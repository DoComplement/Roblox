-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/Project-XXL"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=10320676839 or nil~=getgenv()["5-Wmsg7L6Mrl7a`R7N$Pdb:n5`O^eY+v"])then return end;
getgenv()["5-Wmsg7L6Mrl7a`R7N$Pdb:n5`O^eY+v"] = true;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}
repeat
    wait()
until game:IsLoaded()
wait()

local Players = Get.Players
local ReplicatedStorage = Get.ReplicatedStorage
local Workspace = Get.Workspace
local VirtualUser = Get.VirtualUser 
local HttpService = Get.HttpService 
local VirtualInputManager = Get.VirtualInputManager
local HttpService = Get.HttpService
local TweenService = Get.TweenService 
local TeleportService = Get.TeleportService
local RunService = Get.RunService
local MarketplaceService = Get.MarketplaceService

local Player = Players.LocalPlayer
local Live = Workspace.Live
local Protest = ReplicatedStorage.Quests
local Markers = Workspace.QuestMarkers
local PlayerValues = Player.PlayerValues
local Chests = Workspace.Chests
local wait = task.wait 
local spawn = task.spawn

        
Players.LocalPlayer.Idled:connect(
    function()
        game:GetService("VirtualUser"):ClickButton2(Vector2.new())
    end
)
for i,v in pairs(getconnections(Player.Idled)) do 
    v:Disable()
end 

local Name = "Ihateit.json"

local Des = {}
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
    writefile("V.G Hub//" .. Name, game:GetService("HttpService"):JSONEncode(Des))
end

Settings = game:GetService("HttpService"):JSONDecode(readfile("V.G Hub//" .. Name))

local function Save()
    writefile("V.G Hub//" .. Name, game:GetService("HttpService"):JSONEncode(Settings))
end
spawn = task.spawn
wait = task.wait


Player.CharacterAdded:Connect(
    function()
        wait(1)
        Player.Character = Player.Character
    end
)
local Message = function(A, B, C)
    if messagebox then
        messagebox(B, A, 0x10)
    end
    return A, B, C
end

local Teleport = function(A, B, C)
    if C then
        A.CFrame = B
    end
end
local Rough = function()
    repeat wait() until Player:FindFirstChild("Menu",true) and Player:WaitForChild("Backpack"):FindFirstChildWhichIsA("Tool",true)
end
RunService.Stepped:connect(function()
    pcall(function()
        if Player.Character.Head:FindFirstChild("Overhead",true) and not Settings.HideName then
            Player.Character.Head.Overhead:destroy()
        end
        Workspace.FallenPartsDestroyHeight = 0 / 0
        sethiddenproperty(Player, "SimulationRadius", 1000)
    end)
end)

local function Float(v)
    if v:FindFirstChild("BodyForce",true) then
        return
    end
    local BodyForce = Instance.new("BodyForce")
    BodyForce.Force = v:GetMass() * Vector3.new(0, Workspace.Gravity, 0)
    BodyForce.Parent = v
end

RunService.Stepped:connect(
    function()
        pcall(
            function()
                if Player.Character.Head:FindFirstChild("Overhead",true) and not Settings.HideName then
                    Player.Character.Head.Overhead:destroy()
                end
            end
        )
    end
)
for i, v in pairs(Workspace.NPCS:GetChildren()) do
    if v:IsA("Model") and v:FindFirstChild("Humanoid") then
        v.Chat.QuestText1.Value = MarketplaceService:GetProductInfo(game.PlaceId).Name .. " Thanks you for using V.G Hub"
    end
end


local Quests = {}
for i, v in pairs(Protest:GetChildren()) do
    table.insert(Quests, v.Name)
end
local code = {}
for i, v in pairs(Player.Codes:GetChildren()) do
    table.insert(code, v.Name)
end
local Shop = {}
for i, v in pairs(Workspace.Shop:GetChildren()) do
    table.insert(Shop, v.Name)
