-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/Games/Climb-1000-Stairs"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=5702593762 or nil~=getgenv()["c_vM9MI^:ql+i^Di~peEp.Nmh%U?wt@w"])then return end;
getgenv()["c_vM9MI^:ql+i^Di~peEp.Nmh%U?wt@w"] = true;


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

LeftGroupBox:AddToggle('Stars', {Text = 'Auto Stars', Default = false,Tooltip = 'This is a tooltip'})
Toggles.Stars:OnChanged(function(State)
    Toggle = Toggles.Stars.Value
    spawn(function()
        while wait() and Toggle do
            pcall(function()
                for i,v in pairs(Workspace.Stairs:GetChildren()) do
                    if v:IsA("BasePart") and v:FindFirstChildWhichIsA("TouchTransmitter") then
                        firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart",true), v, 0)
                        firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart",true), v, 1)
                    end 
                end
            end)
        end
    end)
end)

LeftGroupBox:AddButton('Instant Winner!', function() 
    firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart",true), Workspace.Spawns.WinnerSpawn, 0)
end)
LeftGroupBox:AddButton('Instant Badges!', function() 
    for i,v in pairs(Workspace.Badges:GetChildren()) do
        firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart",true), v, 1)
    end 
end)

LeftGroupBox:AddToggle('Carts', {Text = 'Auto Spawn Carts', Default = false,Tooltip = 'This is a tooltip'})
Toggles.Carts:OnChanged(function(State)
    Toggle2 = Toggles.Carts.Value
    spawn(function()
        while wait() and Toggle2 do
            pcall(function()
                for i,v in pairs(Workspace.CartRegens:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChildWhichIsA("TouchTransmitter",true) then
                        firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart",true), v:FindFirstChildWhichIsA("BasePart"), 0)
                        firetouchinterest(Player.Character:FindFirstChild("HumanoidRootPart",true), v:FindFirstChildWhichIsA("BasePart"), 1)
                    end 
                end
            end)
        end
    end)
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
