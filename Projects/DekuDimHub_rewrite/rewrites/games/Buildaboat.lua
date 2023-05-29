
-- https://raw.githubusercontent.com/1201for/V.G-Hub/main/Project-XXL

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=171391948 or nil~=getgenv()["vl]rv4SC6[dP2Sv7+tHntYQtLQPT09X("])then return end;
getgenv()["vl]rv4SC6[dP2Sv7+tHntYQtLQPT09X("] = true;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}

local UserInputService = game:GetService("UserInputService");
local TweenService     = game:GetService("TweenService");
local HttpService      = game:GetService("HttpService");
local RunService       = game:GetService("RunService");
local Players          = game:GetService("Players");

local Player = Players.LocalPlayer;
local Mouse  = Player:GetMouse();

local character = (Player.Character or Player.CharacterAdded:Wait());
if(not character.PrimaryPart)then 
    character:GetPropertyChangedSignal("PrimaryPart"):Wait();  
end;
local rootPart,humanoid = character.PrimaryPart,character.Humanoid;         -- can error here

Player.CharacterAdded:Connect(function(Char)
    Char:GetPropertyChangedSignal("PrimaryPart"):Wait();
    character,rootPart,humanoid = Char,Char.PrimaryPart,Char.Humanoid;      -- can error here when fetching humanoid
end);


local NOCLIP_CON = nil;
local function NOCLIP_SET()humanoid:ChangeState(11)end;

local InvokeServer = Workspace.ItemBoughtFromShop.InvokeServer;
local FireServer   = Workspace.ChangeCharacter.FireServer;


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

local OldNameCall = nil;
OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    if(getnamecallmethod()~="FireServer"or(self.Name~="Received"and"Sent"~=self.Name))then
        return OldNameCall(self, ...);
    end;
end);

local ToxmodsisHOT = nil;
do
    local CF = CFrame.new(-51.1823959, 80.6168747, -536.437805);
    local I1 = {TweenInfo.new(30, Enum.EasingStyle.Linear), {CFrame = CFrame.new(-60.5737877, 53.9498825, 8666.35059)}};
    local I2 = {TweenInfo.new(0,  Enum.EasingStyle.Linear), {CFrame = CFrame.new(-55.5486526, -360.063782, 9489.0498)}};
    
    ToxmodsisHOT = function(Char)
        if(not Char.PrimaryPart)then
            Char:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;
        Workspace.Gravity = 0;
        rootPart.CFrame = CF;
        TweenService:Create(Char.PrimaryPart, table.unpack(I1)):Play();
        task.wait(30);
        TweenService:Create(Char.PrimaryPart, table.unpack(I2)):Play();
        Workspace.Gravity = 196.2;
    end;
end;

local Number = 1;
local Name = "V.G Hub//BuildABoat.txt"

local Des = {}
if(nil~=makefolder and not isfile("V.G Hub"))then
    makefolder("V.G Hub");
end;

if(not isfile(Name))then
    writefile(Name, HttpService:JSONEncode(Des));
end;

local Settings = HttpService:JSONDecode(readfile(Name));
local function Save()
    writefile(Name, HttpService:JSONEncode(Settings));
end;

local Window = assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test")),"error loading V.G library")():CreateWindow(Config, game:GetService("CoreGui"));

local Tab1 = Window:CreateTab("Build a Boat");
local Section1 = Tab1:CreateSection("AutoFarms");
local Section2 = Tab1:CreateSection("Misc");
local SectionA = Tab1:CreateSection("Teleports");

local Tab2 = Window:CreateTab("UI Settings");
local Section3 = Tab2:CreateSection("Menu");
local Section4 = Tab2:CreateSection("Background");

do
    local c1,c2 = nil,nil;
    
    Section1:CreateToggle("AutoFarm", Settings.AutoFarm, function(State)
        Settings.AutoFarm = State;
        if(State)then
            c1 = RunService.Stepped:Connect(NOCLIP_SET);
            c2 = Player.CharacterAdded:Connect(ToxmodsisHOT);
            ToxmodsisHOT(character);
            character.Head:Destroy();
        else
            c1:Disconnect();
            c2:Disconnect();
        end;
    end)
end;

do
    local c1,c2 = nil,nil;
    local f2 = nil;
    
    local function f1(part)
        if(part.Name=="WaterDetector")then
            part:Destroy();
        end;
    end;
    f2 = function(Char)
        c1:Disconnect();
        c2:Disconnect();
        
        c1 = Char.ChildAdded:Connect(f1);
        c2 = Player.CharacterAdded:Connect(f2);
    end;
    
    Section1:CreateToggle("Water GodMode", Settings.Water, function(State)
        Settings.Water = State
        if(State)then
            if(character:FindFirstChild("WaterDetector"))then
                character.WaterDetector:Destroy();
            end;
            c1 = character.ChildAdded:Connect(f1);
            c2 = Player.CharacterAdded:Connect(f2);
        else
            c1:Disconnect();
            c2:Disconnect();
        end;
    end);   