end
local Mobs = {}
for i, v in pairs(Live:GetChildren()) do
table.insert(Mobs, v.Name)
end
local VVV = {}
for i, v in pairs(Markers:GetChildren()) do
    table.insert(VVV, v.Name)
end
local Hentai = {}
for i, v in pairs(Live:GetChildren()) do
    if
        v:FindFirstChild("Humanoid") and v:FindFirstChild("Quest") and v:FindFirstChild("Drops") and
            v.Name ~= "Thug (lvl. 5)"
     then
        table.insert(Hentai, v.Name)
    end
end
local system = {}
for i, v in pairs(Live:GetChildren()) do
    if
        v:FindFirstChild("Humanoid") and v:FindFirstChild("Quest") and not table.find(Hentai, v.Name) and
            not table.find(system, v.Name)
     then
        table.insert(system, v.Name)
    end
end

local function Tween(A, B, C)
    if A and B then
        local Time = (B - A.Position).magnitude / C
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = game:GetService("TweenService"):Create(A, Info, {CFrame = CFrame.new(B.X, B.Y, B.Z)})
        Tween:Play()
        wait(Time)
    end
end
function c()
    for i, v in pairs(Player:WaitForChild("Backpack"):GetChildren()) do
        if v.ClassName == "Tool" and v:FindFirstChild("Combat Script") then
            wait(0.001)
            Player.Character:WaitForChild("Humanoid"):EquipTool(v)
        end
    end
end

local Message = function(A, B, C)
    messagebox(B, A, 0x10)
    return A, B, C
end

local Part = Instance.new("Part", Workspace)
Part.Name = "poopy"
Part.Size = Vector3.new(9e9, 0, 9e9)
Part.Anchored = true
Part.Transparency = 1

local uu = 75
getgenv().delay2 = 0.03
getgenv().delay = 1
getgenv().name = "MagicMan1240"
getgenv().aa = 0
Settings.Amount = 10


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Anime Rifts")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")


local Toggle1 = Section1:CreateToggle("Auto Attack", Settings.AutoAttack, function(State)
Settings.AutoAttack = State

spawn(
    function()
        while Settings.AutoAttack do
            wait(delay2)
            ReplicatedStorage.RemoteEvents.BladeCombatRemote:FireServer(false, nil, nil)
        end
    end
)

end)
local Toggle1 = Section1:CreateToggle("Auto Skills", Settings.AutoSkills, function(State)
Settings.AutoSkills = State
spawn(
    function()
        while Settings.AutoSkills do
            for i, v in pairs({"E", "R", "C", "X", "Y", "V", "Z"}) do
                wait(delay2)
                VirtualInputManager:SendKeyEvent(true, v, false, game)
            end
        end
    end
)
end)

local Toggle1 = Section1:CreateToggle("Auto Chests", Settings.Auw, function(State)
Settings.Auw = State
spawn(function()
    while wait() and Settings.Auw do
        pcall(function()
            for i,v in pairs(Chests:GetChildren()) do
                if v:IsA("BasePart") and v.Transparency == 0 then
                    Player.Character:FindFirstChild("HumanoidRootPart", true).CFrame = v.CFrame
                end 
            end 
        end)
    end 
end)
end)

local Toggle1 = Section1:CreateToggle("Auto Fruits", Settings.Auw, function(State)
Settings.Aud = State
spawn(function()
    while wait() and Settings.Aud do 
        pcall(function()
            if Workspace:FindFirstChildWhichIsA("Tool", true) then
                firetouchinterest(Player.Character.HumanoidRootPart, Workspace:FindFirstChildWhichIsA("Tool", true).Handle, 0)
            end 
        end)
    end 
end)
end)
local Toggle1 = Section1:CreateToggle("Dont HideName", Settings.HideName, function(State)
    Settings.HideName = State
end)

