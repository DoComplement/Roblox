
local Events = game.ReplicatedStorage.Events;
local GroupReward = game:GetService("CollectionService"):GetTagged("DailyGroupRewardsZone")[1].Countdown.CountdownUI.Frame.Countdown;
local RankReward = game:GetService("CollectionService"):GetTagged("RankRewardZone")[1].Countdown.CountdownUI.Frame.Countdown;
local UserId = game:GetService("Players").LocalPlayer.UserId

local function inGroup(GroupID)
	for _,Group in ipairs(GroupService:GetGroupsAsync(UserId)) do
		if GroupID == Group.Id then
			return true;
		end;
	end;
	return false;
end;

local function ClaimGroupRewards()
	if GroupReward.Text == "Ready" then
		task.wait(2);
		if inGroup(11109344) == false then
			print("Not in Tachyon Roblox Group, so group rewards can not be claimed.");
			print("Group rewards will be claimed if you join mid-game.");
			repeat task.wait(1) until inGroup(11109344);
		end;
		Events.ClaimGroupDailyReward:InvokeServer();
	end;
end;

local function ClaimRankRewards()
	if RankReward.Text == "Ready" then
		task.wait(2);
		Events.ClaimRankReward:InvokeServer();	
	end;
end;

GroupReward:GetPropertyChangedSignal("Text"):Connect(ClaimGroupRewards);
RankReward:GetPropertyChangedSignal("Text"):Connect(ClaimRankRewards);
