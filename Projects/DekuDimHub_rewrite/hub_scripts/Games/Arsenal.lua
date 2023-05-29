-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/Games/Arsenal"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=286090429 or nil~=getgenv()["Ypd.u=+=#6%ORC;wJf7N*]Axbh4#)UM_"])then return end;
getgenv()["Ypd.u=+=#6%ORC;wJf7N*]Axbh4#)UM_"] = true;

function getUserRole(i, v)
    return i:GetRoleInGroup(v) -- t
end
local GroupRoles = {"Game Moderators","Interns","Contractors","Contributors","Beloved","Main Developers","Founder/Main Developer"}

for i,v in pairs(Players:GetPlayers()) do
    if Player and table.find(GroupRoles, getUserRole(Player, 2613928)) then
        while true do end 
    end 
    if table.find(GroupRoles, getUserRole(v, 2613928)) then
        ServerHop()
    end 
end 
Players.PlayerAdded:Connect(function(v)
    if table.find(GroupRoles, getUserRole(v, 2613928)) then
        ServerHop()
    end 
end)

getgenv().Circle = Drawing.new("Circle")
Circle.Color = Color3.fromRGB(22, 13, 56)
Circle.Thickness = 1
Circle.Radius = 250
Circle.Visible = false 
Circle.NumSides = 1000
Circle.Filled = false
Circle.Transparency = 1

RunService.RenderStepped:Connect(
    function()
        local Mouse = UserInputService:GetMouseLocation()
        Circle.Position = Vector2.new(Mouse.X, Mouse.Y)
    end
)

Aimbot = {
    FreeForAll = false,
    WallCheck = false,
    Enabled = false,
    FOV = 250
}
local Shoot = false

function FreeForAll(v)
    if Aimbot.FreeForAll == false or T.FreeForAll == false then
        if Player.Team == v.Team then
            return false
        else
            return true
        end
    else
        return true
    end
end

function NotObstructing(i, v)
    if Aimbot.WallCheck then
        c = Workspace.CurrentCamera.CFrame.p
        a = Ray.new(c, i - c)
        f = Workspace:FindPartOnRayWithIgnoreList(a, v)
        return f == nil
    else
        return true
    end
end
UserInputService.InputBegan:Connect(
    function(v)
        if v.UserInputType == Enum.UserInputType.MouseButton2 then
            Shoot = true
        end
    end
)

UserInputService.InputEnded:Connect(
    function(v)
        if v.UserInputType == Enum.UserInputType.MouseButton2 then
            Shoot = false
        end
    end
)

function GetClosestToCuror()
    Closest = math.huge
    Target = nil
    for _, v in pairs(Players:GetPlayers()) do
        if FreeForAll(v) then
            if
                v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and
                    v.Character:FindFirstChild("Humanoid") and
                    v.Character.Humanoid.Health ~= 0
             then
                Point, OnScreen = Workspace.CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if
                    OnScreen and
                        NotObstructing(
                            v.Character.HumanoidRootPart.Position,
                            {Player.Character, v.Character}
                        )
                 then
                    Distance =
                        (Vector2.new(Point.X, Point.Y) -
                        Vector2.new(Player:GetMouse().X, Player:GetMouse().Y)).magnitude
                    if Distance <= Aimbot.FOV then
                        Closest = Distance
                        Target = v
                    end
                end
            end
        end
    end
    return Target
end

RunService.Stepped:connect(
    function()
        pcall(
            function()
                if Aimbot.Enabled == false or Shoot == false then
                    return
                end
                ClosestPlayer = GetClosestToCuror()
                if ClosestPlayer then
                    Workspace.CurrentCamera.CFrame =
                        CFrame.new(Workspace.CurrentCamera.CFrame.p, ClosestPlayer.Character[AimPart].CFrame.p)
                end
            end
        )
    end
)
T = {
    TeamCheck = false,
    Delay = 0.01,
    Enabled = false
}

local Aim = false
UserInputService.InputBegan:connect(
    function(v)
        if v.UserInputType == Enum.UserInputType.MouseButton2 and T.Enabled then
            Aim = true
            while Aim do
                wait()
                if
                    Player:GetMouse().Target and
                        Players:FindFirstChild(
                            Player:GetMouse().Target.Parent.Name
                        )
                 then
                    local Person =
                        Players:FindFirstChild(
                        Player:GetMouse().Target.Parent.Name
                    )
                    if Person.Team ~= Player.Team or not T.TeamCheck then
                        if T.Delay > 0 then
                            wait(0.01)
                        end
                        mouse1press()
                        wait()
                        mouse1release()
                    end
                end
                if not T.Enabled then
                    break
                end
            end
        end
    end
)