local Toggle1 = Section1:CreateToggle("Auto Mob", Settings.AutoA, function(State)
Settings.AutoA = State
RunService.Stepped:connect(function()
   
        if Settings.AutoA then
            for i,v in pairs(Player.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                    v.Velocity = Vector3.new(0,0,0)
                end 
            end 
        end
    
end)
spawn(function()
    while wait(0.1) and Settings.AutoA do 
        pcall(function()
            for i,v in pairs(Live:GetChildren()) do
                if v:IsA("Model") and v.Name == Settings.Mo then
                    if v:FindFirstChild("HumanoidRootPart") then
                        local Humanoid = v:FindFirstChildWhichIsA("Humanoid",true)
                        if Humanoid.Health ~= 0 then
                            Player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, -15, 0) * CFrame.Angles(0, 0, 0)
                            ReplicatedStorage.RemoteEvents.BladeCombatRemote:FireServer(false, Vector3.new(v.HumanoidRootPart.Position),CFrame.new(v.HumanoidRootPart.Position))
                            if Player.Backpack:FindFirstChild("Combat",true) then
                                Player.Character:FindFirstChild("Humanoid",true):EquipTool(Player.Backpack:FindFirstChild("Combat",true))
                            end 
                        end 
                    end 
                end 
            end 
        end)
    end 
end)
end)


local Dropdown1 = Section1:CreateDropdown("Mobs", system, function(String)
	Settings.Mo = String
end)

local Toggle1 = Section1:CreateToggle("Player Silent Aim", Settings.PlayerSilentAim, function(State)
Settings.PlayerSilentAim = State

local Players = Players
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function ClosestPlayerToCurser()
    local MaxDistance, Closest = math.huge
    for i, v in pairs(Players.GetPlayers(Players)) do
        if v ~= LocalPlayer and v.Player.Character then
            local H = v.Player.Character.FindFirstChild(v.Player.Character, "Head")
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


local OldIndex = nil
OldIndex =
    hookmetamethod(
    game,
    "__index",
    function(self, v, ...)
        if self == Mouse and (v == "Hit" or v == "Target") then
            if ClosestPlayerToCurser() and Settings.PlayerSilentAim then
                return ((v == "Hit" and ((ClosestPlayerToCurser().Player.Character.Head.CFrame) or (ClosestPlayerToCurser().Player.Character.Head.CFrame + (ClosestPlayerToCurser().Player.Character.Head.Velocity)))) or
                    (v == "Target" and ClosestPlayerToCurser().Player.Character.Head))
            end
        end

        return OldIndex(self, v)
    end
)
end)
local Toggle1 = Section1:CreateToggle("Mob Silent Aim", Settings.MobSilentAim, function(State)

Settings.MobSilentAim = State
local Players = Players
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function ClosestMobToCurser()
    local MaxDistance, Closest = math.huge
    for i, v in pairs(Live:GetChildren()) do
        if v:IsA("Model")  then
            local H = v:FindFirstChild("Head")
            if H then
                local Pos, Vis = Workspace.CurrentCamera:WorldToScreenPoint(H.Position)
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

local Toggle1 = Section1:CreateToggle("Player Godmode", Settings.PlayerGodMode, function(State)
Settings.PlayerGodMode = State
spawn(
    function()
        while Settings.PlayerGodMode do
            wait(getgenv().delay2)
            pcall(
                function()
                    if PlayerValues.PassiveMode.Value == false then
                        firetouchinterest(
                            Player.Character.HumanoidRootPart,
                            Workspace.GameStuff.EternalHorrorBrolyTeleporter.TeleportPart,
                            0
                        )
                        for i = 1, 10 do wait(0.1)
                            wait(getgenv().delay2)
                            Teleport(Player.Character.HumanoidRootPart,Workspace.SafeZoneIndicator.CFrame,true)
                        end
                    end
                    if not Settings.PlayerGodMode then
                        Player.Character.Humanoid.Health = 0
                    end
                end
            )
        end
    end
)

end)


local Toggle1 = Section1:CreateToggle("NPC Semi Godmode", Settings.SemiGodMode, function(State)
Settings.SemiGodMode = State
spawn(
    function()
        while Settings.SemiGodMode do
            wait(getgenv().delay2)
                pcall(function()
                    if Settings.SemiGodMode then
                        if Player.Character:FindFirstChild("Player") then
                            Player.Character:WaitForChild("Player"):remove()
                        end
                    end
                    if not Settings.SemiGodMode then
                        Player.Character.Humanoid.Health = 0
                    end
            end)
        end
    end
)
end)

local Toggle1 = Section1:CreateToggle("Auto Start Quest", Settings.StartQuest, function(State)
Settings.StartQuest = State
spawn(
    function()
        while Settings.StartQuest do
            wait(delay2)
            pcall(
                function()
                    Rough()
                    local Quest = Player:WaitForChild("PlayerGui"):WaitForChild("Menu"):WaitForChild("QuestFrame")
                    if Quest.Visible == false then
                        ReplicatedStorage.RemoteEvents.ChangeQuestRemote:FireServer(
                            Protest:FindFirstChild(Settings.Quest)
                        )
                    end
                end
            )
        end
    end
)

end)


local Dropdown1 = Section1:CreateDropdown("Quests", Quests, function(String)
	Settings.Quest = String
end)






local Toggle1 = Section1:CreateToggle("No CooldownReduction", Settings.CooldownReduction, function(State)
Settings.CooldownReduction = State
spawn(function()
while wait(delay2) do
    wait(delay2)
    if Settings.CooldownReduction then
        PlayerValues.CooldownReduction.Value = -9e9
    else
        PlayerValues.CooldownReduction.Value = 1
    end
end
end)
end)
Toggle1:AddToolTip("Makes Abilitys have no anmation Cooldown")

local Button1 = Section1:CreateButton("Anti Effects", function()
pcall(
    function()
        game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "Effects Gone",
                Text = "Try one of your gay ugly weak moves unless you use *** then u cool"
            }
        )
        Workspace.Effects:remove()
    end
)
end)




