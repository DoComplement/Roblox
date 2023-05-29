-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/Games/FruitBattleGrounds"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=9224601490 or nil~=getgenv()["N^*Yb7K6=2A~kt$e`tKtmbup(YqCo&8c"])then return end;
getgenv()["N^*Yb7K6=2A~kt$e`tKtmbup(YqCo&8c"] = true;

if messagebox then
messagebox("A fatal error occurred. game patched pls do not contact developers for help", "We are aware of patch pls wait", 0x10)
else 
Kick(Player,"A fatal error occurred. game patched pls do not contact developers for help We are aware of patch pls wait")
end 
repeat wait(9e9) until game 
local Numbers = {
    49,
    50,
    51,
    52
}
local VirtualInputManager = game:GetService("VirtualInputManager")

local d = Instance.new("Part")
d.Name = "Ro"
d.Parent = Workspace
d.Anchored = true
d.Position = Vector3.new()
local Respawn = function() -- Stolen LOL
    require(ReplicatedStorage.Loader).ServerEvent("Core", "LoadCharacter", {})
    require(ReplicatedStorage.Loader).ServerEvent("Main", "LoadCharacter")
    if (Player.Character or Player.CharacterAdded:Wait()) and Player.Character:WaitForChild("Humanoid", 2) then
        Workspace.CurrentCamera.CameraSubject = Player.Character
        StarterGui:SetCoreGuiEnabled("Backpack", false)
        StarterGui:SetCoreGuiEnabled("PlayerList", true)
        StarterGui:SetCoreGuiEnabled("Chat", true)
        UI.MainMenu.Visible = false
        UI.HUD.Visible = true
    end
end

DisableConnection(Player,"Idled")

RunService.Stepped:connect(
    function()
        Workspace.FallenPartsDestroyHeight = math.huge/math.huge
        sethiddenproperty(Player, "SimulationRadius", 1000)
    end
)
repeat wait() until Player:FindFirstChild("MAIN_DATA")
local Data = Player:FindFirstChild('MAIN_DATA')
local UI = Player.PlayerGui.UI

local Slots = Player["MAIN_DATA"].Slots
local Slot = Player["MAIN_DATA"].Slot
local Load = require(ReplicatedStorage.Loader)
local FruitsHandler = require(ReplicatedStorage.Loader.Replicated.FruitsHandler)
local Fruit = {}
local Wants = {}
for i,v in pairs(FruitsHandler.List) do
    table.insert(Wants, v)
end 
local Codes = {
    "FREEBREAD!",
    "60KLETSGO",
    "SORRY4SHUTDOWN",
    "MAGMALETSGOO",
    "50KINSANE",
    "40KDAMN",
    "35KWOWBRO",
    "30KLOVEYOU"
}

local CFrames = {
    ["1"] = CFrame.new(-987, 502, -1102),
    ["2"] = CFrame.new(-289, 557, -1343),
    ["3"] = CFrame.new(321, 583, -1442),
    ["4"] = CFrame.new(486, 549, -1316),
    ["5"] = CFrame.new(1195, 562, -826)
}

for i,v in pairs(Codes) do
    Load.Server("Codes","Redeem",{["Code"] = v}) 
end 

--[[while wait(2) do
    if not table.find(Wants,Slots[Slot.Value].Value) then
        Load.Server("FruitsHandler","Spin",{}) 
    end
end ]]--

local Self = {}
getgenv().Text = Drawing.new("Text")
Text.Color = Color3.new(0, 1, 1)
Text.Font = 1
Text.Outline = true
Text.OutlineColor = Color3.new(0, 0, 0)
Text.Position = Vector2.new(0,0)
Text.Size = 25
Text.Text = ""
Text.Visible = true

Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    local X,Y= Text.TextBounds.X,Text.Position.Y
    Text.Position = Vector2.new(Workspace.CurrentCamera.ViewportSize.X / X , Y)
end)
local function Direction(A, B)
    return (B - A).Unit * 1000
end

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

