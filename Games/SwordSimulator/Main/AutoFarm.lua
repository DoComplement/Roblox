
-- to-do:

-- some variables aren't used beyond initialization. 
-- it would be efficient to relocate the assignment of these variables with respect to their usage.
-- the functions would be more understandable, and the config format is not really even necessary


if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=7026949294 or getgenv()["QRfuSEK*VSAbxd;1ob*w"]~=nil)then return end;
getgenv()["QRfuSEK*VSAbxd;1ob*w"] = true;

do
	local succ,val = pcall(game.HttpGetAsync,game,"https://httpbin.org/headers");
	while(not succ and task.wait(8))do
		succ,val = pcall(game.HttpGetAsync,game,"https://httpbin.org/headers");
	end;
	if(not val:match("Specific_PrivateGame"))then return end; -- do not execute the script if the server is public
end;

local wait,getChildren = task.wait,game.GetChildren;

do	-- if autofarming with multiple players	(specifically for dungeons)
	getgenv().PLR_CNT = 0;																		-- wait for a certain quantity of players before executing
	if(PLR_CNT > 1)then
		local plrs = game:GetService("Players");
		while(#getChildren(plrs) < PLR_CNT)do													-- wait until the desired quantity of players has been reached
			plrs.ChildAdded:Wait();																-- wait until a new player joins
		end;
	end;
	getgenv().PLR_CNT = nil;																	-- genv is used so the user can change the value mid-iteration (with consequence), if desired
end;

local LocalPlayer = game:GetService("Players").LocalPlayer;
if(not(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()).PrimaryPart)then 
    LocalPlayer.Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
end;

local HumanoidRootPart = LocalPlayer.Character.PrimaryPart;
HumanoidRootPart.CanTouch = false;

LocalPlayer.CharacterAdded:Connect(function(Character)
    Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
	HumanoidRootPart = Character.PrimaryPart;
end);

-- Important Folders
local Folders = {
    [1] = Workspace.Mobs; 																			-- Mobs directory
	[2] = game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent; 						-- modulescript directory
	[3] = LocalPlayer.PlayerGui; 																	-- LocalPlayer.PlayerGui
}

-- Frequently-Used Remote Events
local Events = {
    [1] = game:GetService("ReplicatedStorage").Remotes.Gameplay.FireHit; 						-- Hit mob remote
    [2] = game:GetService("ReplicatedStorage").Events.GetDungeonData; 							-- get Dungeon State remote
    [3] = game:GetService("ReplicatedStorage").Remotes.Gameplay.RequestPetPurchase; 			-- Egg Purchase remote
	[4] = game:GetService("ReplicatedStorage").Events; 											-- Events directory
};

local FireServer = Events[1].FireServer;
local InvokeServer = Events[2].InvokeServer;

-- Module Scripts
local Modules = {
    [2] = require(Folders[2].Storage.PetsModule); -- Pets Module
    [3] = require(Folders[2].WeaponsModule); -- Weapons Module
    [4] = require(Folders[2].BoostsCalculator); -- Boosts Calculators
    [5] = require(Folders[2].Zones); -- Zones
};

do
	local playerData = require(Folders[2].Parent.Client["PlayerData - Client"]);
	if(not playerData.Replica.Data)then playerData.Loaded:Wait()end;
	Modules[1] = playerData.Replica.Data.Main;
end;

-- local Globals = {}
-- local Signals = {}
-- local Routines = {}

local MobsTable,BossTable,Teleports,ElementInventory = {},{},{},{};
for Zone,Info in ipairs(Modules[5]) do Teleports[Zone] = CFrame.new(Info.ZoneSpawn)end;					-- Teleport positions
for _,Element in ipairs(getChildren(Folders[2].Elements))do ElementInventory[Element.Name] = 0 end;		-- initialize element table
for _,Element in next,Modules[1].AuraInventory do ElementInventory[Element.Base] += 1 end;				-- count all player elements

do	-- pre/postload config stuff
	local fileName = "SwordSimData/Configs/Config_"..LocalPlayer.UserId..".json";
	local HttpService = game:GetService("HttpService");
	local Encode = HttpService.JSONEncode;
	
	if(not isfile(fileName))then
		if(not isfolder("SwordSimData"))then makefolder("SwordSimData")end;
		if(not isfolder("SwordSimData/Configs"))then makefolder("SwordSimData/Configs")end;
		writefile(fileName, "{\"TARGET\":\"nil\",\"ZONE_TO_FARM\":\"nil\",\"EGG\":\"nil\",\"LOG_DUNGEON_DATA\":false,\"JOIN_DUNGEON\":false,\"LOG_WEAPON_DATA\":false,\"FARM_BOSS\":false,\"DISABLE_EGG_PROMPTS\":false,\"IGNORE_ITEM_MESSAGES\":false,\"INDEX_RANDOMLY\":false,\"LOG_HATCH_DATA\":false,\"FARM_DUNGEON\":false,\"FARM_TARGET\":false,\"ACTIVE\":false,\"ZONE_TO_FARM\":\"22\",\"FARM_MAX\":false,\"FARM_EGGS\":false,\"LOG_REWARDS_DATA\":false,\"TARGET\":\"AutumnPaladin\"}");
		print("this is your first time using this script, here are the toggles you can modify (modify by setting _G[INDEX] = VALUE, from here forward: \n\n");
		for idx,val in next,HttpService:JSONDecode(readfile(fileName))do print("_G."..idx,'=',val)end;
		print("\_G.DISABLE_EGG_PROMPTS is special :). modify by _G.DISABLE_EGG_PROMPTS.Value = BOOL_VALUE");
		print("\ncall SAVE_DATA() at any time to save the toggles for the next time you use this script");
	end;
	
	getgenv().SAVE_DATA = newcclosure(function()															-- make global so values can be saved mid-game
		writefile(fileName, Encode(HttpService,_G));
	end);
	
	_G.DISABLE_EGG_PROMPTS = Instance.new("StringValue");													-- doesn't transfer through json
	_G.MAX_ZONE = Modules[1].CurrentZone;																	-- default
	
	for idx,val in next,HttpService:JSONDecode(readfile(fileName))do										-- load config
		if(idx~="DISABLE_EGG_PROMPTS")then
			_G[idx] = val;
		else
			_G[idx].Value = val;
		end;
	end;
end;

local AwayFromBoss = true;
local AtDungeon = false;

local CurrentZone,DungeonState = Workspace.Mobs:WaitForChild("Other"),nil;
for _,Folder in ipairs(getChildren(Workspace.Mobs))do
	if(Folder.Name~="Other")then
	    CurrentZone = Folder;
	end;
end;

-- local table of all Zones and their respective Mobs & Boss(es) <- devs stack event zones in the same folder
do
	local Name = nil;
	for Zone,Info in ipairs(Modules[5])do 
		MobsTable[Zone],BossTable[Zone] = {},{};
		for _,Mob in next,Info.Mobs do 
			Name = Mob.Model.Name;
			if(Mob.Quantity==1 and not table.find(BossTable[Zone],Name))then 
				table.insert(BossTable[Zone],Name);
			elseif(not table.find(MobsTable[Zone],Name))then
				table.insert(MobsTable[Zone],Name);
			end;
		end;
	end;
end;

-- fills MobsTable folders from EventMobs ModuleScript
if(game:GetService("ReplicatedStorage"):FindFirstChild("EventMobs",true)~=nil)then
	local Name = nil;
	for _,Zone in next,require(game:GetService("ReplicatedStorage"):FindFirstChild("EventMobs", true))do
		for _,Mob in next, Zone do 
			Name = Mob.Model.Name;
			if(Mob.Quantity==1 and not table.find(BossTable[1],Name))then 	
				table.insert(BossTable[1],Name);
			elseif(not table.find(MobsTable[1],Name))then
				table.insert(MobsTable[1],Name);
			end;
		end;
    end;
end;

do	-- disable egg ui prompt popups
	local function invisPrompt(prompt)
		if(prompt~=nil)then
			prompt.Frame.Visible = not _G.DISABLE_EGG_PROMPTS.Value;
		end;
	end;
	Folders[3].EggOpeningPrompts.ChildAdded:Connect(invisPrompt);							-- on egg prompt popup
	_G.DISABLE_EGG_PROMPTS.Changed:Connect(function()
		invisPrompts(Folders[3].EggOpeningPrompts:FindFirstChild("Frame"));					-- call potential on changed
	end);
	invisPrompts(Folders[3].EggOpeningPrompts:FindFirstChild("Frame"));						-- initialize
end;

-- Signals to update "Boss" as the player enters a new area within the same zone (Devs overlap zones)
Folders[3].ChildAdded:Connect(function(Instance)
	if(Instance.Name=="Transition")then 
    	local ACTIVE = _G.ACTIVE;
    	_G.ACTIVE = false;
    	Instance.AncestryChanged:Wait(); -- waits until transition is gone (zone is loaded) 
    	_G.ACTIVE = ACTIVE;
    end;
end);

local function FarmBoss(Mob, Humanoid)    
	while(Humanoid.Health>0 and Mob.Parent==CurrentZone)do -- repeating if any toggle is disabled before defeating the boss
		while(not(_G.ACTIVE and _G.FARM_BOSS and AwayFromBoss))do wait(math.random())end; -- wait until all toggles are enabled
		AwayFromBoss = false;
		HumanoidRootPart.CFrame = Mob.WorldPivot;
    	while(Humanoid.Health>0 and Mob.Parent==CurrentZone and _G.ACTIVE and _G.FARM_BOSS)do	
    		HumanoidRootPart.CFrame = Mob.WorldPivot;
			wait();
    	end;
		AwayFromBoss = true;
	end;
end;

local function YieldHumanoid(Mob)
	-- Checks if "Mob" is a boss
	if(not table.find(BossTable[tonumber(CurrentZone.Name)],Mob.Name))then
		return;
	elseif(not Mob.PrimaryPart)then
		Mob:GetPropertyChangedSignal("PrimaryPart"):Wait();
	end;
	FarmBoss(Mob, Mob.Humanoid);
end;

local function SearchBosses(Zone)
	local Bosses = BossTable[tonumber(Zone.Name)];
	for _,Mob in ipairs(getChildren(Zone))do -- Search for bosses
		if(not table.find(Bosses, Mob.Name))then -- if mob is not a zone-boss
			continue;
		elseif(not Mob.PrimaryPart)then -- wait for primary part if not loaded yet (no primary part -> no humanoid)
			Mob:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		FarmBoss(Mob, Mob.Humanoid);
	end;
end;

-- Finding the Boss(s) when a new zone is entered;
local ChildAdded,ParentChanged = nil;
Workspace.Mobs.ChildAdded:Connect(function(NewZone)
	CurrentZone = NewZone;
	if(not BossTable[tonumber(NewZone.Name)][1])then return end;
	
	task.defer(SearchBosses,NewZone); -- Initialize Bosses in New Zone
	
	ChildAdded = NewZone.ChildAdded:Connect(YieldHumanoid);
	ParentChanged = NewZone.AncestryChanged:Connect(function() 
		if(NewZone.Parent~=Workspace.Mobs)then
			ChildAdded:Disconnect();
			ParentChanged:Disconnect();
		end;
	end);
end);

Workspace.Mobs.ChildRemoved:Connect(function()CurrentZone = Workspace.Mobs.Other end);

-- (1) makes all incoming item pop-ups on the screen invisible if indicated (_G.IGNORE_ITEM_MESSAGES is true)
-- (2) prints the aura and its' percent gained from a completed dungeon if indicated (_G.LOG_DUNGEON_DATA is true)
Folders[3].MessagesUI.Frame.ChildAdded:Connect(function(Label)
	if(Label.Name=="Frame")then
        if(_G.IGNORE_ITEM_MESSAGES and wait())then 
			Label.Visible = false;
		end;
        if(_G.LOG_WEAPON_DATA and Modules[3][Label.ViewportFrame:FindFirstChildOfClass("Model").Name].Rarity=="Mythical")then 
			print(Label.TextLabel.Text);
        end;
    elseif(_G.LOG_DUNGEON_DATA and Label.Name=="TextLabel"and ElementInventory[Label.Text:match("Obtained (.+) Aura")]~=nil)then 
		print(Label.Text);
	end;
end);

local function GetMinValueIndex(vals, min, idx)
	for cnt,val in ipairs(vals)do
		if(val~=-1 and val<min)then
			idx,min = cnt,val;
		end;
	end;
	return idx;
end;

-- EquipBest Modules 
local function SortItems(items, vals, pow, id, idx)
	for iter = 1,idx do
		if(vals[iter]==-1)then continue;
		elseif(pow==-1 or vals[iter]<pow)then
			if(pow==-1 or vals[idx]<vals[iter])then 
				vals[idx],items[idx] = vals[iter],items[iter];
			end;
			vals[iter],items[iter] = pow,id;
			return(GetMinValueIndex(vals,vals[idx],idx));
		end;
	end;
	return idx;
end;

-- Current Events = {
	-- "Christmas2022",
	-- "Halloween2022",
	-- nil
-- }
local function GetItemPower(ID, Item, Data, Calculator, Event)
	if(Data.Vanity~=nil)then
		if(IgnoreVanity or Data.Vanity.Boost<1)then return(nil)end;
		return -1;
	end;
	if(Event~=nil and(not Data.Tags or Data.Tags[1]~=Event))then return(nil)end;
		
	-- calculates relative power of item read (Temp is invalid for Pet Category, Power is invalid for Weapon Category)
	local Power,Temp = Calculator(ID,Item);
	if(Temp>0)then return(Temp)end;
	return(Power);
end;

-- simplify the function by removing IgnoreVanity (will remove the -1 powers from the sort)
local function GatherBest(Storage, Module, Items, Calculator, Event)
	local Values,Vanities = table.create(#Items,0),table.create(#Items,'');
	local Index = 1
	
	-- loops through storage of item "Category"
	local Data = nil;
    for ID,Item in next,Storage do 
		Data = Module[Item.Base];
		-- if Data.Vanity ~= nil then ...; end;
		local Power = GetItemPower(ID,Item,Module[Item.Base],Calculator,Event);
		if(Power~=nil)then
			Index = SortItems(Items,Values,Power,ID,Index);
		end;
    end;
	
	return Items;
end

-- gathers bets items of Category - Pet,Weapon - and equips those items 
local function EquipBest(Category, Event)
    local EquippedItems,Best = {},nil;
	
	-- sets general variables based on input Category
    if(Category=="Pet")then 
        EquippedItems = Modules[1].EquippedItems.Pets
		Best = GatherBest(Modules[1]["Pets"], Modules[2], table.create(Modules[1].PetEquips,''), Modules[4].CalculatePetBoosts, Event)
    else
    	for ID,_ in next,Modules[1].EquippedItems.Weapons do EquippedItems[#EquippedItems+1] = ID end 	-- gathers equipped weapons
    	Best = GatherBest(Modules[1]["Weapons"], Modules[3], table.create(Modules[1].WeaponEquips,''), Modules[4].CalculateWeaponBoosts, Event)
    end;
	
    for _,ID in ipairs(Best)do
        if(not table.find(EquippedItems, ID))then 
            InvokeServer(Events[4].EquipItem,Category..'s', EquippedItems);	-- Unequip Current items
			wait(2);
			InvokeServer(Events[4].EquipItem,Category..'s', Best);
            return;
        end;
    end;
end;

-- See to enhancing the modules in here (removing autosInit)
-- Also see to consolidating the local variables 
task.defer(function()
	if(LocalPlayer.PlayerGui:FindFirstChild("LoadingScreenUi")~=nil)then
		LocalPlayer.PlayerGui.LoadingScreenUi.Destroying:Wait();
	end;
    -- Initializing automatic playtime rewards
    for _,Reward in ipairs(getChildren(Folders[3].Rewards.Main.Frame))do
		if(Reward.Name=="UIGridLayout")then continue;
		elseif(Reward.TimeLeft.Text~="CLICK TO CLAIM")then
			Reward.TimeLeft:GetPropertyChangedSignal("TextColor3"):Once(function()
				getconnections(Reward.TimeLeft.Activated)[1].Function();
				if(_G.LOG_REWARDS_DATA)then print("Claimed Playtime reward",Reward.Name)end;
			end);
        else 
            getconnections(Reward.TimeLeft.Activated)[1].Function();
			if(_G.LOG_REWARDS_DATA)then print("Claimed Playtime reward",Reward.Name)end;
        end
    end
    
	-- for playtime rewards that are added mid-game
    Folders[3].Rewards.Main.Frame.ChildAdded:Connect(function(Reward)
        Reward:WaitForChild("TimeLeft"):GetPropertyChangedSignal("TextColor3"):Once(function()
			getconnections(Reward.TimeLeft.Activated)[1].Function();
			if(_G.LOG_REWARDS_DATA)then print("Claimed Playtime reward",Reward.Name)end;
        end)
    end)

    -- Initializing automatic Daily (SpinReward) rewards
    local SpinReward = Folders[3].Main.Top.DailyRewards.UnClaimed
	local Spin = getconnections(Folders[3].DailyRewards.Main.Frame.SpinButton.Activated)[1].Function;
	
    if(SpinReward.Visible)then 
        Spin();
		if(_G.LOG_REWARDS_DATA)then print("Collected Daily Rewards")end;
	end
    
    SpinReward:GetPropertyChangedSignal("Visible"):Connect(function()
        if(SpinReward.Visible)then 
			Spin();
			if(_G.LOG_REWARDS_DATA)then print("Collected Daily Rewards")end;
		end
    end);

    -- Initializing automatic Rank and Group rewards
    -- each signal is called with this configuration regardless when initialized for some reason
    -- Connections are not designed to have arguments with directly passed functions (ClaimRewards(...) in this case), so I had to overlap generic functions
	-- Reference Variables for Auto Daily Rewards
	
	local rwrdCntrs = {
		[1] = game:GetService("CollectionService"):GetTagged("DailyGroupRewardsZone")[1].Countdown.CountdownUI.Frame.Countdown;	
		[2] = game:GetService("CollectionService"):GetTagged("RankRewardZone")[1].Countdown.CountdownUI.Frame.Countdown;
	};
	
	local function ClaimDailyRewards()
		if(rwrdCntrs[1].Text~="Ready")then return end;
		wait(2);
		if(not LocalPlayer:IsInGroup(11109344))then
			print("Not in Tachyon Roblox Group, so group rewards can not be claimed.");
			print("Group rewards will be claimed if you join mid-game.");
			repeat wait(1)until LocalPlayer:IsInGroup(11109344);
		end;
		InvokeServer(Events[4].ClaimGroupDailyReward);
		if(_G.LOG_REWARDS_DATA)then print("Claimed Group Rewards")end;
	end;

	local function ClaimRankRewards()
		if(rwrdCntrs[2].Text=="Ready")then
			wait(2);
			InvokeServer(Events[4].ClaimRankReward);
			if(_G.LOG_REWARDS_DATA)then print("Claimed Rank Rewards") end;
		end;
	end;
	
	-- check if each reward is ready to be claimed upon textchanged
	rwrdCntrs[1]:GetPropertyChangedSignal("Text"):Connect(ClaimDailyRewards);
    rwrdCntrs[2]:GetPropertyChangedSignal("Text"):Connect(ClaimRankRewards);
	
	-- it rewards are ready to be claimed upon script execution... (text will not change)
	task.defer(ClaimDailyRewards);																-- Initialize Daily Rewards
	task.defer(ClaimRankRewards);																-- Initialize Rank Rewards


    -- Initializing automatic Index rewards
    -- local Index = Folders[3].PetIndex.Main
	 
	-- for _,Category in ipairs({"Weapon", "Pet"}) do
		-- local Counter = Index[Category.."IndexRewards"].Counter;
		-- if(Counter.Text=="Completed")then continue end;
		
		-- local Claim,Connection = Index[Category.."IndexRewards"].Claim,nil;
		-- local claimReward = getconnections(Claim.Activated)[1].Function;
		-- Connection = Claim:GetPropertyChangedSignal("Visible"):Connect(function()
			-- if(Claim.Visible)then 
				-- claimReward();
				-- if _G.LOG_REWARDS_DATA then print("Claimed", Category, "Index")end;
				-- Claim.Visible=false;
			-- end;
			-- wait(1)
			-- if(Counter.Text=="Completed")then 
				-- if(_G.LOG_REWARDS_DATA)then print(Category, "Indexes Completed")end;
				-- Connection = Connection:Disconnect();
			-- end;
		-- end);
    -- end;

    -- Automatic Zone and Teleport purchases
	if(_G.MAX_ZONE>=#Modules[5])then return end;
    local TeleportButtons = Folders[3].Teleports.Main.ListFrame;
        
 	-- set to false if you do not want the doors and teleports to be automatically purchased
 	_G.PURCHASE_DOORS = true;
 	_G.PURCHASE_TELEPORTS = false;
	
 	task.defer(function()
		local MaxZone = #Modules[5] - 1;
 		while wait(1) do
 			for Index = 2,MaxZone do
 				if(_G.PURCHASE_DOORS and Workspace.Worlds["Zone"..Index]:FindFirstChild("PurchaseNewZone")~=nil and Modules[1].Coins>=Modules[5][Index + 1].Cost.Coins)then 
					InvokeServer(Events[4].PurchaseZone);
					_G.MAX_ZONE += 1;
					if(_G.FARM_MAX)then _G.ZONE_TO_FARM = tostring(_G.MAX_ZONE)end;
					if(Index==MaxZone)then 
						_G.PURCHASE_DOORS = nil;
						if(not _G.PURCHASE_TELEPORTS)then return end;
					end;
 				end;
				
 				if(_G.PURCHASE_TELEPORTS and TeleportButtons[Index]:FindFirstChild("Cost")~=nil and Modules[1].Gems>=Modules[5][Index].TeleportCost.Gems)then 
					InvokeServer(Events[4].PurchaseTeleport,Index);
					if(Index==MaxZone)then 
						_G.PURCHASE_TELEPORTS = nil;
						if(not _G.PURCHASE_DOORS)then return end;
					end;
				end;
 			end;
 		end;
 	end);
end);

local HitDetector,randomize = nil,nil;
do	-- rand class
	local rand = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/RandLib/Rand.lua")))();
	randomize = rand.randomize;

	HitDetector = Instance.new("Part");
	HitDetector.Name = rand.randStr(math.random(15, 22));
	HitDetector.Shape = "Ball";
	HitDetector.Size = Vector3.new(15, 15, 15);
	HitDetector.Transparency = 1;
	HitDetector.CanCollide = false;
	HitDetector.Anchored = false;
	HitDetector.Locked = false;
	HitDetector.Parent = Workspace;
end;

HitDetector.Touched:Connect(function(Hit)
	if(_G.ACTIVE and Hit.Name=="HumanoidRootPart"and Hit.Parent.Parent==CurrentZone and Hit.Parent.Humanoid.Health>0)then
		FireServer(Events[1],nil,Hit.Parent,Hit.Position);
	end;
end);

game:GetService("RunService").RenderStepped:Connect(function()
    HitDetector.CFrame = HumanoidRootPart.CFrame;
end);

do
	local Dungeon = CFrame.new(-3401, 136.290268, 468, 1, -3.82670748e-08, -3.79028059e-12, 3.82670748e-08, 1, 6.93830984e-08, 3.78762516e-12, -6.93830984e-08, 1);
	local dungeonEar = Instance.new("BindableEvent");
	local Fire = dungeonEar.Fire;
	
	-- Auto Dungeon
	dungeonEar.Event:Connect(function()
		DungeonState = InvokeServer(Events[2]); -- updated once every second
		if(AtDungeon)or(not(_G.JOIN_DUNGEON and DungeonState=="Starting")and os.time()<(Modules[1].LastDungeonEnter+3600))or(DungeonState=="Begun")then return end;
		AtDungeon = true;
		if(_G.LOG_DUNGEON_DATA)then print("Dungeon is ready")end;
		while not(_G.FARM_DUNGEON)do wait(1)end;		-- when dungeon is ready, waits until dungeon farming is active
		
			-- (1) Starts Dungeon
		wait(2);
		InvokeServer(Events[4].EnterDungeon);
		wait(2);

			-- (2) Store current variable data
		local Currents,EquippedWeapons = {_G.FARM_MAX, _G.ZONE_TO_FARM, _G.FARM_BOSS, _G.FARM_TARGET, _G.INDEX_RANDOMLY, _G.ACTIVE, HumanoidRootPart.CFrame}, {}
		for ID in next,Modules[1].EquippedItems.Weapons do table.insert(EquippedWeapons, ID)end
		
			-- (3) Equip best weapons for Dungeon
		EquipBest("Weapon");
		
			-- (4) Disable potentially inflicting variables
		_G.ACTIVE, _G.FARM_MAX, _G.FARM_BOSS, _G.FARM_TARGET, _G.ZONE_TO_FARM = false, false, false, false, "Other";
		wait(4);
		
			-- (5) Teleport user to dungeon loading zone
		HumanoidRootPart.CFrame = Dungeon;
		HumanoidRootPart.Anchored = true; 
		wait(2); 
		HumanoidRootPart.Anchored = false;
		
			-- (6) enable farming
		_G.INDEX_RANDOMLY = true;
		_G.ACTIVE = true;
		
			-- (7) wait until user is rewarded an Aura (dungeon is complete)
		repeat wait(1)until DungeonState=="Ready";

			-- (8) Disable farming and teleport user to previous location
		_G.ACTIVE = false;
		HumanoidRootPart.CFrame = Currents[7];
		HumanoidRootPart.Anchored = true;

			-- (9) Unequip current weapons then equip previous weapons
		local Equipped = {}
		for ID in next,Modules[1].EquippedItems.Weapons do table.insert(Equipped, ID)end;
		InvokeServer(Events[4].EquipItem,"Weapons",Equipped)wait(1); -- unequip current weapons
		InvokeServer(Events[4].EquipItem,"Weapons",EquippedWeapons); -- equip previous weapons
		HumanoidRootPart.Anchored = false;
		
		   -- (10) re-assign variables
		_G.FARM_MAX, _G.ZONE_TO_FARM, _G.FARM_BOSS, _G.FARM_TARGET, _G.INDEX_RANDOMLY, _G.ACTIVE = unpack(Currents);
		AtDungeon = false;
	end);

	local HatchType = "Hatch3";
	if(not Modules[1].Gamepasses["40355989"])then
		HatchType = "Hatch";
		local GP_Purchased = nil;
		GP_Purchased = game:GetService("MarketplaceService").PromptGamePassPurchaseFinished:Connect(function(player,gamePassId,wasPurchased)
			if(player==LocalPlayer and wasPurchased and gamePassId==40355989)then
				HatchType = "Hatch3";
				GP_Purchased = GP_Purchased:Disconnect();
			end;
		end);
	end;
	
	local function checkHatch(hatched)
		if(not hatched or type(hatched)~="table")then return(nil)end;
		local rarity = nil;
		for _,dat in ipairs(hatched)do
			if(dat[3]or not _G.LOG_HATCH_DATA)then continue;
			elseif(not dat[2].Weapon)then	-- if hatched item is a pet
				rarity = Modules[2][dat[1]].Rarity;
			else
				rarity = Modules[3][dat[1]].Rarity;
			end;
			if(rarity=="Secret"or rarity=="Mythical")then
				print("Hatched",rarity,dat[1]);
			end;
		end;
	end;

	-- Auto Egg Hatching
	local autoEgg = Instance.new("BindableEvent");
	local eggTime = (os.time() + 3)%10;
	autoEgg.Event:Connect(function()
		if(os.time()%10~=eggTime)then return end;
		eggTime = (eggTime + 3)%10;
		
		if(_G.FARM_EGGS)then checkHatch(InvokeServer(Events[3],_G.EGG,HatchType))end;
	end);

	local DungeonHandler,time = LocalPlayer.PlayerScripts.PlayerHandler.Miscallenious.DungeonHandler,nil;
	time = hookfunction(os.time, newcclosure(function() 
		if(getcallingscript()==DungeonHandler)then 
			Fire(autoEgg); -- Egg Hatch
			Fire(dungeonEar); -- Auto Dungeon
		end;
		return time();
	end));
end;

local function CheckZone()
	if(_G.ZONE_TO_FARM~="Other"and CurrentZone.Name~=_G.ZONE_TO_FARM)then -- "CurrentZone" is current zone
    	HumanoidRootPart.CFrame = Teleports[tonumber(_G.ZONE_TO_FARM)];
    	HumanoidRootPart.Anchored = true;
    	wait(1);
    	HumanoidRootPart.Anchored = false;
    end;
end;

local TempMobs = {};
local function GetMobs(Mobs)
	if(_G.INDEX_RANDOMLY)then
		TempMobs = randomize(getChildren(CurrentZone));
	else
		TempMobs = getChildren(CurrentZone);
	end;

	if _G.FARM_TARGET then
		for _,Mob in ipairs(TempMobs)do
			if(Mob.PrimaryPart~=nil and Mob.Name==_G.TARGET)then
				Mobs[Mob] = Mob.Humanoid;
			end;
		end;
	else
		for _,Mob in ipairs(TempMobs)do
			if(Mob.PrimaryPart~=nil)then
				Mobs[Mob] = Mob.Humanoid;
			end;
		end;
	end;
	
	return Mobs;
end;

-- Auto Farm Specific & General
task.defer(function()
	local Mobs = {};

    while(wait())do
		while(not(_G.ACTIVE and AwayFromBoss))do wait()end;
		CheckZone();
		
        for Mob,Humanoid in next,GetMobs(Mobs)do 
			if(not(_G.ACTIVE and AwayFromBoss))then break;
			elseif(Mob.PrimaryPart~=nil and Mob.Parent==CurrentZone and Humanoid.Health>0)then
				HumanoidRootPart.CFrame = Mob.WorldPivot;
                while(Humanoid.Health>0 and _G.ACTIVE and AwayFromBoss)do	
        			HumanoidRootPart.CFrame = Mob.WorldPivot;
					wait();
            	end;
            end;
        end;
		table.clear(Mobs);
    end;
end);

-- reconnect when disconnected
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(UI)
	wait(3);
	UI = UI:FindFirstChild("ErrorTitle", true);
	if not UI or UI.Text ~= "Disconnected" then return end;
	
	print("User has Disconnected. Waiting until connection has been re-established");
	repeat wait(1)until game:HttpGetAsync("https://raw.githubusercontent.com/DoComplement/Roblox/main/null") == '\n';
	print("Connection has been established!");
	
	wait(8);
	game:GetService("TeleportService"):Teleport(game.PlaceId);
end);

-- Anti AFK
for _,v in ipairs(getconnections(LocalPlayer.Idled))do
	v:Disable();
end;
