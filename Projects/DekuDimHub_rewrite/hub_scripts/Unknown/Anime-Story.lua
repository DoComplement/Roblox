
-- "https://raw.githubusercontent.com/1201for/V.G-Hub-Part-3/main/Anime-Story"

repeat
    wait()
until game:IsLoaded()
if game.PlaceId ~= 9417197334 then return end
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local wait = task.wait
local spawn = task.spawn
local Live = Workspace.Live
local Config = {
    WindowName = "V.G Hub",
    Color = Color3.fromRGB(107, 72, 55),
    Keybind = Enum.KeyCode.RightControl
}

local Name = "Era .json"

Des = {}
if makefolder then
    makefolder("V.G Hub")
end

local Settings

if
    not pcall(
        function()
            readfile("V.G Hub//" .. Name)
        end
    )
 then
    writefile("V.G Hub//" .. Name, HttpService:JSONEncode(Des))
end

Settings = HttpService:JSONDecode(readfile("V.G Hub//" .. Name))

local function Save()
    writefile("V.G Hub//" .. Name, HttpService:JSONEncode(Settings))
end
RunService.Stepped:connect(
    function()
        sethiddenproperty(Player, "SimulationRadius", 1000)
    end
)

local Guis = {}

for i, v in pairs(Player.PlayerGui.MenuGUI.AreaFrame.Areas:GetChildren()) do
    if v:IsA("ImageButton") then
        table.insert(Guis, v)
    end
end
local Mobs = {}
for i,v in pairs(Workspace.Live:GetChildren()) do
    if v:IsA("Model") and not table.find(Mobs,v.Name) then
        table.insert(Mobs,v.Name)
    end 
end 
spawn(
    function()
        while wait(1) do
            pcall(
                function()
                    if Player.PlayerGui.MenuGUI.AreaFrame.Visible then
                        local Guis = {}

                        for i, v in pairs(Player.PlayerGui.MenuGUI.AreaFrame.Areas:GetChildren()) do
                            if v:IsA("ImageButton") then
                                table.insert(Guis, v)
                            end
                        end

                        for i, v in pairs(Guis) do
                            for i, v in pairs(getconnections(v.MouseButton1Click)) do
                                v:Fire()
                            end
                        end
                    end
                end
            )
        end
    end
)

local Quests = {}
for i, v in pairs(Workspace.Interactable.Quests.Repeatable:GetChildren()) do
    if
        v:IsA("Model") and v:FindFirstChildWhichIsA("ProximityPrompt") and
            not table.find(Quests, v.Head["Overhead_Info"].PlayerName.Text)
     then
        table.insert(Quests, v.Head["Overhead_Info"].PlayerName.Text)
    end
end