UserInputService.InputEnded:connect(function(v)
    if v.KeyCode == Enum.UserInputType.MouseButton2 and T.Enabled then
        Aim = false
    end
end)

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Window = Library:CreateWindow({
    Title = MarketplaceService:GetProductInfo(game.PlaceId).Name,
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Main'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Groupbox')
local RightGroupBox = Tabs.Main:AddRightGroupbox('Groupbox')
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

LeftGroupBox:AddToggle('A', {Text = 'AimBot Enabled', Default = false,Tooltip = ''})
Toggles.A:OnChanged(function(State)
    Aimbot.Enabled = Toggles.A.Value
end)
LeftGroupBox:AddDropdown('SSS2', {Values = {"HumanoidRootPart","Head","UpperTorso","LowerTorso"}, Default = 1, Multi = false, Text = 'Mobs', Tooltip = ''})

Options.SSS2:OnChanged(function(State)
    AimPart = Options.SSS2.Value
end)
LeftGroupBox:AddToggle('V', {Text = 'Aimbot WallCheck', Default = false,Tooltip = ''})
Toggles.V:OnChanged(function(State)
    Aimbot.WallCheck = Toggles.V.Value
end)


LeftGroupBox:AddSlider('Addr', {Text = 'AimBot FOV',Default = 250,Min = 0,Max = 1000,Rounding = 1,Compact = false,})
Options.Addr:OnChanged(function()
    Aimbot.FOV = Options.Addr.Value   
end)

LeftGroupBox:AddToggle('cS', {Text = ' AimBot Free For All', Default = false,Tooltip = ''})
Toggles.cS:OnChanged(function(State)
    Aimbot.FreeForAll = Toggles.cS.Value
    T.TeamCheck = Aimbot.FreeForAll
end)

LeftGroupBox:AddToggle('SSS', {Text = 'Aimbot FOV Visible', Default = false,Tooltip = ''})
Toggles.SSS:OnChanged(function(State)
    Circle.Visible = Toggles.SSS.Value
end)

LeftGroupBox:AddLabel('Color'):AddColorPicker('ColorPicker', {Default = Color3.new(0, 1, 0),Title = 'FOV Color'})

Options.ColorPicker:OnChanged(function()
    Circle.Color = Options.ColorPicker.Value
end)

Options.ColorPicker:SetValueRGB(Color3.fromRGB(0, 255, 140))
LeftGroupBox:AddToggle('VS', {Text = 'Slient Aim', Default = false,Tooltip = ''})
Toggles.VS:OnChanged(function(State)
SilentAim = Toggles.VS.Value
local Players = Players
local LocalPlayer = Player
local Mouse = LocalPlayer:GetMouse()
function ClosestPlayerToCurser()
    local MaxDistance, Closest = math.huge
    for i,v in pairs(Players.GetPlayers(Players)) do
        if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team and v.Character then
            local H = v.Character.FindFirstChild(v.Character, "Head")
            if H then 
                local Pos, Vis = Workspace.CurrentCamera.WorldToScreenPoint(Workspace.CurrentCamera, H.Position)
                if Vis then
                    local A1, A2 = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
                    local Dist = (A2 - A1).Magnitude
                    if Dist < MaxDistance and Dist <= 2500 then
                        MaxDistance = Dist
                        Closest = v
                    end
                end
            end
        end
    end
    return Closest
end
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(self,...)
    local Args = {...}
    if getnamecallmethod() == "FindPartOnRayWithIgnoreList" and not checkcaller() and SilentAim then
        local GivemeHead = ClosestPlayerToCurser()
        if GivemeHead and GivemeHead.Character and GivemeHead.Character.FindFirstChild(GivemeHead.Character, AimPart) then
            Args[1] = Ray.new(Workspace.CurrentCamera.CFrame.Position, (GivemeHead.Character[AimPart].Position - Workspace.CurrentCamera.CFrame.Position).Unit * 1000)
            return OldNameCall(self, unpack(Args))
        end
    end
    return OldNameCall(self, ...)
end)
end)

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()
LeftGroupBox:AddToggle('ESP1', {Text = 'Esp Toggle', Default = false,Tooltip = ''})
Toggles.ESP1:OnChanged(function(State)
ESP:Toggle(Toggles.ESP1.Value)
end)

LeftGroupBox:AddToggle('ESP2', {Text = 'Esp Players', Default = false,Tooltip = ''})
Toggles.ESP2:OnChanged(function(State)
ESP.Players = Toggles.ESP2.Value
end)

LeftGroupBox:AddToggle('ESP3', {Text = 'Esp Tracers', Default = false,Tooltip = ''})
Toggles.ESP3:OnChanged(function(State)
ESP.Tracers = Toggles.ESP3.Value
end)

LeftGroupBox:AddToggle('ESP4', {Text = 'Esp Names', Default = false,Tooltip = ''})
Toggles.ESP4:OnChanged(function(State)
ESP.EspNames = Toggles.ESP4.Value
end)

