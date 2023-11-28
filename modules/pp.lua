
-- pp.lua -> get player-parts

if(not game:IsLoaded())then
	game.Loaded:Wait();
end;
if(getgenv()["yo#p^q$XTPCysUGkzO?Y-*A]lBUKTO$m"] ~= nil)then return end;    -- strong pp
getgenv()["yo#p^q$XTPCysUGkzO?Y-*A]lBUKTO$m"] = true;

local localPlayer = game:GetService("Players").LocalPlayer;
local character = (localPlayer.Character or localPlayer.CharacterAdded:Wait());

local function waitforchild(parent, child)
	local temp = parent:FindFirstChild(child);
	while(not temp or temp.Name ~= child)do
		temp = parent.ChildAdded:Wait();
	end;
	return temp;
end;

local primaryPart = character.PrimaryPart;
if(not primaryPart)then
	character:GetPropertyChangedSignal("PrimaryPart"):Wait();
	primaryPart = character.PrimaryPart;
end;

local humanoid = waitforchild(character, "Humanoid");

localPlayer.CharacterAdded:Connect(function(char)
	char:GetPropertyChangedSignal("PrimaryPart"):Wait();
	character = char;
	primaryPart = char.PrimaryPart;
	humanoid = waitforchild(char, "Humanoid");
end);

return localPlayer, character, primaryPart, humanoid;
