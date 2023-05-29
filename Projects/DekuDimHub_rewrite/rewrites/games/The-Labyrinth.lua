

-- https://raw.githubusercontent.com/1201for/V.G-Hub/main/The-Labyrinth

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=534701013 or nil~=getgenv()["cOt*P55V#.8!9eKA7b@VApbOai%0w+a2"])then return end;
getgenv()["cOt*P55V#.8!9eKA7b@VApbOai%0w+a2"] = true;


local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightShift
}

local VirtualUser = game:GetService("VirtualUser");
local VirtualInputManager = game:GetService("VirtualInputManager");
local Players = game:GetService("Players");
local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");
local HttpService = game:GetService("HttpService");
local TweenService = game:GetService("TweenService");
local TeleportService = game:GetService("TeleportService");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Lighting = game:GetService("Lighting");

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

local NOCLIP_CON = nil;
local function NOCLIP_SET()humanoid:ChangeState(11)end;

local OldNameCall = nil;
OldNameCall = hookmetamethod(game, "__namecall", function(self,...)
    if(self.Name~="Ping"and"InvokeServer"~=getnamecallmethod()and"PreloadAsync"~=getnamecallmethod())then
        return OldNameCall(self,...);
    end;
    return wait(math.huge);
end);

pcall(function()
    Workspace.Map.Glade.Doors:Destroy();
    ReplicatedStorage.Resources.Data.Events.Administration:Destroy();
    ReplicatedStorage.Resources.Data.Events.PlayerData:Destroy();
end);

RunService.RenderStepped:Connect(function()
    if(nil~=(character:FindFirstChild("Head")and character.Head:FindFirstChild("NameBillboard")))then
        character.Head.NameBillboard:Destroy();
    end;
end);

for _,part in ipairs(Workspace.Map.Maze:GetDescendants())do
    if(nil~=part.Name:match("Trap"))then
        part:Destroy();
    end;
end;

Workspace.Map.Maze.DescendantAdded:Connect(function(part)
    if(nil~=part.Name:match("Trap"))then
        part:Destroy();
    end;
end);

