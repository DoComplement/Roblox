
-- https://raw.githubusercontent.com/1201for/V.G-Hub/main/Phantom-Forces

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=292439477 or nil~=getgenv()["#yTDaUAHfTjq~eQcOc6r"])then return end;
getgenv()["#yTDaUAHfTjq~eQcOc6r"] = true;

local Config = {
    WindowName = "V.G Hub",
    Color = Color3.fromRGB(255, 128, 64),
    Keybind = Enum.KeyCode.RightControl
}

local HttpService = game:GetService("HttpService");
local RunService = game:GetService("RunService");
local Players = game:GetService("Players");
local UserInputService = game:GetService("UserInputService");
local CurrentCamera = Workspace.CurrentCamera;

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

local Name = "V.G Hub//Pf.txt";
local Des = {}
if(not isfolder("V.G Hub"))then
    assert(makefolder,"makefolder function not supported")("V.G Hub");;
end;

if(not isfile(Name))then
    writefile(Name, HttpService:JSONEncode(Des));
end;

local function Save()
    writefile(Name, HttpService:JSONEncode(Settings));
end;

getgenv().Circle = Drawing.new("Circle")
Circle.Color = Color3.fromRGB(22, 13, 56)
Circle.Thickness = 1
Circle.Radius = 250
Circle.Visible = false
Circle.NumSides = 1000
Circle.Filled = false
Circle.Transparency = 1

RunService.RenderStepped:Connect(function()
	local rat = UserInputService:GetMouseLocation();
	Circle.Position = Vector2.new(rat.X, rat.Y);
end);

local function GetTeam()
    for idx,plr in ipairs(Players:GetPlayers())do
		if(idx~=1 and plr.TeamColor ~= Player.TeamColor)then
            return plr.TeamColor.Name;
        end;
	end;
end;

local Settings = {
    FreeForAll = false;
    WallCheck = false;
    Enabled = false;
    FOV = 250;
	Delay = 0.01;
};

local Shoot = false;

function Obstructing(pos, set)
    return(Settings.WallCheck or nil~=Workspace:FindPartOnRayWithIgnoreList(Ray.new(CurrentCamera.CFrame.p, pos - CurrentCamera.CFrame.p), set));
end;

local MouseButton2 = Enum.UserInputType.MouseButton2
UserInputService.InputBegan:Connect(function(inp,proc)
    Shoot = (not(proc)and v.UserInputType==MouseButton2);
end);

UserInputService.InputEnded:Connect(function(inp,proc)
    Shoot = (proc or inp.UserInputType~=MouseButton2);
end);

function GetClosestToCuror()
    local Closest,Target = math.huge,nil;
    for idx,plr in ipairs(Workspace.Players[GetTeam()]:GetChildren())do
        if(plr==Player or not plr:FindFirstChild("Torso"))then continue end;
        local Point,OnScreen = CurrentCamera:WorldToViewportPoint(plr.Torso.Position);
        if(not(OnScreen)or Obstructing(plr.Torso.Position, {character, plr}))then continue end;
            Distance = math.sqrt((Point.X - Mouse.X)^2 + (Point.Y - Mouse.Y)^2);
            if(Distance <= Settings.FOV)then
                Closest,Target = Distance,plr;
            end;
        end;
    end;
    return Target;
end

