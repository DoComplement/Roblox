
-- "https://raw.githubusercontent.com/1201for/V.G-Hub-Part-3/main/Evade"

local O = {
    9872472334,
    10324346056,
    10324347967,
    10539706691,
    10662542523,
}
if not table.find(O, game.PlaceId) then
    return 
end 
repeat
    wait()
until game:IsLoaded()

local Config = {
    WindowName = "V.G Hub",
    Color = Color3.fromRGB(107, 72, 55),
    Keybind = Enum.KeyCode.RightControl
}

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
local Events = ReplicatedStorage:WaitForChild("Events", 120)

local Name = "Evade.json"

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

UserInputService.InputBegan:Connect(
    function(v)
        if v.KeyCode == Enum.KeyCode.LeftShift then
            Player.Character.Humanoid.WalkSpeed = 30
        elseif v.KeyCode == Enum.KeyCode.RightShift then
            Player.Character.Humanoid.WalkSpeed = 30
        end
    end
)
UserInputService.InputEnded:Connect(
    function(v)
        if v.KeyCode == Enum.KeyCode.LeftShift then
            Player.Character.Humanoid.WalkSpeed = 16
        elseif v.KeyCode == Enum.KeyCode.RightShift then
            Player.Character.Humanoid.WalkSpeed = 16
        end
    end
)
spawn(
    function()
        while wait() do
            pcall(
                function()
                    game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = true
                    game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Position =
                        game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Position +
                        UDim2.new(
                            UDim.new(),
                            game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Size.Y
                        )
                end
            )
        end
    end
)


local GodMode = function()
    pcall(function()
        local Hum = Player.Character:FindFirstChildWhichIsA("Humanoid")
        Hum.Parent = nil
        Hum.Parent = Player.Character
    end)
end

local Player = game:GetService("Players").LocalPlayer
local ts = game:GetService("TweenService")
local function Tween(A, B, C)
    if A and B then
        local Time = (B.Position - A.Position).magnitude/C
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = ts:Create(A,Info,{CFrame = B})
        Tween:Play()
        wait(Time)
    end
end


RunService.Stepped:Connect(function()
    Player.PlayerScripts.CameraShake.Value = CFrame.new(0,0,0) * CFrame.new(0,0,0)
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Evade")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")
local Toggle1 = Section1:CreateToggle("AutoFarm", Settings.AutoFarm, function(State)
Settings.AutoFarm = State
RunService.Stepped:Connect(
    function()
        pcall(
            function()
                if Settings.AutoFarm then
                    Player.Character.Humanoid:ChangeState(11)
                end
            end
        )
    end
)
spawn(
    function()
        while Settings.AutoFarm do
            wait()
            pcall(function()
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(121, 500, 181)
                Tween(Player.Character.HumanoidRootPart,CFrame.new(900, 500, 28),100)
                Tween(Player.Character.HumanoidRootPart,CFrame.new(-300, 500, 29),100)
                Tween(Player.Character.HumanoidRootPart,CFrame.new(-34, 500, 900),100)
            end)
        end
    end
)
end)

local Toggle1 = Section1:CreateToggle("GodMode", Settings.GodMode, function(State)
Settings.GodMode = State
if Settings.GodMode then
    GodMode()
elseif not Settings.GodMode then
    if Events:FindFirstChild("Reset") and Events:FindFirstChild("Respawn") then
        Events:FindFirstChild("Reset"):FireServer()
        wait(2)
        Events:FindFirstChild("Respawn"):FireServer()
    end
end

Player.CharacterAdded:Connect(
    function()
        if Settings.GodMode and wait(3) then
            GodMode()
        end
    end
)

end)
local Toggle1 = Section1:CreateToggle("Auto revive yourself", Settings.AutoReived, function(State)
Settings.AutoReived = State
spawn(
    function()
        while wait() and Settings.AutoReived do
            pcall(
                function()
                    if Player.Character.StatChanges.Speed:FindFirstChild("Downed") then
                        Events.Respawn:FireServer()
                    end
                end
            )
        end
    end
)
end)

local Toggle1 = Section1:CreateToggle("FullBright", Settings.FullBright, function(State)
Settings.FullBright = State
        if Settings.FullBright then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
            Lighting.ColorShift_Top = Color3.new(1, 1, 1)
        else
            Lighting.Ambient = Color3.new(0, 0, 0)
            Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
            Lighting.ColorShift_Top = Color3.new(0, 0, 0)
        end
game.Lighting.Changed:connect(
    function()
        if Settings.FullBright then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
            Lighting.ColorShift_Top = Color3.new(1, 1, 1)
        else
            Lighting.Ambient = Color3.new(0, 0, 0)
            Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
            Lighting.ColorShift_Top = Color3.new(0, 0, 0)
        end
    end
)
end)

local Toggle1 = Section1:CreateToggle("Crash Server", nil, function(State)
Settings.Server = State
spawn(
    function()
        while wait() and Settings.Server do
            pcall(
                function()
                    if Events:FindFirstChild("Reset") and Events:FindFirstChild("Respawn") then
                        Events:FindFirstChild("Reset"):FireServer()
                        Events:FindFirstChild("Respawn"):FireServer()
                    end
                end
            )
        end
    end
)
end)

