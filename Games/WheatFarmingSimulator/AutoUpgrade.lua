-- Work in progress

local LocalPlayer = game:GetService("Players").LocalPlayer
local UpgradeIndicator = LocalPlayer.PlayerGui.UI.UpgradeIndicator.TextLabel;
local Purchase = game.ReplicatedStorage.RemoteFunctions.Purchase;
local BE = game.ReplicatedStorage.BindableEvents;

local function UP()
    if UpgradeIndicator.Text == "Upgradeable!" then
       -- Purchase:InvokeServer("Iron", c); task.wait();
        BE.GoldChanged:Fire(); task.wait();
        BE.UpdateData:Fire();
    end;
end;

UpgradeIndicator:GetPropertyChangedSignal("Text"):Connect(UP);
while UpgradeIndicator.Text=="Upgradeable!"and task.wait() do UP() end;
