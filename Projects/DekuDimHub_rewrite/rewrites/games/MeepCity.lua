
-- https://raw.githubusercontent.com/1201for/V.G-Hub/main/MeepCity

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=370731277 or nil~=getgenv()["NXM[KbZD!=]tP!vr!BS&P4ay^9&63Xe;"])then return end;
getgenv()["NXM[KbZD!=]tP!vr!BS&P4ay^9&63Xe;"] = true;

local UserInputService = game:GetService("UserInputService");
local RunService = game:GetService("RunService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Players = game:GetService("Players");
local Player = Players.LocalPlayer;
local Mouse = Player:GetMouse();

local character = (Player.Character or Player.CharacterAdded:Wait());
if(not character.PrimaryPart)then 
    character:GetPropertyChangedSignal("PrimaryPart"):Wait();  
end;
local rootPart,humanoid = character.PrimaryPart,character.Humanoid;         -- can error here

Player.CharacterAdded:Connect(function(Char)
    Char:GetPropertyChangedSignal("PrimaryPart"):Wait();
    character,rootPart,humanoid = Char,Char.PrimaryPart,Char.Humanoid;      -- can error here when fetching humanoid
end);

assert(getconnections,"getconnections not supported, some modules will not work properly");
if(not getconnections)then
	local VirtualUser = game:GetService("VirtualUser");
	Player.Idled:Connect(function()
		task.wait(math.random(15,33));
		VirtualUser:CaptureController();
		VirtualUser:ClickButton2(Vector2.new(Mouse.X, Mouse.Y), Workspace.Camera);
	end);
else
	for _,con in ipairs(getconnections(game:GetService("ScriptContext").Error)) do
	   con:Disable();
	end;
	for _,con in ipairs(getconnections(Player.Idled))do
		con:Disable();
	end;
end;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
};

local DefaultSettings = {
	NI = false,
	Fly1 = false,
	NoClip1 = false, 
	NoClip2 = false,
};

local Settings = {
	NI= false,
	Fly1=false,
	NoClip1=false ,
	NoClip2=false ,
};

if(nil~=makefolder and not isfilder("V.G Hub"))then
	makefolder("V.G Hub");
end;

local Name = "V.G Hub\\"..game.PlaceId ..".txt";
if(not isfile(Name))then 
	writefile(Name, HttpService:JSONEncode(DefaultSettings));
else
	Settings = HttpService:JSONDecode(readfile(Name));
end;

local function Save()
	assert(writefile,"writefile not supported")(Name,HttpService:JSONEncode(Settings));
end;

local Window = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test")),"error loading V.G library")():CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("MeepCity");
local Section1 = Tab1:CreateSection("");
local Section2 = Tab1:CreateSection("");
Tab1:CreateSection("");

local Tab2 = Window:CreateTab("UI Settings");
local Section3 = Tab2:CreateSection("Menu");
local Section4 = Tab2:CreateSection("Background");

local InvokeServer = ReplicatedStorage.Connection.InvokeServer;

do
	local Connection = ReplicatedStorage.Connection;
	local Fish,con = Workspace.VW.TempFish,nil
	
	local Arg2 = {
		FishingPolePos = Fish.Position,
		Power = 1,
		Face = Fish.Position,
		PlayerPos = Fish.Position,
		FishingZonePos = Vector3.new(-5.29345703, -18.0412292, 43.7173767)
	}
	
	local function f()
		InvokeServer(Connection,49);
		InvokeServer(Connection,50);
		InvokeServer(Connection,51);
		
		Arg2.FishingPolePos,Arg2.Face,Arg2.PlayerPos = Fish.Position,Fish.Position,Fish.Position;
		InvokeServer(Connection, 1, Arg2);
	end;
	
	Section1:CreateToggle("AutoFarm", Settings.NI, function(State)
		Settings.NI = State
		InvokeServer(Connection, 9, 1);
		if(State)then
			con = RunService.RenderStepped:Connect(f);
		else
			con:Disconnect();
		end;
	end);
end;

Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)humanoid.WalkSpeed = Value end);
Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)humanoid.JumpPower = Value end);

do
	local con = nil;
	local function f()humanoid:ChangeState("Jumping")end;
	Section2:CreateToggle("Infinite Jump", Settings.Infinite, function(State)
		Settings.Infinite = State
		if(State)then
			con = UserInputService.JumpRequest:Connect(f);
		else
			con:Disconnect();
		end;
	end);
end;

do
	local noclip,c1,c2 = Settings.NoClip1,nil,nil;
	local function f()humanoid:ChangeState(11)end;
	local function f2(key)
		if(key:lower()=='g')then
			noclip = not noclip;
		end;
	end;
	Section2:CreateToggle("G PlatFormNoclip", Settings.NoClip1, function(State)
		Settings.NoClip1 = State;
		if(State)then
			c1 = RunService.RenderStepped:Connect(f);
			c2 = Mouse.KeyDown:Connect(f2);
		else
			c1:Disconnect();
			c2:Disconnect();
		end;
	end);
end;

do
	local noclip,c1,c2 = Settings.NoClip2,nil,nil;
	
	local function f()
		for _,p in ipairs(character:GetDescendants()) do
			if(p.ClassName=="Part"or"MeshPart"==p.ClassName)then
				p.CanCollide = false;
			end;
		end;
	end;
	
	local function f2(key)
		if(key:lower()=='n')then
			noclip = not noclip;
		end
	end;
	
	Section2:CreateToggle("N NonePlatFormNoclip", Settings.NoClip2, function(State)
		Settings.NoClip2= State
		if(State)then
			c1 = RunService.Stepped:Connect(f);
			c2 = Mouse.KeyDown:Connect(f2);
		else
			c1:Disconnect();
			c2:Disconnect();
		end;
	end)
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
    
    Section2:CreateToggle("H Fly", Settings.Fly1, function(State)
        Settings.Fly1 = State;
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

Section2:CreateButton("Rejoin", function()TeleportService:Teleport(game.PlaceId,game.JobId)end);
Section2:CreateButton("Save Settings",Save);
Section3:CreateToggle("UI Toggle", nil, function(State)Window:Toggle(State)end);
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)Config.Keybind = Enum.KeyCode[Key]end);
Toggle3:SetState(true);
Section3:CreateLabel("Credits DekuDimz#7960");
Section3:CreateLabel("Credits AlexR32#3232 Ui");

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

-- repeat Save()until not task.wait(10);				DUMB