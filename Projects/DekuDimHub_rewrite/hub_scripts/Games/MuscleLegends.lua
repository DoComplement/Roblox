-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/MuscleLegends"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=3623096087 or nil~=getgenv()["]4Oer]xeZCR8E6k:9B(B#32kh]JlQz++"])then return end;
getgenv()["]4Oer]xeZCR8E6k:9B(B#32kh]JlQz++"] = true;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}



local Name = "Muscle-Legends.txt"

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
    writefile("V.G Hub//" .. Name, game:service "HttpService":JSONEncode(Des))
end

Settings = game:service "HttpService":JSONDecode(readfile("V.G Hub//" .. Name))

local function Save()
    writefile("V.G Hub//" .. Name, game:service "HttpService":JSONEncode(Settings))
end

jk = {}
for _, v in pairs(game:GetService("ReplicatedStorage").chestRewards:GetDescendants()) do
    if v.Name ~= "Light Karma Chest" or v.Name ~= "Evil Karma Chest" then
        table.insert(jk, v.Name)
    end
end

jk1 = {}
for _, v in pairs(game:GetService("Workspace").mapCrystalsFolder:GetDescendants()) do
    if v:FindFirstChild("Crystal") then
        table.insert(jk1, v.Name)
    end
end
Rocks = {}
for i, v in pairs(game:GetService("Workspace").machinesFolder:GetChildren()) do
    if v:FindFirstChild("Rock") then
        table.insert(Rocks, v.Name)
    end
end
function c()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if
            v.ClassName == "Tool" and v.Name == "Handstands" or v.Name == "Situps" or v.Name == "Pushups" or
                v.Name == "Weight"
         then
            v:FindFirstChildOfClass("NumberValue").Value = 0
            repeat
                wait()
            until game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
        end
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Muscle Legends")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")
local Section3 = Tab2:CreateSection("")
local Section4 = Tab2:CreateSection("")


local Toggle1 = Section1:CreateToggle("AutoFarm", Settings.WorkOut, function(State)
Settings.WorkOut = State
game:GetService("RunService").Stepped:connect(
    function()
        pcall(
            function()
                if Settings.WorkOut then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end
        )
    end
)
spawn(function()
while Settings.WorkOut do
    wait()
    pcall(
        function()
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
            c()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9e9,9e9,9e9)
            if not Settings.WorkOut then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
            end
        end
    )
end
end)
end)

local Toggle1 = Section1:CreateToggle("AutoMob", Settings.AutoMob, function(State)
Settings.AutoMob = State
spawn(function()
while Settings.AutoMob do
    wait()
    pcall(
        function()
            for i, v in pairs(game:GetService("Workspace").enemyNPCs["Battle Island"]:GetChildren()) do
                if v:IsA("Folder") and v:FindFirstChildOfClass("Model") then
                    for i, v in pairs(v:GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
                            repeat
                                wait()
                                pcall(
                                    function()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                            v.PrimaryPart.CFrame
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(
                                            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Punch")
                                        )
                                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                                            "punch",
                                            "rightHand"
                                        )
                                        game:GetService("Players").LocalPlayer.muscleEvent:FireServer(
                                            "punch",
                                            "leftHand"
                                        )
                                    end
                                )
                            until v.Parent.stats.Health == 0
                        end
                    end
                end
            end
        end
    )
end
end)

end)
local Toggle1 = Section1:CreateToggle("Auto Durability", Settings.WorkOut1, function(State)
Settings.WorkOut1 = State
game:GetService("RunService").Stepped:connect(
    function()
        pcall(
            function()
                if Settings.WorkOut1 then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                end
            end
        )
    end
)
spawn(function()
while Settings.WorkOut1 do
    wait()
    pcall(
        function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game:GetService("Workspace").machinesFolder[Rocks].Rock.CFrame
            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")

            game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack.Punch)
        end
    )
end
end)
end)



local Dropdown1 = Section1:CreateDropdown("Rocks", Rocks, function(String)
	Settings.Rocks = String
end)



