
-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/natural%20disaster%20survival"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=189707 or nil~=getgenv()["AYJx:h;%nFoBCtg@!uQQ"])then return end;
getgenv()["AYJx:h;%nFoBCtg@!uQQ"] = true;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
};

local Players = game:GetService("Players");
local VirtualUser = game:GetService("VirtualUser");
local RunService = game:GetService("RunService");
local HttpService = game:GetService("HttpService");
local CoreGui = game:GetService("CoreGui");
local UserInputService = game:GetService("UserInputService");\
local ReplicatedStorage = game:GetService("ReplicatedStorage");

local Player = Players.LocalPlayer;
local Mouse = Player:GetMouse();

local character = (Player.Character or Player.CharacterAdded:Wait());
if(not character.PrimaryPart)then
	character:GetPropertyChangedSignal("PrimaryPart"):Wait();
end;

local con = nil;
local function r(c)
	if(c.Name=="FallDamageScript")then
		c:Destroy();
	end;
end;
local function init_rm()
	if(character:FindFirstChild("FallDamageScript"))then
		character.FallDamageScript:Destroy();
	end;
	con = character.ChildAdded:Connect(r);
end;

local rootPart,humanoid = character.PrimaryPart,character.Humanoid;					-- can error here
Player.CharacterAdded:Connect(function(Char)
	con:Disconnect();
	Char:GetPropertyChangedSignal("PrimaryPart"):Wait();
	character,rootPart,humanoid = Char,Char.PrimaryPart,Char.Humanoid;				-- can error here;
	init_rm();
end);

if(nil~=getconnections)then
	for _,con in ipairs(getconnections(Player.Idled))do
		con:Disable();
	end;
else
	Player.Idled:Connect(function()
		task.wait(math.random(15,33));
		VirtualUser:CaptureController();
		VirtualUser:ClickButton2(Vector2.new(Mouse.X,Mouse.Y),Workspace.Camera);
	end);
end;

local Name = "V.G Hub//SS.json";
local Des = {};
if(nil~=makefolder)then
    makefolder("V.G Hub");
end;

if(not isfile(Name))then
    writefile(Name, HttpService:JSONEncode(Des));
end;

local Settings = HttpService:JSONDecode(readfile(Name));
local function Save()
    writefile(Name, HttpService:JSONEncode(Settings));
end;

local Window = assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test")),"error loading v.g library")():CreateWindow(Config, CoreGui)

local Tab1 = Window:CreateTab("Natural Disaster Survival")
local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")

local Tab2 = Window:CreateTab("UI Settings")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

do
	local con = nil;
	local f = function()
		humanoid:ChangeState(11);
		rootPart.CFrame = CFrame.new(-279, 142, 340);
	end;
	
	Section1:CreateToggle("AutoFarm", Settings.Farm, function(State)
		Settings.Farm = State;
		if(State)then
			con = RunService.RenderStepped:Connect(f);
		else
			con:Disconnect();
		end;
	end)
end;

do
	local con = nil;
	local f = function()
		for _,child in ipairs(Workspace:GetChildren())do
			if(child:IsA("Tool")and child.Name=="GreenBalloon")then
				local balloon = v:Clone();
				balloon.Parent = Player.Character;
				wait();
				balloon.Parent = Player.Backpack;
			end;
		end;
	end;;
	Section1:CreateToggle("Spam Give GreenBalloon", Settings.A, function(State)
		Settings.A = State;
		if(State)then
			con = RunService.RenderStepped:Connect(f)
		else
			con:Disconnect();
		end;
	end);
end;

do
	local Chat = ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest;
	local fs = Chat.FireServer;
	Section1:CreateToggle("Auto Chat Disaster", Settings.SD, function(State)
		Settings.SD = State
		while(wait()and Settings.SD)do
			if(Player.PlayerGui.MainGui.NextMapPage.Visible)then
				wait(4)
				fs(Chat, "The disaster for this match is: " .. character:WaitForChild("SurvivalTag").Value,"All")
				wait(10);
			end;
		end;
	end);
end;

do
	local ChatBar = Player.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar;
	Section1:CreateToggle("Auto Warn YourSelf", Settings.O, function(State)
		Settings.O = State;
		while(wait()and Settings.O)do
			if(Player.PlayerGui.MainGui.NextMapPage.Visible)then
				wait(2);
				ChatBar:SetTextFromInput(Player.Character:WaitForChild("SurvivalTag").Value);
			end;
		end;
	end);
end;

