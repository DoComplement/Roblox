local Workspace = game:GetService("Workspace")
local Orbs,Lootbags = Workspace["__THINGS"].Orbs, Workspace["__THINGS"].Lootbags
local PrimaryPart = game:GetService("Players").LocalPlayer.Character.PrimaryPart
local Connections = {}

for _,Orb in ipairs(Orbs:GetChildren()) do
	Orb.CFrame = PrimaryPart.CFrame
end

for _,Lootbag in ipairs(Lootbags:GetChildren()) do
	Lootbag.CFrame = PrimaryPart.CFrame
end

Connections["OrbConnection"] = Orbs.ChildAdded:Connect(function(Orb)
	while Orb.Parent and wait() do
		Orb.CFrame = PrimaryPart.CFrame
	end
end)

Connections["LootbagConnection"] = Lootbags.ChildAdded:Connect(function(Lootbag)
	while Lootbag.Parent and wait() do
		Lootbag.CFrame = PrimaryPart.CFrame
	end
end)  
