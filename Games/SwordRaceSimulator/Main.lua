--[[
Work on fixing the orb teleport error and creating a model for eggs 

local OpenEgg = Remotes.RE_Draw; -- Args = {"Hatch","DrawXXX",{}} --> XXX indicates the number, determined by the zone (each egg is unique by their price)

local WeaponDraw = Remotes.RF_WeaponDraw; -- args = number of race loops
local DeleteItem = Remotes.RE_WeaponDelete; -- args = table of item ids 
local WepAutoDelete = Remotes.RF_WeaponAutoDelete; -- args = "WeaponXXX", XXX is weapon number
local FuseWeapons = Remotes.RE_WeaponFuse; --args = ID of one wep that can be fused
local FusePets = Remotes.RE_PetFuse; --args = num=2,table of items to fuse

local Summontime = Remotes.RF_Summontime;
local InvokeServer = Summontime.InvokeServer;
local SummonBoss = Remotes.RE_SummonBoss;

InvokeServer(Summontime)FireServer(SummonBoss); -- SummonBoss

]]

if game.PlaceId~=12172698927 or LOADED~=nil then return end;
getgenv().LOADED=true;
if game:IsLoaded()==false then 
    game.Loaded:Wait();
    game.ReplicatedFirst.Loaded.Event:Wait();
    game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UI.CenterMenu.Rewards.Reward.ScrollingFrame.Rewards.List.Rewards006.Time.text:GetPropertyChangedSignal("Text"):Wait();
	getconnections(game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UI.LeftMenu.AutoRun.Main.Activated)[1].Function(); -- Auto Run
end;

local LocalPlayer,FAST_REJOIN = game:GetService("Players").LocalPlayer,false;
local HRP = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart"); -- can infinite yield

do -- Initiating fast rejoin race
	local Launch = Workspace.WorldMain:WaitForChild("Walls").Launch.CFrame;
	-- local Gate = game.ReplicatedStorage:FindFirstChild("Gate") or Workspace.WorldMain.Door.Gate;
	-- Gate.AncestryChanged:Wait(); --etc
	
	local Running,StateChanged = Enum.HumanoidStateType.Running,nil;
	StateChanged=LocalPlayer.Character.Humanoid.StateChanged:Connect(function(old,new)
		if FAST_REJOIN and (old==Running or new==Running) then
			HRP.CFrame=Launch;
			FAST_REJOIN=false;
		end;
	end);

	LocalPlayer.CharacterAdded:Connect(function(Character)
		Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
		HRP = Character.PrimaryPart;
		StateChanged:Disconnect();
		StateChanged=Character.Humanoid.StateChanged:Connect(function(old)
			if FAST_REJOIN and old==Landed then
				HRP.CFrame=Launch;
				FAST_REJOIN=false;
			end;
		end);
	end);
end;

local wait = task.wait;
local insert,find,remove = table.insert,table.find,table.remove;
local UI = LocalPlayer.PlayerGui.MainUI.UI;
local Coins = LocalPlayer.leaderstats.Coins;
local Remotes = game.ReplicatedStorage.Remotes;
local CreateOrbs = Remotes.RE_CreateObrs;
local FireServer = CreateOrbs.FireServer;
-- local JoinRace = Remotes.RF_JoinRace; -- args=nil

do -- Auto Playtime Rewards
	local ClaimReward = Remotes.RE_ClaimReward;
		
	for idx,Reward in ipairs(UI.CenterMenu.Rewards.Reward.ScrollingFrame.Rewards.List:GetChildren()) do
		if idx==1 or Reward.Time.text.Text:sub(8)=="Claimed" then
			continue;
		elseif Reward.Time.text.Text=="Claim!" then
			FireServer(ClaimReward,Reward.Name);
			
			-- rejoin if all rewards have been claimed (ADD A TOGGLE)
			if(Reward.Name=="Rewards006")then
				game:GetService("TeleportService"):Teleport(game.PlaceId); -- :TeleportToPlaceInstance(game.PlacId,game.JobId);
			end;
		else
			local RewardText,RewardSignal=Reward.Time.text,nil;
			RewardSignal=RewardText:GetPropertyChangedSignal("Text"):Connect(function()
				if RewardText.Text~="Claim!" then return end;
				FireServer(ClaimReward,Reward.Name);
				RewardSignal=RewardSignal:Disconnect();
				
				-- rejoin if all rewards have been claimed
				if(Reward.Name=="Rewards006")then
					game:GetService("TeleportService"):Teleport(game.PlaceId); -- :TeleportToPlaceInstance(game.PlacId,game.JobId);
				end;
			end);
		end;
	end;
end;

do -- Auto Rebirth
	local Dot = UI.LeftMenu.Big.Two.Rebirths.Dot;
	local Rebirth = Remotes.RE_Rebirth;
	
	if Dot.Visible then FireServer(Rebirth) end;
	Dot:GetPropertyChangedSignal("Visible"):Connect(function()
		if Dot.Visible then FireServer(Rebirth) end;
	end);
