-- Place the AutoFuse.lua script and this script in the autoexec file of the executor
if(game:IsLoaded())then return end;

local RECONNECT = nil;
-- reconnect when disconnected
task.defer(function()
	RECONNECT = game:GetService("CoreGui"):WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay").ChildAdded:Connect(function(UI)
		task.wait(3);
		UI = UI:FindFirstChild("ErrorTitle", true);
		if(not UI or UI.Text~="Disconnected")then return end;
		
		print("User has Disconnected. Waiting until connection has been re-established");
		repeat task.wait(1)until game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/null") == '\n';
		print("Connection has been established!");
		
		task.wait(8);
		game:GetService("TeleportService"):Teleport(game.PlaceId);	
	end);
end);

game.Loaded:Wait();
if(game.PlaceId~=7026949294)then return end;
do
	local succ,val = pcall(game.HttpGetAsync,game,"https://httpbin.org/headers");	
	while(not succ and task.wait(8))do
		succ,val = pcall(game.HttpGetAsync,game,"https://httpbin.org/headers");
	end;
	if(val:match("Specific_PrivateGame")~=nil)then 	-- if game is private
		RECONNECT = RECONNECT:Disconnect();
		return;
	end;
end;

local TempCFrames = {	-- may change/add CFrames to what is desired
	["Autumn Zone Boss"] = Vector3.new(3506.71142578125, 43.40776062011719, 12374.5322265625);
	["Autumn Egg 2"] = Vector3.new(3518.75634765625, 33.770015716552734, 12153.056640625);
	["Event Egg"] = Vector3.new(64.29299926757812, 30.878000259399414, -111.57599639892578);
	["Christmas Zone 2 Egg 2"] = Vector3.new(436.1945495605469, 970.802490234375, -1271.0340576171875);
	["Christmas Zone 1 Egg 2"] = Vector3.new(428.68499755859375, 970.635009765625, -1307.9110107421875);
};

local LocalPlayer = game:GetService("Players").LocalPlayer;
if(not(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()).PrimaryPart)then
	LocalPlayer.Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
end;

local rootPart = LocalPlayer.Character.PrimaryPart;
rootPart.CanQuery = false;
	
getgenv.TASK = ({
	[ [==[ UserId ]==] ] = "Autumn Zone Boss"; -- temp
	[ [==[ alt UserId ]==] ] = ...;
	...
})[LocalPlayer.UserId];


local rand = math.random;
local function randVec3()
	if(rand()>0.5)then
		if(rand()>0.5)then return Vector3.new(rand(2,6),0,rand(2,6))end;
		return Vector3.new(rand(2,6),0,-rand(2,6));
	elseif(rand()>0.5)then return Vector3.new(-rand(2,6),0,rand(2,6))end;
	return -Vector3.new(rand(2,6),0,rand(2,6));
end;

local function Teleport()
	rootPart.CFrame = CFrame.new(TempCFrames[TASK] + randVec3(), TempCFrames[TASK]);
	rootPart.Anchored = true;
    task.wait(3);
    rootPart.Anchored = false;
end;

task.defer(Teleport);
if(not TASK:match("Egg"))then		
	local HitEvent = game:GetService("ReplicatedStorage").Remotes.Gameplay.FireHit;
	local FireServer = HitEvent.FireServer;
	local Zone = Workspace.Mobs.ChildAdded:Wait();

	local HitDetector = Instance.new("Part");
	HitDetector.Name = "UnbreakableGobstoppa";
	HitDetector.Shape = "Ball";
	HitDetector.Size = Vector3.new(15, 15, 15);
	HitDetector.Transparency = 1;
	HitDetector.CanCollide = false;
	HitDetector.Anchored = false;
	HitDetector.Locked = false;
	HitDetector.Parent = Workspace;

	HitDetector.Touched:Connect(function(Hit)
		if(Hit.Name=="HumanoidRootPart"and Hit.Parent.Parent==Zone and Hit.Parent.Humanoid.Health>0)then
			FireServer(HitEvent, nil, Hit.Parent, Hit.Position);
		end;
	end);

	game:GetService("RunService").RenderStepped:Connect(function()
		HitDetector.CFrame = rootPart.CFrame;
	end);
else	
	local EggEvent = game:GetService("ReplicatedStorage").Remotes.Gameplay.RequestPetPurchase;
	local InvokeServer = EggEvent.InvokeServer;
	local DungeonHandler = LocalPlayer.PlayerScripts.PlayerHandler.Miscallenious.DungeonHandler;
	local Bvent = Instance.new("BindableEvent");
	
	local HatchType = "Hatch3";
	if(not plrData.Gamepasses["40355989"])then
		HatchType = "Hatch";
		local GP_Purchased = nil;
		GP_Purchased = game:GetService("MarketplaceService").PromptGamePassPurchaseFinished:Connect(function(player,gamePassId,wasPurchased)
			if(player==LocalPlayer and wasPurchased and gamePassId==40355989)then
				HatchType = "Hatch3";
				GP_Purchased = GP_Purchased:Disconnect();
			end;
		end);
	end;
	
	local WeaponsModule = require(game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.WeaponsModule);
	local PetsModule = require(game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.Storage.PetsModule);
	local function checkHatch(hatched)
		if(not hatched)then return(nil)end;
		local rarity = nil;
		for _,dat in ipairs(hatched)do
			if(dat[3])then continue;
			elseif(not dat[2].Weapon)then
				rarity = PetsModule[dat[1]].Rarity;
			else
				rarity = WeaponsModule[dat[1]].Rarity;
			end;
			if(rarity=="Secret"or rarity=="Mythical")then
				print("Hatched",rarity,dat[1]);
			end;
		end;
	end;

	local counter = (os.time() + 3)%10;
	Bvent.Event:Connect(function() 
		if(os.time()%10~=counter)then return end;
		counter = (counter + 3)%10;
		checkHatch(InvokeServer(EggEvent, TASK, HatchType));
	end);

	local time = nil;time = hookfunction(os.time, newcclosure(function()
		if(getcallingscript()==DungeonHandler)then Bvent:Fire()end;
		return time();
	end));
end;

-- onCharacterAdded event
LocalPlayer.CharacterAdded:Connect(function(Character)
	Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
	rootPart = Character.PrimaryPart;
	Teleport();
end);

-- Anti AFK
for _,v in ipairs(getconnections(LocalPlayer.Idled)) do
	v:Disable();
end;
