if game.PlaceId ~= 7026949294 or _G.LOADED then return end; _G.LOADED = true;
if game:IsLoaded() == false then game.Loaded:Wait() end;

--[[ TO DO:
	1) De-nest the branching and looping into separate functions
	2) consolidate the variables, functions, connections, threads, etc. into a arrays
	3) find the in-game functions (if existing) that correspond to remote calls (the functions will call the remotes, adding a bit of spoofing)
	4) simplify the GatherBest function by removing the IgnoreVanity argument (and update the code that is influenced by this argument)
]]

local CreateInstance = function(ObjectType, Properties)
    local Instance = Instance.new(ObjectType)
	for Attribute, Value in next, Properties do
		Instance[Attribute] = Value
	end
	return Instance
end;

local Services = {
    [1] = game:GetService("Players");
    [2] = game:GetService("ReplicatedStorage");
    [3] = game:GetService("GroupService");
	[4] = game:GetService("VirtualUser");
};

-- Reference Variables for Auto Daily Rewards
local DailyRewards = {
    [1] = game:GetService("CollectionService"):GetTagged("DailyGroupRewardsZone")[1].Countdown.CountdownUI.Frame.Countdown;
    [2] = game:GetService("CollectionService"):GetTagged("RankRewardZone")[1].Countdown.CountdownUI.Frame.Countdown;
}