end;

do -- Auto Claim Pet Index
	local PetIndex = Remotes.RE_PetIndexRewardClaimed; --args= WaitingId.Value
	local WaitingId = UI.CenterMenu.Index.PetsContainer.Bottom.Done.WaitingId
	local Dot = UI.LeftMenu.Big.Three.Index.Dot
	
	if Dot.Visible then FireServer(PetIndex,WaitingId.Value) end;
	Dot:GetPropertyChangedSignal("Visible"):Connect(function()
		if Dot.Visible then FireServer(PetIndex,WaitingId.Value) end;
	end);
end;

do -- Auto Upgrades (needs to be fixed/optimized)
	local Upgrade,UpgradeSignal = Remotes.RE_Upgrade,nil;
	local Config = require(game.ReplicatedStorage.Modules.LocalConfig.UpgradeConfig);
	local List = UI.CenterMenu.Upgrade.Shop.ScrollingFrame.Boosts.List;
		
	local function CheckUpgrades()
		for idx,Option in ipairs(List:GetChildren()) do
			if idx~=1 and Option.Max.Value~='' and Coins.Value>=Config[Option.Name][Option.Max.Value].Price then
				FireServer(Upgrade,Option.Name,Option.Max.Value);
			end;	
		end;
	end;
	task.defer(CheckUpgrades);
	UpgradeSignal=Coins:GetPropertyChangedSignal("Value"):Connect(CheckUpgrades);
end;

do -- Auto Teleport to best zone (after immediate rebirth)
    local Teleport = Remotes.RE_Teleport;
		
    for idx,Zone in ipairs(UI.CenterMenu.Teleport.List:GetChildren()) do
        if idx~=1 and Zone.Frame.TextLabel.Text=="?????" then
            Zone.Frame.TextLabel:GetPropertyChangedSignal("Text"):Once(function()
            	FireServer(Teleport,Zone.Name);
            end)
        end;
    end;
end;

--[[
do -- Auto Damage Boss & Collect Box
    local DamageBoss = Remotes.RE_TakeDamage;
    local ClaimBox = Remotes.RE_ClaimBox;
    local Monster = Workspace.WorldMain.Machines.Monster;
    local Box = Monster:FindFirstChild("Box") or game.ReplicatedStorage.Models.Effects.Box;
    
    if Monster.Health.Value>0 then
        while Monster.Health.Value>0 do
            child.RootPart.CFrame=HRP.CFrame;
            FireServer(DamageBoss);
            wait(1.05);
        end;
        Box.AncestryChanged:Wait();
        FireServer(ClaimBox);
    elseif Box.Parent==Monster then
        FireServer(ClaimBox);
    end
    
    game.ReplicatedStorage.Models.Monsters.ChildRemoved:Connect(function(child)
        if Monster.Health.Value==0 then Monster.Health.Changed:Wait() end;
        while Monster.Health.Value>0 do
            child.RootPart.CFrame=HRP.CFrame;
            FireServer(DamageBoss);
            wait(1.05);
        end;
        Box.AncestryChanged:Wait();
        FireServer(ClaimBox);
    end);
end;
]]

do -- Auto Equip Best Pets
    local EquipBest = Remotes.RE_EquipBest; -- args = true/false -> equip/unequip
    local Dot = UI.LeftMenu.Big.Three.Weapon.Dot;
    
    if Dot.Visible then FireServer(EquipBest,true) end;
    Dot:GetPropertyChangedSignal("Visible"):Connect(function()
        if Dot.Visible then FireServer(EquipBest,true) end;
    end);
end;

do -- Auto Equip Best Weapon
    local WeaponEquipBest = Remotes.RE_WeaponEquipBest;
    local Dot = UI.LeftMenu.Big.Two.Pets.Dot;
    
    if Dot.Visible then FireServer(WeaponEquipBest) end;
    Dot:GetPropertyChangedSignal("Visible"):Connect(function()
        if Dot.Visible then FireServer(WeaponEquipBest) end;
    end);
end;

do -- Auto Claim Daily Reward
    local Dot = UI.RightMenu.Small.Daily.Dot;
    
    for idx,Reward in ipairs(UI.CenterMenu.DailyLogin.Rewards:GetChildren()) do
        if idx==1 or Reward.Claim.text.Text=="Claimed" then
            continue;
        elseif UI.RightMenu.Small.Daily.Dot.Visible then
            FireServer(Remotes.RE_ClaimDaily,idx-1);
        else
            Dot:GetPropertyChangedSignal("Visible"):Once(function()
                FireServer(Remotes.RE_ClaimDaily,idx-1);
            end)
        end;
        break;
    end;
end;
--[[
There is still an error with setting the CFrame of orbs to the CFrame of the LocalPlayer PrimaryPart
-> The Model is teleported, but the orb will not be removed...

: Test cases where this error occurs and watch the output of a remote spy w.r.t the orb names
]]

