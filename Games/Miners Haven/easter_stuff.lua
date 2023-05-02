-- somewhat automated. user still has to load a save slot manually because I haven't attempted to spoof the calling env

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=258258996)then return end;

if(not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("GUI"))then
	game:GetService("Players").LocalPlayer.PlayerGui.ChildRemoved:Wait();										-- wait until player is loaded
end;	

local hrp = game:GetService("Players").LocalPlayer.Character.PrimaryPart;
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(Character)
    Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
    hrp = Character.PrimaryPart;
end);

local eggQueue = {};

local f = game:GetService("ReplicatedStorage").EventControllers.Easter.EasterBadgeItem;
local g = f.Parent.GetEasterEggs;
local i = f.InvokeServer;

-- on egg claimed
local function checkEgg(egg)
    if(i(g)[egg]==1)then
        i(f,egg);
    end;
end;

local function fillEgg(egg)
	if(egg~=nil)then
		table.insert(eggQueue,1,egg);
	end;
end;

for _,path in ipairs({Workspace.Easter["EASTER ISLAND EGG SPAWNS"],Workspace.Map.EGG_SPAWNS})do
    for idx,egg in ipairs(path:GetChildren())do
        egg.ChildAdded:Connect(fillEgg);
        fillEgg(egg:GetChildren()[1]);
    end;
end;

do										-- collect easter eggs
	local egg = nil;
	cf = hrp.CFrame;
	while(#eggQueue>0)do
		egg = table.remove(eggQueue);
		if(not egg:FindFirstChild("ProximityPrompt"))then continue end;
		hrp.CFrame = egg.CFrame;
		task.wait(0.3);
		repeat fireproximityprompt(egg.ProximityPrompt, 2);
		until task.wait()and not(egg.Parent);
		task.delay(1,checkEgg,egg.Name);
	end;
	hrp.CFrame = cf;
end;

do										-- server hop
	local function getServers()
		local succ,servers = pcall(game.HttpGetAsync, game, "https://games.roblox.com/v1/games/258258996/servers/0?limit=100&excludeFullGames=true");
		while(not(succ)and task.wait(5))do
			succ,servers = pcall(game.HttpGetAsync, game, "https://games.roblox.com/v1/games/258258996/servers/0?limit=100&excludeFullGames=true");
		end;

		return game:GetService("HttpService"):JSONDecode(servers).data;
	end;

	local servers = nil;
	repeat servers = getServers();
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(#servers)].id);					-- game may crash here occasionally
	until not task.wait(1);
end;