-- Player Variables (See to adding these back into the tuple-format. I don't think the time loss is even slightly significant)
local HumanoidRootPart = Services[1].LocalPlayer.Character.HumanoidRootPart;
local HitEvent = Services[2].Remotes.Gameplay.FireHit;

Services[1].LocalPlayer.CharacterAdded:Connect(function(Character)
	HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
end);

-- Important Folders
local Folders = {
    [1] = Workspace.Mobs; -- Workspace.Mobs
	[2] = Services[2].Saturn.Modules.GameDependent; -- ReplicatedStorage.Saturn.Modules.GameDependent
	[3] = Services[1].LocalPlayer.PlayerGui; -- Players.LocalPlayer.PlayerGui
}

-- Frequently-Used Remote Events
local Events = {
    [1] = Services[2].Events.GetDungeonData; -- Dungeon State
    [2] = Services[2].Remotes.Gameplay.RequestPetPurchase; -- Egg Purchase
	[3] = Services[2].Events; -- Events CurrentZone
	[4] = Instance.new("BindableEvent"); -- Egg Hatch Signal
	[5] = Instance.new("BindableEvent"); -- Auto Dungeon Signal
}

-- Module Scripts
local Modules = {
    [1] = require(Folders[2].Parent.Client["PlayerData - Client"]).Replica.Data.Main; -- Player Data
    [2] = require(Folders[2].Storage.PetsModule); -- Pets Module
    [3] = require(Folders[2].WeaponsModule); -- Weapons Module
    [4] = require(Folders[2].BoostsCalculator); -- Boosts Calculators
    [5] = require(Folders[2].Zones); -- Zones
	[6] = Services[1].LocalPlayer.PlayerScripts.PlayerHandler.Miscallenious.DungeonHandler; -- game script
}

local Globals = {}
local Signals = {}
local Routines = {}

local MobsTable = table.create(table.getn(Modules[5]), ''); -- All Mobs per Zone
local BossTable = table.create(table.getn(MobsTable), ''); -- Bosses per Zone
local Teleports = table.create(table.getn(MobsTable), ''); -- Zone Teleport CFrames for ease-of-access
for Zone,Info in ipairs(Modules[5]) do Teleports[Zone] = Info.ZoneSpawn; end; -- Teleport positions

local ElementInventory = {}
for _,Element in ipairs(Folders[2].Elements:GetChildren()) do ElementInventory[Element.Name] = 0 end
for _,Element in next, Modules[1].AuraInventory do ElementInventory[Element.Base] = ElementInventory[Element.Base] + 1 end

--[[ All the below values can be changed mid-game ]]

-- Edit these variables here
_G.MAX_ZONE = Modules[1].CurrentZone;
_G.TARGET = "AutumnPaladin";
_G.ZONE_TO_FARM = "22";
_G.EGG = "Event Egg";

-- Edit these toggles
_G.IGNORE_ITEM_MESSAGES = true;
_G.PRINT_REWARDS_DATA = false;
_G.PRINT_DUNGEON_DATA = true;
_G.PRINT_WEAPON_DATA = true;

_G.INDEX_RANDOMLY = true;
_G.FARM_DUNGEON = true;
_G.JOIN_DUNGEON = true; -- may only want to use in private servers

_G.FARM_TARGET = true;
_G.FARM_EGGS = true;
_G.FARM_MAX = true;
_G.ACTIVE = true;

local Toggles = {
	[1] = true;	-- _G.FARM_BOSS
	[2] = true;	-- AwayFromBoss
	[3] = false; -- Farming Dungeon
};

-- rand class
local rand = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/RandLib/Rand.lua"))()

local CurrentZone,DungeonState = "Other",nil;
for _,Folder in ipairs(Folders[1]:GetChildren()) do
	if Folder.Name ~= "Other" then
		CurrentZone = Folder.Name;
	end;
end;

-- local table of all Zones and their respective Mobs & Boss(es) <- devs stack event zones in the same folder
for Zone,Info in ipairs(Modules[5]) do 
	MobsTable[Zone] = {};
	BossTable[Zone] = {};
	local Model = nil;
    for _,Mob in next, Info.Mobs do 
		Model = tostring(Mob.Model);
        if Mob.Quantity == 1 and table.find(BossTable[Zone], Model) == nil then 
            table.insert(BossTable[Zone], Model);
        elseif table.find(MobsTable[Zone], Model) == nil then
            table.insert(MobsTable[Zone], Model);
        end;
    end;
end;

-- fills MobsTable folders from EventMobs ModuleScript
if Services[2]:FindFirstChild("EventMobs", true) then
	local Model = nil;
	for _,Zone in next, require(Services[2]:FindFirstChild("EventMobs", true)) do
		for _,Mob in next, Zone do 
			Model = tostring(Mob.Model);
			if Mob.Quantity == 1 and table.find(BossTable[1], Model) == nil then 	
				table.insert(BossTable[1], Model);
			elseif table.find(MobsTable[1], Model) == nil then
				table.insert(MobsTable[1], Model);
			end;
		end;
    end;
end;

-- Signals to update "Boss" as the player enters a new area within the same zone (Devs overlap zones)
Folders[3].ChildAdded:Connect(function(Instance)
	if Instance.Name ~= "Transition" then return; end;
	local ACTIVE = _G.ACTIVE
	_G.ACTIVE = false
	while Folders[3]:FindFirstChild("Transition") ~= nil do task.wait(1); end; -- waits until transition is gone (zone is loaded) 
	_G.ACTIVE = ACTIVE;
end);

-- Check if the "Toggle" argument is valid for any input by reference (Even a global or upvalue boolean) 
local function FollowMob(Mob, Index, Health)
	while task.wait() and _G.ACTIVE and Toggles[Index] and Health.Text ~= "0 Health" and Mob.PrimaryPart ~= nil do	
		if (HumanoidRootPart.Position - Mob.PrimaryPart.Position).Magnitude >= 5 then
			HumanoidRootPart.CFrame = Mob.PrimaryPart.CFrame;
		end;
	end;
end;

local function GetHealth(Head)
	if Head ~= nil and Head:WaitForChild("ExtraData").RedBar.Health.Text ~= "0 Health" then
		return Head.ExtraData.RedBar.Health;
	end;
end;

local function FarmBoss(Mob)
	if table.find(BossTable[CurrentZone + 0], Mob.Name) == nil then return; end; -- if Mob is not a boss
	local Health = Mob:WaitForChild("Head"):WaitForChild("ExtraData"):WaitForChild("RedBar"):WaitForChild("Health");
	while Health.Text ~= "0 Health" do -- repeating if any toggle is disabled before defeating the boss
		while (_G.ACTIVE and Toggles[1] and Toggles[2]) == false do task.wait(math.random()); end; -- wait until all toggles are enabled
		Toggles[2] = false;
		FollowMob(Mob, 1, Health);
		Toggles[2] = true;
	end;
end;

local function YieldHead(Mob)
	local Loading = nil;
	Loading = Mob.ChildAdded:Connect(function(Child)
		if Child.Name == "Head" then
			Loading = Loading:Disconnect();
			FarmBoss(Mob);
		end;
	end);
end;

local function SearchBosses(Zone)
	local Bosses = BossTable[CurrentZone + 0];
	for _,Mob in ipairs(Zone:GetChildren()) do -- Search for bosses
		if table.find(Bosses, Mob.Name) ~= nil then
			YieldHead(Mob);
		end;
	end;
end;

-- Finding the Boss(s) when a new zone is entered;
Folders[1].ChildAdded:Connect(function(NewZone)
	CurrentZone = NewZone.Name;
	if BossTable[CurrentZone + 0][1] == nil then return; end;
	
	SearchBosses(NewZone); -- Initialize Bosses in New Zone
	
	local ChildAdded,ParentChanged = nil;
	ChildAdded = NewZone.ChildAdded:Connect(FarmBoss);
	ParentChanged = NewZone:GetPropertyChangedSignal("Parent"):Connect(function() 
		if NewZone.Parent == Folders[1] then return; end;
		ChildAdded = ChildAdded:Disconnect();
		ParentChanged = ParentChanged:Disconnect();
	end);
end);

Folders[1].ChildRemoved:Connect(function() CurrentZone = "Other"; end);

-- (1) makes all incoming item pop-ups on the screen invisible if indicated (_G.IGNORE_ITEM_MESSAGES is true)
-- (2) prints the aura and its' percent gained from a completed dungeon if indicated (_G.PRINT_DUNGEON_DATA is true)
Folders[3].MessagesUI.Frame.ChildAdded:Connect(function(Label)
	if Label.Name == "Frame" then
        if _G.IGNORE_ITEM_MESSAGES then task.wait(); Label.Visible = false; end; --task.delay(0,function() Label.Visible = false end) end
        if _G.PRINT_WEAPON_DATA then
            local WeaponName = Label.ViewportFrame:FindFirstChildOfClass("Model").Name
            if Modules[3][WeaponName].Rarity == "Mythical" then 
                print("Obtained Mythical", WeaponName)
            end
        end
    elseif _G.PRINT_DUNGEON_DATA and Label.Name == "TextLabel" and ElementInventory[Label.Text:match("Obtained (.+) Aura.+")] ~= nil then 
		print(Label.Text) 
	end;
end);

local function GetMinValueIndex(Values, Min, Index)
	for Count,Value in ipairs(Values) do
		if Value ~= -1 and Value < Min then
			Index,Min = Count,Value;
		end;
	end;
	return Index;
end;

--[[ EquipBest Modules ]]
local function SortItems(Items, Values, Power, ID, Index)
	for Iter=1,Index do
		if Values[Iter] ~= -1 and (Power == -1 or Values[Iter] < Power) then
			if Values[Index] ~= -1 and (Power == -1 or Values[Index] < Values[Iter]) then 
				Values[Index],Items[Index] = Values[Iter],Items[Iter] 
			end 
			Values[Iter],Items[Iter] = Power,ID;
			return GetMinValueIndex(Values, Values[Index], Index);
		end
	end
	return Index
end

--[[ Current Events = {
	"Christmas2022",
	"Halloween2022",
	nil
]]
local function GetItemPower(ID, Item, Data, Calculator, Event)
	if Data["Vanity"] ~= nil then
		if IgnoreVanity then return end
		return -1
	else 
		local Tags = Data["Tags"]
		if Event ~= nil and (Tags == nil or Tags[1] ~= Event) then return; end;
			
		-- calculates relative power of item read (Temp is invalid for Pet Category, Power is invalid for Weapon Category)
		local Power,Temp = Calculator(ID,Item);
		if Temp ~= 0 then return Temp; end;
		return Power;
	end;
end;

-- simplify the function by removing IgnoreVanity (will remove the -1 powers from the sort)
local function GatherBest(Storage, Module, Items, Calculator, Event)
	local Values,Vanities = table.create(table.getn(Items), 0),table.create(table.getn(Items), '');
	local Index = 1
	
	-- loops through storage of item "Category"
	local Data = nil;
    for ID,Item in next, Storage do 
		Data = Module[Item.Base];
		-- if Data["Vanity" ~= nil then ...; end;
		local Power = GetItemPower(ID, Item, Module[Item.Base], Calculator, Event)
		if Power == nil then continue; end;
		Index = SortItems(Items, Values, Power, ID, Index);
    end
	
	return Items
end

-- gathers bets items of Category - Pet,Weapon - and equips those items 
local function EquipBest(Category, Event)
    local EquippedItems,Best = {}
	
	-- sets general variables based on input Category
    if Category == "Pet" then 
        EquippedItems = Modules[1].EquippedItems.Pets
		Best = GatherBest(Modules[1]["Pets"], Modules[2], table.create(Modules[1]["PetEquips"], ''), Modules[4]["CalculatePetBoosts"], Event)
    else
    	for ID,_ in next, Modules[1].EquippedItems.Weapons do EquippedItems[table.getn(EquippedItems) + 1] = ID end 	-- gathers equipped weapons
    	Best = GatherBest(Modules[1]["Weapons"], Modules[3], table.create(Modules[1]["WeaponEquips"], ''), Modules[4]["CalculateWeaponBoosts"], Event)
    end
	
    for _,ID in ipairs(Best) do
        if table.find(EquippedItems, ID) ~= nil then continue end;
		Events[3].EquipItem:InvokeServer(Category..'s', EquippedItems);	-- Unequip Current items
		task.wait(2);
		Events[3].EquipItem:InvokeServer(Category..'s', Best);
		return;
    end;
end;

local function inGroup(GroupID)
	for _,Group in ipairs(Services[3]:GetGroupsAsync(Services[1].LocalPlayer.UserId)) do
		if GroupID == Group.Id then
			return true;
		end;
	end;
	return false;
end;

local function ClaimDailyRewards()
	if DailyRewards[1].Text == "Ready" then
		task.wait(2);
		if inGroup(11109344) == false then
			print("Not in Tachyon Roblox Group, so group rewards can not be claimed.");
			print("Group rewards will be claimed if you join mid-game.");
			repeat task.wait(1) until inGroup(11109344);
		end;
		Events[3].ClaimGroupDailyReward:InvokeServer();
		if _G.PRINT_REWARDS_DATA then print("Claimed Group Rewards") end;
	end;
end;

local function ClaimRankRewards()
	if DailyRewards[2].Text == "Ready" then
		task.wait(2);
		Events[3].ClaimRankReward:InvokeServer();
		if _G.PRINT_REWARDS_DATA then print("Claimed Rank Rewards") end;
	end;
end;

--[[ See to enhancing the modules in here (removing autosInit)]]
--[[ Also see to consolidating the local variables ]]
local function autosInit()

    -- Initializing automatic playtime rewards
    local PlaytimeRewards = Folders[3].Rewards.Main.Frame;

    if table.getn(PlaytimeRewards:GetChildren()) > 1 then
        for Index = 12 - table.getn(PlaytimeRewards:GetChildren()), 10 do
			if PlaytimeRewards[Index].TimeLeft.Text ~= "CLICK TO CLAIM" then
				local Connection;
				Connection = PlaytimeRewards[Index].TimeLeft:GetPropertyChangedSignal("TextColor3"):Once(function()
					Events[3].GiveStayReward:FireServer(Index);
					if _G.PRINT_REWARDS_DATA then print("Claimed Playtime reward", Index) end;
					delay(3, function() PlaytimeRewards[Index]:Destroy() end);
					Connection:Disconnect();
					Connection = nil;
				end)
            else 
                Events[3].GiveStayReward:FireServer(Index)
				if _G.PRINT_REWARDS_DATA then print("Claimed Playtime reward", Index) end
                delay(3, function() PlaytimeRewards[Index]:Destroy() end)
            end
        end
    end
    
	-- for playtime rewards that are added mid-game
    PlaytimeRewards.ChildAdded:Connect(function(Reward)
        Reward:WaitForChild("TimeLeft"):GetPropertyChangedSignal("TextColor3"):Once(function()
			Events[3].GiveStayReward:FireServer(Reward.Name + 0)	-- find the function that calls this remote event
			if _G.PRINT_REWARDS_DATA then print("Claimed Playtime reward", Reward.Name) end
			task.delay(3, function() Reward:Destroy() end)
        end)
    end)

    -- Initializing automatic Daily (SpinReward) rewards
    local SpinReward = Folders[3].Main.Top.DailyRewards.UnClaimed
	
    if SpinReward.Visible then Events[3].ClaimDailyReward:InvokeServer()
		if _G.PRINT_REWARDS_DATA then print("Collected Daily Rewards") end
	end
    
    SpinReward:GetPropertyChangedSignal("Visible"):Connect(function()
        if SpinReward.Visible == false then return; end;
		Events[3].ClaimDailyReward:InvokeServer();
		if _G.PRINT_REWARDS_DATA then print("Collected Daily Rewards") end;
    end);

    -- Initializing automatic Rank and Group rewards
    -- each signal is called with this configuration regardless when initialized for some reason
    -- Connections are not designed to have arguments with directly passed functions (ClaimRewards(...) in this case), so I had to overlap generic functions
	DailyRewards[1]:GetPropertyChangedSignal("Text"):Connect(ClaimDailyRewards)
    DailyRewards[2]:GetPropertyChangedSignal("Text"):Connect(ClaimRankRewards)
	
	task.defer(ClaimDailyRewards)	-- Initialize Daily Rewards
	task.defer(ClaimRankRewards)	-- Initialize Rank Rewards

    -- Initializing automatic Index rewards
    local Index = Folders[3].PetIndex.Main
    
    for _,Category in ipairs({"Weapon", "Pet"}) do
        local Counter = Index[Category.."IndexRewards"].Counter
        if Counter.Text ~= "Completed" then
			
			local function GetRatio(String)
				local T,B = String:gmatch("(.+)/(.+) .+")()
				return (T + 0)/(B + 0) >= 1
			end			
			
			while task.wait() and Counter.Text ~= "Completed" and GetRatio(Counter.Text) do
				Events[3].IndexCompleted:FireServer(Category)
			end
			
            if Counter.Text ~= "Completed" then
				local Button,Connection = Index[Category.."IndexRewards"].Claim;
				Connection = Button:GetPropertyChangedSignal("Visible"):Connect(function()
					if Button.Visible then 
						Events[3].IndexCompleted:FireServer(Category);
						if _G.PRINT_REWARDS_DATA then print("Claimed", Category, "Index"); end;
						Button.Visible = false;
					end;
					task.delay(1, function() 
						if Counter.Text == "Completed" then 
							if _G.PRINT_REWARDS_DATA then print(Category, "Indexes Completed") end;
							Connection:Disconnect();
						end;
					end);
				end);
			end;
        end;
    end;
    
    -- Automatic Zone and Teleport purchases
    local TeleportButtons = Folders[3].Teleports.Main.ListFrame;
    if _G.MAX_ZONE >= table.getn(Modules[5]) then return; end;
        
	-- set to false if you do not want the doors and teleports to be automatically purchased
	_G.PURCHASE_DOORS = false;
	_G.PURCHASE_TELEPORTS = false;
	
	task.defer(function()
		while task.wait(1) do
			for Index=2, table.getn(Modules[5])-1 do
				if _G.PURCHASE_DOORS and Workspace.Worlds["Zone"..Index]:FindFirstChild("PurchaseNewZone") then
					if Modules[1].Coins >= Modules[5][Index + 1].Cost.Coins then 
						Events[3].PurchaseZone:InvokeServer();
						_G.MAX_ZONE += 1
						if _G.FARM_MAX then _G.ZONE_TO_FARM = tostring(_G.MAX_ZONE) end
						if Index == table.getn(Modules[5])-1 then 
							_G.PURCHASE_DOORS = nil;
							if _G.PURCHASE_TELEPORTS == nil then return end;
						end;
					end;
				end;
				
				if _G.PURCHASE_TELEPORTS and TeleportButtons[Index]:FindFirstChild("Cost") then
					if Modules[1].Gems >= Modules[5][Index].TeleportCost.Gems then 
						Events[3].PurchaseTeleport:InvokeServer(Index);
						if Index == table.getn(Modules[5])-1 then 
							_G.PURCHASE_TELEPORTS = nil;
							if _G.PURCHASE_DOORS == nil then return; end;
						end;
					end;
				end;
			end;
		end;
	end);
end;

autosInit()

local HitDetector = CreateInstance("Part", {
    Parent = Workspace,
    Name = rand:randString(math.random(15, 22)),
    Shape = "Ball",
    Size = Vector3.new(15, 15, 15),
    Transparency = 1,
    CanCollide = false,
    Anchored = false,
    Locked = false;
});

HitDetector.Touched:Connect(function(Hit)
	if _G.ACTIVE == false or Hit.Name ~= "HumanoidRootPart" or Services[1]:FindFirstChild(Hit.Parent.Name) ~= nil or GetHealth(Hit.Parent:FindFirstChild("Head")) == nil then return; end;
	HitEvent:FireServer(nil, Hit.Parent, Hit.Position);
end);

game:GetService("RunService").RenderStepped:Connect(function()
    HitDetector.CFrame = HumanoidRootPart.CFrame;
end);

-- Auto Dungeon
Events[5].Event:Connect(function()
	DungeonState = Events[1]:InvokeServer(); -- updated once every second
	if Toggles[3] or ((_G.JOIN_DUNGEON and DungeonState == "Starting") == false and os.time() < (Modules[1].LastDungeonEnter + 3600)) or DungeonState == "Begun" then return; end;
	Toggles[3] = true;
	if _G.PRINT_DUNGEON_DATA then print("Dungeon is ready") end
	while _G.FARM_DUNGEON == false do task.wait(1) end		-- when dungeon is ready, waits until dungeon farming is active
	
		-- (1) Starts Dungeon
	task.wait(2)
	Events[3].EnterDungeon:InvokeServer()
	task.wait(2)

		-- (2) Store current variable data
	local Currents,EquippedWeapons = {_G.FARM_MAX, _G.ZONE_TO_FARM, Toggles[1], _G.FARM_TARGET, _G.INDEX_RANDOMLY, _G.ACTIVE, HumanoidRootPart.CFrame}, {}
	for ID,_ in next, Modules[1].EquippedItems.Weapons do table.insert(EquippedWeapons, ID) end
	
		-- (3) Equip best weapons for Dungeon
	EquipBest("Weapon")
	
		-- (4) Disable potentially inflicting variables
	_G.ACTIVE, _G.FARM_MAX, Toggles[1], _G.FARM_TARGET, _G.ZONE_TO_FARM = false, false, false, false, "Other"
	task.wait(4)
	
		-- (5) Teleport user to dungeon loading zone
	HumanoidRootPart.CFrame = CFrame.new(-3401, 136.290268, 468, 1, -3.82670748e-08, -3.79028059e-12, 3.82670748e-08, 1, 6.93830984e-08, 3.78762516e-12, -6.93830984e-08, 1)
	HumanoidRootPart.Anchored = true; task.wait(2); HumanoidRootPart.Anchored = false
	
		-- (6) enable farming
	_G.INDEX_RANDOMLY = true
	_G.ACTIVE = true
	
		-- (7) wait until user is rewarded an Aura (dungeon is complete)
	repeat task.wait(1) until DungeonState == "Ready"

		-- (8) Disable farming and teleport user to previous location
	_G.ACTIVE = false;HumanoidRootPart.CFrame = Currents[7];HumanoidRootPart.Anchored = true

		-- (9) Unequip current weapons then equip previous weapons
	local Equipped = {}
	for ID,_ in next, Modules[1].EquippedItems.Weapons do table.insert(Equipped, ID) end
	Events[3].EquipItem:InvokeServer("Weapons", Equipped)wait(1) -- unequip current weapons
	Events[3].EquipItem:InvokeServer("Weapons", EquippedWeapons) -- equip previous weapons
	HumanoidRootPart.Anchored = false
	
	   -- (10) re-assign variables
	_G.FARM_MAX, _G.ZONE_TO_FARM, Toggles[1], _G.FARM_TARGET, _G.INDEX_RANDOMLY, _G.ACTIVE = unpack(Currents);
	Toggles[3] = false;
end);

-- Auto Egg Hatching
local EggClocking = (os.time() + 3)%10;
Events[4].Event:Connect(function()
	if os.time()%10 ~= EggClocking then return; end;
	EggClocking = (EggClocking + 3)%10;
	
	if _G.FARM_EGGS == false then return; end;
	if Modules[1].Gamepasses["40355989"] == nil then 
		return Events[2]:InvokeServer(_G.EGG, "Hatch");
	end;
	Events[2]:InvokeServer(_G.EGG, "Hatch3");
end);

local NewTime = nil;
NewTime = hookfunction(os.time, function() -- 
	if getcallingscript() == Modules[6] then 
		Events[4]:Fire(); -- Egg Hatch
		Events[5]:Fire(); -- Auto Dungeon
	end;
	return NewTime();
end);

local function CheckZone()
	if CurrentZone == "Other" or CurrentZone == _G.ZONE_TO_FARM then return; end; -- "CurrentZone" is current zone
	HumanoidRootPart.CFrame = CFrame.new(Teleports[tonumber(_G.ZONE_TO_FARM)]);
	HumanoidRootPart.Anchored = true
	task.wait(1)
	HumanoidRootPart.Anchored = false
end

local function GetMobs(Mobs)
	if _G.FARM_TARGET then
		for _,Mob in ipairs(Folders[1][CurrentZone]:GetChildren()) do
			if Mob.Name ~= _G.TARGET or Mob:FindFirstChild("Head") == nil then continue; end;
			table.insert(Mobs, Mob);
		end;
	else
		for _,Mob in ipairs(Folders[1][CurrentZone]:GetChildren()) do
			if Mob:FindFirstChild("Head") == nil then continue; end;
			table.insert(Mobs, Mob);
		end;
	end;
	
	if _G.INDEX_RANDOMLY then 
		return rand:Randomize(Mobs);
	end;
	
	return Mobs;
end;

-- Auto Farm Specific & General
task.defer(function()
	local Mobs,Health = {}

    while task.wait() do
		while (_G.ACTIVE and Toggles[2]) == false do task.wait(); end;
		CheckZone();
		
        for _,Mob in ipairs(GetMobs(Mobs)) do 
			if (_G.ACTIVE or Toggles[2]) == false then break; end;
			Health = GetHealth(Mob:FindFirstChild("Head"));
            if Health ~= nil then FollowMob(Mob, 2, Health); end;
        end;
		table.clear(Mobs);
    end;
end);

-- reconnect when disconnected
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(UI)
	task.wait(3);
	UI = UI:FindFirstChild("ErrorTitle", true);
	if UI == nil or UI.Text ~= "Disconnected" then return end;
	
	print("User has Disconnected. Waiting until connection has been re-established");
	repeat task.wait(1) until game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/null") == '\n';
	print("Connection has been established!");
	
	task.wait(8);
	game:GetService("TeleportService"):Teleport(game.PlaceId);
end);

-- Anti AFK
local Mouse = Services[1].LocalPlayer:GetMouse();
Services[1].LocalPlayer.Idled:Connect(function()	
	wait(math.random(5, 45));
	
	Services[4]:CaptureController();
	Services[4]:ClickButton2(Vector2.new(Mouse.X, Mouse.Y));
end);