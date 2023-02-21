-- Place the AutoFuse.lua script and this script in the autoexec file of the executor
if game.PlaceId ~= 7026949294 then return end;

-- reconnect when disconnected
task.defer(function()
	game:WaitForChild("CoreGui"):WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay").ChildAdded:Connect(function(UI)
		task.wait(3);
		UI = UI:FindFirstChild("ErrorTitle", true);
		if UI == nil or UI.Text ~= "Disconnected" then return end;
		
		print("User has Disconnected. Waiting until connection has been re-established");
		repeat task.wait(1) until game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/null") == '\n';
		print("Connection has been established!");
		
		task.wait(8);
		game:GetService("TeleportService"):Teleport(game.PlaceId);	
	end);
end);

if game:IsLoaded() == false then game.Loaded:Wait() end;

local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local PrimaryPart = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart");

LocalPlayer.CharacterAdded:Connect(function(Character)
	PrimaryPart = Character:WaitForChild("HumanoidRootPart");
end);

local TempCFrames = {
	["Autumn Zone Boss"] = CFrame.new(3508.42798, 36.5313873, 12369.9121, -0.945489943, -9.52416528e-08, 0.325651348, -1.07699051e-07, 1, -2.02262811e-08, -0.325651348, -5.41960858e-08, -0.945489943);
	["Autumn Egg 2"] = CFrame.new(3527.39844, 30.7223492, 12150.4932, -0.308820128, -9.9491011e-08, 0.951120436, -4.06626661e-08, 1, 9.14012119e-08, -0.951120436, -1.04485594e-08, -0.308820128);
	["Event Egg"] = CFrame.new(74.7213516, 25.8495693, -106.706306, 0.286026955, -2.58336925e-08, 0.958221555, 9.23232193e-08, 1, -5.98229799e-10, -0.958221555, 8.86372078e-08, 0.286026955);
	["Christmas Zone 2 Egg 2"] = CFrame.new();
}

task.defer(function()
	PrimaryPart.CFrame = TempCFrames["Autumn Egg 2"]; -- Change here (will have to change getgenv().EGG accordingly
    PrimaryPart.Anchored = true;
    task.wait(3);
    PrimaryPart.Anchored = false;
end);

-- Anti AFK
if getconnections~=nil then
	for _,v in ipairs(getconnections(Loca.Player.Idled)) do
		v:Disable();
	end;
else
	local Mouse = LocalPlayer:GetMouse();
	local VirtualUser = game:GetService("VirtualUser");
	LocalPlayer.Idled:connect(function()	
		task.wait(math.random(1, 45));

		VirtualUser:CaptureController();
		VirtualUser:ClickButton2(Vector2.new(Mouse.X, Mouse.Y));
	end);
end;

--					Auto Egg Hatch Begin						
local EggEvent = game:GetService("ReplicatedStorage").Remotes.Gameplay.RequestPetPurchase;
local DungeonHandler = LocalPlayer.PlayerScripts.PlayerHandler.Miscallenious.DungeonHandler;
local Bvent = Instance.new("BindableEvent");
getgenv().EGG = "Event Egg"; -- change to what is desired

local counter = (os.time() + 3)%10;
Bvent.Event:Connect(function() 
	if os.time()%10 ~= counter then return; end;
	counter = (counter + 3)%10;
	EggEvent:InvokeServer(EGG, "Hatch3");
end);

local f=nil;f = hookfunction(os.time, function()
	if getcallingscript() == DungeonHandler then Bvent:Fire() end;
	return f();
end);
--  					Auto Egg Hatch End						]]	



--[[					Auto Attack Begin							
local HitEvent = game:GetService("ReplicatedStorage").Remotes.Gameplay.FireHit;

local function GetHealth(Head)
	if Head == nil or Head.ExtraData.RedBar.Health.Text == "0 Health" then return; end;
	return Head.ExtraData.RedBar.Health;
end;

local HitDetector = Instance.new("Part", Workspace);
HitDetector.Name = "UnbreakableGobstoppa";
HitDetector.Shape = "Ball";
HitDetector.Size = Vector3.new(15, 15, 15);
HitDetector.Transparency = 1;
HitDetector.CanCollide = false;
HitDetector.Anchored = false;
HitDetector.Locked = false;

local HitSignal
HitSignal = HitDetector.Touched:Connect(function(Hit)
	if Hit.Name ~= "HumanoidRootPart" or Players:FindFirstChild(Hit.Parent.Name) ~= nil or GetHealth(Hit.Parent:FindFirstChild("Head")) == nil then return; end;
	HitEvent:FireServer(nil, Hit.Parent, Hit.Position);
end);

local FollowSignal
FollowSignal = game:GetService("RunService").RenderStepped:Connect(function()
    HitDetector.CFrame = PrimaryPart.CFrame;
end);
--  					Auto Attack End						]]	
