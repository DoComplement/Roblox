
-- https://raw.githubusercontent.com/1201for/V.G-Hub/main/Project-XXL

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=171391948 or nil~=getgenv()["htlO@FMxrP6DP_HZS;Q^"])then return end;
getgenv()["htlO@FMxrP6DP_HZS;Q^"] = true;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
};

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local VirtualInputManager = game:GetService("VirtualInputManager");
local HttpService = game:GetService("HttpService");
local TweenService = game:GetService("TweenService");
local TeleportService = game:GetService("TeleportService");
local RunService = game:GetService("RunService");
local MarketplaceService = game:GetService("MarketplaceService");
local StarterGui = game:GetService("StarterGui");

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse();
local Protest = ReplicatedStorage.Quests
local PlayerValues = Player.PlayerValues
local Chests = Workspace.Chests
local wait = task.wait

if(nil~=getconnections)then
    for _,con in ipairs(getconnections(LocalPlayer.Idled))do
        con:Disable();
    end;
else
	local VirtualUser = game:GetService("VirtualUser");
    Player.Idled:Connect(function()
        task.wait(math.random(15,33));
        VirtualUser:CaptureController();
        VirtualUser:ClickButton2(Vector2.new(Mouse.X,Mouse.Y),Workspace.Camera);
    end);
end;


local Name = "V.G Hub//Ihateit.json";
local Des = {}
if(nil~=makefolder and not isfolder("V.G Hub"))then
    makefolder("V.G Hub");
end;

if(not isfile(Name))then
    writefile(Name, HttpService:JSONEncode(Des));
end;

local Settings = HttpService:JSONDecode(readfile(Name))
local function Save()
    writefile(Name, HttpService:JSONEncode(Settings));
end;

local function Message(A, B, C)
	assert(messagebox,"messagebox function not supported")(B, A, 0x10);
    return A, B, C;
end

local function Teleport(A, B, C)
    if(C)then A.CFrame = B end;
end;

local function Rough()
    repeat wait() until Player:FindFirstChild("Menu",true) and Player:WaitForChild("Backpack"):FindFirstChildWhichIsA("Tool",true)
end

RunService.Stepped:Connect(function()
	if(not character:FindFirstChild("Head"))then return end;
	if(not Settings.HideName and nil~=character.Head:FindFirstChild("Overhead",true))then
		character.Head:FindFirstChild("Overhead",true):Destroy();
	end;
	Workspace.FallenPartsDestroyHeight = 0 / 0;				-- NaN
	sethiddenproperty(Player, "SimulationRadius", 1000);	
end);

local function Float(v)
    if(nil~=v:FindFirstChild("BodyForce",true))then
        return;
    end;
    local BodyForce = Instance.new("BodyForce")
    BodyForce.Force = v:GetMass() * Vector3.new(0, Workspace.Gravity, 0);
    BodyForce.Parent = v;
end;

for idx,npc in ipairs(Workspace.NPCS:GetChildren())do
    if(v:IsA("Model")and nil~=v:FindFirstChild("Humanoid"))then
        v.Chat.QuestText1.Value = MarketplaceService:GetProductInfo(game.PlaceId).Name .. " Thanks you for using V.G Hub";
    end;
end;


local Quests = {}
for idx, quest in ipairs(Protest:GetChildren())do
    Quests[idx] = quest.Name;
end;

local Codes = {}
for idx,code in ipairs(Player.Codes:GetChildren())do
    Codes[idx] = code.Name;
end;

local Shop = {}
for idx,item in ipairs(Workspace.Shop:GetChildren())do
    Shop[idx] = item.Name;
end;