local Button1 = Section1:CreateButton("Time waits for noone.", function()
    local Cooldown; Cooldown = hookfunction(wait, function(v)
        v = 0;
        return Cooldown(v);
    end);
end)


local Toggle1 = Section1:CreateToggle("InstantKill", Settings.InstantKill, function(State)
Settings.InstantKill = State
spawn(
    function()
        while Settings.InstantKill do
            wait(delay2)
            pcall(
                function()
                    for i, v in pairs(Live:GetChildren()) do
                        if
                            v:FindFirstChild("Humanoid") and v.Humanoid.Health ~= 0 and
                                v.Humanoid.Health < v.Humanoid.MaxHealth
                         then
                            v.Humanoid.Health = 0
                        end
                    end
                end
            )
        end
        if Settings.InstantKill then
            game.StarterGui:SetCore(
                "SendNotification",
                {
                    Title = "if it dosen't work",
                    Text = "Minmize the roblox tab and then reopen it should work again"
                }
            )
        end
    end
)
end)


Section1:CreateTextBox("Fast Trade", "UserName Here", false, function(String)
for i, v in pairs(Players:GetPlayers()) do
    if
        string.find(v.Name, String) or v.Name:lower():match(String) or v.Name:upper():match(String) or
            string.find(v.DisplayName, String) or
            v.DisplayName:lower():match(String) or
            v.DisplayName:upper():match(String)
     then
        ReplicatedStorage.RemoteEvents.CommandsRemote:FireServer("!trade " .. tostring(v))
    end
end
end)


Section1:CreateTextBox("Fast GiveItem", "UserName Here", false, function(String)
for i, v in pairs(Players:GetPlayers()) do
    if
        string.find(v.Name, String) or v.Name:lower():match(String) or v.Name:upper():match(String) or
            string.find(v.DisplayName, String) or
            v.DisplayName:lower():match(String) or
            v.DisplayName:upper():match(String)
     then
        ReplicatedStorage.RemoteEvents.CommandsRemote:FireServer("!giveitem " .. tostring(v))
    end
end

end)
                