Section1:CreateButton("Remove Map Part CS", function()
	for i, v in ipairs(Workspace.Structure:GetChildren())do
		v:Destroy();
	end;
end);

UserInputService.JumpRequest:Connect(function()
	if(Settings.InfiniteJump)then
		humanoid:ChangeState("Jumping");
	end;
end);

Section2:CreateTextBox("Fps Cap", "Only numbers", true, function(Value)Settings.Fps = Value end)
Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)Settings.WalkSpeed = Value end)
Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)Settings.JumpPower = Value end)
Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)Settings.InfiniteJump = State end);


local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()
Section1:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State;
    ESP:Toggle(State);
end);

Section1:CreateToggle("PLayer Esp", Settings.PlayerEsp, function(State)Settings.PlayerEsp,ESP.Players = State,State end);
Section1:CreateToggle("Tracers Esp", Settings.Tracers, function(State)Settings.Tracers,ESP.Tracers = State,State end);
Section1:CreateToggle("Name Esp", Settings.EspNames, function(State)ESP.Names,Settings.EspNames = State,State end)
Section1:CreateToggle("Boxes Esp", Settings.Boxes, function(State)Settings.Boxes,ESP.Boxes = State,State end);

Section2:CreateToggle("Invisicam", Settings.Sorry, function(State)
	Settings.Sorry = State;
	if(State)then
		Player.DevCameraOcclusionMode = "Invisicam";
	else
		Player.DevCameraOcclusionMode = "Zoom";
	end;
end);

do
	local c1,c2 = nil,nil;
	local noclips = false;
	
	local function f1(key)
		if('n'==key:lower())then
			noclips = not noclips
		end;
	end;
	
	local function f2()
		if(not noclips)then return end;
		for _,child in ipairs(Player.Character:GetChildren()) do
			if v:IsA("BasePart") then
				v.CanCollide = false;
			end
		end;
	end;

	Section2:CreateToggle("N Noclip", Settings.Sex1, function(State)
		noclips = false;
		Settings.Sex1 = State;
		if(State)then
			c1 = Mouse.KeyDown:Connect(f1);
			c2 = RunService.Stepped:Connect(f2);
		else
			c1:Disconnect();
			c2:Disconnect();
		end;
	end);
end;

do
	local c1,c2 = nil,nil;
	local noclip = false;
	
	local function f1()
		if(noclip)then
			humanoid:ChangeState(11);
		end;
	end;
	local function f2(key)
		if('g'==key:lower())then
			noclip = not noclip;
		end;
	end;
	
	Section2:CreateToggle("G Noclip", Settings.Sex, function(State)
		Settings.Sex = State
		noclip = false
		if(State)then
			c1 = RunService.Stepped:Connect(f1);
			c2 = Mouse.KeyDown:Connect(f2);
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
	local url = "https://games.roblox.com/v1/games/189707/servers/Public?sortOrder=Asc&limit=100";
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

Section2:CreateButton("Rejoin Same Server", function()game:GetService("TeleportService"):Teleport(game.PlaceId, game.JobId)end);

do
	local a = false;
	local function do____(tbl)
		for _,child in ipairs(tbl)do
			if(child.ClassName=="TextLabel")then
				child.Text = HttpService:GenerateGUID(false);
			else
				do____(child:GetChildren());
			end;
		end;
	end;
	
	Section1:CreateButton("???", function()
		a = not a;
		while(wait()and a)do
			do____(Player.PlayerGui.Menu:GetChildren());
		end
	end)
end;

do
	local a = false;
	local function do____(tbl)
		for _,child in ipairs(tbl)do
			if(child:IsA("Model")and nil~=child:FindFirstChild("Humanoid"))then
				child.Name = HttpService:GenerateGUID(false);
			end;
		end;
	end;
	Section1:CreateButton("???", function()
		a = not a;
		while(wait()and a)do
			do____(Workspace.NPCS:GetChildren());
			do____(Workspace.Live:GetChildren());
		end;
	end);
end;


do
	local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)Window:Toggle(State)end);
	Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)Config.Keybind = Enum.KeyCode[Key]end);
	Toggle3:SetState(true);
end;

Section3:CreateLabel("Credits DekuDimz#7960");
Section3:CreateLabel("Credits AlexR32#3232 Ui");
Section3:CreateLabel("Credits The3Bakers");
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
Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)Window:SetBackgroundTransparency(Value)end):SetValue(0)
Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)Window:SetTileScale(Value)end):SetValue(0.5)

repeat Save();
until not(wait(10));