local Mobs,Hentai,system = {},{},{}
for idx,mob in ipairs(Workspace.Live:GetChildren())do
	Mobs[idx] = mob.Name;
	if(not(mob:FindFirstChild("Humanoid")and mob:FindFirstChild("Quest"))then continue;
	elseif(mob.Name~="Thug (lvl. 5)"and nil~=mob:FindFirstChild("Drops"))then
		Hentai[#Hentai + 1] = mob.Name;
    elseif(not table.find(system, mob.Name))then
        system[#system + 1] = mob.Name;
    end;
end;

local VVV = {}
for idx,marker in ipairs(Workspace.QuestMarkers:GetChildren())do
    VVV[idx] = marker.Name;
end;

local function Tween(A, B, C)
    if(nil~=(A and B))then
        local Time = (B - A.Position).Magnitude / C;
        TweenService:Create(A, TweenInfo.new(Time, Enum.EasingStyle.Linear), {CFrame = CFrame.new(B.X, B.Y, B.Z)}):Play();
        wait(Time);
    end;
end;

local function c()
    for _,tool in ipairs(Player.Backpack:GetChildren())do
        if(tool.ClassName=="Tool" and nil~=v:FindFirstChild("Combat Script"))then
			task.defer(humanoid.EquipTool, humanoid, tool);
        end;
    end;
end;

local Part = Instance.new("Part");
Part.Name = "poopy";
Part.Size = Vector3.new(9e9, 0, 9e9)
Part.Anchored = true
Part.Transparency = 1
Part.Parent = Workspace;

local uu = 75
getgenv().delay2 = 0.03
getgenv().delay = 1
getgenv().name = "MagicMan1240"
getgenv().aa = 0
Settings.Amount = 10


local Window = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test")), "error loading V.G library")():CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Anime Rifts")
local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")

local Tab2 = Window:CreateTab("UI Settings")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

local BladeCombatRemote = ReplicatedStorage.RemoteEvents.BladeCombatRemote;
local FireServer = BladeCombatRemote.FireServer;

Section1:CreateToggle("Auto Attack", Settings.AutoAttack, function(State)
	Settings.AutoAttack = State;
	while(Settings.AutoAttack)do
		wait(delay2)
		FireServer(BladeCombatRemote,false);
	end;
end);

do
	local LIST = {'E', 'R', 'C', 'X', 'Y', 'V', 'Z'};
	Section1:CreateToggle("Auto Skills", Settings.AutoSkills, function(State)
		Settings.AutoSkills = State;
		while(Settings.AutoSkills)do
			for _,ltr in ipairs(LIST)do
				wait(delay2)
				VirtualInputManager:SendKeyEvent(true, ltr, false, game);
			end;
		end;
	end;
end);

Section1:CreateToggle("Auto Chests", Settings.Auw, function(State)
	Settings.Auw = State
    while(wait() and Settings.Auw)do
		for _,chest in ipairs(Chests:GetChildren())do
			if(chest:IsA("BasePart")and 0==chest.Transparency)then
				rootPart.CFrame = chest.CFrame;
			end;
		end;
    end;
end);

Section1:CreateToggle("Auto Fruits", Settings.Auw, function(State)
	Settings.Aud = State;
	local tool = nil;
    while(wait()and Settings.Aud)do 
		tool = Workspace:FindFirstChildWhichIsA("Tool", true);
		if(nil~=tool)then
			firetouchinterest(rootPart, tool.Handle, 0);
		end;
    end;
end);

Section1:CreateToggle("Dont HideName", Settings.HideName, function(State)Settings.HideName = State end);

RunService.Stepped:Connect(function()
	if(Settings.AutoA)then
		for i,v in ipairs(character:GetChildren())do
			if v:IsA("BasePart") then
				v.CanCollide = false
				v.Velocity = Vector3.new();
			end 
		end 
	end
end);

Section1:CreateToggle("Auto Mob", Settings.AutoA, function(State)
	Settings.AutoA = State;
    while(wait()and Settings.AutoA)do
		for i,v in ipairs(Workspace.Live:GetChildren())do
			if(not(v:IsA("Model"))or v.Name~=Settings.Mo or not v.PrimaryPart)then continue end;
			local Humanoid = v:FindFirstChildWhichIsA("Humanoid",true)
			if(not Humanoid or Humanoid.Health<=0)then continue end;
			rootPart.CFrame = v.PrimaryPart.CFrame * CFrame.new(0, -15, 0) * CFrame.Angles();
			FireServer(BladeCombatRemote, false, v.PrimaryPart.Position,v.PrimaryPart.CFrame);
			if(nil~=Player.Backpack:FindFirstChild("Combat",true))then
				humanoid.EquipTool(humanoid, Player.Backpack:FindFirstChild("Combat",true));
			end;
		end;
    end;
end)

Section1:CreateDropdown("Mobs", system, function(String)Settings.Mo = String end);

local function ClosestPlayerToCurser()
    local MaxDistance, Closest = math.huge,nil;
    for idx,plr in ipairs(Players.GetPlayers(Players))do
		if(idx==1 or not(plr.Character and plr.Character.PrimaryPary))then continue end;
	
		local Pos, Vis = Workspace.CurrentCamera:WorldToScreenPoint(plr.Character.PrimaryPart.CFrame.Position);
		if(not Vis)then continue end;
			local Dist = math.sqrt((Mouse.X - Pos.X)^2 + (Mouse.Y - Pos.Y)^2);
			if(Dist < MaxDistance)then
				MaxDistance,Closest = Dist,plr.Character.PrimaryPart;
			end;
		end;
    end
    return Closest;
end;

local OldIndex = getrawmetatable(game).__index;
local function NewIndex(self, key)
	if((Settings.PlayerSilentAim or Settings.MobSilentAim)and self==Mouse and(key=="Hit"or"Target"==key))then
		local Closest = ClosestPlayerToCurser();
		if(not Closest)then return OldIndex(self,key)end;
		if(key=="Hit")then
			return Closest.CFrame + Closest.Velocity;
		else
			return Closest;											-- Target
		end;
	end

	return OldIndex(self, key);
end;

Section1:CreateToggle("Player Silent Aim", Settings.PlayerSilentAim, function(State)
	Settings.PlayerSilentAim = State;
	if(Settings.MobSilentAim)then return end;
	if(State)then
		hookmetamethod(game, "__index", NewIndex);				-- set
	else
		hookmetamethod(game, "__index", OldIndex);				-- reset
	end;
end);

local function ClosestMobToCurser()
	local MaxDistance, Closest = math.huge;
	for _,mob in ipairs(Workspace.Live:GetChildren())do
		if(not(mob:IsA("Model")and mob:FindFirstChild("Head")))then continue end;
		local Pos, Vis = Workspace.CurrentCamera:WorldToScreenPoint(mob.Head.Position);
		if(not Vis)then continue end;
		local Dist = math.sqrt((Mouse.X - Pos.X)^2 +  (Mouse.Y - Pos.Y)^2);
		if(Dist < MaxDistance)then
			MaxDistance,Closest, Dist,mob.Head;
		end;
	end;
	return Closest;
end

Section1:CreateToggle("Mob Silent Aim", Settings.MobSilentAim, function(State)
	Settings.MobSilentAim = State;
	if(Settings.PlayerSilentAim)then return end;
	if(State)then
		hookmetamethod(game, "__index", NewIndex);				-- set
	else
		hookmetamethod(game, "__index", OldIndex);				-- reset
	end;
end)

Section1:CreateToggle("Player Godmode", Settings.PlayerGodMode, function(State)
	Settings.PlayerGodMode = State
	while(Settings.PlayerGodMode)do
		wait(delay2);
		if(not PlayerValues.PassiveMode.Value)then
			firetouchinterest(rootPart,Workspace.GameStuff.EternalHorrorBrolyTeleporter.TeleportPart,0)
			for i = 1, 10 do
				wait(delay2)
				Teleport(rootPart,Workspace.SafeZoneIndicator.CFrame,true);
			end;
		end;
	end;
	humanoid.Health = 0;
end);

Section1:CreateToggle("NPC Semi Godmode", Settings.SemiGodMode, function(State)
Settings.SemiGodMode = State;
	while(wait(delay2)and Settings.SemiGodMode)
		if(Player.Character:FindFirstChild("Player"))then
			Player.Character.Player:Destroy();
		end;
	end;
	humanoid.Health = 0;
end);

do
	local ChangeQuestRemote = ReplicatedStorage.RemoteEvents.ChangeQuestRemote;
	Section1:CreateToggle("Auto Start Quest", Settings.StartQuest, function(State)
		Settings.StartQuest = State;
		while(Settings.StartQuest)do
			wait(delay2)
			Rough();
			if(not Player.PlayerGui:WaitForChild("Menu"):WaitForChild("QuestFrame").Visible)then
				FireServer(ChangeQuestRemote, Protest:FindFirstChild(Settings.Quest));
			end;
		end;
	end);
end;

Section1:CreateDropdown("Quests", Quests, function(String)Settings.Quest = String end);

task.defer(function()
	while(wait(delay2))do
		if(Settings.CooldownReduction)then
			PlayerValues.CooldownReduction.Value = -9e9
		else
			PlayerValues.CooldownReduction.Value = 1;
		end;
	end;
end);
Section1:CreateToggle("No CooldownReduction", Settings.CooldownReduction, function(State)Settings.CooldownReduction = State end):AddToolTip("Makes Abilitys have no animation Cooldown");

Section1:CreateButton("Anti Effects", function()
	StarterGui:SetCore("SendNotification",{
		Title = "Effects Gone",
		Text = "Try one of your gay ugly weak moves unless you use *** then u cool"
	});
	if(nil~=Workspace:FindFirstChild("Effects"))then
		Workspace.Effects:Destroy();
	end;
end);

do
	local idk = false;
	local Cooldown = task.wait;
	local function here_hook(v)
		return Cooldown(0);
	end;
	Section1:CreateToggle("Time waits for nobody.", idk, function(state)
		idk = state;
		if(state)then
			hookfunction(task.wait, here_hook);
		else
			hookfunction(task.wait, Cooldown);
		end;
	end);
end;


Section1:CreateToggle("InstantKill", Settings.InstantKill, function(State)
	Settings.InstantKill = State;
	while(wait(delay2)and Settings.InstantKill)do
		for i,v in ipairs(Workspace.Live:GetChildren())do
			if(v:FindFirstChild("Humanoid")and v.Humanoid.Health>0 and v.Humanoid.Health < v.Humanoid.MaxHealth)then
				v.Humanoid.Health = 0;
			end;
		end;
	end;
end);


Section1:CreateTextBox("Fast Trade", "UserName Here", false, function(String)
	String = String:lower();
	for idx,plr in ipairs(Players:GetPlayers())do
		if(idx~=1 and nil~=(plr.Name:lower():match(String)or plr.DisplayName:lower():match(String)))then
			ReplicatedStorage.RemoteEvents.CommandsRemote:FireServer("!trade " .. plr.Name);
		end;
	end;
end);


Section1:CreateTextBox("Fast GiveItem", "UserName Here", false, function(String)
	String = String:lower();
	for idx,plr in ipairs(Players:GetPlayers())do
		if(idx~=1 and nil~=(plr.Name:lower():match(String)or plr.DisplayName:lower():match(String)))then
			ReplicatedStorage.RemoteEvents.CommandsRemote:FireServer("!giveitem " .. plr.Name);
		end;
    end;
end);
                
Section1:CreateToggle("Stun All Mobs", Settings.StunMobs, function(State)
	Settings.StunMobs = State;
	while(wait(2)and Settings.StunMobs)do
		for _,mob in ipairs(Workspace.Live:GetChildren())do
			if(nil~=mob:FindFirstChild("Humanoid"))then
				mob.Humanoid.PlatformStand = true;
			end;
		end;
	end;
end);

getgenv().magss = 100
Section1:CreateToggle("Auto Bring Mob", Settings.Bring, function(State)
	Settings.Bring = State;
	while(wait(0.5)and Settings.Bring)do
		for _,mob in ipairs(Workspace.Live:GetChildren()) do
			if(not mob.PrimaryPart or mob.Name=="Training dummy"or mob.Humanoid.Health<=0)then continue end;
			if((rootPart.Position - mob.PrimaryPart.Position).Magnitude < magss)then
				Tween(mob.PrimaryPart, rootPart.CFrame.p, 100);
				ReplicatedStorage.RemoteEvents.BladeCombatRemote:FireServer(false);
			end;
		end;
	end;
end);


Section1:CreateTextBox("Print Players Info", "UserName Here", false, function(String)
	String = String:lower();
	for idx,plr in ipairs(Players:GetPlayers())do
		if(idx~=1 and nil~=(plr.Name:lower():match(String)or plr.DisplayName:lower():match(String)))then
		plr = Players[plr.Name].PlayerValues;
        print("Gold", plr.Gold.Value);
        print("Ability1 -", plr.Ability.Value, plr.Trait.Value, plr.Class.Value);
        print("Ability2 -", plr.Ability2.Value, plr.Trait2.Value, plr.Class2.Value);
    end;
end);

local SayMessageRequest = ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest;
Section1:CreateTextBox("Blurt Players Info", "UserName Here", false, function(String)
	String = String:lower();
	for idx,plr in ipairs(Players:GetPlayers())do
		if(idx~=1 and nil~=(plr.Name:lower():match(String)or plr.DisplayName:lower():match(String)))then
		plr = Players[plr.Name].PlayerValues;
		FireServer(SayMessageRequest, "First Ability They have Equiped is " .. (plr.Ability.Value .. " " .. plr.Trait.Value .. " " .. plr.Class.Value), "All");
		FireServer(SayMessageRequest, "Second Ability They have Equiped is "..(plr.Ability2.Value .. " " .. plr.Trait2.Value .." " .. plr.Class2.Value),"All");
		FireServer(SayMessageRequest, plr.Name .. " is there user", "All");
	end;
end);

do
	local function setup_AutoKeyPress(key)
		return function(State)
			Settings[key] = State;
			while(wait(delay2)and Settings[key])do
				VirtualInputManager:SendKeyEvent(true, key, false, uwu);
			end;
		end;
	end;

	for _,key in ipairs({'E', 'R', 'X', 'C', 'Y', 'V', 'T'})do
		Section2:CreateToggle("AutoKeyPress "..key, Settings[key], setup_AutoKeyPress(key));
	end;
end;

-- needs work
-- Section2:CreateToggle("Streamer Mode", Settings.Name, function(State)
	-- Settings.Name = State
	-- Settings.FakeName = "OkButWhoAsked";
	-- for i, v in next, game:GetDescendants() do
		-- if v.ClassName == "TextLabel" and Settings.Name then
			-- if string.find(v.Text, Player.Name) then
				-- v.Text = v.Text:gsub(Player.Name, Settings.FakeName)
			-- end
			-- v:GetPropertyChangedSignal("Text"):Connect(function()
				-- v.Text = v.Text:gsub(Player.Name, Settings.FakeName);
			-- end);
		-- end;
	-- end;
-- end)

-- game.DescendantAdded:Connect(function(desc)
	-- if v.ClassName == "TextLabel" and Settings.Name then
		-- v:GetPropertyChangedSignal("Text"):Connect(function()
			-- v.Text = v.Text:gsub(Player.Name, Settings.FakeName)
		-- end)
		-- if string.find(v.Text, Player.Name) then
			-- v.Text = v.Text:gsub(Player.Name, Settings.FakeName)
		-- end
	-- end
-- end)



Section1:CreateButton("Make Money Anoucement", function()
	if(Settings.MakeItRain)then
		FireServer(SayMessageRequest,"This Cash Grab Was Sponsored By V.G Hub","All");
	end;
end);

do
	local CommandsRemote = ReplicatedStorage.RemoteEvents.CommandsRemote;
	Section1:CreateToggle("Make It Rain Cash", Settings.MakeItRain, function(State)
		Settings.MakeItRain = State;
		while(wait(delay2)and Settings.MakeItRain)do
			for idx,plr in ipairs(Players:GetPlayers())do
				if(idx~=1)then
					FireServer(CommandsRemote, "!pay " .. v.Name .. " " .. Settings.Amount);
				end;
			end;
		end;
	end):AddToolTip("Warning this uses your cash use it wisely");
end;

Section1:CreateSlider("Giving Money Amount", 0,1000,nil,false, function(Value)Settings.Amount = Value end);

do
	local OldNameCall = nil;
	local function here_hook(self,...)
		if(Settings.AntiLeveling and"LevelingRemote"==self.Name)then
			return;
		end
		return OldNameCall(self, ...);
	end;
	Section1:CreateToggle("Anti Leveling", nil, function(State)
		Settings.AntiLeveling = State;
		if(State)then
			OldNameCall = hookmetamethod(game, "__namecall", here_hook);
		else
			hookmetamethod(game, "__namecall", OldNameCall);
		end;
	end):AddToolTip("Makes you not able to level up");
end;


Section1:CreateSlider("Attack Distance", 0,300,nil,false, function(Value)uu = Value end);
Section1:CreateSlider("AutoFarm Speed", 0,7,nil,false, function(Value)delay2 = Value end);
Section1:CreateSlider("Bring Radius", 0,1000,nil,false, function(Value)magss = Value end);
Section1:CreateSlider("Attack Angle", 0,360,nil,false, function(Value)aa = Value end);
Section1:CreateButton("Redeem Selected Code", function()ReplicatedStorage.RemoteEvents.CodeRemote:FireServer(code)end);
Section1:CreateDropdown("Codes", code, function(String)code = String end);
Section1:CreateButton("Redeem All Codes", function()
	for i, v in pairs(Player.Codes:GetDescendants())do
		ReplicatedStorage.RemoteEvents.CodeRemote:FireServer(v.Name);
	end;
end);

local words = {
	"V.G Hub Best",
	"Autofarming with V.G hub makes this game ten times easier",
	"DekuDimz is so cool fast updates ez",
	"V.G Hub has the only working godmode",
	"im pround to be using V.G Hub OwO",
	"why are you just standing around get yourself V.G hub its free dude",
	"Honestly if your not using godmode your a dork','Random messging is funny','i have auto chat enabled LOL",
	"V.G Hub Winning",
	"V.G Hub on Top"
}

Section2:CreateToggle("SS Jump Mobs", Settings.UU, function(State)
	Settings.UU = State
	while(wait(1)and Settings.UU)do
		for _,mob in ipairs(Workspace.Live:GetChildren())do
			if(mob:IsA("Model"))then
				mob.Humanoid:ChangeState("Jumping");
			end;
		end;
    end;
end);

do
	local con = nil;
	local function here_f(mob)
		if(not mob:IsA("Model"))then continue end;
		for _,child in ipairs(mob:GetChildren())do
			if(child:IsA("BasePart")and not child.Anchored)then
				Float(child);
			elseif(child:IsA("Humanoid"))then
				child.PlatformStand = true
			end;
		end;
	end;

	Section2:CreateToggle("SS Float Mobs", Settings.Go, function(State)
		Settings.Go = State;
		if(State)then
			-- initialize
			for _,mob in ipairs(Workspace.Live:GetChildren()) do
				here_f(mob);
			end;

			con = Live.ChildAdded:Connect(here_f);
		else
			con:Disconnect();
		end;
	end);
end;

Section2:CreateToggle("SS Sit Mobs", Settings.UU1, function(State)
	Settings.UU1 = State;
	while(wait(1)and Settings.UU1)do
		for _,mob in ipairs(Workspace.Live:GetChildren()) do
			if(mob:IsA("Model"))then
				mob.Humanoid.Sit = true;
			end;
		end;
	end;
end);

Section2:CreateToggle("Spam Chat", nil, function(State)
	Settings.Spam = State;
        while(wait(5)and Settings.Spam)do
			FireServer(SayMessageRequest,words[math.random(#words)],"All");
        end;
    end;
end);

do
	local con = nil;
	local function here()
		humanoid.WalkSpeed = Settings.WalkSpeed;
		if(humanoid.UseJumpPower)then
			humanoid.JumpPower = Settings.JumpPower;
		else
			humanoid.JumpHeight  = Settings.JumpPower;
		end;
		if(not UserInputService.WindowFocusReleased)then
			setfpscap(Settings.Fps);
		end;
	end;
	
	Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
		Settings.Go = State;
		if(State)then
			con = RunService.Stepped:Connect(here);
		else
			con:Disconnect();
		end;
	end);
end;

Section2:CreateTextBox("Teleport To Player", "UserName Here", false, function(String)
	String = String:lower();
	for idx,plr in ipairs(Players:GetPlayers())do
		if(idx==1 or not(Player.Character and Player.Character.PrimaryPart))then continue;
		elseif(nil~=(plr.Name:lower():match(String)or plr.DisplayName:lower():match(String)))then
			Teleport(rootPart,v.Player.Character.PrimaryPart.CFrame,true);
		end;
    end;
end);

Section2:CreateTextBox("Fps Cap", "Only numbers", true, function(Value)Settings.Fps = Value end);
Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)Settings.WalkSpeed = Value end);
Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)Settings.JumpPower = Value end);

