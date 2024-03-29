
-- "https://raw.githubusercontent.com/1201for/V.G-Hub-Part-3/main/AO"


local Table = {
    3272915504,
    12604352060
}
if not table.find(Table,game.PlaceId) then return end

local Mobs = {}
if Workspace:FindFirstChild("Enemies") then
    for i,v in pairs(Workspace.Enemies:GetChildren()) do
        if v:IsA("Model") and not table.find(Mobs,v.Name) then
            table.insert(Mobs, v.Name)
        end 
    end 
end

for i,v in pairs(ReplicatedStorage.RS.UnloadEnemies:GetChildren()) do
    if v:IsA("Model") and not table.find(Mobs,v.Name) then
        table.insert(Mobs,v.Name)
    end 
end 

local Rods = {}
for i,v in pairs(Player.Backpack:GetChildren()) do
    if v.Name:find("Rod") then
        table.insert(Rods,v.Name)
    end 
end 

local NoClip = function(A)
    return A:ChangeState(11)
end 

local KeyPress = function(A)
    return VirtualInputManager:SendKeyEvent(false,A,true,game)
end 

local Invis = function()
    local Clone = Player.Character:FindFirstChild("LowerTorso").Root:Clone()
    Clone.Parent = Player.Character:FindFirstChild("LowerTorso")
    Player.Character:FindFirstChild("LowerTorso").velocity = Vector3.new(0,0,0)
    Player.Character:FindFirstChild("LowerTorso").Root:Destroy()
