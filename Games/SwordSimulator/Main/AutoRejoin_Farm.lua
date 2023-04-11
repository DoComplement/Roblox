-- Place the AutoFuse.lua script and this script in the autoexec file of the executor
if(game.PlaceId~=7026949294 or game:IsLoaded())then return end;

-- reconnect when disconnected
task.defer(function()
	game:WaitForChild("CoreGui"):WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay").ChildAdded:Connect(function(UI)
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

local TempCFrames = {	-- may change/add CFrames to what is desired
	["Autumn Zone Boss"] = CFrame.new(3508.42798, 36.5313873, 12369.9121, -0.945489943, -9.52416528e-08, 0.325651348, -1.07699051e-07, 1, -2.02262811e-08, -0.325651348, -5.41960858e-08, -0.945489943);
	["Autumn Egg 2"] = CFrame.new(3527.39844, 30.7223492, 12150.4932, -0.308820128, -9.9491011e-08, 0.951120436, -4.06626661e-08, 1, 9.14012119e-08, -0.951120436, -1.04485594e-08, -0.308820128);
	["Event Egg"] = CFrame.new(74.7213516, 25.8495693, -106.706306, 0.286026955, -2.58336925e-08, 0.958221555, 9.23232193e-08, 1, -5.98229799e-10, -0.958221555, 8.86372078e-08, 0.286026955);
	["Christmas Zone 2 Egg 2"] = CFrame.new(436.19455, 970.498596, -1271.03406, -0.564071655, 0, 0.82572329, 0, 1, 0, -0.82572329, 0, -0.564071655);
};

game.Loaded:Wait();

local LocalPlayer = game:GetService("Players").LocalPlayer;
if(not(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()).PrimaryPart)then
	LocalPlayer.Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
end;

local rootPart = LocalPlayer.Character.PrimaryPart;
rootPart.CanQuery = false;
	
getgenv().TASK = "Autumn Zone Boss"; -- change if desired
if(LocalPlayer.UserId~= [==[ your UserId here ]==] )then
	-- change getgenv().TASK for alts
end;

local function Teleport()
	rootPart.CFrame = TempCFrames[TASK];
	rootPart.Anchored = true;
    task.wait(3);
    rootPart.Anchored = false;
end;

task.defer(Teleport);
if(not TASK:match("Egg"))then		
	local HitEvent = game:GetService("ReplicatedStorage").Remotes.Gameplay.FireHit;
	local FireServer = HitEvent.FireServer;
	local Zone = Workspace.Mobs.ChildAdded:Wait();

	local HitDetector = Instance.new("Part", Workspace);
	HitDetector.Name = "UnbreakableGobstoppa";
	HitDetector.Shape = "Ball";
	HitDetector.Size = Vector3.new(15, 15, 15);
	HitDetector.Transparency = 1;
	HitDetector.CanCollide = false;
	HitDetector.Anchored = false;
	HitDetector.Locked = false;

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

	local counter = (os.time() + 3)%10;
	Bvent.Event:Connect(function() 
		if(os.time()%10~=counter)then return end;
		counter = (counter + 3)%10;
		InvokeServer(EggEvent, TASK, "Hatch3");
	end);

	local f = nil;f = hookfunction(os.time, function()
		if(getcallingscript()==DungeonHandler)then Bvent:Fire()end;
		return f();
	end);
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
