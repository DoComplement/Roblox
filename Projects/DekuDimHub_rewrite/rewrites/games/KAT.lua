-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/KAT"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=621129760 or nil~=getgenv()["#=0ymBku;A*+;2lO+(cT0nX0CapSF0sg"])then return end;
getgenv()["#=0ymBku;A*+;2lO+(cT0nX0CapSF0sg"] = true;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
};

local UserInputService = game:GetService("UserInputService");
local VirtualUser = game:GetService("VirtualUser");
local RunService = game:GetService("RunService");
local Lighting = game:GetService("Lighting");
local Players = game:GetService("Players");

local CurrentCamera = 
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
    for _,con in ipairs(getconnections(LocalPlayer.Idled))do
        con:Disable();
    end;
else
    Player.Idled:Connect(function()
        task.wait(math.random(15,33));
        VirtualUser:CaptureController();
        VirtualUser:ClickButton2(Vector2.new(Mouse.X,Mouse.Y),Workspace.Camera);
    end);
end;

local OldNameCall = nil;
OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    if(getnamecallmethod()=="FireServer"and"Utility"==self.Name)then
        return task.wait(math.huge);
    end;
    return OldNameCall(self, ...);
end);

local Circle = Drawing.new("Circle");
Circle.Color =  Color3.fromRGB(22, 13, 56);
Circle.Thickness = 1;
Circle.Radius = 250;
Circle.Visible = false;
Circle.NumSides = 1000;
Circle.Filled = false;
Circle.Transparency = 1;

RunService.RenderStepped:Connect(function()
    local Mouse = game:GetService("UserInputService"):GetMouseLocation();
    Circle.Position = Vector2.new(Mouse.X, Mouse.Y);
end);

local Aimbot = {
    WallCheck = false,
    Enabled = false,
    FOV = 250,
    Smoothness = 0.05
}

local Method,Shoot = '',false
local function Obstructing(pos, set)
    return(Aimbot.WallCheck or nil~=Workspace:FindPartOnRayWithIgnoreList(Ray.new(CurrentCamera.CFrame.p, pos - CurrentCamera.CFrame.p), set));
end;

local MouseButton2 = Enum.UserInputType.MouseButton2;
UserInputService.InputBegan:Connect(function(inp, proc)
    if(not(proc)and inp.UserInputType==.MouseButton2)then
        Shoot = true;
    end;
end);

UserInputService.InputEnded:Connect(function(inp, proc)
    if(not(proc)and inp.UserInputType==.MouseButton2)then
        Shoot = false;
    end;
end);

function GetClosestToCuror()
    local Closest,Target = math.huge,nil;
    for idx,plr in ipairs(Players:GetPlayers())do
        if(idx==1 or not(plr.Character and plr.Character.PrimaryPart and plr.Character.Humanoid.Health<=0))then continue end;
        local Point,OnScreen = CurrentCamera:WorldToViewportPoint(plr.Character.PrimaryPart.Position)
        if(not(OnScreen)or Obstructing(plr.Character.PrimaryPart.Position, {character, plr.Character}))then continue end;
        local Distance = math.sqrt((Point.X - Mouse.X)^2 + (Point.Y - Mouse.Y)^2);
        if(Distance <= Aimbot.FOV)then
            Closest,Target = Distance,plr;
        end;
    end;
    return Target;
end;

RunService.RenderStepped:Connect(function()
    if(not(Aimbot.Enabled and Shoot))then return end;
    local ClosestPlayer = GetClosestToCuror();
    if(not CLosestPlayer)then return end;
    if(Method=="FirstPerson")then
       CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.p, ClosestPlayer.Character.PrimaryPart.CFrame.p);
    end
    elseif(Method=="ThridPerson")then
        local TargetPos = Workspace.Camera:WorldToViewportPoint(ClosestPlayer.Character.PrimaryPart.Position);
        mousemoverel((TargetPos.X - Mouse.X)*Aimbot.Smoothness, (TargetPos.Y - Mouse.Y)*Aimbot.Smoothness);
    end;
end);


local Window = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test")),"error loading V.G library")():CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Kat");
local Section1 = Tab1:CreateSection("");
local Section2 = Tab1:CreateSection("");
local SectionA = Tab1:CreateSection("");

local Tab2 = Window:CreateTab("UI Settings");
local Section3 = Tab2:CreateSection("Menu");
local Section4 = Tab2:CreateSection("Background");

do
    local c1 = nil;
    local function f()humanoid.WalkSpeed = 25 end;
    Section1:CreateToggle("Auto Sprint", nil, function(State)
        sex = State;
        if(State)then
            c1 = RunService.Stepped:Connect(f);
        else
            c1:Disconnect();
        end;
    end);
end;

do
    local c1,c2 = Color3.new(1,1,1),Color3.new();
    local cc = c2;
    Lighting.Changed:Connect(function()
        Lighting.Ambient = cc;
        Lighting.ColorShift_Bottom = cc;
        Lighting.ColorShift_Top = cc;
    end);
    Section1:CreateToggle("FullBright", nil, function(State)
        FullBright = State;
        if(State)then
            cc = c1;
        else
            cc = c2;
        end;
    end);
end;