end 

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local Window = Library:CreateWindow({
    Title = 'Arcane Odyssey',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Main'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Groupbox')

LeftGroupBox:AddToggle('SSS', {
    Text = 'AutoFishing',
    Default = Fishing,
    Tooltip = 'This is a tooltip', 
})


Toggles.SSS:OnChanged(function(State)
    Fishing = State
    Fishing = Toggles.SSS.Value
    spawn(function()
        while wait() and Fishing do
            pcall(function()
                if not Player.Character:FindFirstChild(Rod) then
                    Player.Character:FindFirstChild("Humanoid"):EquipTool(Player.Backpack:FindFirstChild(Rod))
                end 
                if not Player.Character:FindFirstChild("FishClock") then
                    ReplicatedStorage.RS.Remotes.Misc.ToolAction:FireServer(Player.Character:FindFirstChild(Rod)) wait(5)
                end 
                if Player.Character:FindFirstChild("FishClock") and Player.Character:FindFirstChild("FishBiteGoal") then
                    ReplicatedStorage.RS.Remotes.Misc.ToolAction:FireServer(Player.Character:FindFirstChild(Rod))
                end 
            end)
        end 
    end)
end)

Toggles.SSS:SetValue(false)

LeftGroupBox:AddDropdown('SSS2', {
    Values = Rods,
    Default = 1,
    Multi = false,

    Text = 'Fishing Rods',
    Tooltip = 'This is a tooltip',
})

Options.SSS2:OnChanged(function(State)
    Rod = State
end)

LeftGroupBox:AddToggle('SSS', {
    Text = 'Walk on Water',
    Default = No,
    Tooltip = 'This is a tooltip', 
})


Toggles.SSS:OnChanged(function(State)
    No = State
    Toggles.SSS.Value = No
    spawn(function()
        
        while wait() do
            pcall(function()
                if No then
                    for i,v in pairs(Workspace.CurrentCamera:GetChildren()) do
                        if v:IsA("BasePart") and No then
                            v.CanCollide = true
                        else
                            v.CanCollide = false
                        end 
                    end 
                end 
            end)
        end 
    end)
end)
Toggles.SSS:SetValue(false)


LeftGroupBox:AddToggle('SSS', {
    Text = 'Auto Fruit',
    Default = AutoFruits,
    Tooltip = 'This is a tooltip', 
})


Toggles.SSS:OnChanged(function(State)
    AutoFruits = State
    Toggles.SSS.Value = AutoFruits
    RunService.Stepped:Connect(function()
        if AutoFruits then 
            pcall(function()
                NoClip(Player.Character:FindFirstChildWhichIsA("Humanoid"))
            end)
        end 
    end)
    spawn(function()
        while AutoFruits and wait() do
            pcall(function()
                for i,v in pairs(Workspace.Map:GetChildren()) do
                    if v:FindFirstChild("Fruits",true) then
                        for i,v in pairs(v.Fruits:GetChildren()) do
                            if v:IsA('BasePart') and v.Transparency == 0 and AutoFruits then
                                Player.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame wait(2)
                                fireproximityprompt(v:FindFirstChildWhichIsA("ProximityPrompt",true))
                            end 
                        end 
                    end 
                end 
            end)
        end 
    end)
end)

Toggles.SSS:SetValue(false)

LeftGroupBox:AddToggle('SSS', {
    Text = "Auto Chests",
    Default = AutoChests,
    Tooltip = 'This is a tooltip', 
})

Toggles.SSS:OnChanged(function(State)
    AutoChests = State
    Toggles.SSS.Value = AutoChests
    RunService.Stepped:Connect(function()
        if AutoChests then
            pcall(function()
                
            end)
        end 
    end)
    spawn(function()
        while wait() and AutoChests do 
            pcall(function()
                for i,v in pairs(Workspace.Map:GetChildren()) do
                    if v:FindFirstChild("Chests",true) then
                        for i,v in pairs(v.Chests:GetChildren()) do
                            local D = v:FindFirstChildWhichIsA("BasePart",true)
                            if v:IsA("Model") and D.Transparency == 0 and AutoChests then
                                Player.Character:FindFirstChild("HumanoidRootPart").CFrame = v:GetModelCFrame() * CFrame.new(0,5,0)
                                wait(0.5)
                                fireproximityprompt(v:FindFirstChildWhichIsA("ProximityPrompt",true))
                                wait(5)
                            end 
                        end 
                    end 
                end 
            end)
        end 
    end)
end)

Toggles.SSS:SetValue(false)

LeftGroupBox:AddToggle('SSS', {
    Text = 'Auto Invis',
    Default = AutoInvis,
    Tooltip = 'This is a tooltip', 
})

Toggles.SSS:OnChanged(function(State)
    AutoInvis = State
    Toggles.SSS.Value = AutoInvis
    spawn(function()
        while wait() and AutoInvis do wait(5)
            pcall(function()
                Invis()
            end)
        end 
    end)
end)

Toggles.SSS:SetValue(false)


LeftGroupBox:AddToggle('SSS', {
    Text = 'Auto Herbs',
    Default = Herbs,
    Tooltip = 'This is a tooltip', 
})

Toggles.SSS:OnChanged(function(State)
    Herbs = State
    Toggles.SSS.Value = Herbs
    RunService.Stepped:Connect(function()
        if Herbs then
            pcall(function()
                NoClip(Player.Character:FindFirstChildWhichIsA("Humanoid"))
            end)
        end 
    end)
    spawn(function()
        while wait() and Herbs do 
            pcall(function()
                for i,v in pairs(Workspace.Map:GetChildren()) do
                    if v:FindFirstChild("Herbs",true) then
                        for i,v in pairs(v.Herbs:GetChildren()) do
                            if v:IsA("BasePart") and v.Transparency == 0 and Herbs then
                                Player.Character:FindFirstChild("HumanoidRootPart").CFrame = v.CFrame * CFrame.new(0,-5,0) wait(2)
                                fireproximityprompt(v:FindFirstChildWhichIsA("ProximityPrompt",true))
                            end 
                        end 
                    end 
                end 
            end)
        end 
    end)
end)

Toggles.SSS:SetValue(false)

LeftGroupBox:AddToggle('SSS', {
    Text = 'Auto Herbs',
    Default = Notes,
    Tooltip = 'This is a tooltip', 
})

Toggles.SSS:OnChanged(function(State)
    Notes = State
    Toggles.SSS.Value = Notes
    RunService.Stepped:Connect(function()
        if Notes then
            pcall(function()
                NoClip(Player.Character:FindFirstChildWhichIsA("Humanoid"))
            end)
        end 
    end)
    spawn(function()
        while wait() and AutoNotes do 
            pcall(function()
                for i,v in pairs(Workspace.Map:GetChildren()) do
                    if v:FindFirstChild("Notes",true) then
                        for i,v in pairs(v.Notes:GetChildren()) do
                            if v:IsA("Model") and v:FindFirstChildWhichIsA("BasePart") and AutoNotes then
                                Player.Character:FindFirstChild("HumanoidRootPart").CFrame = v:GetModelCFrame() * CFrame.new(0,-5,0)
                                KeyPress("E")wait(3)
                                ReplicatedStorage.RS.Remotes.Misc.VoteNote:FireServer(v,"Up")
                            end 
                        end 
                    end 
                end 
            end)
        end 
    end)
end)

Toggles.SSS:SetValue(false)

LeftGroupBox:AddToggle('SSS', {
    Text = 'Auto Charge Energy',
    Default = Ad,
    Tooltip = 'This is a tooltip', 
})

Toggles.SSS:OnChanged(function(State)
    Ad = State
    Toggles.SSS.Value = Ad
    spawn(function()
        while wait(1) and Ad do 
            pcall(function()
                if Player.bin.MagicEnergy.Value ~= Player.bin.MaxMagicEnergy.Value then
                    ReplicatedStorage.RS.Remotes.Misc.ChargingToggle:FireServer(true)
                elseif Player.bin.MagicEnergy.Value == Player.bin.MaxMagicEnergy.Value then
                    ReplicatedStorage.RS.Remotes.Misc.ChargingToggle:FireServer(false)
                end 
            end)
        end
    end)
end)

Toggles.SSS:SetValue(false)

LeftGroupBox:AddToggle('SSS', {
    Text = 'Auto Mob',
    Default = ss,
    Tooltip = 'This is a tooltip', 
})
getgenv().Pairs = {}
Toggles.SSS:OnChanged(function(State)
    ss = State
    RunService.Stepped:Connect(function()
        if ss then
            pcall(function()
                NoClip(Player.Character:FindFirstChildWhichIsA("Humanoid"))
            end)
        end
    end)
    spawn(function()
        while wait(1) and ss do 
            pcall(function()
                for i,v in pairs(ReplicatedStorage.RS.UnloadEnemies:GetChildren()) do
                    if v:IsA("Model") and (table.find(Pairs,v.Name) or AllMobs) then
                        Player.Character.HumanoidRootPart.CFrame = v:GetModelCFrame()
                    end 
                end 
                for i,v in pairs(Workspace.Enemies:GetChildren()) do
                    if v:IsA("Model")  and v.Attributes.Health.Value ~= 0 and (table.find(Pairs, v.Name) or AllMobs) then
                        
                        Player.Character:FindFirstChild("HumanoidRootPart",true).CFrame = v:GetModelCFrame() * CFrame.new(0,0,3)
                        if not Player.Character:FindFirstChildWhichIsA("Tool") then
                            Player.Character:FindFirstChildWhichIsA("Humanoid"):EquipTool(Player.Backpack:FindFirstChild(Player.Character.Data.Melee1.Value))
                        end 
                        ReplicatedStorage.RS.Remotes.Combat.DealWeaponDamage:FireServer(math.huge,Player.Character,v,"{\"Level\":2,\"Name\":\"Old Dagger\"}","Slash")
                    end 
                end 
            end)
        end
    end)
end)

Toggles.SSS:SetValue(false)

LeftGroupBox:AddDropdown('SSS23', {
    Values = Mobs,
    Default = 1,
    Multi = true,

    Text = 'Mobs',
    Tooltip = 'This is a tooltip',
})

Options.SSS23:OnChanged(function()
    for i,v in pairs(Options.SSS23.Value) do
        table.insert(Pairs, i) 
        if v == false then
            table.remove(Pairs, i)
        end 
    end 
end)


LeftGroupBox:AddToggle('SSS', {
    Text = 'Auto All Mobs',
    Default = AllMobs,
    Tooltip = 'This is a tooltip', 
})

Toggles.SSS:OnChanged(function(State)
    AllMobs = State
    Toggles.SSS.Value = AllMobs
end)

Toggles.SSS:SetValue(false)

LeftGroupBox:AddToggle('SSS', {
    Text = 'Player Kill Aura',
    Default = G9,
    Tooltip = 'This is a tooltip', 
})

Toggles.SSS:OnChanged(function(State)
    G9 = State
    Toggles.SSS.Value = G9
    spawn(function()
        while wait() and G9 do 
           pcall(function()
                for i,v in pairs(Players:GetPlayers()) do
                    if v:IsA("Model") and (Player.Character:GetModelCFrame().Position - v.Character:GetModelCFrame().Position).Magnitude < 10 then
                        ReplicatedStorage.RS.Remotes.Combat.DealWeaponDamage:FireServer(0,Player.Character,v.Character,"{\"Level\":2,\"Name\":\"Old Dagger\"}","Slash")
                    end 
                end 
            end)
        end 
    end)
end)

Toggles.SSS:SetValue(false)


LeftGroupBox:AddToggle('SSS', {
    Text = 'Mob Kill Aura',
    Default =  G91,
    Tooltip = 'This is a tooltip', 
})
Toggles.SSS:OnChanged(function(State)
    G91 = State
    Toggles.SSS.Value = G91
    spawn(function()
        while wait() and G91 do 
            pcall(function()
                for i,v in pairs(Workspace.Enemies:GetChildren()) do
                    if v:IsA("Model")  and v.Attributes.Health.Value ~= 0 and (Player.Character:GetModelCFrame().Position - v:GetModelCFrame().Position).Magnitude < 10 then
                        ReplicatedStorage.RS.Remotes.Combat.DealWeaponDamage:FireServer(0,Player.Character,v,"{\"Level\":2,\"Name\":\"Old Dagger\"}","Slash")
                    end 
                end 
            end)
        end 
    end)
end)

Toggles.SSS:SetValue(false)



LeftGroupBox:AddToggle('SSS', {
    Text = 'Player Kill Aura',
    Default =  G91,
    Tooltip = 'This is a tooltip', 
})
Toggles.SSS:OnChanged(function(State)
    G91 = State
    Toggles.SSS.Value = G91
    spawn(function()
        while wait() and G91 do 
            pcall(function()
                for i,v in pairs(Workspace.Enemies:GetChildren()) do
                    if v:IsA("Model")  and v.Attributes.Health.Value ~= 0 and (Player.Character:GetModelCFrame().Position - v:GetModelCFrame().Position).Magnitude < 10 then
                        ReplicatedStorage.RS.Remotes.Combat.DealWeaponDamage:FireServer(math.huge,Player.Character,v,"{\"Level\":2,\"Name\":\"Old Dagger\"}","Slash")
                    end 
                end 
            end)
        end 
    end)
end)


LeftGroupBox:AddToggle('SSS', {
    Text = "Kill All",
    Default =  G913,
    Tooltip = 'This is a tooltip', 
})
Toggles.SSS:OnChanged(function(State)
    G913 = State
    Toggles.SSS.Value = G913
    spawn(function()
        while wait(.5) and G913 do 
            pcall(function()
                for i,v in pairs(Players:GetChildren()) do
                    if v ~= Player then
                        Player.Character:FindFirstChild("HumanoidRootPart").CFrame = v.Character:GetModelCFrame() wait(.1)
                        ReplicatedStorage.RS.Remotes.Combat.DealWeaponDamage:FireServer(math.huge,Player.Character,v.Character,"{\"Level\":2,\"Name\":\"Old Dagger\"}","Slash")
                    end 
                end 
            end)
        end 
    end)
end)

local RightGroupBox = Tabs.Main:AddRightGroupbox('Groupbox')


local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

LeftGroupBox:AddInput('SSF', {
    Default = 'Player To Kill',
    Numeric = false,
    Finished = false,

    Text = 'Players',
    Tooltip = 'Type in Player Name',

    Placeholder = 'WalkSpeed',
})

Options.SSF:OnChanged(function(State)
    PlayerToKill = State
end)

local MyButton = LeftGroupBox:AddButton('Kill Said Player', function()
    local Target 
    for i,v in pairs(Players:GetPlayers()) do
        if v.Name:find(tostring(PlayerToKill)) or v.DisplayName:find(tostring(PlayerToKill)) or v.Name == tostring(PlayerToKill) or v.DisplayName == tostring(PlayerToKill) then
            Target = v.Character
        end 
    end 
    local Old = Player.Character.HumanoidRootPart.CFrame
    for i=1,50 do wait()
        Player.Character:FindFirstChild("HumanoidRootPart").CFrame = Target:FindFirstChild("HumanoidRootPart",true).CFrame 
        ReplicatedStorage.RS.Remotes.Combat.DealWeaponDamage:FireServer(math.huge,Player.Character,Taget,"{\"Level\":2,\"Name\":\"Old Dagger\"}","Slash")
    end 
    Player.Character.HumanoidRootPart.CFrame = Old
end)

local MyButton = LeftGroupBox:AddButton('Kill All', function()
local Old = Player.Character.HumanoidRootPart.CFrame
for i,v in pairs(Players:GetPlayers()) do
    if v ~= Player then
        for i=1,10 do wait()
            Player.Character:FindFirstChild("HumanoidRootPart").CFrame = v.Character:FindFirstChild("HumanoidRootPart",true).CFrame 
            ReplicatedStorage.RS.Remotes.Combat.DealWeaponDamage:FireServer(math.huge,Player.Character,v.Character,"{\"Level\":2,\"Name\":\"Old Dagger\"}","Slash")
        end 
    end 
end 
end)   
RightGroupBox:AddToggle('SSS', {
    Text = 'Player Loop WalkSpeed/JumpPower',
    Default =  Toggle,
    Tooltip = 'This is a tooltip', 
})
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


RightGroupBox:AddInput('SSF', {
    Default = 'WalkSpeed',
    Numeric = true,
    Finished = false,

    Text = 'WalkSpeed',
    Tooltip = 'Numbers Only',

    Placeholder = 'WalkSpeed',
})

Options.SSF:OnChanged(function(State)
    WalkSpeed = State
    print(WalkSpeed)
end)

RightGroupBox:AddInput('SSF', {
    Default = 'JumpPower',
    Numeric = true,
    Finished = false,

    Text = 'JumpPower',
    Tooltip = 'Numbers Only',

    Placeholder = 'WalkSpeed',
})

Options.SSF:OnChanged(function(State)
    JumpPower = State
    print(JumpPower)
end)



RightGroupBox:AddToggle('SSS', {
    Text = 'Infinite Jump',
    Default =  InfiniteJump,
    Tooltip = 'This is a tooltip', 
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

RightGroupBox:AddToggle('SSS', {
    Text = 'H Fly',
    Default =  Sex,
    Tooltip = 'Fly By Pressing H', 
})

Toggles.SSS:OnChanged(function(State)
Sex = State
Toggles.SSS.Value = Sex
local Max = 0
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
Mouse.KeyDown:connect(
    function(k)
        if k:lower() == "h" then
            Max = Max + 1
            getgenv().Fly = false
            if Sex then
                local T = LP.Character.UpperTorso
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