local Toggle1 = Section1:CreateToggle("Stun All Mobs", Settings.StunMobs, function(State)
Settings.StunMobs = State
spawn(
    function()
        while wait(2) do
            pcall(
                function()
                    if Settings.StunMobs then
                        for i, v in pairs(Live:GetChildren()) do
                            if v:FindFirstChild("Humanoid") then
                                v.Humanoid.PlatformStand = true
                            end
                        end
                    end
                end
            )
        end
    end
)

end)


getgenv().magss = 100
local Toggle1 = Section1:CreateToggle("Auto Bring Mob", Settings.Bring, function(State)
Settings.Bring = State
spawn(
    function()
        while Settings.Bring do
            wait(0.5)
            pcall(
                function()
                    for i, v in ipairs(Live:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v.Name ~= "Training dummy" and v.Humanoid.Health > 0 then
                            local Root = Player.Character.HumanoidRootPart
                            local RootTwo = v.HumanoidRootPart
                            if (Root.Position - RootTwo.Position).Magnitude < getgenv().magss then
                                Tween(v.HumanoidRootPart, Player.Character.HumanoidRootPart.CFrame.p, 100)
                                ReplicatedStorage.RemoteEvents.BladeCombatRemote:FireServer(false, nil, nil)
                                ReplicatedStorage.RemoteEvents.BladeCombatRemote:FireServer(false, nil, nil)
                                ReplicatedStorage.RemoteEvents.BladeCombatRemote:FireServer(false, nil, nil)
                            end
                        end
                    end
                end
            )
        end
    end
)

end)


Section1:CreateTextBox("Print Players Info", "UserName Here", false, function(String)
for i, v in pairs(Players:GetPlayers()) do
    if
        string.find(v.Name, String) or v.Name:lower():match(String) or v.Name:upper():match(String) or
            string.find(v.DisplayName, String) or
            v.DisplayName:lower():match(String) or
            v.DisplayName:upper():match(String)
     then
        print("Gold " .. Players[v.Name].PlayerValues.Gold.Value)
        print(
            "Ability1 - " ..
                Players[v.Name].PlayerValues.Ability.Value ..
                    " " ..
                        Players[v.Name].PlayerValues.Trait.Value ..
                            " " .. Players[v.Name].PlayerValues.Class.Value
        )
        print(
            "Ability2 - " ..
                Players[v.Name].PlayerValues.Ability2.Value ..
                    " " ..
                        Players[v.Name].PlayerValues.Trait2.Value ..
                            " " .. Players[v.Name].PlayerValues.Class2.Value
        )
    end
end
end)

Section1:CreateTextBox("Blurt Players Info", "UserName Here", false, function(String)
for i, v in pairs(Players:GetPlayers()) do
    if
        string.find(v.Name, String) or v.Name:lower():match(String) or v.Name:upper():match(String) or
            string.find(v.DisplayName, String) or
            v.DisplayName:lower():match(String) or
            v.DisplayName:upper():match(String)
     then
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
            "First Ability They have Equiped is " ..
                (Players[v.Name].PlayerValues.Ability.Value ..
                    " " ..
                        Players[v.Name].PlayerValues.Trait.Value ..
                            " " .. Players[v.Name].PlayerValues.Class.Value),
            "All"
        )
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
            "Second Ability They have Equiped is " ..
                (Players[v.Name].PlayerValues.Ability2.Value ..
                    " " ..
                        Players[v.Name].PlayerValues.Trait2.Value ..
                            " " .. Players[v.Name].PlayerValues.Class2.Value),
            "All"
        )
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v.Name .. " is there user", "All")
    end
end
end)