Section1:CreateToggle("Aimbot", nil, function(State)Aimbot.Enabled = State end);
Section1:CreateDropdown("AimBot Modes", {"FirstPerson","ThridPerson"}, function(String)Method = String end):SetOption("ThridPerson");
Section1:CreateToggle("WallCheck", nil, function(State)Aimbot.WallCheck = State end);
Section1:CreateSlider("Aimbot Smoothness", 0,10,nil,false, function(Value) Aimbot.Smoothness = Value end);
Section1:CreateSlider("Aimbot Radius", 0,1000,nil,false, function(Value)Aimbot.FOV,Circle.Radius = Value,Value end);
Section1:CreateToggle("Circle Visible", nil, function(State)Circle.Visible = State end);
Section1:CreateColorpicker("Circle Color", function(Color)Circle.Color = Color end);

do
    assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G_Hub_Extras/main/RayCast_Method")), "error loading V.G RayCast_Method")();
    local function ClosestPlayerToCurser()
        local MaxDistance,Closest = math.huge,nil;
        for idx,plr in ipairs(Players:GetPlayers())do
            if(idx==1 or not(plr.Character and Plr.Character:FindFirstChild("Head"))then continue end;
            local Pos,Vis = CurrentCamera.WorldToScreenPoint(CurrentCamera, plr.Character.Head.Position);
            if(not Vis)then continue end;
            local A1, A2 = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
            local Dist = math.sqrt(((Mouse.X - Pos.X)^2 + (Mouse.Y - Pos.Y)^2));
            if(Dist < MaxDistance)then
                MaxDistance,Closest = Dist,plr;
            end;
        end;
        return Closest;
    end;
    
    local Popper = Player.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper;
    Section1:CreateToggle("Silent Aim", nil, function(State)
        getgenv().SilentAim = State;
        if(not State)then return end;
        for _,val in ipairs(getgc())do
            if(type(val)~="function"or getfenv(val).script~=Popper)then continue end;
            for idx,ref in ipairs(getconstants(val))do
               if(tonumber(ref)==0.25)then
                   setconstant(val, idx, 0);
               elseif(tonumber(ref)==0)then
                   setconstant(val, idx, 0.25);
               end;
            end;
        end;
    end);
end;

local ESP = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp")), "error loading Karrot-Esp")();

Section2:CreateToggle("Player Esp", nil, function(State)ESP:Toggle(State)end);
Section2:CreateToggle("Tracers Esp", nil, function(State)ESP.Tracers = State end);
Section2:CreateToggle("Name Esp", nil, function(State)ESP.Names = State end);
Section2:CreateToggle("Boxes Esp", nil, function(State)ESP.Boxes = State end);

do
    local con = nil;
    local function f()
        humanoid:ChangeState(11)
        for idx,plr in ipairs(Players:GetChildren())do
            if(idx==1 or not(plr.Character and plr.Character.PrimaryPart))then continue end;
            rootPart.CFrame = Workspace.Spawn.DefaultSpawns.SpawnPoint.CFrame;
            plr.Character.PrimaryPart.CFrame = rootPart.CFrame * CFrame.new(0, 0, -2);
            if(Workspace.Gamemode.Value~="Classic")then continue end;
            VirtualUser:ClickButton1(Vector2.new(125, 125));
            for _,tool in ipairs(Player.Backpack:GetChildren())do
                if(tool.Name=="Knife")then
                    tool.Parent = character;
                end;
            end;
        end
        if(Workspace.Gamemode.Value=="Murder")then
            Workspace.MapMain.OUTDATED:FindFirstChild("Crate").CFrame = rootPart.CFrame;
        end;
    end;
    
    Section1:CreateToggle("AutoFarm", nil, function(State)
        if(State)then
            con = RunService.Stepped:Connect(f);
        else
            con:Disconnect();
        end;
    end);
end;


Section2:CreateButton("Anti Lag", function()
    for _,desc in ipairs(Workspace:GetDescendants())do
        if(not(v:IsA("BasePart")and desc.Parent:FindFirstChild("Humanoid"))then             --- i stole this from the actual game LOL >-<
        desc.Material = Enum.Material.SmoothPlastic;           
    elseif(desc:IsA("Texture"))then
        desc:Destroy();
    end;
end);

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
    
    Section2:CreateToggle("H Fly", false, function(State)
        if(State)then
            con = Mouse.KeyDown:Connect(fly);
        else
            getgenv().Fly = false;
            con:Disconnect();
        end;
    end);
end;

Section2:CreateButton("teleport to randomPlayer", function()
    local plrs = Players:GetPlayers();
    rootPart.CFrame = plrs[math.random(2, #plrs)].PrimaryPart.CFrame;               -- can error
end);

do
    local Network,con = settings().Network,nil;
    local X,F3 = false, Enum.KeyCode.F3;
    local function f(inp, proc)
        if(not(proc)and inp.KeyCode==F3)then
            X = not X;
            if(X)then
                Network.IncomingReplicationLag = 10;
            else
                Network.IncomingReplicationLag = 0;
            end;
        end;
    end;
    Section2:CreateToggle("Lag Switch F3", false, function(State)
        if(State)then
            con = UserInputService.InputEnded:Connect(f);
        else
            con:Disconnect();
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

Section2:CreateButton("Rejoin", function()game:GetService("TeleportService"):Teleport(game.PlaceId, game.JobId)end);

do
	local Toggle3 Section3:CreateToggle("UI Toggle", nil, function(State)Window:Toggle(State)end);
	Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)Config.Keybind = Enum.KeyCode[Key]end);
	Toggle3:SetState(true);
end;

Section3:CreateLabel("Credits DekuDimz#7960");
Section3:CreateLabel("Credits AlexR32#3232 Ui");
Section3:CreateLabel("Credits BaconLord#0001");
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