task.defer(function()
    local ClosestPlayer = nil;
    RunService.RenderStepped:Connect(function()
        if(not(Settings.Enabled or Shoot))then return end;
        ClosestPlayer = GetClosestToCuror();
        if(not ClosestPlayer)then return end;
        local rat = UserInputService:GetMouseLocation();
        local TargetPos = Workspace.Camera:WorldToViewportPoint(ClosestPlayer[Settings.AimPart].Position);
        mousemoverel((TargetPos.X - rat.X)*0.09, (TargetPos.Y - rat.Y)*0.09);
    end);
end;

local Aim = false;
UserInputService.InputBegan:Connect(function(inp,proc)
	if(not(Settings.Tigger and proc)or inp.UserInputType ~= MouseButton2)then return end;
	Aim = true
	while(wait()and Aim)do
		if(not(Mouse.Target and Mouse.Target.Parent)then continue end;
		local Person = Workspace.Players[GetTeam()]:FindFirstChild(Mouse.Target.Parent.Name);
		if(not Person)then continue;
		elseif(Settings.Delay > 0)then wait()end
		mouse1press();
		wait();
		mouse1release();
		if(not Settings.Tigger)then break end;
	end;
end);

if(not Settings.AimPart)then Settings.AimPart = "Torso"end;
if(not Settings.FOV)then Settings.FOV = 250 end;
if(not Settings.Smoothness)then Settings.Smoothness = 00.3 end;

local Window = assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test")),"error loading V.G library")():CreateWindow(Config, game:GetService("CoreGui"));

local Tab1 = Window:CreateTab("PhantomForces");
local Section1 = Tab1:CreateSection("");
local Section2 = Tab1:CreateSection("");
local Section5 = Tab1:CreateSection("");

local Tab2 = Window:CreateTab("UI Settings");
local Section3 = Tab2:CreateSection("Menu");
local Section4 = Tab2:CreateSection("Background");

Section1:CreateToggle("Aimbot", Settings.Enabled, function(State)Settings.Enabled = State end)
Section1:CreateDropdown("HitPart", {"Torso","Head"}, function(String)Settings.AimPart = String end)
Section1:CreateSlider("Aimbot Smoothness", 0,10,Settings.Smoothness,false, function(Value)Settings.Smoothness = Value end);
Section1:CreateToggle("WallCheck",Settings.WallCheck, function(State)Settings.WallCheck = State end);
Section1:CreateToggle("TriggerBot", Settings.Tigger, function(State)Settings.Tigger = State end);
Section1:CreateSlider("Aimbot Radius", 0,1000, Settings.FOV, false, function(Value)Settings.FOV,Circle.Radius = Value,Value end);
Section1:CreateToggle("Circle Visible", Settings.Visible, function(State)Circle.Visible = State end);
Section1:CreateColorpicker("Circle Color", function(Color)Circle.Color = Color end);


local ESP = assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/dragonadventures/main/Esp-Test")),"Error loading V.G esp")();

Section1:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State
    ESP:Toggle(State);
end);


local function fetchTorsoSuite()
	local EVENT,con = Instance.new("BindableEvent"),nil;
		
	local function checkChild(child)
		if(nil~=child.Name:match("Torso"))then
			con:Disconnect();
			EVENT:Fire(child);
		end;
	end;

	return function(plr)
		local Torso = plr:FindFirstChild("Torso");
		if(not Torso)then
			con = plr.ChildAdded:Connect(checkChild);
			return EVENT.Event:Wait();
		end;
		return Torso;
	end;
end

local function dum(plr)return not Players[plr.Name]end;
local function dum2(clr)return function()return(clr)end end;

Section1:CreateToggle("Bright blue Team Esp", Settings.Blue, function(State)
	Settings.Blue,ESP.Blue = State,State;

	ESP:AddObjectListener(Workspace.Players["Bright blue"], {
		Color = BrickColor.Blue(),
		Type = "Model",
		PrimaryPart = fetchTorsoSuite,
		Validator = dum,
		CustomName = dum2("Bright Blue"),
		IsEnabled = "Blue",
	});
end);


Section1:CreateToggle("Bright orange Team Esp", Settings.Orange, function(State)
    Settings.Orange,ESP.Orange = State,State;

    ESP:AddObjectListener(Workspace.Players["Bright orange"], {
        Color =  Color3.new(255, 154, 0),
        Type = "Model",
        PrimaryPart = fetchTorsoSuite,
        Validator = dum,
        CustomName = dum2("Bright Orange"),
        IsEnabled = "Orange",
    })
end)

Section1:CreateToggle("Tracers Esp", Settings.Tracers, function(State)Settings.Tracers,ESP.Tracers = State,State end)
Section1:CreateToggle("Name Esp", Settings.EspNames, function(State)ESP.Names,Settings.EspNames = State,State end);
Section1:CreateToggle("Boxes Esp", Settings.Boxes, function(State)Settings.Boxes,ESP.Boxes = State,State end);

do
    local con = nil;
    local function f()
        if(not Workspace.Camera:FindFirstChild("Right Arm"))then return end;
        for _,part in ipairs(Workspace.Camera:GetChildren())do
            if(not part:IsA("Model")or part.Name=="Right Arm"or"Left Arm"==part.Name)then continue end;
            for _,obj in ipairs(part:GetChildren())do
                if(obj:IsA("BasePart") then
                    obj.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1);                           -- changes Color
                end;
            end;
        end;
    end;
    Section2:CreateToggle("RainBow Gun", Settings.RainBow, function(State)
        Settings.RainBow = State;
        if(State)then
            con = RunService.RenderStepped:Connect(f);
        else
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

do
    local F3,con = Enum.KeyCode.F3,nil;
    local Active,Network = false,settings().Network
    
    local function f(inp,proc)
        if(not(proc)and inp.KeyCode==F3)then
            ass = not ass;
            if(ass)then
                Network.IncomingReplicationLag = 10;
            else
                Network.IncomingReplicationLag = 0;
            end;
        end
    end;
    Section2:CreateToggle("Lag Switch F3", false, function(State)
        Active = State;
        if(State)then
            con = UserInputService.InputEnded:Connect(f);
        else
            con:Disconnect();
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


Section2:CreateButton("Rejoin", function()game:GetService("TeleportService"):Teleport(game.PlaceId,game.JobId)end);
Section2:CreateButton("Save Settings",Save);

Section3:CreateToggle("UI Toggle", nil, function(State)Window:Toggle(State)end);
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)Config.Keybind = Enum.KeyCode[Key]end);
Toggle3:SetState(true);
Section3:CreateLabel("Credits DekuDimz#7960");
Section3:CreateLabel("Credits AlexR32#3232 Ui");
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


repeat Save()until not task.wait();