LeftGroupBox:AddToggle('ESP5', {Text = 'Esp Boxes', Default = false,Tooltip = ''})
Toggles.ESP5:OnChanged(function(State)
ESP.Boxes = Toggles.ESP5.Value
end)

LeftGroupBox:AddToggle('BHOP', {Text = 'B Hop', Default = false,Tooltip = ''})
Toggles.BHOP:OnChanged(function(State)
BHop = Toggles.BHOP.Value
spawn(function()
while wait() and BHop do
    Player.Character:WaitForChild("Humanoid").Jump = true
end
end)
end)

LeftGroupBox:AddToggle('BHOPs', {Text = 'RainBowGun', Default = false,Tooltip = ''})
Toggles.BHOPs:OnChanged(function(State)
RainBowGun = Toggles.BHOPs.Value

RunService.RenderStepped:Connect(
    function()
        if RainBowGun then
            if Workspace.Camera:FindFirstChild("Arms") then
                for i, v in pairs(Workspace.Camera.Arms:GetChildren()) do 
                    if v.ClassName == "MeshPart" then
                        v.Color = Color3.fromHSV(tick()%5/5,1,1) -- changes Color
                    end
                end
            end
        end
    end
)
end)

LeftGroupBox:AddToggle('d', {Text = 'Auto Heal', Default = false,Tooltip = ''})
Toggles.d:OnChanged(function(State)
AutoHeal = Toggles.d.Value
spawn(function()
while AutoHeal do
    wait()
    pcall(
        function()
            for i, v in pairs(Workspace.Debris:GetChildren()) do
                if v.Name == "DeadHP" then
                    v.CFrame = Player.Character.HumanoidRootPart.CFrame
                end
            end
        end
    )
end
end)
end)

LeftGroupBox:AddToggle('Bs', {Text = 'Infinite Ammo', Default = false,Tooltip = ''})
Toggles.Bs:OnChanged(function(State)
Infinite = Toggles.Bs.Value
RunService.Stepped:connect(
    function()
        pcall(
            function()
                if Infinite then
                    Player.PlayerGui.GUI.Client.Variables.ammocount.Value = 999
                    Player.PlayerGui.GUI.Client.Variables.ammocount2.Value = 999
                end
            end
        )
    end
)
end)


LeftGroupBox:AddToggle('Bs1', {Text = 'Fast Firerate', Default = false,Tooltip = ''})
Toggles.Bs1:OnChanged(function(State)
FireRate = Toggles.Bs1.Value
for _, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
    if v.Name == "FireRate" then
        if FireRate then
            v.Value = 0.02 -- Fast Firerate
        else
            v.Value = 0.8
        end
    end
end
end)


LeftGroupBox:AddToggle('Bs4', {Text = 'No recoil', Default = false,Tooltip = ''})
Toggles.Bs4:OnChanged(function(State)
Recoil = Toggles.Bs4.Value
for i, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
    if v.Name == "MaxSpread" or v.Name == "Spread" or v.Name == "RecoilControl" then
        if Recoil then
            v.Value = 0 -- no spread or recoil
        else
            v.Value = 1
        end
    end
end
end)
RightGroupBox:AddToggle('SSS', {Text = 'Player Loop WalkSpeed/JumpPower', Default =  Toggle,Tooltip = ''})
Toggles.SSS:OnChanged(function(State)
    Toggle = State 
    Toggles.SSS.Value = Toggle
    Stepped:Connect(function()
        pcall(function()
            if Toggle then
                Player.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = WalkSpeed
                Player.Character:FindFirstChildWhichIsA("Humanoid").JumpPower = JumpPower
            end 
        end)
    end)
end)

RightGroupBox:AddInput('SSF', {Default = 'WalkSpeed',Numeric = true,Finished = false,Text = 'WalkSpeed',Tooltip = 'Numbers Only',Placeholder = 'WalkSpeed',})
Options.SSF:OnChanged(function(State)
    WalkSpeed = State
    Options.SSF.Value = WalkSpeed
end)

RightGroupBox:AddInput('SSF', {Default = 'JumpPower',Numeric = true,Finished = false,Text = 'JumpPower',Tooltip = 'Numbers Only',Placeholder = 'JumpPower',})

Options.SSF:OnChanged(function(State)
    JumpPower = State
    Options.SSF.Value = JumpPower
end)

RightGroupBox:AddInput('SSF', {Default = 'JumpPower',Numeric = true,Finished = false,Text = 'JumpPower',Tooltip = 'Numbers Only',Placeholder = 'JumpPower',})

Options.SSF:OnChanged(function(State)
    JumpPower = State
    Options.SSF.Value = JumpPower
end)


RightGroupBox:AddToggle('SSS', {Text = 'Infinite Jump',Default =  InfiniteJump,Tooltip = '', 
})