local Toggle1 = Section2:CreateToggle("PapaPlantz#3856 Personal Feature", Settings.personal, function(State)
Settings.personal = State
game:GetService("RunService").Stepped:connect(
    function()
        pcall(
            function()
                if Settings.personal then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8980, -30, -6049)
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(
                        game:GetService("Players").LocalPlayer.Backpack.Punch
                    )
                end
            end
        )
    end
)
end)

Toggle1:AddToolTip("haha i fucked your mom last night")
local Button1 = Section2:CreateButton("No Tool CoolDown", function()
c()
game:GetService("Players").LocalPlayer.Backpack.Punch:FindFirstChildOfClass("NumberValue").Value = 0
end)

local Toggle1 = Section1:CreateToggle("Auto Rebirth", Settings.Rebirth, function(State)
Settings.Rebirth = State
spawn(function()
while Settings.Rebirth do
    wait(0.1)
    game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
end
end)
end)
 
local Toggle1 = Section1:CreateToggle("Auto Join Brawl", Settings.Hot, function(State)
Settings.Hot = State
spawn(function()
while Settings.Hot do
    wait(2)
    game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
end
end)
end)

local Button1 = Section1:CreateButton("Get All Chests", function()
for i = 1, #jk do
    wait(2)
    game:GetService("ReplicatedStorage").rEvents.checkChestRemote:InvokeServer(jk[i])
end

end)

local Toggle1 = Section1:CreateToggle("Auto Crystal", Settings.AutoPets, function(State)
Settings.AutoPets = State
spawn(function()
while Settings.AutoPets do
    wait()
    game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", jk1)
end
end)
end)


local Dropdown1 = Section1:CreateDropdown("Crystals", jk1, function(String)
	Settings.Crystals = String
end)

local Toggle1 = Section1:CreateToggle("Anti Delete Pets", Settings.Stop, function(State)
Settings.Stop = State
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}
        if self.Name == "sellPetEvent" and Args[1] == "sellPet" and Settings.Stop then
                return 
        end
    return OldNameCall(self, unpack(Args))
end)
end)

local Toggle1 = Section1:CreateToggle("Anti Rebirth", Settings.Stop1, function(State)
Settings.Stop1 = State
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}
        if self.Name == "rebirthRemote" and Args[1] == "rebirthRequest" and Settings.Stop1 then
                return 
        end
    return OldNameCall(self, unpack(Args))
end)
end)


local Toggle1 = Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
Settings.Go = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.Go then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Settings.WalkSpeed
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = Settings.JumpPower
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
    game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Invisicam"
else
    game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Zoom"
end
end)

local Toggle1 = Section2:CreateToggle("N Noclip", Settings.Sex1, function(State)
noclips = false
Settings.Sex1 = State
game.Players.LocalPlayer:GetMouse().KeyDown:connect(
    function(v)
        if v == "n" then
            if Settings.Sex1 then
                noclips = not noclips
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
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
game:GetService("RunService").Stepped:connect(
    function()
        if noclips then
            for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
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
game:GetService("RunService").Stepped:connect(
    function()
        if noclip then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end
)
mouse = game.Players.LocalPlayer:GetMouse()
game.Players.LocalPlayer:GetMouse().KeyDown:connect(
    function(v)
        if v == "g" then
            if Settings.Sex then
                noclip = not noclip
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
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
local Button1 = Section2:CreateButton("Anti Lag", function()
for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
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

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
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
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
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
game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) end)





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
for i,v in pairs(game:GetService("ReplicatedStorage").funs:GetChildren()) do
local OldNameCall = nil
OldNameCall =
    hookmetamethod(
    game,
    "__namecall",
    function(self, ...)
        local Args = {...}
        if self.Name == v.Name or self.Name == "maxstat" then
            return nil
        end
        return OldNameCall(self, unpack(Args))
    end
)
end 

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
while wait() do
Save()
end end)