do
    local CON = nil;
	local function jump()humanoid:ChangeState("Jumping")end;
    Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
        Settings.InfiniteJump = State
        if(State)then
            CON = UserInputService.JumpRequest:Connect(jump);
        else
            CON:Disconnect();
        end;
    end);
end;

local ESP = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp")),"Error loading Karrot-Esp")();
Section1:CreateToggle("PLayer Esp", Settings.PlayerEsp, function(State)Settings.PlayerEsp,ESP.Players = State,State end);
Section1:CreateToggle("Tracers Esp", Settings.Tracers, function(State)Settings.Tracers,ESP.Tracers = State,State end);
Section1:CreateToggle("Name Esp", Settings.EspNames, function(State)Settings.EspNames,ESP.Names = State,State end)
Section1:CreateToggle("Boxes Esp", Settings.Boxes, function(State)Settings.Boxes,ESP.Boxes = State,State end)

Section2:CreateToggle("Invisicam", Settings.Sorry, function(State)
    Settings.Sorry = State;
    if(Settings.Sorry)then
        LocalPlayer.DevCameraOcclusionMode = "Invisicam";
    else
        LocalPlayer.DevCameraOcclusionMode = "Zoom";
    end;
end);


do
    local c1,c2 = nil,nil;
    local noclips = false;
    
    local f1 = function(key)
        if(Settings.Sex1 and'n'==key:lower())then
            noclips = not noclips;
            for i, v in ipairs(character:GetChildren())do
                if(v:IsA("BasePart"))then
                    v.CanCollide = false;
                end;
            end;
        end;
    end;
    local f2 = function()
        if(noclips)then
            for i, v in ipairs(character:GetChildren())do
                if v:IsA("BasePart") then
                    v.CanCollide = false;
                end;
            end;
        end;
    end;
    
    if(Settings.Sex1)then
        c1,c2 = Mouse.KeyDown:Connect(f1),RunService.Stepped:Connect(f2);
    end;
    
    Section2:CreateToggle("N Noclip", Settings.Sex1, function(State)
        noclips = false;
        Settings.Sex1 = State;
        if(State)then
            c1,c2 = Mouse.KeyDown:Connect(f1),RunService.Stepped:Connect(f2);
        else
            c1:Disconnect();
            c2:Disconnect();
        end;
    end);
