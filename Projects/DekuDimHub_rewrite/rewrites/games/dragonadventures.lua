
-- https://raw.githubusercontent.com/1201for/dragonadventures/main/ui

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=3297964905 or nil~=getgenv()["AYJx:h;%nFoBCtg@!uQQ"])then return end;
getgenv()["AYJx:h;%nFoBCtg@!uQQ"] = true;

local Config = {
    WindowName = "V.G Hub";                                             -- title
	Color = Color3.fromRGB(255,128,64);                                 -- window background color
	Keybind = Enum.KeyCode.RightControl;                                -- toggle menu keybind
};

local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");
local HttpService = game:GetService("HttpService");
local TweenService = game:GetService("TweenService");
local TeleportService = game:GetService("TeleportService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local wait = task.wait;

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

if(nil~=getconnections)then
    for _,con in ipairs(getconnections(Player.Idled))do
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

local Name = "V.G Hub//Weaponry.json";
local Des = {};
if(makefolder and not isfile("V.G Hub"))then
    makefolder("V.G Hub");
end;

local Settings = {
    FreeForAll= false;
    WallCheck = false;
    Enabled = false;
    FOV = 250;
};
pcall(function()
    if(isfile(Name))then
        readfile(Name);
    else 
        writefile(Name, HttpService:JSONEncode(Des));
    end;
end);

if(isfile(Name))then
    Settings = HttpService:JSONDecode(assert(readfile(Name)))or Settings;
end;

local function Save()
    assert(writefile,"writefile not supported")(Name, HttpService:JSONEncode(Settings));
end;

local Circle = Drawing.new("Circle");
Circle.Color =  Color3.fromRGB(22, 13, 56);
Circle.Thickness = 1;
Circle.Radius = 250;
Circle.Visible = false;
Circle.NumSides = 1000;
Circle.Filled = false;
Circle.Transparency = 1;

RunService.RenderStepped:Connect(function()
    Circle.Position = UserInputService:GetMouseLocation();
end);

local Shoot = false;
local function FreeForAll(plr)
    return(Settings.FreeForAll or Player.Team~=plr.Team);
end

local function NotObstructing(i, v)
    if Settings.WallCheck then
        c = Workspace.CurrentCamera.CFrame.p
        a = Ray.new(c, i- c)
        f = Workspace:FindPartOnRayWithIgnoreList(a, v)
        return f == nil
    else
        return true
    end
end

local MouseButton2 = Enum.UserInputService.MouseButton2;
UserInputService.InputBegan:Connect(function(inp,proc)
    if(not(proc)and inp.UserInputType==MouseButton2)then
        Shoot = true;
    end;
end);

UserInputService.InputEnded:Connect(function(inp,proc)
    if(not(proc)and v.UserInputType==MouseButton2)then
        Shoot = false;
    end;
end);

local function GetClosestToCuror()
    local closest,target = math.huge,nil;
    for idx,plr in ipairs(Players:GetPlayers())do
        if(idx==1 or(not Settings.FreeForAll and Player.Team==plr.Team))then continue;
        elseif((nil~=plr.Character and plr.Character.PrimaryPart)and plr.Character.Humanoid.Health>0)then
            local Point,OnScreen = Workspace.CurrentCamera:WorldToViewportPoint(plr.Character.PrimaryPart.Position);
            if(not(OnScreen)or not(NotObstructing(plr.Character.PrimaryPart.Position,{character,plr.Character})))then continue;
            
            local Distance = math.sqrt((Point.X-Mouse.X)^2 + (Point.Y-Mouse.Y)^2);
            if(Distance<=Settings.FOV)then
                Closest = Distance;
                Target = plr;
            end;
        end;
    end;
    return Target;
end;



do
    local anon_func = function()
        if(not(Settings.Enabled and Shoot))then return end;
        ClosestPlayer = GetClosestToCuror();
        if(ClosestPlayer)then
            Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.p,ClosestPlayer.Character[Settings.AimPart].CFrame.p);
        end;
    end
    RunService.Stepped:Connect(function()
        pcall(anon_func);
    end);
end;

local function isAncestor(parent,child)
    while(nil~=child.Parent)do
        if(child.Parent==parent)then return(child)end;
        child = child.Parent;
    end;
    return false;
end;

local Aim = false;
UserInputService.InputBegan:Connect(function(inp,proc)
    if(proc or not(Settings.Enabled)or v.UserInputType~=MouseButton2)then return end;
    Aim = true;
    while(wait()and Aim)do
        if(not Mouse.Target)then continue end;
        local plr = isAncestor(Players,Mouse.Target.Parent);
        if(Settings.TeamCheck or plr.Team==Player.Team)then continue end;
        if(Settings.Delay>0)then wait(Settings.Delay)end;
        mouse1release(mouse1press(),wait());
        if(not Settings.Enabled)then break end;
    end;
end);

UserInputService.InputEnded:Connect(function(v)
    if(Settings.Enabled and v.KeyCode==MouseButton2)then
        Aim = false;
    end;
end);

