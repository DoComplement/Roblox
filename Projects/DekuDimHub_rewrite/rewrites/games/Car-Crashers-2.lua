-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/Games/Car-Crashers-2"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=654732683 or nil~=getgenv()["`MIRL]to872t+ZbKB#zRYaB9^~&gs8c*"])then return end;
getgenv()["`MIRL]to872t+ZbKB#zRYaB9^~&gs8c*"] = true;

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

if(nil~=getConnections)then
    for _,con in ipairs(getConnections(LocalPlayer.Idled))do
        con:Disable();
    end;
else
    Player.Idled:Connect(function()
        task.wait(math.random(15,33));
        VirtualUser:CaptureController();
        VirtualUser:ClickButton2(Vector2.new(Mouse.X,Mouse.Y),Workspace.Camera);
    end);
end;

local OpenDealership,SpawnButton = nil,nil;
do
    local GUIs = getsenv(Player.PlayerGui:FindFirstChild("GUIs",true));
    OpenDealership = GUIs["OpenDealership"];
    SpawnButton = GUIs["SpawnButton"];
end;

local function Car()
    return Workspace.CarCollection:FindFirstChild(Player.Name, true):FindFirstChildWhichIsA("Model",true);
end;

local function SpawnCar()
    OpenDealership();
    SpawnButton();
end;

local Fling = nil
do
    local v1,v2 = Vector3.new(0, 500, 0),Vector3.new(0, -1000, 0);
    Fling = function()
        local Vehicle = Car().PrimaryPart;
        Vehicle.Velocity = v1;
        task.wait(0.25);
        CVehicle.Velocity = v2;
    end;
end;

Player:GetMouse().KeyDown:Connect(function(v)
    if v == "n" then
        noclips = not noclips
    end 
end)

local Library = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/Library.lua")), "error loading Linorial Library")();
local ThemeManager = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/ThemeManager.lua")), "error loading Linorial ThemeManager")();
local SaveManager = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/SaveManager.lua")), "error loading Linorial SaveManager")();

local Window = Library:CreateWindow({
    Title = MarketplaceService:GetProductInfo(game.PlaceId).Name,
    Center = true, 
    AutoShow = true,
});

local Tabs = {
    Main = Window:AddTab("Main"), 
    ["UI Settings"] = Window:AddTab("UI Settings"),
};

local LeftGroupBox = Tabs.Main:AddLeftGroupbox("Groupbox");
local RightGroupBox = Tabs.Main:AddRightGroupbox("Groupbox");
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu");

LeftGroupBox:AddToggle("AutoFarm", {Text = "AutoFarm", Default = false,Tooltip = ""}):OnChanged(function(State)
    Something = State;
    
    -- will supposedly error, but idk how so
    while(task.wait()and Something)do
        if(Player.SpawnTimer.Value==0)then
            SpawnCar();
        end
        Fling();
    end;
end);

local ESP = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp")),"error loading Karrot-Esp")();
LeftGroupBox:AddToggle("ESP1", {Text = "Esp Toggle", Default = false,Tooltip = ""}):OnChanged(function(State)ESP:Toggle(State)end);
LeftGroupBox:AddToggle("ESP2", {Text = "Esp Players", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.Players = State end);
LeftGroupBox:AddToggle("ESP3", {Text = "Esp Tracers", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.Tracers = State end);
LeftGroupBox:AddToggle("ESP4", {Text = "Esp Names", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.EspNames = State end);
LeftGroupBox:AddToggle("ESP5", {Text = "Esp Boxes", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.Boxes = State end);

do
    local con = nil;
    local function f()
        humanoid.WalkSpeed = WalkSpeed;
        humanoid.JumpPower = JumpPower;
    end;
    RightGroupBox:AddToggle("SSS", {Text = "Player Loop WalkSpeed/JumpPower", Default =  Toggle,Tooltip = "This is a tooltip"}):OnChanged(function(State)
        if(State)then
            con = Stepped:Connect(f);
        else
            con:DisConnect();
        end;
    end)
end;

RightGroupBox:AddInput("SSF", {Default = "WalkSpeed",Numeric = true,Finished = false,Text = "WalkSpeed",Tooltip = "Numbers Only",Placeholder = "WalkSpeed"}):OnChanged(function(State)WalkSpeed = State end);
RightGroupBox:AddInput("SSF", {Default = "JumpPower",Numeric = true,Finished = false,Text = "JumpPower",Tooltip = "Numbers Only",Placeholder = "JumpPower",}):OnChanged(function(State)JumpPower = State end);
RightGroupBox:AddInput("SSF", {Default = "JumpPower",Numeric = true,Finished = false,Text = "JumpPower",Tooltip = "Numbers Only",Placeholder = "JumpPower",}):OnChanged(function(State)JumpPower = State end);

do
    local con = nil;
    local function f()humanoid:ChangeState("Jumping")end;
    RightGroupBox:AddToggle("SSS", {Text = "Infinite Jump",Default =  InfiniteJump,Tooltip = "This is a tooltip", }):OnChanged(function(State)
        if(State)then
            con = UserInputService.JumpRequest:Connect(f);
        else
            con:Disconnect();
        end;
    end);
end;

do
    local con = nil;
    local function f()NoClip2(character)end;
    RightGroupBox:AddToggle("SSS", {Text = "N NoClip",Default =  Sex2,Tooltip = "This is a tooltip"}):OnChanged(function(State)
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
        if(State)then
            con = Mouse.KeyDown:Connect(fly);
        else
            getgenv().Fly = false;
            con:Disconnect();
        end;
    end);
end;

RightGroupBox:AddButton("ServerHop", ServerHop);
RightGroupBox:AddButton("Rejoin", function()print(pcall(Rejoin))end);

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton("Unload", function()Library:Unload()end);
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightControl", NoUI = true, Text = "Menu keybind" }); 

Library.ToggleKeybind = Options.MenuKeybind;
ThemeManager:SetLibrary(Library);
SaveManager:SetLibrary(Library);

SaveManager:IgnoreThemeSettings();
SaveManager:SetIgnoreIndexes({"MenuKeybind"});
ThemeManager:SetFolder("V.G Hub");
SaveManager:SetFolder("V.G Hub/" .. game.PlaceId);
SaveManager:BuildConfigSection(Tabs["UI Settings"]);
ThemeManager:ApplyToTab(Tabs["UI Settings"]);