end;

do
    local c1,c2 = nil,nil;
    local noclip = false;
    local f1 = function()
        if(noclip)then
            humanoid:ChangeState(11);
        end;
    end;
    local f2 = function(key)
        if(Settings.Sex and'g'==key:lower())then
            noclip = not noclip;
            humanoid:ChangeState(11);
        end;
    end;;
    
    if(Settings.Sex)then
        c1,c2 = RunService.Stepped:Connect(f1),Mouse.KeyDown:Connect(f2);
    end;
    
    Section2:CreateToggle("G Noclip", Settings.Sex, function(State)
        Settings.Sex = State;
        noclip = false;
        if(State)then
            c1,c2 = RunService.Stepped:Connect(f1),Mouse.KeyDown:Connect(f2);
        else
            c1:Disconnect();
            c2:Disconnect();
        end;
    end);
end;

do  -- fly function. will stop working if the user resets mid usage
    local con = nil;
    local c1,c2 = nil,nil;
    
    local S  = {F = 0, B = 0, L = 0, R = 0};
    -- local S2 = {F = 0, B = 0, L = 0, R = 0};
    
    local function f1(key)
        key = key:lower();
        if(key=='w')then
            S.F = 1;
        elseif(key=='s')then
            S.B = -1;
        elseif(key=='a')then
            S.L = -1;
        elseif(key=='d')then
            S.R = 1;
        end;
    end;
    local function f2(key)
        key = key:lower();
        if(key=='w')then
            S.F = 0;
        elseif(key=='s')then
            S.B = 0;
        elseif(key=='a')then
            S.L = 0;
        elseif(key=='d')then
            S.R = 0;
        end;
    end;
    
    local function reset()
        S.F,S.B,S.L,S.R = 0,0,0,0;
        -- S2.F,S2.B,S2.L,S2.R = 0,0,0,0;
    end;
    
    local v1,v2 = Vector3.new(9e9,9e9,9e9),Vector3.new(0,0.1,0);
    
    local function propagate(parent)
        c1 = Mouse.KeyDown:Connect(f1);
        c2 = Mouse.KeyUp:Connect(f2);
        
        local BodyGyro = Instance.new("BodyGyro");
        BodyGyro.P = 9e4;
        BodyGyro.maxTorque = v1;
        BodyGyro.cframe = parent.CFrame
        BodyGyro.Parent = parent;
        
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.velocity = v2;
        BodyVelocity.maxForce = v1;
        BodyVelocity.Parent = parent;
        
        repeat wait()
            humanoid.PlatformStand = true;
            local CF = Workspace.CurrentCamera.CoordinateFrame;
            if(S.L ~= -S.R or S.F ~= -S.B)then                                      -- speed set to 200
                BodyVelocity.velocity = (CF.lookVector*(S.F + S.B) + CF*CFrame.new(S.L + S.R, (S.F + S.B)*0.2, 0).p - CF.p)*200;
                -- S2 = {F = S.F, B = S.B, L = S.L, R = S.R};
            elseif(SPEED>0)then                                                     -- speed set to 0
                BodyVelocity.velocity = Vector3.new();
                -- BodyVelocity.velocity = (CF.lookVector*(S2.F + S2.B) + CF*CFrame.new(S2.L + S2.R, (S2.F + S2.B)*0.2, 0).p - CF.p)*SPEED;
            else
                BodyVelocity.velocity = v2;
            end
            BodyGyro.cframe = CF;
        until(not Fly);
        
        reset();
        BodyGyro:destroy();
        BodyVelocity:destroy();
        humanoid.PlatformStand = false;
    end;
    
    local R6,R15 = Enum.HumanoidRigType.R6,Enum.HumanoidRigType.R15;
    local function fly(key)
        if('h'~=key:lower())then return end;
        getgenv().Fly = not Fly;
        if(not Fly)then
            c1:Disconnect();
            c2:Disconnect();
            return;
        end;
        
        reset();
        if(humanoid.RigType==R6)then
            task.defer(propagate,rootPart);
        elseif(humanoid.RigType==R15)then
            task.defer(propagate,character:FindFirstChild("UpperTorso"));
        end;
    end;
    
    Section2:CreateToggle("H Fly", Settings.Sex2, function(State)
        Settings.Sex2 = State;
        if(State)then
            con = Mouse.KeyDown:Connect(fly);
        else
            getgenv().Fly = false;
            con:Disconnect();
        end;
    end);
