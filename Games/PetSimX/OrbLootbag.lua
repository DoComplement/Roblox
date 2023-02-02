
local LocalPlayer = game:GetService("Players").LocalPlayer
local PrimaryPart = (LocalPlayer.Character or LpcalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart");
PrimaryPart.Parent.CharacterAdded:Connect(function(c)
	PrimaryPart = c:WaitForChild("HumanoidRootPart");
end);

local function Sauce(O)
	while O.Parent ~= nil and task.wait() do
		O.CFrame = PrimaryPart.CFrame;
	end;
end;

for _,Orb in ipairs(Workspace["__THINGS"].Orbs:GetChildren()) do
	task.defer(Sauce, Orb);
end;

for _,Lootbag in ipairs(Workspace["__THINGS"].Lootbags:GetChildren()) do
	task.defer(Sauce, Lootbag);
end;

Workspace["__THINGS"].Orbs.ChildAdded:Connect(Sauce)
Workspace["__THINGS"].Lootbags.ChildAdded:Connect(Sauce)
