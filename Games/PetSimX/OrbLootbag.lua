local wait,PrimaryPart = task.wait,nil;
do
	local LocalPlayer = game:GetService("Players").LocalPlayer
	if(not(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()).PrimaryPart)then
		LocalPlayer.Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
	end;
	PrimaryPart = LocalPlayer.Character.PrimaryPart;
	LocalPlayer.CharacterAdded:Connect(function(Character)
		Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
		PrimaryPart = Character.PrimaryPart;
	end);
end;

local function Sauce(O)
	while(O.Parent~=nil)do
		O.CFrame = PrimaryPart.CFrame;
		wait();
	end;
end;

task.defer(function()
	for _,Orb in ipairs(Workspace.__THINGS.Orbs:GetChildren()) do
		Sauce(Orb);
	end;
	for _,Lootbag in ipairs(Workspace.__THINGS.Lootbags:GetChildren()) do
		Sauce(Lootbag);
	end;
end);

Workspace.__THINGS.Orbs.ChildAdded:Connect(Sauce)
Workspace.__THINGS.Lootbags.ChildAdded:Connect(Sauce)
