
-- https://raw.githubusercontent.com/1201for/V.G-Hub/main/Games/Arsenal

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=286090429 or nil~=getgenv()["#yTDaUAHfTjq~eQcOc6r"])then return end;
getgenv()["#yTDaUAHfTjq~eQcOc6r"] = true;

local GetRoleInGroup = Player.GetRoleInGroup;
local GroupRoles = {"Game Moderators","Interns","Contractors","Contributors","Beloved","Main Developers","Founder/Main Developer"}

for idx,plr in ipairs(Players:GetPlayers())do
    -- if(idx==1 and nil~=table.find(GroupRoles, GetRoleInGroup(Player, 2613928)))then return end;     -- doesn"t allow any special group member to use the script?? dev dummy thick
    if(nil~=table.find(GroupRoles, GetRoleInGroup(plr, 2613928)))then ServerHop()end;
end 
Players.PlayerAdded:Connect(function(v)
    if(nil~=table.find(GroupRoles, GetRoleInGroup(plr, 2613928)))then ServerHop()end;
end);

local character = (Player.Character or Player.CharacterAdded:Wait());
if(not character.PrimaryPart)then 
    character:GetPropertyChangedSignal("PrimaryPart"):Wait();  
end;
local rootPart,humanoid = character.PrimaryPart,character.Humanoid;         -- can error here

Player.CharacterAdded:Connect(function(Char)
    Char:GetPropertyChangedSignal("PrimaryPart"):Wait();
    character,rootPart,humanoid = Char,Char.PrimaryPart,Char.Humanoid;      -- can error here when fetching humanoid
end);

local Circle = Drawing.new("Circle");
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
end;

local Aimbot = {
    FreeForAll = false,
    WallCheck = false,
    Enabled = false,
    FOV = 250
}
local Shoot = false;

local function FreeForAll(plr)
    return((Aimbot.FreeForAll and T.FreeForAll)or Player.Team~=plr.Team);
end;

local Mouse = Player:GetMouse();
local CurrentCamera = Workspace.CurrentCamera;

local function NotObstructing(pos, set)
    return(not(Aimbot.WallCheck or Workspace:FindPartOnRayWithIgnoreList(Ray.new(CurrentCamera.CFrame.p, pos - CurrentCamera.CFrame.p), set)));
end;

local MB2 = Enum.UserInputType.MouseButton2
UserInputService.InputBegan:Connect(function(inp,proc)
    Shoot = (not proc and v.UserInputType == MB2);
end);

UserInputService.InputEnded:Connect(function(v,proc)
    Shoot = (proc or v.UserInputType~=MB2);
end);

local function GetClosestToCuror()
    Closest = math.huge
    Target = nil
    for idx,plr in ipairs(Players:GetPlayers())do
        if(idx==1 or not(FreeForAll(plr)and plr.Character and plr.Character.PrimaryPart or plr.Character.Humanoid.Health<=0))then continue end;
        local Point,OnScreen = CurrentCamera:WorldToViewportPoint(plr.Character.PrimaryPart.Position)
        if(not(OnScreen and NotObstructing(plr.Character.PrimaryPart.Position, {character, plr.Character})))then continue end;
            Distance = math.sqrt((Point.X - Mouse.X)^2 +  (Point.Y - Mouse.Y)^2);
            if(Distance <= Aimbot.FOV)then                  -- poor check here
                Closest,Target = Distance,plr;
            end;
        end;
    end;
    return Target;
end;

RunService.Stepped:Connect(function()
    if(not(Aimbot.Enabled and Shoot))then return end;
    ClosestPlayer = GetClosestToCuror();
    if(nil~=ClosestPlayer)then
        CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.p, ClosestPlayer.Character[AimPart].CFrame.p)
    end;
end);

local T = {
    TeamCheck = false,
    Delay = 0.01,
    Enabled = false
}