end;


Section2:CreateButton("Anti Lag", function()
    local material = Enum.Material.SmoothPlastic
    for _,child in ipairs(Workspace:GetDescendants())do
        if(child:IsA("Texture"))then
            child:Destroy();
        elseif(child:IsA("BasePart")and not child.Parent:FindFirstChild("Humanoid"))then
            child.Material = material;
        end;
    end;
end);

Section2:CreateButton("Teleport to RandomPlayer", function()
    local plrs = Players:GetPlayers();
    local randPlr = plrs[math.random(2,#plrs)];
    if(not randPlr)then return end;
    rootPart.CFrame = randPlr.PrimaryPart.CFrame;
end);

do
    local bitch = settings();
    local ACTIVE = false;
    local con,ass = nil,nil;
    
    local function f(i,p)
        if(not(p)and i.KeyCode == F3)then
            ass = not ass;
            if(ass)then
                bitch.Network.IncomingReplicationLag = 10;
            else
                bitch.Network.IncomingReplicationLag = 0;
            end;
        end;
    end;

    Section2:CreateButton("Lag Switch F3", function()
        if(ACTIVE)then
            con:Disconnect();
        else
            ass = false;
            con = UserInputService.InputEnded:Connect(f);
        end;
    end);
end;


do
	local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100";
	local AllIDs = {};
	local foundAnything = nil;
	local actualHour = os.date("!*t").hour;
	local Deleted = false;
	
	if(isfile("NotSameServers.json"))then
		AllIDs = HttpService.JSONDecode(HttpService, readfile("NotSameServers.json"));
	else
		AllIDs[#AllIDs + 1] = actualHour;
		writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs));
	end;

	local function TPReturner()
		local Site,ID = nil,nil;
		if(not foundAnything)then
			Site = HttpService:JSONDecode(game:HttpGetAsync(url))
		else
			Site = HttpService:JSONDecode(game:HttpGetAsync(url.."&cursor="..foundAnything));
		end
		if(Site.nextPageCursor~="null")then
			foundAnything = Site.nextPageCursor;
		end;
		
		for _,server in ipairs(Site.data)do
			local Possible = true;
			if(server.maxPlayers>server.playing)then
				for idx,Existing in ipairs(AllIDs)do
					if(idx>0)then
						if(ID==Existing)then
							Possible = false
						end
					else
						if(actualHour~=Existing)then
							if(isfile("NotSameServers.json"))then delfile("NotSameServers.json")end;
							table.clear(AllIDs);
							AllIDs[1] = actualHour;
						end;
					end;
				end
				if(Possible)then
					AllIDs[#AllIDs + 1] = ID;
					writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs));
					game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID);
					wait(4);		-- if the above teleport attempt fails
				end;
			end;
		end;
	end;

	-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
	Section2:CreateButton("ServerHop", function()
		while wait()do
			TPReturner()
			if(nil~=foundAnything)then
				TPReturner();
			end;
		end;
	end);