local Toggle1 = Section2:CreateToggle("AutoKeyPress E", Settings.E, function(State)
Settings.E = State
spawn(
    function()
        while Settings.E do
            wait(delay2)
            VirtualInputManager:SendKeyEvent(true, "E", false, uwu)
        end
    end
)
end)

local Toggle1 = Section2:CreateToggle("AutoKeyPress R", Settings.R, function(State)
Settings.R = State
spawn(
    function()
        while Settings.R do
            wait(delay2)
            VirtualInputManager:SendKeyEvent(true, "R", false, uwu)
        end
    end
)
end)

local Toggle1 = Section2:CreateToggle("AutoKeyPress X", Settings.X, function(State)
Settings.X = State
spawn(
    function()
        while Settings.X do
            wait(delay2)
            VirtualInputManager:SendKeyEvent(true, "X", false, uwu)
        end
    end
)
end)

local Toggle1 = Section2:CreateToggle("AutoKeyPress C", Settings.C, function(State)
Settings.C = State
spawn(
    function()
        while Settings.C do
            wait(delay2)
            VirtualInputManager:SendKeyEvent(true, "C", false, uwu)
        end
    end
)

end)

local Toggle1 = Section2:CreateToggle("AutoKeyPress Y", Settings.Y, function(State)
Settings.Y = State
spawn(
    function()
        while Settings.Y do
            wait(delay2)
            VirtualInputManager:SendKeyEvent(true, "Y", false, uwu)
        end
    end
)

end)

local Toggle1 = Section2:CreateToggle("AutoKeyPress V", Settings.V, function(State)
Settings.V = State
spawn(
    function()
        while Settings.V do
            wait(delay2)
            VirtualInputManager:SendKeyEvent(true, "V", false, uwu)
        end
    end
)
end)

local Toggle1 = Section2:CreateToggle("AutoKeyPress T", Settings.T, function(State)
Settings.T = State
spawn(
    function()
        while Settings.T do
            wait(delay2)
            VirtualInputManager:SendKeyEvent(true, "T", false, uwu)
        end
    end
)
end)


local Toggle1 = Section2:CreateToggle("Streamer Mode", Settings.Name, function(State)
Settings.Name = State
Settings.FakeName = "OkButWhoAsked"
for i, v in next, game:GetDescendants() do
    pcall(
        function()
            if v.ClassName == "TextLabel" and Settings.Name then
                if string.find(v.Text, Player.Name) then
                    v.Text = v.Text:gsub(Player.Name, Settings.FakeName)
                end
                v:GetPropertyChangedSignal("Text"):Connect(
                    function()
                        v.Text = v.Text:gsub(Player.Name, Settings.FakeName)
                    end
                )
            end
        end
    )
end

game.DescendantAdded:Connect(
    function(v)
        pcall(
            function()
                if v.ClassName == "TextLabel" and Settings.Name then
                    v:GetPropertyChangedSignal("Text"):Connect(
                        function()
                            v.Text = v.Text:gsub(Player.Name, Settings.FakeName)
                        end
                    )
                    if string.find(v.Text, Player.Name) then
                        v.Text = v.Text:gsub(Player.Name, Settings.FakeName)
                    end
                end
            end
        )
    end
)
end)



local Button1 = Section1:CreateButton("Make Money Anoucement", function()
if Settings.MakeItRain == true then
ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("This Cash Grab Was Sponsored By V.G Hub","All")
end
end)
local Toggle1 = Section1:CreateToggle("Make It Rain Cash", Settings.MakeItRain, function(State)
Settings.MakeItRain = State
Settings.MakeItRain = State
spawn(
    function()
        while wait(delay2) and Settings.MakeItRain do
            pcall(
                function()
                    for i, v in pairs(game.Players:GetPlayers()) do
                        if v ~= Player then
                            ReplicatedStorage.RemoteEvents.CommandsRemote:FireServer(
                                "!pay " .. v.Name .. " " .. Settings.Amount
                            )
                        end
                    end
                end
            )
        end
    end
)
end)