local Aim = false;
UserInputService.InputBegan:Connect(function(inp,proc)
    if(proc or not(T.Enabled)or v.UserInputType ~= Enum.UserInputType.MouseButton2)then
    Aim = true
    while(wait()and Aim)do
        if(not Mouse.Target)then continue end;
        local Person = Players:FindFirstChild(Mouse.Target.Parent.Name);
        if(not Person or(T.TeamCheck and Person.Team==Player.Team)then continue end;
        if(T.Delay>0)then wait(0.01)end;
            mouse1press()
            wait()
            mouse1release()
        end
        if(not T.Enabled)then
            break;
        end;
    end;
end);

UserInputService.InputEnded:Connect(function(inp,proc)
    if(not proc and T.Enabled and inp.KeyCode == Enum.UserInputType.MouseButton2)then
        Aim = false;
    end;
end);

local Library = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/Library.lua")),"error loading linorial library")();
local ThemeManager = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/ThemeManager.lua")),"error loading linorial ThemeManager")();
local SaveManager = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/SaveManager.lua")),"error loading linorial SaveManager")();

local Window = Library:CreateWindow({
    Title = MarketplaceService:GetProductInfo(game.PlaceId).Name;
    Center = true;
    AutoShow = true;
});

local Tabs = {
    Main = Window:AddTab("Main"), 
    ["UI Settings"] = Window:AddTab("UI Settings"),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox("Groupbox")
local RightGroupBox = Tabs.Main:AddRightGroupbox("Groupbox")
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")

LeftGroupBox:AddToggle("A", {Text = "AimBot Enabled", Default = false,Tooltip = ""}):OnChanged(function(State)Aimbot.Enabled = State end);
LeftGroupBox:AddDropdown("SSS2", {Values = {"HumanoidRootPart","Head","UpperTorso","LowerTorso"}, Default = 1, Multi = false, Text = "Mobs", Tooltip = ""}):OnChanged(function(State)AimPart = State end);
LeftGroupBox:AddToggle("V", {Text = "Aimbot WallCheck", Default = false,Tooltip = ""}):OnChanged(function(State)Aimbot.WallCheck = State end);
LeftGroupBox:AddSlider("Addr", {Text = "AimBot FOV",Default = 250,Min = 0,Max = 1000,Rounding = 1,Compact = false,}):OnChanged(function(State)Aimbot.FOV = State end);
LeftGroupBox:AddToggle("cS", {Text = " AimBot Free For All", Default = false,Tooltip = ""}):OnChanged(function(State)Aimbot.FreeForAll,T.TeamCheck = State,State end);
LeftGroupBox:AddToggle("SSS", {Text = "Aimbot FOV Visible", Default = false,Tooltip = ""}):OnChanged(function(State)Circle.Visible = State end);

LeftGroupBox:AddLabel("Color"):AddColorPicker("ColorPicker", {Default = Color3.new(0, 1, 0),Title = "FOV Color"}):OnChanged(function(State)Circle.Color = State end);
Options.ColorPicker:SetValueRGB(Color3.fromRGB(0, 255, 140));

do
    local OldNameCall = nil;
    local function here_hook(self,...)
        if(not SilentAim or checkcaller()or"FindPartOnRayWithIgnoreList"~=getnamecallmethod())then
            return OldNameCall(self, ...);
        end;
        local GivemeHead = GetClosestToCuror();
        if(not(GivemeHead and GivemeHead.Character:FindFirstChild(AimPart)))then
            return OldNameCall(self, ...);
        end;
        return OldNameCall(self, Ray.new(CurrentCamera.CFrame.Position, (GivemeHead.Character[AimPart].Position - CurrentCamera.CFrame.Position).Unit * 1000), select(2,...));
    end;
    LeftGroupBox:AddToggle("VS", {Text = "Slient Aim", Default = false,Tooltip = ""}):OnChanged(function(State)
        SilentAim = State;
        if(State)then
            OldNameCall = hookmetamethod(game, "__namecall", here_hook);
        else
            hookmetamethod(game, "__namecall", OldNameCall);
        end;
    end);
end;

local ESP = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp")),"error loading Karrot-Esp")();
LeftGroupBox:AddToggle("ESP1", {Text = "Esp Toggle", Default = false,Tooltip = ""}):OnChanged(function(State)ESP:Toggle(State)end);
LeftGroupBox:AddToggle("ESP2", {Text = "Esp Players", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.Players = State end)
LeftGroupBox:AddToggle("ESP3", {Text = "Esp Tracers", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.Tracers = State end);
LeftGroupBox:AddToggle("ESP4", {Text = "Esp Names", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.EspNames = State end);
LeftGroupBox:AddToggle("ESP5", {Text = "Esp Boxes", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.Boxes = State end);
LeftGroupBox:AddToggle("BHOP", {Text = "B Hop", Default = false,Tooltip = ""}):OnChanged(function(State)
    BHop = State;
    while(wait()and BHop)do
        humanoid.Jump = true;
    end;
end);

do
    local con = nil;
    local function f()
        if(not RainBowGun or not Workspace.Camera:FindFirstChild("Arms"))then return end;
        for _,child in ipairs(Workspace.Camera.Arms:GetChildren())do 
            if(child.ClassName == "MeshPart")then
                child.Color = Color3.fromHSV(tick()%5/5,1,1); -- changes Color
            end;
        end;
    end;
LeftGroupBox:AddToggle("BHOPs", {Text = "RainBowGun", Default = false,Tooltip = ""}):OnChanged(function(State)
    RainBowGun = State
    if(State)then
        con = RunService.RenderStepped:Connect(f);
    else
        con:Disconnect();
    end;
end)

LeftGroupBox:AddToggle("d", {Text = "Auto Heal", Default = false,Tooltip = ""}):OnChanged(function(State)
    AutoHeal = State;
    while(wait()and AutoHeal)do
        for _,debris in ipairs(Workspace.Debris:GetChildren())do
            if(debris.Name=="DeadHP")then
                debris.CFrame = rootPart.CFrame;
            end;
        end;
    end;
end);

do
    local con = nil;
    local Variables = Player.PlayerGui.GUI.Client.Variables;                -- can possibly error here, haven't check post to rewrite
    
    local function f()
        Variables.ammocount.Value,Variables.ammocount2.Value = 999,999;
    end;
    
    LeftGroupBox:AddToggle("Bs", {Text = "Infinite Ammo", Default = false,Tooltip = ""}):OnChanged(function(State)
        Infinite = State;
        if(State)then
            con = RunService.Stepped:Connect(f);
        else
            con:Disconnect();
        end;
    end);
end;

LeftGroupBox:AddToggle("Bs1", {Text = "Fast Firerate", Default = false,Tooltip = ""}):OnChanged(function(State)
    FireRate = State;
    if(State)then
        FireRate = 0.02;
    else
        FireRate = 0.8;
    end;
    for _,wep in ipairs(ReplicatedStorage.Weapons:GetDescendants())do
        if(wep.Name == "FireRate")then
            wep.Value = FireRate;
        end;
    end;
end);


LeftGroupBox:AddToggle("Bs4", {Text = "No recoil", Default = false,Tooltip = ""}):OnChanged(function(State)
    if(State)then
        Recoil = 0;
    else
        Recoil = 1;
    end;
    for _,wep in ipairs(ReplicatedStorage.Weapons:GetDescendants())do
        if(wep.Name=="MaxSpread"or"Spread"==wep.Name or wep.Name=="RecoilControl")then
            wep.Value = Recoil;
        end;
    end;
end);

do
    local con = nil;
    local function f()
        humanoid.WalkSpeed,humanoid.JumpPower = WalkSpeed,JumpPower;
    end;

    RightGroupBox:AddToggle("SSS", {Text = "Player Loop WalkSpeed/JumpPower", Default = Toggle,Tooltip = ""}):OnChanged(function(State)
        Toggle = State;
        if(State)then
            con = RunService.Stepped:Connect(f);
        else
            con:Disconnect();
        end;
    end);
end;

RightGroupBox:AddInput("SSF", {Default = "WalkSpeed",Numeric = true,Finished = false,Text = "WalkSpeed",Tooltip = "Numbers Only",Placeholder = "WalkSpeed",}):OnChanged(function(State)WalkSpeed = State end);
RightGroupBox:AddInput("SSF", {Default = "JumpPower",Numeric = true,Finished = false,Text = "JumpPower",Tooltip = "Numbers Only",Placeholder = "JumpPower",}):OnChanged(function(State)JumpPower = State end);
RightGroupBox:AddInput("SSF", {Default = "JumpPower",Numeric = true,Finished = false,Text = "JumpPower",Tooltip = "Numbers Only",Placeholder = "JumpPower",}):OnChanged(function(State)JumpPower = State end);

do
    local con = nil;
    local function f()humanoid:ChangeState("Jumping")end;
    RightGroupBox:AddToggle("SSS", {Text = "Infinite Jump",Default =  InfiniteJump,Tooltip = ""}):OnChanged(function(State)
        InfiniteJump = State;
        if(State)then
            con = UserInputService.JumpRequest:Connect(f);
        else
            con:Disconnect();
        end;
    end);
end;

do
    local con = nil;
    local function f()pcall(NoClip2, character)end;
    RightGroupBox:AddToggle("SSS", {Text = "N NoClip",Default =  Sex2,Tooltip = ""}):OnChanged(function(State)
        Sex2 = State
        if(State)then
            con = RunService.Stepped:Connect(f);
        else
            con:Disconnect();
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
    
    RightGroupBox:AddToggle("SSS", {Text = "H Fly",Default =  Sex,Tooltip = "Fly By Pressing H"}):OnChanged(function(State)
        Sex = State;
        if(State)then
            con = Mouse.KeyDown:Connect(fly);
        else
            getgenv().Fly = false;
            con:Disconnect();
        end;
    end);
end;

RightGroupBox:AddButton("ServerHop", ServerHop);
RightGroupBox:AddButton("Rejoin", function() print(pcall(Rejoin))end);

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton("Unload", function() Library:Unload() end)
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightControl", NoUI = true, Text = "Menu keybind" }) 

Library.ToggleKeybind = Options.MenuKeybind 
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ "MenuKeybind" }) 
ThemeManager:SetFolder("V.G Hub")
SaveManager:SetFolder("V.G Hub/" .. game.PlaceId)
SaveManager:BuildConfigSection(Tabs["UI Settings"]) 
ThemeManager:ApplyToTab(Tabs["UI Settings"])