LeftGroupBox:AddToggle('SD', {Text = 'AutoFarm', Default = false,Tooltip = ''})
Toggles.SD:OnChanged(function(State)
    Ez = Toggles.SD.Value
    RunService.Stepped:connect(function()
        if Ez then
            pcall(function()
                if (not Player.Character or Player.Character == nil) and not UI.HUD.Visible then
                    Respawn()
                end 
                Player.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(11)
            end)
        end
    end)
    spawn(function()
        while Ez do wait()
            pcall(function()
                if Method == "Sky" then
                    Player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(0, 10000, math.random(9000))
                end 
                if Method == "Floor" then
                    for i,v in pairs(CFrames) do
                        if i == tostring(math.random(1,5)) then
                            Player.Character:WaitForChild("HumanoidRootPart").CFrame = v
                        end 
                    end 
                end 
                for i, v in pairs(Numbers) do
                    VirtualInputManager:SendKeyEvent(true, v, false, game)
                    wait(1)
                    VirtualInputManager:SendMouseButtonEvent(0,0,0, true, game, 1)
                    VirtualInputManager:SendMouseButtonEvent(0,0,0, false, game, 1) 
                    wait(1)
                end
            end)
        end
    end)
end)


LeftGroupBox:AddDropdown('Method', {Values = {"Floor", "Sky"}, Default = 1, Multi = false, Text = 'AutoFarm Methods', Tooltip = ''})

Options.Method:OnChanged(function(State)
    Method = Options.Method.Value
end)

LeftGroupBox:AddToggle('SD6', {Text = 'Slient Aim', Default = false,Tooltip = ''})
Toggles.SD6:OnChanged(function(State)
E = Toggles.SD6.Value

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function ClosestPlayerToCurser()
    local MaxDistance, Closest = math.huge
    for i, v in pairs(Players.GetPlayers(Players)) do
        if v ~= LocalPlayer and v.Character then
            local H = v.Character.FindFirstChild(v.Character, "Head")
            if H then
                local Pos, Vis = Workspace.CurrentCamera.WorldToScreenPoint(Workspace.CurrentCamera, H.Position)
                if Vis then
                    local A1, A2 = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
                    local Dist = (A2 - A1).Magnitude
                    if Dist < MaxDistance and Dist <= math.huge then
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
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    if getnamecallmethod() == "Raycast" and not checkcaller() and E then
        local GivemeHead = ClosestPlayerToCurser()
        if GivemeHead and GivemeHead.Character then
            local T = Args[2]
            Args[3] = Direction(T,ClosestPlayerToCurser().Character.HumanoidRootPart.Position)
            return OldNameCall(unpack(Args))
        end
    end
    return OldNameCall(...)
end)
end)

LeftGroupBox:AddDropdown('Method2', {Values = Wants, Default = 1, Multi = true, Text = 'Fruits', Tooltip = ''})


LeftGroupBox:AddToggle('SD623', {Text = 'Auto Spin', Default = false,Tooltip = ''})
Toggles.SD623:OnChanged(function(State)
Spin = Toggles.SD623.Value

Load.ServerEvent("Core", "UpdateSettings", {["\255"] = true, ["\255"] = true, ["\255"] = true, ["\255"] = true, ["\255"] = true})

spawn(function()
    while Spin do wait(2)
        if not table.find(Options.Method2.Value,Slots[Slot.Value].Value) and Player.MAIN_DATA.Gems.Value >= 49 then
            Load.Server("FruitsHandler","Spin",{}) 
        elseif table.find(Options.Method2.Value,Slots[Slot.Value].Value)  then
            Load.ServerEvent("Core","UpdateSettings",{["Textures"] = true,["FPSCounter"] = true,["KillFeed"] = true, ["Music"] = false, ["Shadows"] = true})       
        else
            TeleportService:Teleport(game.PlaceId, Player)
        end
    end 
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


RightGroupBox:AddToggle('SSS', {Text = 'Player Loop WalkSpeed/JumpPower', Default =  Toggle,Tooltip = 'This is a tooltip'})
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

RightGroupBox:AddToggle('SSS', {Text = 'Infinite Jump',Default =  InfiniteJump,Tooltip = 'This is a tooltip', 
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

RightGroupBox:AddToggle('SSS', {Text = 'N NoClip',Default =  Sex2,Tooltip = 'This is a tooltip'})
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

RightGroupBox:AddButton('FPS Booster', function()
    for i,v in pairs(game:GetDescendants()) do 
        if v:IsA("Texture") then
            v.Texture = ""
        elseif v:IsA("BasePart") then
            v.Material = Enum.Material.Wood
        end 
    end 
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