local function Go(i, v)
    return(v - i).Unit * 1000;
end;

local Window = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test")),"error fetching library")():CreateWindow(Config, game:GetService("CoreGui"));

local Tab1 = Window:CreateTab("Weponry");
local Section1 = Tab1:CreateSection();
local Section2 = Tab1:CreateSection();
local Section5 = Tab1:CreateSection();

local Tab2 = Window:CreateTab("UI Settings");
local Section3 = Tab2:CreateSection("Menu");
local Section4 = Tab2:CreateSection("Background");

Section1:CreateToggle("Aimbot", nil, function(State)Settings.Enabled = State end);

do
    local Dropdown1 = Section1:CreateDropdown("HitPart", {"PrimaryPart","Head","UpperTorso","LowerTorso","Random"}, function(String)Settings.AimPart = String end);
    Dropdown1:AddToolTip("Select AimPart");
    Dropdown1:SetOption("PrimaryPart");
end;

Section1:CreateToggle("FreeForAll", Settings.TeamCheck, function(State)
    Settings.TeamCheck = State;
    Settings.TeamCheck = Settings.FreeForAll;
end);

Section1:CreateToggle("TriggerBot", Settings.Enabled, function(State)Settings.Enabled = State end);
Section1:CreateToggle("WallCheck", Settings.WallCheck, function(State)Settings.WallCheck = State end);

Section1:CreateSlider("Aimbot Radius", 0,1000,Circle.Radius,false, function(Value)
    Circle.Radius = Value;
    Circle.Radius =  Settings.FOV;
end);

Section1:CreateToggle("Circle Visible", Circle.Visible, function(State)Circle.Visible = State end);
Section1:CreateColorpicker("Circle Color", function(Color)Circle.Color = Color end);

do
    local CON = nil;
    local ws_jp_func = function()
        humanoid.WalkSpeed = Settings.WalkSpeed;
        humanoid.JumpPower = Settings.JumpPower;
        if(not UserInputService.WindowFocusReleased)then
            setfpscap(Settings.Fps);
        end;    
    end;
    
    if(Settings.Go)then CON = RunService.Stepped:Connect(ws_jp_func);
    Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
        Settings.Go = State;
        if(State)then
            CON = RunService.Stepped:Connect(ws_jp_func);
        else
            CON:Disconnect();
        end;
    end);
end;

Section2:CreateTextBox("Fps Cap", "Only numbers", true, function(Value)Settings.Fps = Value end);
Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)Settings.WalkSpeed = Value end);
Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)Settings.JumpPower = Value end);
Section2:CreateTextBox("Seconds Until ServerHop", "Only numbers", true, function(Value)Settings.Seconds = Value end);

do
    local CON = nil;
    if(Settings.InfiniteJump)then
        CON = UserInputService.JumpRequest:Connect(function()
            humanoid:ChangeState("Jumping");
        end);
    end;
    Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
        Settings.InfiniteJump = State
        if(State)then
            CON = UserInputService.JumpRequest:Connect(function()
                humanoid:ChangeState("Jumping");
            end);
        else
            CON:Disconnect();
        end;
    end);
end;

local ESP = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp")),"error fetching Karrot-Esp")();
Section1:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State;
    ESP:Toggle(State);
end);

Section1:CreateToggle("PLayer Esp", Settings.PlayerEsp, function(State)Settings.PlayerEsp,ESP.Players = State,State end);
Section1:CreateToggle("Tracers Esp", Settings.Tracers, function(State)Settings.Tracers,ESP.Tracers = State,State end);
Section1:CreateToggle("Name Esp", Settings.EspNames, function(State)Settings.EspNames,ESP.Names = State,State end)
Section1:CreateToggle("Boxes Esp", Settings.Boxes, function(State)Settings.Boxes,ESP.Boxes = State,State end)

Section2:CreateToggle("Invisicam", Settings.Sorry, function(State)
    Settings.Sorry = State;
    if(Settings.Sorry)then
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

Section2:CreateButton("Server Hop", function()
    local URL = "https://games.roblox.com/v1/games/3297964905/servers/Public?sortOrder=Asc&limit=100";
    local succ,data = pcall(game.HttpGetAsync,game,URL);
    while(not(succ)and wait(5))do
        succ,data = pcall(game.HttpGetAsync,game,URL);
    end;
    
    for _,server in ipairs(HttpService:JSONDecode(data).data) do
        if(server.ping<80 and server.maxPlayers>server.playing)then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id);
            break;
        end;
    end;
end);

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

Section2:CreateButton("Rejoin", function()TeleportService:Teleport(game.PlaceId,game.JobId)end);
Section2:CreateButton("Save Settings",Save);

do
    local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)Window:Toggle(State)end);
    Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)Config.Keybind = Enum.KeyCode[Key]end);
    Toggle3:SetState(true);
end;

Section3:CreateLabel("Credits DekuDimz#7960");
Section3:CreateLabel("Credits AlexR32#3232 Ui");
Section3:CreateLabel("Credits bye...");
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