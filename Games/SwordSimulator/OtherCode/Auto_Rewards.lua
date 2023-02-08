
local Services = {
    [1] = Game:GetService("Players"),
    [2] = Game:GetService("Workspace"),
    [3] = Game:GetService("ReplicatedStorage"),
    [4] = Game:GetService("GroupService"),
	[5] = Game:GetService("VirtualUser")
}

-- Reference Variables for Auto Daily Rewards
local DailyRewards = {
    [1] = Game:GetService("CollectionService"):GetTagged("DailyGroupRewardsZone")[1].Countdown.CountdownUI.Frame.Countdown,
    [2] = Game:GetService("CollectionService"):GetTagged("RankRewardZone")[1].Countdown.CountdownUI.Frame.Countdown
}

-- Player Variables (See to adding these back into the tuple-format. I don't think the time loss is even slightly significant)
local HumanoidRootPart = Services[1].LocalPlayer.Character.HumanoidRootPart
local HitEvent = Services[3].Remotes.Gameplay.FireHit

-- Important Folders
local Folders = {
    [1] = Services[2].Mobs,                           	-- Workspace.Mobs
	[2] = Services[3].Saturn.Modules.GameDependent,   	-- ReplicatedStorage.Saturn.Modules.GameDependent
	[3] = Services[1].LocalPlayer.PlayerGui				-- Players.LocalPlayer.PlayerGui
}

-- Frequently-Used Remote Events
local Events = {
    [1] = Services[3].Events.GetDungeonData,            		-- Dungeon State
    [2] = Services[3].Remotes.Gameplay.RequestPetPurchase,      -- Egg Purchase
	[3] = Services[3].Events									-- Events Folder
}

-- Module Scripts
local Modules = {
    [1] = require(Folders[2].Parent.Client["PlayerData - Client"]).Replica.Data.Main,	-- Player Data
    [2] = require(Folders[2].Storage.PetsModule),                               -- Pets Module
    [3] = require(Folders[2].WeaponsModule),                                    -- Weapons Module
    [4] = require(Folders[2].BoostsCalculator),                              	-- Boosts Calculator
    [5] = require(Folders[2].Zones)                                          	-- Zones
}


local function inGroup(GroupID)
	for _,Group in ipairs(Services[4]:GetGroupsAsync(Services[1].LocalPlayer.UserId)) do
		if GroupID == Group.Id then
			return true;
		end;
	end;
	return false;
end;

local ClaimDailyRewards()
	if DailyRewards[1].Text == "Ready" then
		task.wait(2);
		if inGroup(11109344) == false then
			print("Not in Tachyon Roblox Group, so group rewards can not be claimed.");
			print("Group rewards will be claimed if you join mid-Game.");
			repeat task.wait(1) until inGroup(11109344);
		end;
		Events[3].ClaimGroupDailyReward:InvokeServer();
		if _G.PRINT_REWARDS_DATA then print("Claimed Group Rewards") end;
	end;
end;

local ClaimRankRewards()
	if DailyRewards[2].Text == "Ready" then
		task.wait(2);
		Events[3].ClaimRankReward:InvokeServer();
		if _G.PRINT_REWARDS_DATA then print("Claimed Rank Rewards") end;
	end;
end;

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
    
	-- for playtime rewards that are added mid-Game
    PlaytimeRewards.ChildAdded:Connect(function(Reward)
        Reward:WaitForChild("TimeLeft"):GetPropertyChangedSignal("TextColor3"):Once(function()
			Events[3].GiveStayReward:FireServer(tonumber(Reward.Name))	-- find the function that calls this remote event
			if _G.PRINT_REWARDS_DATA then print("Claimed Playtime reward", Reward.Name) end
			delay(3, function() Reward:Destroy() end)
        end)
    end)

    -- Initializing automatic Daily (SpinReward) rewards
    local SpinReward = Folders[3].Main.Top.DailyRewards.UnClaimed
	
    if SpinReward.Visible then Events[3].ClaimDailyReward:InvokeServer()
		if _G.PRINT_REWARDS_DATA then print("Collected Daily Rewards") end
	end
    
    SpinReward:GetPropertyChangedSignal("Visible"):Connect(function()
        if SpinReward.Visible then 
			Events[3].ClaimDailyReward:InvokeServer()
			if _G.PRINT_REWARDS_DATA then print("Collected Daily Rewards") end
		end 
    end)

    -- Initializing automatic Rank and Group rewards
    -- each signal is called with this configuration regardless when initialized for some reason
    -- Connections are not designed to have arguments with directly passed functions (ClaimRewards(...) in this case), so I had to overlap generic functions
	DailyRewards[1]:GetPropertyChangedSignal("Text"):Connect(ClaimDailyRewards)
    DailyRewards[2]:GetPropertyChangedSignal("Text"):Connect(ClaimRankRewards)
	
	task.defer(ClaimDailyReward)	-- Initialize Daily Rewards
	task.defer(ClaimRankRewards)	-- Initialize Rank Rewards

    -- Initializing automatic Index rewards
    local Index = Folders[3].PetIndex.Main
    
    for _,Category in ipairs({"Weapon", "Pet"}) do
        local Counter = Index[Category.."IndexRewards"].Counter
        if Counter.Text ~= "Completed" then
			
			local function GetRatio(String)
				local T,B = String:match("(.+)/(.+) .+");
				return tonumber(T)/tonumber(B) >= 1;
			end;
			
			while task.wait() and Counter.Text ~= "Completed" and GetRatio(Counter.Text) do
				Events[3].IndexCompleted:FireServer(Category)
			end
			
            if Counter.Text ~= "Completed" then
				local Button,Connection = Index[Category.."IndexRewards"].Claim
				Connection = Button:GetPropertyChangedSignal("Visible"):Connect(function()
					if Button.Visible then 
						Events[3].IndexCompleted:FireServer(Category)
						if _G.PRINT_REWARDS_DATA then print("Claimed", Category, "Index") end
						Button.Visible = false
					end
					task.delay(1, function() 
						if Counter.Text == "Completed" then 
							if _G.PRINT_REWARDS_DATA then print(Category, "Indexes Completed") end
							Connection:Disconnect() 
						end
					end)
				end)
			end
        end
    end
    
    -- Automatic Zone and Teleport purchases
    local TeleportButtons = Folders[3].Teleports.Main.ListFrame
    
    if _G.MAX_ZONE < table.getn(Modules[5]) then
        
	-- set to false if you do not want the doors and teleports to be automatically purchased
        _G.PURCHASE_DOORS = false
        _G.PURCHASE_TELEPORTS = false
        
        task.defer(function()
            while wait(1) do
                for Index=2, table.getn(Modules[5])-1 do
                    if _G.PURCHASE_DOORS and Services[2].Worlds["Zone"..Index]:FindFirstChild("PurchaseNewZone") then
                        if Modules[1].Coins >= Modules[5][Index + 1].Cost.Coins then 
                            Events[3].PurchaseZone:InvokeServer()
                            _G.MAX_ZONE = _G.MAX_ZONE + 1
                            if _G.FARM_MAX then _G.ZONE_TO_FARM = tostring(_G.MAX_ZONE) end
                            if Index == table.getn(Modules[5])-1 then 
                                _G.PURCHASE_DOORS = nil
                                if _G.PURCHASE_TELEPORTS == nil then return end
                            end
                        end
                    end
                    
                    if _G.PURCHASE_TELEPORTS and TeleportButtons[Index]:FindFirstChild("Cost") then
                        if Modules[1].Gems >= Modules[5][Index].TeleportCost.Gems then 
                            Events[3].PurchaseTeleport:InvokeServer(Index) 
                            if Index == table.getn(Modules[5])-1 then 
                                _G.PURCHASE_TELEPORTS = nil
                                if _G.PURCHASE_DOORS == nil then return end
                            end
                        end
                    end
                end
            end
        end)
    end