Toggle1:AddToolTip("Warning this uses your cash use it wisely")
local Slider2 = Section1:CreateSlider("Giving Money Amount", 0,1000,nil,false, function(Value)
    Settings.Amount = Value
end)

local Toggle1 = Section1:CreateToggle("Anti Leveling", nil, function(State)
Settings.AntiLeveling = State
local OldNameCall = nil
OldNameCall =
    hookmetamethod(
    game,
    "__namecall",
    function(...)
        local Args = {...}
        local Self = Args[1]
        if getnamecallmethod() == "FireServer" and tostring(Self) == "LevelingRemote" and Settings.AntiLeveling then
            return nil
        end
        return OldNameCall(...)
    end
)
end)
Toggle1:AddToolTip("Makes you not able to level up")


local Slider2 = Section1:CreateSlider("Attack Distance", 0,300,nil,false, function(Value)
uu = Value
end)
local Slider2 = Section1:CreateSlider("AutoFarm Speed", 0,7,nil,false, function(Value)
delay2 = Value
end)
local Slider2 = Section1:CreateSlider("Bring Radius", 0,1000,nil,false, function(Value)
getgenv().magss = Value
end)

local Slider2 = Section1:CreateSlider("Attack Angle", 0,360,nil,false, function(Value)
aa = Value
end)

local Button1 = Section1:CreateButton("Redeem Selected Code", function()
ReplicatedStorage.RemoteEvents.CodeRemote:FireServer(code)
end)

local Dropdown1 = Section1:CreateDropdown("Codes", code, function(String)
	code = String
end)
local Button1 = Section1:CreateButton("Redeem All Codes", function()
for i, v in pairs(Player.Codes:GetDescendants()) do
    ReplicatedStorage.RemoteEvents.CodeRemote:FireServer(v.Name)
end
end)

local words = {"V.G Hub Best","Autofarming with V.G hub makes this game ten times easier","DekuDimz is so cool fast updates ez",'V.G Hub has the only working godmode','im pround to be using V.G Hub OwO','why are you just standing around get yourself V.G hub its free dude','Honestly if your not using godmode your a dork','Random messging is funny','i have auto chat enabled LOL',
'V.G Hub Winning','V.G Hub on Top'
}

local Toggle1 = Section2:CreateToggle("SS Jump Mobs", Settings.UU, function(State)
Settings.UU = State
spawn(
    function()
        while Settings.UU do
            pcall(
                function()
                    wait(1)
                    for i, v in pairs(Live:GetChildren()) do
                        if v:IsA("Model") then
                            v.Humanoid.Jump = true
                        end
                    end
                end
            )
        end
    end
)
end)



local Toggle1 = Section2:CreateToggle("SS Float Mobs", nil, function(State)
Settings.Go = State

for i, v in ipairs(Live:GetChildren()) do
    if v:IsA("Model") then
        if Settings.Go then
            for i, v in ipairs(v:GetChildren()) do
                if v:IsA("BasePart") and v.Anchored == false then
                    Float(v)
                elseif v:IsA("Humanoid") then
                    v.PlatformStand = true
                end
            end
        end
    end
end

Live.ChildAdded:Connect(
    function()
        for i, v in ipairs(Live:GetChildren()) do
            if v:IsA("Model") then
                if Settings.Go then
                    for i, v in ipairs(v:GetChildren()) do
                        if v:IsA("BasePart") and v.Anchored == false then
                            Float(v)
                        elseif v:IsA("Humanoid") then
                            v.PlatformStand = true
                        end
                    end
                end
            end
        end
    end
)
end)
local Toggle1 = Section2:CreateToggle("SS Sit Mobs", Settings.UU1, function(State)
Settings.UU1 = State
spawn(
    function()
        while Settings.UU1 do
            pcall(
                function()
                    wait(1)
                    for i, v in pairs(Live:GetChildren()) do
                        if v:IsA("Model") then
                            v.Humanoid.Sit = true
                        end
                    end
                end
            )
        end
    end
)

end)

