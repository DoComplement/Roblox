
--[[ TO DO:
	Consolidate methods w.r.t size of Types after initialization loop.
	Add variable,function,signal deallocation.
	Add method to change order upgrades by biased significance.
]]

local Upgrades = Game:GetService("Players").LocalPlayer.PlayerGui.Upgrades.Main.ScrollingFrame;
local UpgradeRemote = Game:GetService("ReplicatedStorage").Events.Upgrade;
local PlayerData = require(Game:GetService("ReplicatedStorage").Saturn.Modules.Client["PlayerData - Client"]).Replica.Data.Main;
local Types = {};
local Conversion = {
	['K'] = 1e+3, 
	['M'] = 1e+6, 
	['B'] = 1e+9
};

local function GetCost(Number, Symbol)
	return tonumber(Number)*Conversion[Symbol];
end;

local Signal = nil;
local function Upgrade()
    if(#Types == 0)then
       	Signal = Signal:Disconnect();
		return;
    end;
	for _,Upgrade in ipairs(Types)do
		local Cost = Upgrades[Upgrade].Frame.Cost;
		while Cost.Text ~= "XX" and PlayerData.Gems >= GetCost(Cost.Text:gmatch("(%d+)(.)")()) do
			UpgradeRemote:FireServer(Upgrade);
			Cost:GetPropertyChangedSignal("Text"):Wait();
		end;
	end;
end;

-- Initializing
for idx,Upgrade in ipairs(Upgrades:GetChildren()) do
    if Index == 1 or Upgrade.Frame.Cost.Text == "XX" then continue end;
	Types[idx - 1] = Upgrade.Name;
	local Cost,Connection = Upgrade.Frame.Cost, nil;
	Connection = Cost:GetPropertyChangedSignal("Text"):Connect(function()
		if Cost.Text == "XX" then
			table.remove(Types, idx - 1);
			Connection = Connection:Disconnect();
		end;
	end);
end;

Signal = Game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.GemsBar.GemsBar.Amount:GetPropertyChangedSignal("Text"):Connect(Upgrade);
Upgrade();