end;

Section1:CreateToggle("Auto Common Chests", Settings.Common, function(State)
    Settings.Common = State;
    while(task.wait()and Settings.Common)do
        InvokeServer(Workspace.ItemBoughtFromShop, "Common Chest", Number);
    end;
end);

Section1:CreateToggle("Auto UnCommon Chests", Settings.UnCommon, function(State)
    Settings.UnCommon = State;
    while(task.wait()and Settings.UnCommon)do
        InvokeServer(Workspace.ItemBoughtFromShop, "Uncommon Chest", Number);
    end;
end);

Section1:CreateToggle("Auto Rare Chests", Settings.Rare, function(State)
    Settings.Rare = State;
    while(task.wait()and Settings.Rare)do
        InvokeServer(Workspace.ItemBoughtFromShop, "Rare Chest", Number);
    end;
end);

Section1:CreateToggle("Auto Epic Chests", Settings.Epic, function(State)
    Settings.Epic = State;
    while(task.wait()and Settings.Epic)do
        Workspace.ItemBoughtFromShop:InvokeServer("Epic Chest", Number);
    end;
end);

Section1:CreateToggle("Auto Legendary Chests", nil, function(State)
    Settings.Legendary = State;
    while(task.wait()and Settings.Legendary)do
        InvokeServer(Workspace.ItemBoughtFromShop, "Legendary Chest", Number);
    end;
end);

Section2:CreateButton("Fox", function()FireServer(Workspace.ChangeCharacter, "FoxCharacter")end);
Section2:CreateButton("Penguin", function()Workspace.ChangeCharacterFireServer("PenguinCharacter")end);
Section2:CreateButton("Chicken", function()Workspace.ChangeCharacterFireServer("ChickenCharacter")end);

do
    local ref = CFrame.new(0,5,0);
    local function getCF(CF)
        CF = CF*ref;
        return(function()rootPart.CFrame = CF end;        
    end;
    
    SectionA:CreateButton("Blue Zone", getCF(Workspace["Really blueZone"].CFrame));
    SectionA:CreateButton("Blue Zone", getCF(Workspace.BlackZone.CFrame));
    SectionA:CreateButton("Blue Zone", getCF(Workspace.MagentaZone.CFrame));
    SectionA:CreateButton("Blue Zone", getCF(Workspace["New YellerZone"].CFrame));
    SectionA:CreateButton("Blue Zone", getCF(Workspace.CamoZone.CFrame));
    SectionA:CreateButton("Blue Zone", getCF(Workspace.WhiteZone.CFrame));
    SectionA:CreateButton("Blue Zone", getCF(CFrame.new(math.huge,math.huge,math.huge)));
end;

do
    local con = nil;
    local function f()
        humanoid.WalkSpeed = Settings.WalkSpeed;
        humanoid.JumpPower = Settings.JumpPower;
        if(not UserInputService.WindowFocusReleased)then
            setfpscap(Settings.Fps);
        end;
    end;
    
    Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
        Settings.Go = State;
        if(State)then
            c1 = RunService.Stepped:Connect(f);
        else
            c1:Disconnect();
        end;
    end);
end;

Section2:CreateTextBox("Fps Cap", "Only numbers", true, function(Value)Settings.Fps = Value end);
Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)Settings.WalkSpeed = Value end);
Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)Settings.JumpPower = Value end);

do
    local c1 = nil;
    local function f()humanoid:ChangeState("Jumping")end;
    Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
        Settings.InfiniteJump = State;
        if(State)then
            c1 = UserInputService.JumpRequest:Connect(f);
        else
            c1:Disconnect();
        end;
    end);
end;

local ESP = assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp")),"error loading Karrot-Esp")();

Section1:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State;
    ESP:Toggle(Settings.Esp);
end);

Section1:CreateToggle("PLayer Esp", Settings.PlayerEsp, function(State)Settings.PlayerEsp,ESP.Players = State,State end);
Section1:CreateToggle("Tracers Esp", Settings.Tracers, function(State)Settings.Tracers,ESP.Tracers = State,State end);
Section1:CreateToggle("Name Esp", Settings.EspNames, function(State)ESP.Names,Settings.EspNames = State,State end);
Section1:CreateToggle("Boxes Esp", Settings.Boxes, function(State)Settings.Boxes,ESP.Boxes = State,State end);

Section2:CreateToggle("Invisicam", Settings.Sorry, function(State)
    Settings.Sorry = State
    if(State)then
        Player.DevCameraOcclusionMode = "Invisicam";
    else
        Player.DevCameraOcclusionMode = "Zoom";
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

repeat Save()until not(task.wait(5));