-- Prevents game from setting UI to transparent
local NewNIdx=nil;NewNIdx=hookmetamethod(game,"__newindex",newcclosure(function(Self,...)
	if checkcaller()==false and Self==UI then
		return true;
	end;
	return NewNIdx(Self,...)
end));

do -- Prevent Server from create orbs via Namecall
    local EndRace = Remotes.RE_RaceEnd; 
    local NewNamecall=nil;NewNamecall=hookmetamethod(game,"__namecall",newcclosure(function(Self,...)
    	if checkcaller()==false and getnamecallmethod()=="FireServer" then
    	    if Self==CreateOrbs then
    	        return nil;
    	    elseif Self==EndRace then
    	        FAST_REJOIN=true;
            end;
    	end;
    	return NewNamecall(Self,...);
    end));
end;

-- Prevent Server from create orbs via Function call (even though this will never occur, yeet)
local Hook=nil;Hook=hookfunction(FireServer,newcclosure(function(Remote,...)
	if checkcaller()==false and Remote==CreateOrbs then
		return nil;
	end;
	return Hook(Remote,...);
end));

-- Teleport Orb to LocalPlayer until it is defeated
local Orbs = {};
local function ConnectOrb(Orb)
	insert(Orbs,Orb.Name);
	if Orb.PrimaryPart==nil then
		Orb:GetPropertyChangedSignal("PrimaryPart"):Wait();
	end;
	
	while wait() and Orb.PrimaryPart~=nil do
		Orb.PrimaryPart.CFrame=HRP.CFrame;
	end;
end;
	
Workspace.Orbs.ChildAdded:Connect(ConnectOrb);
Workspace.Orbs.ChildRemoved:Connect(function(orb)
	remove(Orbs,find(Orbs,orb.Name));
	if orb:FindFirstChild('1')~=nil then -- orb is VIP
		FireServer(CreateOrbs,false,true);
	else	
		FireServer(CreateOrbs,true,false);
	end;
end);
	
-- Initialize slimes
if #(Workspace.Orbs:GetChildren())<50 then
	local VIP_COUNT,NORMAL_COUNT = 30,20;
	for _,Orb in ipairs(Workspace.Orbs:GetChildren()) do
		task.defer(ConnectOrb,Orb);
		if Orb:FindFirstChild('1')~=nil then
			VIP_COUNT -= 1;
		else
			NORMAL_COUNT -= 1;
		end;
	end;
	
	for i=NORMAL_COUNT,0,-1 do
		FireServer(CreateOrbs,true,false);
	end;
	for i=VIP_COUNT,0,-1 do
		FireServer(CreateOrbs,false,true);
	end;
end;
	
-- Swing Orbs
task.defer(function()
	local Swing = Remotes.RE_Swing;
			
	while wait() do
		FireServer(Swing, Orbs)
	end;
end);

-- AntiAFK
for _,signal in ipairs(getconnections(LocalPlayer.Idled)) do
	signal:Disable();
end;

-- initialize zone data table
local Zones = {zones={}};
for id,details in next,require(game.ReplicatedStorage.Modules.LocalConfig.WorldConfig) do
	Zones.zones[details.WorldName]=id;
	Zones[id]={};
end;

do -- format zone data
    local floor,conversion = math.floor,{
        [1]={4,1,''};
        [2]={7,1e+3,'k'};
        [3]={10,1e+6,'m'};
        [4]={13,1e+9,'b'};
        [5]={16,1e+12,"Qa"};
    };
    local function Abbreviate(num,len)
        local len=tostring(floor(num)):len();
        for _,d in ipairs(conversion) do
            if len<d[1] then
                return ((num/d[2]..d[3]):gsub("%.000",''));
            end;
        end;
    end;
    
    for Egg,Data in next,require(game.ReplicatedStorage.Modules.LocalConfig.DrawConfig) do
        if Data.Type==1 then
            insert(Zones[Data.WorldIds],{
                [1]=Egg;
                [2]=Data.Price;
                [3]=Abbreviate(Data.Price,tostring(floor(Data.Price)):len());
            });
        end;
    end;
end;

--[[
local function UpdateEggs(child)
    print(child.Name);
    for _,Egg in ipairs(Zones[child.Name].eggs) do
        print(t2s(Egg));
    end;
    print('\n');
end;
]]

for name,id in next,Zones.zones do
    Zones[id],Zones[name] = nil,Zones[id];
    --[[
    if game.ReplicatedStorage.Worlds:FindFirstChild(name)==nil then
        if game.Players:FindFirstChild(name)==nil then
            UpdateEggs(Workspace[name])
        else
            for _,child in ipairs(Workspace:GetChildren()) do
                if child.ClassName=="Folder" and child.Name==name then
                    UpdateEggs(child);
                    break;
                end;
            end;
        end;
    end;
    ]]
end;
Zones.zones=nil;

-- game.ReplicatedStorage.Worlds.ChildRemoved:Connect(UpdateEggs);
-- Workspace.WorldMain.Vip:Destroy(); -- Remove VIP Barrier