local Toggle1 = Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
Settings.Go = State
RunService.Stepped:connect(
    function()
        if Settings.Go then
            pcall(function()
            Player.Character.Humanoid:SetAttribute("RealSpeed", tonumber(Settings.WalkSpeed) * 25);
            Player.Character.Humanoid:SetAttribute("RealJumpHeight", tonumber(Settings.JumpPower))
            end)
            if not game:GetService("UserInputService").WindowFocusReleased then
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

local Toggle1 = Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
Settings.InfiniteJump = State
game:GetService("UserInputService").JumpRequest:connect(
    function()
        if Settings.InfiniteJump then
            Player.Character:FindFirstChildWhichIsA "Humanoid":ChangeState("Jumping")
        end
    end
)
end)

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()

local Toggle1 = Section1:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State
    ESP:Toggle(Settings.Esp)
    
end)


local Button1 = Section2:CreateButton("Press For Hentai", function()

game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "BAHAHAHAHA",
        Text = "DuMbAsS rEtArD"
    }
)


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


local Toggle1 = Section1:CreateToggle("Monster Esp", Settings.Orange, function(State)
    Settings.Orange = State
    ESP.Orange = Settings.Orange

ESP:AddObjectListener(Workspace:WaitForChild("Game", 1337).Players, {
    Color =  Color3.new(255, 154, 0),
    Type = "Model",
    PrimaryPart = function(v)
        local H = v:FindFirstChildWhichIsA("BasePart")
        while not H do
            wait()
            H = v:FindFirstChildWhichIsA("BasePart")
        end
        return H
    end,
    Validator = function(v)
        return not game.Players:GetPlayerFromCharacter(v)
    end,
    CustomName = function(v)
        return v.Name
    end,
    IsEnabled = "Orange",
})

end)


local BoopWrong = function()
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Warning",
            Text = "You have Booped the protogen the wrong way in this case justice will poor down on your soul"
        }
    )
    pcall(
        function()
            Player:Destroy()
        end
    )
    game.StarterGui:SetCore(
        "SendNotification",
        {Title = "Warning", Text = "your sentence is death eternal prison. farewell old friend.."}
    )
end
local BoopCorrect = function()
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "OwO",
            Text = "hai chu have booped me cowwectwy fur that i sha'ww nyot end ur wife and wet chu wive i wuv chu good bai"
        }
    )
end


local Toggle1 = Section1:CreateToggle("BHop", Settings.BHop, function(State)
Settings.BHop = State
spawn(function()
while wait() and Settings.BHop do
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)
end)

local Button1 = Section2:CreateButton("Reset", function()
    Player.Character.Head:Destroy()
end)
local Button1 = Section2:CreateButton("Boop protogen UwU", function()
local Functions = {BoopWrong, BoopCorrect}
local Dog = Functions[math.random(1, #Functions)]
Dog()
end)
local Toggle1 = Section2:CreateToggle("Invisicam", Settings.Sorry, function(State)
Settings.Sorry = State
if Settings.Sorry then
    Player.DevCameraOcclusionMode = "Invisicam"
else
    Player.DevCameraOcclusionMode = "Zoom"
end
end)
local Toggle1 = Section2:CreateToggle("Be Wired", Settings.Weird, function(State)
Settings.Weird = State
spawn(
    function()
        while Settings.Weird do
            wait()
            pcall(
                function()
                    Player.Character["Left Leg"]:remove()
                    Player.Character["Left Arm"]:remove()
                    Player.Character["Right Arm"]:remove()
                    Player.Character["Right Leg"]:remove()
                end
            )
        end
    end
)
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
        pcall(function() 
            Player.Character.Humanoid:ChangeState(11)
        end)
        end
    end
)
mouse = Player:GetMouse()
Player:GetMouse().KeyDown:connect(
    function(v)
        if v == "g" then
            if Settings.Sex then
                noclip = not noclip
                pcall(function() 
            Player.Character.Humanoid:ChangeState(11)
        end)
            end
        end
    end
)
end)
local Toggle1 = Section2:CreateToggle("H Fly", Settings.Sex2, function(State)
Settings.Sex2 = State
local Max = 0
local Players = Players
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
Mouse.KeyDown:connect(
    function(k)
        if k:lower() == "h" then
            Max = Max + 1
            getgenv().Fly = false
            if Settings.Sex2 then
                local T = LP.Character.Torso
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
                                LP.Character.Humanoid.PlatformStand = false
                                if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
                                    SPEED = 200
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
local randomPlayer = Players:GetPlayers()[math.random(1, #Players:GetPlayers())]

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
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    TeleportService:TeleportToPlaceInstance(PlaceID, ID, Player)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
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
TeleportService:Teleport(game.PlaceId, Player) end)





local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)
Section3:CreateLabel("Credits DekuDimz#7960")
Section3:CreateLabel("Credits AlexR32#3232 Ui")
Section3:CreateLabel("Credits FeIix")
Section3:CreateLabel("Credits E621")
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


spawn(
    function()
        while wait() do
            pcall(
                function()
                    Save()
                end
            )
        end
    end
)