local function ServerHop()
    local HttpService = game:GetService("HttpService")
    local ABC = {}
    for _, v in ipairs(
        HttpService:JSONDecode(
            game:HttpGetAsync(
                "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            )
        ).data
    ) do
        if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
            ABC[#ABC + 1] = v.id
        end
    end
    if #ABC > 0 then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, ABC[math.random(1, #ABC)])
    end
end

local OldNameCall
    OldNameCall =
        hookmetamethod(
        game,
        "__newindex",
        function(A, B, ...)
            if not checkcaller() and (B == "WalkSpeed") then
                return Player.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed or 16
            end
            if not checkcaller() and (B == "JumpPower") then
                return Player.Character:FindFirstChildWhichIsA("Humanoid").JumpPower or 50
            end
            return OldNameCall(A, B, ...)
        end
    )


local D = {"Fan", "Guest"}
for i, v in pairs(Players:GetPlayers()) do
    if not table.find(D, v:GetRoleInGroup(15032683)) and Settings.AutoHop then
        ServerHop()
    end
end
Players.PlayerAdded:Connect(
    function(v)
        if not table.find(D, v:GetRoleInGroup(15032683)) and Settings.AutoHop then
            ServerHop()
        end
    end
)
RunService.Stepped:Connect(
    function()
        if Settings.Invis then
            pcall(
                function()
                    Player.Character.LowerTorso.Root:Destroy()
                    Player.Character.LowerTorso.CFrame =
                        game:GetService("Workspace").SpawnLocations.SpawnBox.SpawnLocation.CFrame
                end
            )
        end
    end
)

if not Workspace:FindFirstChild("Poop") then
    local Part = Instance.new("Part", Workspace)
    Part.Name = "Poop"
    Part.Size = Vector3.new(9e9, 0, 9e9)
    Part.Anchored = true
    Part.Transparency = 1
end 


local function NoClip()
    if identifyexecutor and identifyexecutor() ~= "Krnl" then
        Player.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(11)
    elseif identifyexecutor and identifyexecutor() == "Krnl" then
        for i, v in pairs(Player.Character:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
                v.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end
end
local function Loc(v)
    if Settings.Method == "Under" then
        Player.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * CFrame.new(0, -7, 0) * CFrame.Angles(90,0,0)
    end 
    if Settings.Method == "Above" then 
        Player.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * CFrame.new(0, 7, 0) * CFrame.Angles(-90,0,0)
    end 
    if Settings.Method == "Behind" then
        Player.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * CFrame.new(0, 0, 5) * CFrame.Angles(0,0,0)
    end 
    if Settings.Method == "Useless" then
        Player.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * CFrame.new(9e9, 9e9, 9e9) * CFrame.Angles(9e9,9e9,9e9)
    end 
end 
-- Egg saled
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}
    if not checkcaller() and (getnamecallmethod() == "SetPrimaryPartCFrame" or getnamecallmethod() == "Kick") and getcallingscript().Name == "Region" then
        return
    end
    return OldNameCall(self, unpack(Args))
end)

if Settings.Method == nil then
    Settings.Method = "Under"
end 
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Anime Story")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

local Toggle1 = Section1:CreateToggle("Anti Mod Hop", Settings.AutoHop, function(State)
    Settings.AutoHop = State
end)


local Toggle1 = Section1:CreateToggle("Auto Mob", Settings.AutoMob, function(State)
Settings.AutoMob = State
RunService.Stepped:Connect(
    function()
        pcall(
            function()
                if Settings.AutoMob then
                    NoClip()
                end
            end
        )
    end
)
spawn(
    function()
        while wait() and Settings.AutoMob and not Settings.AutoQuest do
            pcall(
                function()
                    if Player.PlayerGui.HUD.HUD.QuestFrame.QuestDescription.Visible then
                        for i, v in pairs(Workspace.Live:GetChildren()) do
                            if
                                v:IsA("Model") and v:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and
                                    v:FindFirstChild("DataFolder") and v.Name == Settings.Mob
                             then
                                Loc(v)
                                
                                Player.Backpack.PlayerControls.Attack:FireServer("M1")
                                if
                                    v:FindFirstChildWhichIsA("Humanoid").Health <
                                        v:FindFirstChildWhichIsA("Humanoid").MaxHealth and
                                        isnetworkowner and
                                        isnetworkowner(v.HumanoidRootPart)
                                 then
                                    v:FindFirstChildWhichIsA("Humanoid").Health = 0
                                end
                            end
                        end
                    end
                end
            )
        end
    end
)
end)





local Dropdown3 = Section1:CreateDropdown("Mobs", Mobs, function(Name)
    Settings.Mob = Name
end)

local Dropdown3 = Section1:CreateDropdown("Farm Method", {'Under',"Above","Behind","Useless"}, function(Name)
    Settings.Method = Name
end)


local Toggle1 = Section1:CreateToggle("Player Silent Aim", Settings.PlayerSilentAim, function(State)
Settings.PlayerSilentAim = State

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function ClosestPlayerToCurser()
    local MaxDistance, Closest = math.huge
    for i, v in pairs(Players.GetPlayers(Players)) do
        if v ~= LocalPlayer and v.Character then
            local H = v.Character.FindFirstChild(v.Character, "Head")
            if H then
                local Pos, Vis = workspace.CurrentCamera.WorldToScreenPoint(workspace.CurrentCamera, H.Position)
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


local OldIndex = nil
OldIndex =
    hookmetamethod(
    game,
    "__index",
    function(self, v, ...)
        if self == Mouse and (v == "Hit" or v == "Target") then
            if ClosestPlayerToCurser() and Settings.PlayerSilentAim then
                return ((v == "Hit" and ((ClosestPlayerToCurser().Character.Head.CFrame) or (ClosestPlayerToCurser().Character.Head.CFrame + (ClosestPlayerToCurser().Character.Head.Velocity)))) or
                    (v == "Target" and ClosestPlayerToCurser().Character.Head))
            end
        end

        return OldIndex(self, v)
    end
)
end)
local Toggle1 = Section1:CreateToggle("Mob Silent Aim", Settings.MobSilentAim, function(State)

Settings.MobSilentAim = State
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function ClosestMobToCurser()
    local MaxDistance, Closest = math.huge
    for i, v in pairs(Live:GetChildren()) do
        if v:IsA("Model")  then
            local H = v:FindFirstChild("Head")
            if H then
                local Pos, Vis = workspace.CurrentCamera:WorldToScreenPoint(H.Position)
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



local OldIndex = nil
OldIndex =
    hookmetamethod(
    game,
    "__index",
    function(self, v, ...)
        if self == Mouse and (v == "Hit" or v == "Target") then
            if ClosestMobToCurser() and Settings.MobSilentAim then
                return ((v == "Hit" and ((ClosestMobToCurser().Head.CFrame) or (ClosestMobToCurser().Head.CFrame + (ClosestMobToCurser().Head.Velocity)))) or
                    (v == "Target" and ClosestMobToCurser().Head))
            end
        end

        return OldIndex(self, v)
    end
)
end)

local Toggle1 = Section1:CreateToggle("Infinite Charge", Settings.Aut, function(State)
Settings.Aut = State
RunService.Stepped:Connect(function()
    pcall(function()
        if Settings.Aut then
            if Player.Character.CharacterState.Energy.Value + 1 <= Player.Character.CharacterState.EnergyMax.Value  then
                Player.Backpack.PlayerControls.Charge:FireServer("On")
            end 
        end 
    end)
end)
end)

local Toggle1 = Section1:CreateToggle("AutoQuest", Settings.AutoQuest, function(State)
Settings.AutoQuest = State
RunService.Stepped:Connect(function()
    pcall(function()
        if Settings.AutoQuest then
            NoClip()
        end 
    end)
end)
spawn(
    function()
        while wait() and Settings.AutoQuest do
            pcall(function()
            if Player.PlayerGui.HUD.HUD.QuestFrame.QuestDescription.Visible then
                for i, v in pairs(Workspace.Live:GetChildren()) do
                    if
                        v:IsA("Model")  and
                          v:FindFirstChild("DataFolder") and v.DataFolder:FindFirstChild("NPC_Quest") and v.DataFolder:FindFirstChild("NPC_Quest").Value == Player.PlayerGui.HUD.HUD.QuestFrame.QuestName.Text and v ~= nil
                     then
                        Loc(v)
                        Player.Backpack.PlayerControls.Attack:FireServer("M1")
                        if v:FindFirstChildWhichIsA("Humanoid").Health < v:FindFirstChildWhichIsA("Humanoid").MaxHealth then
                            v:FindFirstChildWhichIsA("Humanoid").Health = 0 
                        end 
                    end
                end
            elseif not Player.PlayerGui.HUD.HUD.QuestFrame.QuestDescription.Visible then
                for i, v in pairs(Workspace.Interactable.Quests.Repeatable:GetChildren()) do
                    if
                        v:IsA("Model") and v:FindFirstChildWhichIsA("ProximityPrompt") and
                            v.Head["Overhead_Info"].PlayerName.Text == (Settings.Quest)
                     then
                        Loc(v)
                        fireproximityprompt(v:FindFirstChildWhichIsA("ProximityPrompt"))
                    end
                end
            end
            end)
        end
    end
)

end)


local Dropdown3 = Section1:CreateDropdown("Quests", Quests, function(Name)
    Settings.Quest = Name
end)
local Toggle1 = Section1:CreateToggle("Auto Ore", Settings.Ore, function(State)
Settings.Ore = State
spawn(
    function()
        while wait() and Settings.Ore do
            pcall(
                function()
                    for i, v in pairs(Workspace.Interactable.Ores:GetChildren()) do
                        if v:IsA("Model") and v.Ores.Transparency ~= 1 then
                            Player.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * CFrame.new(0,5,0) wait(0.5)
                            fireproximityprompt(v.Rock.ProximityPrompt)
                        end
                    end
                end
            )
        end
    end
)
end)


local Toggle1 = Section1:CreateToggle("Auto Loot", Settings.items, function(State)
Settings.items = State
spawn(
    function()
        while wait() and Settings.items do
            pcall(
                function()
                    for i, v in pairs(game:GetService("Workspace").Loot:GetChildren()) do
                        if v:IsA("Model") then
                            Player.Character.HumanoidRootPart.CFrame = v:GetModelCFrame() * CFrame.new(0,1,0) wait(0.5)
                            fireproximityprompt(v.Main.ProximityPrompt)
                        end
                    end
                end
            )
        end
    end
)
end)

local Toggle1 = Section1:CreateToggle("Auto Summon", Settings.e, function(State)
Settings.e = State
spawn(
    function()
        while wait() and Settings.e do
            pcall(
                function()
                    if Player.DataFolder["Stats_Info"].Gems.Value >= 100 then
                        Player.Character.HumanoidRootPart.CFrame =
                            game:GetService("Workspace").Interactable.Shops.Summoner.Summoner.SummonInteract.CFrame *
                            CFrame.new(0, 1, 0)
                        wait(0.5)
                        fireproximityprompt(
                            game:GetService("Workspace").Interactable.Shops.Summoner.Summoner.SummonInteract.ProximityPrompt
                        )
                    end
                end
            )
        end
    end
)

end)




local Toggle1 = Section1:CreateToggle("Invis", Settings.Invis, function(State)
    Settings.Invis = State
end)

local Toggle1 = Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
Settings.Go = State
RunService.Stepped:connect(
    function()
        if Settings.Go then
            Player.Character:WaitForChild("Humanoid").WalkSpeed = Settings.WalkSpeed
            Player.Character:WaitForChild("Humanoid").JumpPower = Settings.JumpPower
            if not UserInputService.WindowFocusReleased then
                setfpscap(Settings.Fps)
            end
        end
    end
)

end)