end;

Section2:CreateButton("Rejoin", function()TeleportService:Teleport(game.PlaceId,game.JobId)end);

do
	local Tog = false;
	local function do___(tbl)
		for _,inst in ipairs(tbl)do
			if(inst.ClassName~="TextLabel")then
				do___(inst:GetChildren());
			else
				inst.Text = HttpService:GenerateGUID(false);
			end;
		end;
	end;
	Section1:CreateToggle("???", Tog, function(state)
		Tog = state;
		while(wait(delay2)and Tog)do
			do___(Player.PlayerGui.Menu:GetChildren());
		end;
	end);
end;

do
	local Tog = false;
	Section1:CreateTog("???", false, function(state)
		Tog = state;
		while(wait(delay2)and Tog)do
			for _,NPC in ipairs(Workspace.NPCS:GetChildren())do
				if(NPC:IsA("Model")and nil~=NPC:FindFirstChild("Humanoid"))then
					NPC.Name = HttpService:GenerateGUID(false);
				end
			end 
			for _,mob in ipairs(Workspace.Live:GetChildren())do
				if(mob:IsA("Model")and nil~=mob:FindFirstChild("Humanoid"))then
					mob.Name = HttpService:GenerateGUID(false);
				end;
			end;
		end;
	end);
end;

do
	local Toggle3 Section3:CreateToggle("UI Toggle", nil, function(State)Window:Toggle(State)end);
	Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)Config.Keybind = Enum.KeyCode[Key]end);
	Toggle3:SetState(true);
end;

Section3:CreateLabel("Credits DekuDimz#7960")
Section3:CreateLabel("Credits AlexR32#3232 Ui")
Section3:CreateLabel("Credits The3Bakers")
Section3:CreateColorpicker("UI Color", function(Color)Window:ChangeColor(Color)end):UpdateColor(Config.Color);

-- credits to jan for patterns
do
    local patterns = {
        Default = "2151741365";
        Hearts = "6073763717";
        Hexagon = "6073628839";
        Circles = "6071579801";
        ["Lace With Flowers"] = "6071575925";
        Floral = "5553946656";
    };

    Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)Window:SetBackground(patterns[Name])end):SetOption("Default");
end;

Section4:CreateColorpicker("Color", function(Color)Window:SetBackgroundColor(Color)end):UpdateColor(Color3.new(1,1,1));
Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)Window:SetBackgroundTransparency(Value)end):SetValue(0);
Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)Window:SetTileScale(Value)end);
Slider4:SetValue(0.5);

repeat Save()until not(wait(delay2));