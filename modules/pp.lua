
-- pp.lua -> get player-parts

if(getgenv()["yo#p^q$XTPCysUGkzO?Y-*A]lBUKTO$m"] ~= nil)then return end;    -- strong pp

local localPlayer = game:GetService("Players").LocalPlayer;
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait();

local primaryPart = character.PrimaryPart;
if(not primaryPart)then
	character:GetPropertyChangedSignal("PrimaryPart"):Wait();
	primaryPart = character.PrimaryPart;
end;

local humanoid = character:WaitForChild("Humanoid");

localPlayer.CharacterAdded:Connect(function(char)
	char:GetPropertyChangedSignal("PrimaryPart"):Wait();
	character = char;
	primaryPart = char.PrimaryPart;
	humanoid = char:WaitForChild("Humanoid");	-- can yield, easy fix tho
end);

return character,primaryPart,humanoid;