local Sell = {};
task.defer(function()
    for idx in next,require(ReplicatedStorage.Shared.ItemsModule).Items do
        if(nil~=(idx:match("Log")or idx:match("Ore")or idx:match("Fish"))or not idx:match("Bow"))then
            Sell[#Sell + 1] = idx;
        end;
    end;
    table.sort(Sell);
end);

task.defer(function()
	require(Players.Chat:WaitForChild("ClientChatModules").ChatSettings).PlayerDisplayNamesEnabled = false;
	
	local function fix_name(plr_char)
		if(not plr_char.PrimaryPart)then
			plr_char:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		plr_char:WaitForChild("Humanoid").DisplayName = plr_char.Name;
	end;
	
	for idx,player in ipairs(Players:GetPlayers())do
		player.CharacterAdded:Connect(fix_name);
		if(nil~=player.Character)then
			player.DisplayName = player.Name;
			fix_name(player.Character);
		end;
	end
	
	-- normalize displayname to player name on "new player entered"
	Players.PlayerAdded:Connect(function(plr)
		plr.CharacterAdded:Connect(fix_name);
		plr.DisplayName = plr.Name;
	end);
end);

local Circle = Drawing.new("Circle")
Circle.Color =  Color3.fromRGB(22, 13, 56)
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

local AimBot = {
	WallCheck = false,
	Enabled = false,
	FOV = 250,
};

local Shoot = false
function Obstructing(pos, set)
	return(Aimbot.WallCheck and nil~=Workspace:FindPartOnRayWithIgnoreList(Ray.new(CurrentCamera.CFrame.p, pos - CurrentCamera.CFrame.p), set));
end

local MouseButton2 = Enum.UserInputService.MouseButton2;
UserInputService.InputBegan:Connect(function(inp,proc)
    Shoot = (not(proc)and inp.UserInputType==MouseButton2);
end);

UserInputService.InputEnded:Connect(function(inp,proc)
    Shoot = (proc or v.UserInputType~=MouseButton2);
end);

function GetClosestToCuror()
    local Closest,Target = math.huge,nil;
    
    for idx,plr in ipairs(Players:GetPlayers())do
        if(idx==1 or not(plr.Character and plr.Character.PrimaryPart and plr.Character.Humanoid.Health<=0)then continue end;
        local Point,OnScreen = CurrentCamera:WorldToViewportPoint(plr.Character.PrimaryPart.Position);
        if(not(OnScreen)or Obstructing(plr.Character.PrimaryPart.Position,{character,plr.Character}))then continue end;
        Distance = math.sqrt((Point.X - Mouse.X)^2 + (Point.Y - Mouse.Y)^2); 
        if(Distance <= AimBot.FOV)then
            Closest,Target = Distance,plr;
        end;
    end;
    return Target;
end 

RunService.Stepped:Connect(function()
    if(not(AimBot.Enabled or Shoot)then return end;
    local ClosestPlayer = GetClosestToCuror();
    if(nil~=ClosestPlayer)then
        CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.p, ClosestPlayer.Character.PrimaryPart.Position)
    end 
end)

local function getNearestOfGroup(group)
    local TargetDistance,Target,Mag = math.huge,nil,nil;
    for _,obj in ipairs(group)do
        if(not(fish:FindFirstChild("MouseTarget")or obj.Properties.Alive.Value))then continue end;
        Mag = (rootPart.Position - obj:FindFirstChildOfClass("Part").Position).Magnitude;
        if(Mag<TargetDistance)then
            TargetDistance,Target = Mag,obj;
        end;
    end;
    return Target;
end;

-- no longer works
-- local function Invis()
    -- print("cant go invis anymore");
-- end;


local Window = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/im-retarded-3")),"error loading V.G library")():CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("The Labyrinth");
local Section1 = Tab1:CreateSection("");
local Section2 = Tab1:CreateSection("");

local Tab2 = Window:CreateTab("UI Settings");
local Section3 = Tab2:CreateSection("Menu");
local Section4 = Tab2:CreateSection("Background");


Section1:CreateToggle("Aimbot", nil, function(State)AimBot.Enabled = State end);
Section1:CreateToggle("WallCheck", nil, function(State)AimBot.WallCheck = State end);
Section1:CreateSlider("Aimbot Radius", 0,1000,nil,false, function(Value)AimBot.FOV,Circle.Radius = Value,Value end);
Section1:CreateToggle("Circle Visible", nil, function(State)Circle.Visible = State end);
Section1:CreateColorpicker("Circle Color", function(Color)Circle.Color = Color end);
Section1:CreateSlider("Hitbox Radius", 0,50,nil,false, function(Value)head = Value end);

Section1:CreateToggle("Anti Grass", nil, function(State)sethiddenproperty(Workspace.Terrain, "Decoration", State)end);

do
    local con = nil;
    local function f(child)
        if(nil~=child.Name:match("Trap"))then
            child:Destroy();
        end;
    end;
    
    Section1:CreateToggle("Anti Traps", nil, function(State)
        if(State)then
            for _,child in ipairs(Workspace.Map.Maze:GetDescendants())do f(child)end;
            con = Workspace.Map.Maze.DescendantAdded:Connect(f);
        else
            con:Disconnect();
        end;
    end);
end;

do
    local t1,t2 = 1,true;
    local function f(child)
        if(child:IsA("BasePart")and nil~=child.BrickColor.Name:match("stone"))then
            child.Transparency = t1;
            child.CanCollide = t2;
        end;
    end;
    Workspace.Map.Maze.DescendantAdded:Connect(f);
    Section1:CreateToggle("Anti Walls", false, function(State)
        t2 = State;
        if(State)
            t1 = 0;
        else
            t1 = 1;
        end;
        for _,child in ipairs(Workspace.Map.Maze:GetDescendants())do f(child)end;
    end);
end;

do
    local Trader = ReplicatedStorage.Resources.Data.Events.Traffic.Trader;
    Section1:CreateToggle("Auto Sell Selected Item", false, function(State)
        sell = State;
        while(task.wait()and sell)do Trader:InvokeServer("Sell",Sell,1)end;
    end);
end;

do
    local Dropdown1 = Section1:CreateDropdown("Select Item To Sell");
    Dropdown1:AddToolTip("Select Item To Sell");
    local function idk(str)Sell = str end;
    
    for _,option in ipairs(Sell)do
        Dropdown1:AddOption(option, idk);
    end;
end;

Section1:CreateToggle("Hitbox Extender", nil, function(State)
    HEAD = State;
    while(task.wait()and HEAD)do
        for idx,plr in ipairs(Players:GetPlayers())do
            if(idx==1 or not(plr.Character and plr.PrimaryPart and plr:FindFirstChild("LowerTorso")))then continue end;
            plr = plr.Character;
            plr.LowerTorso.CanCollide = false;
            plr.LowerTorso.Material = "Neon";
            plr.LowerTorso.Transparency = 0.5;
            plr.LowerTorso.Size = Vector3.new(head, head, head);
            plr.PrimaryPart.Size = Vector3.new(head, head, head);
        end;
    end;
end);
 
-- do
    -- local con = nil;
    -- local function f()
        -- wait(4);
        -- if(invis)then Invis()end;
    -- end;
    -- Section1:CreateToggle("Auto Invis", nil, function(State)
        -- getgenv().invis = State;
        -- if(State)then
            -- Invis();
            -- con = character.CharacterAdded:Connect(f);
        -- else
            -- con:Disconnect();
        -- end;
    -- end);
-- end;

do
    local function scan_target(object)
        while(not object:FindFirstChild("MouseTarget"))do object.ChildAdded:Wait()end;
        while(not object.MouseTarget:FindFirstChild("HP"))do
            VirtualInputManager:SendKeyEvent(true, "E", false, uwu);
            task.wait(2);
        end;

        repeat VirtualUser:ClickButton1(Vector2.new(9e9, 9e9));
            task.wait();
        until not object.MouseTarget:FindFirstChild("HP");
    end;

    local Active = false;
    local function checkState(State)
        if(State)then
            if(Active)then
                warn("can\'t enable two autofarms simultaneously using this script");
                return false;
            end;
            NOCLIP_CON = RunService.Stepped:Connect(NOCLIP_SET);
            Active = true;
        else
            if(NOCLIP_CON.Connected)then
                NOCLIP_CON:Disconnect();
            end;
            Active = false;
        end;
        return Active;
    end;
    
    local function setup_autofarm(group, target)
        local toggle = false;
        return function(State)
            toggle = State;
            if(not checkState(State))then return end;
            
            while(task.wait()and toggle)do
                local NearestObject = getNearestOfGroup(group:GetChildren());
                if(not NearestObject)then continue end;
                local Time = (NearestObject[target].Position - rootPart.Position).Magnitude / 15;
                TweenService:Create(rootPart, TweenInfo.new(Time, Enum.EasingStyle.Linear) {CFrame = NearestObject[target].CFrame}):Play();
                task.wait(Time);
                scan_target(NearestObject);
            end;
        end;
    end;

    Section2:CreateToggle("AutoFarm Ore", false, setup_autofarm(Workspace.Resources.Glade.Ores, "Rock"));
    Section2:CreateToggle("AutoFarm Trees", false, setup_autofarm(Workspace.Resources.Glade.Trees, "MouseTarget"));
    Section2:CreateToggle("AutoFarm Ingredients", false, setup_autofarm(Workspace.Resources.Glade.Ingredients, "MainPart"));
    Section2:CreateToggle("Auto Fish", false, setup_autofarm(Workspace.Resources.Glade.Fish, "WaterBubbles"));
    Section2:CreateToggle("AutoFarm Ore Maze", false, setup_autofarm(Workspace.Resources.Maze,Ore, "Rock"));
    Section2:CreateToggle("AutoFarm Trees Maze", false, setup_autofarm(Workspace.Resources.Maze.Trees, "MouseTarget"));
    Section2:CreateToggle("AutoFarm Ingredients Maze", false, setup_autofarm(Workspace.Resources.Maze,Ingredients, "MainPart"));
    Section2:CreateToggle("Auto Fish", false, setup_autofarm("Tween1", Workspace.Resources.Maze.Fish, "WaterBubbles"));
end;

do  
    local esp_properties = {Visible = false,Center = true,Outline = true,Font = 2,Size = 14};
    local function new_drawing(text, color)
        local drawing = Drawing.new("Text");
        for property,value in next,esp_properties do
            drawing[property] = value;
        end;
        drawing.Color = color;
        drawing.Text  = text;
        return drawing;
    end;
        
    local function esp(part, tbl, color, drawing, con)
        drawing = new_drawing(part.Name, color);
        local ref = {};
        con = RunService.Stepped:Connect(function()
            if(nil~=part:FindFirstChild("MainPart"))then
                local Vector,Screen = Workspace.CurrentCamera:WorldToViewportPoint(part.MainPart.Position)
                if(Screen)then
                    drawing.Position = Vector2.new(Vector.X, Vector.Y);
                    drawing.Visible = true;
                    drawing.Text = part.Name;
                else
                    drawing.Visible = false;
                end
            else
                drawing:Destroy();
                con:Disconnect();
                tbl[ref] = nil;
            end;
        end);
        tbl[ref] = {con, drawing};
    end;

    local function setup_esp(cast, color)
        local tbl,c1,c2 = {},nil,nil;
        local function checkPart(child)
            if(child:IsA("Part")and nil~=child.Name:match("MainPart"))then
                esp(child.Parent, tbl, color);
            end;
        end;
        
        local l1,l2 = Workspace.Resources.Glade[cast],Workspace.Resources.Maze[cast];
        return function(State)
            if(State)then
                c1 = l1.DescendantAdded:Connect(checkPart);
                c2 = l2.DescendantAdded:Connect(checkPart);
                for _,child in ipairs(l1:GetChildren())do
                    if(child:IsA("Model")and nil~=child:FindFirstChild("MainPart"))then esp(child, tbl, color)end;
                end;
                for _,child in ipairs(l2:GetChildren())do
                    if(child:IsA("Model")and nil~=child:FindFirstChild("MainPart"))then esp(child, tbl, color)end;
                end;
            else
                c1:Disconnect();
                c2:Disconnect();
                for idx,ref in next,tbl do
                    ref[1]:Disconnect();
                    ref[2]:Destroy();
                    tbl[idx] = nil;
                end;
            end;
        end;
    end;

    Section2:CreateToggle("Tree Esp", false, setup_esp("Trees", Color3.fromRGB(255, 5, 0)));
    Section2:CreateToggle("Ores Esp", false, setup_esp("Ores",  Color3.fromRGB(0, 255, 0)));
    Section2:CreateToggle("Fish Esp", false, setup_esp("Fish",  Color3.fromRGB(0, 255, 255)));
    Section2:CreateToggle("Ingredients Esp", false, setup_esp("Ingredients",  Color3.fromRGB(0, 0, 255)));
end;

local ESP = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp")),"error loading Karrot-Esp")();

Section1:CreateToggle("Player Esp", nil, function(State)ESP:Toggle(State)end);
Section1:CreateToggle("Tracers Esp", nil, function(State)ESP.Tracers = State end);
Section1:CreateToggle("Name Esp", nil, function(State)ESP.Names = State end);
Section1:CreateToggle("Boxes Esp", nil, function(State)ESP.Boxes = State end);

Section2:CreateSlider("WalkSpeed", 0,30,nil,false, function(Value)humanoid.WalkSpeed = Value end);
Section2:CreateSlider("JumpPower", 0,100,nil,false, function(Value)humanoid.JumpPower = Value end);
Section2:CreateSlider("Gravity", 0,196.2,nil,false, function(Value)Workspace.Gravity = Value end);

do
    
    local c1,c2 = Color3.new(1,1,1),Color3.new();
    local FullBright = c2;
    
    local function setLighting()
        Lighting.Ambient = FullBright;
        Lighting.ColorShift_Bottom = FullBright;
        Lighting.ColorShift_Top = FullBright;
    end;
    
    Lighting.Changed:Connect(SetLighting);  -- will be called twice per each value set
    Section1:CreateToggle("FullBright", false, function(State)
        if(State)then
            FullBright = c1;
        else
            FullBright = c2;
        end;
        setLighting();
    end);
end;

do
    local noclip,c1,c2 = false,nil,nil;
    local function f1()
        if(noclip)then
            humanoid:ChangeState(11);
        end;
    end;
    local function f2(key)
        if(key=='g')then
            noclip = not noclip;
        end;
    end;
    
    Section2:CreateToggle("G PlatFormNoclip", false, function(State)
        noclip = false;
        if(State)then
            c1 = RunService.Stepped:Connect(f1);
            c2 = Mouse.KeyDown:Connect(f2);
        else
            c1:Disconnect();
            c2:Disconnect();
        end;
    end);
end;

do
    local noclip,c1,c2 = false,nil,nil;
    local function f1()
        if(not noclip)then return end;
        for _,desc in ipairs(character:GetDescendants())do
            if(desc:IsA("BasePart"))then
                desc.CanCollide = false;
            end;
        end;
    end;
    local function f2(key)
        if(key=='n')then
            noclip = not noclip;
        end;
    end;
    Section2:CreateToggle("N NonePlatFormNoclip", false, function(State)
        noclip = false;
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
    
    Section2:CreateToggle("H Fly", false, function(State)
        Sex2 = State;
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