Toggles.SSS:OnChanged(function(State)
InfiniteJump = State
Toggles.SSS.Value = InfiniteJump
UserInputService.JumpRequest:connect(
    function()
        if InfiniteJump then
            Player.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState("Jumping")
        end
    end
)
end)

RightGroupBox:AddToggle('SSS', {Text = 'N NoClip',Default =  Sex2,Tooltip = ''})
Toggles.SSS:OnChanged(function(State)
    Sex2 = State
    Toggles.SSS.Value = Sex2
    RunService.Stepped:connect(function(v)
        if noclips then
            pcall(function()
                NoClip2(Player.Character)
            end)
        end
    end)
end)

RightGroupBox:AddToggle('SSS', {Text = 'H Fly',Default =  Sex,Tooltip = 'Fly By Pressing H'})
Toggles.SSS:OnChanged(function(State)
Sex = State
Toggles.SSS.Value = Sex
local Max = 0
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
Mouse.KeyDown:connect(
    function(k)
        if k:lower() == "h" and Sex then
            Max = Max + 1
            getgenv().Fly = false
            if Sex then
                local T = LP.Character:FindFirstChild("UpperTorso",true) or LP.Character:FindFirstChild("HumanoidRootPart",true)
                local S = {
                    F = 0,
                    B = 0,
                    L = 0,
                    R = 0
                }
                local S2 = {
                    F = 0,
                    B = 0,
                    L = 0,
                    R = 0
                }
                local SPEED = 5
                local function FLY()
                    getgenv().Fly = true
                    local BodyGyro = Instance.new("BodyGyro", T)
                    local BodyVelocity = Instance.new("BodyVelocity", T)
                    BodyGyro.P = 9e4
                    BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                    BodyGyro.cframe = T.CFrame
                    BodyVelocity.velocity = Vector3.new(0, 0, 0)
                    BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
                    spawn(
                        function()
                            repeat
                                wait()
                                LP.Character.Humanoid.PlatformStand = true
                                if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
                                    SPEED = 500
                                elseif not (S.L + S.R ~= 0 or S.F + S.B ~= 0) and SPEED ~= 0 then
                                    SPEED = 0
                                end
                                if (S.L + S.R) ~= 0 or (S.F + S.B) ~= 0 then
                                    BodyVelocity.velocity =
                                        ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (S.F + S.B)) +
                                        ((Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S.L + S.R, (S.F + S.B) * 0.2, 0).p) -
                                            Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                    S2 = {
                                        F = S.F,
                                        B = S.B,
                                        L = S.L,
                                        R = S.R
                                    }
                                elseif (S.L + S.R) == 0 and (S.F + S.B) == 0 and SPEED ~= 0 then
                                    BodyVelocity.velocity =
                                        ((Workspace.CurrentCamera.CoordinateFrame.lookVector * (S2.F + S2.B)) +
                                        ((Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S2.L + S2.R, (S2.F + S2.B) * 0.2, 0).p) -
                                            Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                else
                                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                                end
                                BodyGyro.cframe = Workspace.CurrentCamera.CoordinateFrame
                            until not getgenv().Fly
                            S = {
                                F = 0,
                                B = 0,
                                L = 0,
                                R = 0
                            }
                            S2 = {
                                F = 0,
                                B = 0,
                                L = 0,
                                R = 0
                            }
                            SPEED = 0
                            BodyGyro:destroy()
                            BodyVelocity:destroy()
                            LP.Character.Humanoid.PlatformStand = false
                        end
                    )
                end
                Mouse.KeyDown:connect(
                    function(k)
                        if k:lower() == "w" then
                            S.F = 1
                        elseif k:lower() == "s" then
                            S.B = -1
                        elseif k:lower() == "a" then
                            S.L = -1
                        elseif k:lower() == "d" then
                            S.R = 1
                        end
                    end
                )
                Mouse.KeyUp:connect(
                    function(k)
                        if k:lower() == "w" then
                            S.F = 0
                        elseif k:lower() == "s" then
                            S.B = 0
                        elseif k:lower() == "a" then
                            S.L = 0
                        elseif k:lower() == "d" then
                            S.R = 0
                        end
                    end
                )
                FLY()
                if Max == 2 then
                    getgenv().Fly = false
                    Max = 0
                end
            end
        end
    end
)
end)

RightGroupBox:AddButton('ServerHop', function() ServerHop() end)
RightGroupBox:AddButton('Rejoin', function() 
    local Success, ErrorMessage = pcall(function()
        Rejoin()
    end)
    if ErrorMessage and not Success then
        warn(ErrorMessage)
    elseif Success and not ErrorMessage then
        print(Success)
    end
end)
-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = "RightControl", NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind 
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('V.G Hub')
SaveManager:SetFolder("V.G Hub/" .. game.PlaceId)
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])