local TextBox1 = Section2:CreateTextBox("Fps Cap", "Only numbers", true, function(Value)
    Settings.Fps = Value
end)

local TextBox1 = Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)
    Settings.WalkSpeed = Value
end)
local TextBox1 = Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)
    Settings.JumpPower = Value
end)

local TextBox1 = Section2:CreateTextBox("Seconds Until ServerHop", "Only numbers", true, function(Value)
    Settings.Seconds = Value
end)



local Toggle1 = Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
Settings.InfiniteJump = State
UserInputService.JumpRequest:connect(
    function()
        if Settings.InfiniteJump then
            game:GetService "Players".LocalPlayer.Character:FindFirstChildOfClass "Humanoid":ChangeState("Jumping")
        end
    end
)
end)

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()
local Toggle1 = Section1:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State
    ESP:Toggle(Settings.Esp)
end)
local Toggle1 = Section1:CreateToggle("PLayer Esp", Settings.PlayerEsp, function(State)
    Settings.PlayerEsp = State
    ESP.Players = Settings.PlayerEsp
end)
local Toggle1 = Section1:CreateToggle("Tracers Esp", Settings.Tracers, function(State)
    Settings.Tracers = State
    ESP.Tracers = Settings.Tracers
end)
local Toggle1 = Section1:CreateToggle("Name Esp", Settings.EspNames, function(State)
    ESP.Names = Settings.EspNames
    Settings.EspNames = State
end)
local Toggle1 = Section1:CreateToggle("Boxes Esp", Settings.Boxes, function(State)
    Settings.Boxes = State
    ESP.Boxes = Settings.Boxes
end)