local Toggle1 = Section2:CreateToggle("Spam Chat", nil, function(State)
Settings.Spam = State
spawn(
    function()
        while Settings.Spam do
            wait(5)
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                words[math.random(#words)],
                "All"
            )
        end
    end
)
end)

local Toggle1 = Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
Settings.Go = State
RunService.Stepped:connect(
    function()
        pcall(function()
            if Settings.Go then
                Player.Character:WaitForChild("Humanoid").WalkSpeed = Settings.WalkSpeed
       	        if Player.Character:FindFirstChildOfClass('Humanoid').UseJumpPower then
			        Player.Character:WaitForChild('Humanoid').JumpPower = Settings.JumpPower
		        else
			        Player.Character:WaitForChild('Humanoid').JumpHeight  = Settings.JumpPower
			    end 
                if not game:GetService("UserInputService").WindowFocusReleased then
                    setfpscap(Settings.Fps)
                end
            end
        end)
    end
)

end)

Section2:CreateTextBox("Teleport To Player", "UserName Here", false, function(String)
for i, v in pairs(Players:GetPlayers()) do
    if
        string.find(v.Name, String) or v.Name:lower():match(String) or v.Name:upper():match(String) or
            string.find(v.DisplayName, String) or
            v.DisplayName:lower():match(String) or
            v.DisplayName:upper():match(String)
     then
        Teleport(Player.Character.HumanoidRootPart,v.Player.Character.HumanoidRootPart.CFrame,true)
    end
end

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



local Toggle1 = Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
Settings.InfiniteJump = State
game:GetService("UserInputService").JumpRequest:connect(
    function()
        if Settings.InfiniteJump then
            Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
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
                        pcall(function()
                        v.CanCollide = false
                        end)
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
                    pcall(function()
                    v.CanCollide = false
                    end)
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
                local T = LP.Player.Character.Torso
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
                                wait(delay2)
                                LP.Player.Character.Humanoid.PlatformStand = false
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
                            LP.Player.Character.Humanoid.PlatformStand = false
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

game:GetService("UserInputService").InputEnded:connect(
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
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
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
                wait(delay2)
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait(delay2)
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, Player)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait(delay2) do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport() 
end)
local Button1 = Section2:CreateButton("Rejoin", function()
game:GetService("TeleportService"):Teleport(game.PlaceId, Player) end)



local Button1 = Section1:CreateButton("???", function()
while wait(delay2) do
    pcall(
        function()
            for i, v in pairs(Player.PlayerGui.Menu:GetChildren()) do
                if v:IsA("TextLabel") then
                    v.Text = game:GetService("HttpService"):GenerateGUID(false)
                elseif v.ClassName ~= "TextLabel" then
                    for i, v in pairs(v:GetChildren()) do
                        if v:IsA("TextLabel") then
                            v.Text = game:GetService("HttpService"):GenerateGUID(false)
                        elseif v.ClassName ~= "TextLabel" then
                            for i, v in pairs(v:GetChildren()) do
                                if v:IsA("TextLabel") then
                                    v.Text = game:GetService("HttpService"):GenerateGUID(false)
                                end
                            end
                        end
                    end
                end
            end
        end
    )
end
end)
local Button1 = Section1:CreateButton("???", function()
while wait(delay2) do
for i,v in pairs(Workspace.NPCS:GetChildren()) do
if v:IsA("Model") and v:FindFirstChild("Humanoid") then
v.Name = game:GetService("HttpService"):GenerateGUID(false)
end end 
for i,v in pairs(Live:GetChildren()) do
if v:IsA("Model") and v:FindFirstChild("Humanoid") then
v.Name = game:GetService("HttpService"):GenerateGUID(false)
end end 
end
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
Section3:CreateLabel("Credits The3Bakers")
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
spawn(function()
while wait(delay2) do
Save()
end end)
