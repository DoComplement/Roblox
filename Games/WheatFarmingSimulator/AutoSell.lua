if game:IsLoaded()==false then game.Loaded:Wait() end;

local LocalPlayer = game:GetService("Players").LocalPlayer;
local HumanoidRootPart = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart");

LocalPlayer.CharacterAdded:Connect(function(Character)
     HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");
end);

Workspace.Sell.Anchored=false;
LocalPlayer.Wheat.Changed:Connect(function()
     Workspace.Sell.CFrame = HumanoidRootPart.CFrame;   
end);