local Toggle1 = Section2:CreateToggle("Invisicam", Settings.Sorry, function(State)
Settings.Sorry = State
if Settings.Sorry then
    Player.DevCameraOcclusionMode = "Invisicam"
else
    Player.DevCameraOcclusionMode = "Zoom"
end
end)


local Toggle1 = Section2:CreateToggle("N Noclip", Settings.Sex1, function(State)
noclips = false
Settings.Sex1 = State
Player:GetMouse().KeyDown:connect(
    function(v)
        if v == "n" then
            if Settings.Sex1 then
                noclips = not noclips
                for i, v in pairs(Player.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end
    end
)
RunService.Stepped:connect(
    function()
        if noclips then
            for i, v in pairs(Player.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end
)

end)

local Toggle1 = Section2:CreateToggle("G Noclip", Settings.Sex, function(State)
Settings.Sex = State
noclip = false
RunService.Stepped:connect(
    function()
        if noclip then
            Player.Character.Humanoid:ChangeState(11)
        end
    end
)
mouse = Player:GetMouse()
Player:GetMouse().KeyDown:connect(
    function(v)
        if v == "g" then
            if Settings.Sex then
                noclip = not noclip
                Player.Character.Humanoid:ChangeState(11)
            end
        end
    end
)
end)
local Toggle1 = Section2:CreateToggle("H Fly", Settings.Sex2, function(State)
Settings.Sex2 = State
local Max = 0
local Players = game.Players
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
Mouse.KeyDown:connect(
    function(k)
        if k:lower() == "h" then
            Max = Max + 1
            getgenv().Fly = false
            if Settings.Sex2 then
                local T =  LP.Character:FindFirstChildWhichIsA("Humanoid").RigType == Enum.HumanoidRigType.R6 and LP.Character:FindFirstChild("HumanoidRootPart") or LP.Character:FindFirstChildWhichIsA("Humanoid").RigType == Enum.HumanoidRigType.R15 and LP.Character:FindFirstChild("UpperTorso")
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
                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                    BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
                    spawn(
                        function()
                            repeat
                                wait()
                                LP.Character.Humanoid.PlatformStand = true
                                if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
                                    SPEED = 200
                                elseif not (S.L + S.R ~= 0 or S.F + S.B ~= 0) and SPEED ~= 0 then
                                    SPEED = 0
                                end
                                if (S.L + S.R) ~= 0 or (S.F + S.B) ~= 0 then
                                    BodyVelocity.velocity =
                                        ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (S.F + S.B)) +
                                        ((game.Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S.L + S.R, (S.F + S.B) * 0.2, 0).p) -
                                            game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                    S2 = {
                                        F = S.F,
                                        B = S.B,
                                        L = S.L,
                                        R = S.R
                                    }
                                elseif (S.L + S.R) == 0 and (S.F + S.B) == 0 and SPEED ~= 0 then
                                    BodyVelocity.velocity =
                                        ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (S2.F + S2.B)) +
                                        ((game.Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S2.L + S2.R, (S2.F + S2.B) * 0.2, 0).p) -
                                            game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                else
                                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                                end
                                BodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame
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
local Toggle1 = Section2:CreateToggle("AutoServerHop", Settings.ServerHop, function(State)
Settings.ServerHop = State
spawn(function()
while Settings.ServerHop do wait(Settings.Seconds)
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = HttpService:JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, Player)
                end)
                wait(4)
            end
        end
    end
end

function Tween()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Tween() after it collected everything.
Tween() 
end 
end)
end)
local Button1 = Section2:CreateButton("Anti Lag", function()
for _, v in pairs(Workspace:GetDescendants()) do
    if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
        v.Material = Enum.Material.SmoothPlastic
        if v:IsA("Texture") then
            v:Destroy()
        end
    end
end
end)

local Button1 = Section2:CreateButton("Teleport to RandomPlayer", function()
local randomPlayer = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]

Player.Character.HumanoidRootPart.CFrame =
    CFrame.new(
    Vector3.new(
        randomPlayer.Character.Head.Position.X,
        randomPlayer.Character.Head.Position.Y,
        randomPlayer.Character.Head.Position.Z
    )
)
end)
local Button1 = Section2:CreateButton("Lag Switch F3", function()
local ass = false
local bitch = settings()

game:service "UserInputService".InputEnded:connect(
    function(i)
        if i.KeyCode == Enum.KeyCode.F3 then
            ass = not ass
            bitch.Network.IncomingReplicationLag = ass and 10 or 0
        end
    end
)
end) 

local Button1 = Section2:CreateButton("ServerHop", function()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = HttpService:JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, Player)
                end)
                wait(4)
            end
        end
    end
end

function Tween()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Tween() after it collected everything.
Tween() 
end)
local Button1 = Section2:CreateButton("Rejoin", function()
game:GetService("TeleportService"):Teleport(game.PlaceId, Player) end)


local Button1 = Section2:CreateButton("Save Settings", function()
Save()
end)
local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)
Section3:CreateLabel("Credits DekuDimz#7960")
Section3:CreateLabel("Credits AlexR32#3232 Ui")
Section3:CreateLabel("Credits IY")
local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)
