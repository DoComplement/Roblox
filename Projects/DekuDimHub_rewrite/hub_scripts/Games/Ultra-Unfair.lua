-- "https://raw.githubusercontent.com/1201for/V.G-Hub-Part-3/main/Ultra-Unfair"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=11187148979 or nil~=getgenv()["a*sBe1ki#A!yEyQ4JwxwYK]G[gGq2QNv"])then return end;
getgenv()["a*sBe1ki#A!yEyQ4JwxwYK]G[gGq2QNv"] = true;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}
local Players = Get.Players
local ReplicatedStorage = Get.ReplicatedStorage
local HttpService = Get.HttpService
local Workspace = Get.Workspace 
local VirtualUser = Get.VirtualUser
local VirtualInputManager = Get.VirtualInputManager
local RunService = Get.RunService
local Player = Players.LocalPlayer
local Rep = ReplicatedStorage
local wait = task.wait
local spawn = task.spawn
Player.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

Player.Character.ChildAdded:Connect(
   function(p15)
       if p15.Name == "TimeStop" or p15.Name == "grayscreen" then
           p15:remove()
       end
   end
)
Workspace.Magic.ChildAdded:Connect(
   function(v)
       if v.Name == "SoundPart" then
           v:Destroy()
       end
   end
)
local Old = getsenv(Player.PlayerScripts.MoveHandler)
-- Improved Fps Due to these functions fucking up the game go figures
hookfunction(
   Old.camshake,
   function()
       return
   end
)
hookfunction(
   Old._G.knockback,
   function()
       return
   end
)
hookfunction(
   Old._G.HitEffect,
   function()
       return
   end
)
hookfunction(
   Old._G.flasheffect,
   function()
       return
   end
)
hookfunction(
   Old.addparticle,
   function()
       return
   end
)

local Name = "UnConventional.json"

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
local A = require(Workspace.EnemyStats)

local HideMode = function()
    if not Player.Character:FindFirstChild("Head") then
        return
    end
    for i, v in pairs(Player.Character:GetChildren()) do
        if (v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants")) then
            v:Destroy()
        end
        if v.Name == ("Head") and v:FindFirstChildWhichIsA("BillboardGui") then
            v:FindFirstChildWhichIsA("BillboardGui"):Destroy()
        end
    end
end
local Distance = function(A)
    return (A.Position - Player.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
end

local H = function(A)
    return (A:GetModelCFrame() - Player.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude
end 
RunService.Stepped:Connect(function()
    HideMode()
end)

local Quests = {}
for i,v in pairs(Workspace.QuestNPCs:GetChildren()) do
    if v:IsA("Model") and v:FindFirstChild("Quest") and not table.find(Quests,v.Quest.Value) then
        table.insert(Quests,v.Quest.Value)
    end 
end 

local Hell = {}
for i, v in pairs(A) do
    table.insert(Hell, i)
end

local Quests = {}
for i, v in pairs(Workspace.QuestNPCs:GetChildren()) do
    if v:FindFirstChildWhichIsA("Humanoid") and v:FindFirstChild("Quest") then
        table.insert(Quests, v.Quest.Value)
    end
end



--Skided from game need it for AutoQuest
function GetTier(p18)
	local v32 = { "Exodia Tiers", "Mythical Tiers", "God Tiers", "High Tiers", "Elite Tiers", "Mid Tiers", "Low Tiers" };
	for v33, v34 in pairs({ 9, 7.5, 6, 5, 3.5, 2 }) do
		if v34 <= p18 then
			return v32[v33];
		end;
	end;
	return "Low Tiers";
end;


local function getNearestMobs()
    local TargetDistance = math.huge
    local Target
    for i, v in ipairs(Workspace:GetChildren()) do
        if v:FindFirstChild("Level") then
            local String = Player.PlayerGui.MainClient.Quest.Folder.Objective.objective
            String.Text = string.gsub(String.Text,"-"," ")
        if v:IsA("Model") and (table.find(Hell, v.Name) and not Settings.AutoQuest or string.find(String.Text,GetTier(v.Level.Value)) and Settings.AutoQuest) then
            if v:FindFirstChildWhichIsA("Humanoid") and v:FindFirstChildWhichIsA("Humanoid").Health ~= 0 or v.Name == "Barrier" then
            local Mag =
                    Distance(v.PrimaryPart)
                if Mag < TargetDistance then
                    TargetDistance = Mag
                    Target = v
                    end 
                end
            end end 
        end
    return Target
end


local function Hit(v)
    Rep.Damage:FireServer(
        "DualSwordHeavy",
        v:FindFirstChildWhichIsA("Humanoid"),
        Player.Character.Cancellations.Value,
        {[1] = v:FindFirstChildWhichIsA("Humanoid")}
    )
end

local function Hitv2(v)
    for i = 1, 5 do
        Rep.Punch:FireServer(
            v:FindFirstChildWhichIsA("Humanoid"),
            i,
            Player.Character.Cancellations.Value,
            nil,
            3
        )
        wait(.15)
    end
end

local function Q(A)
    if not Player.PlayerGui.MainClient.Quest.Visible then
        Rep.TakeQuest:FireServer(A)
    elseif
        Player.PlayerGui.MainClient.Quest.Visible and
            Player.PlayerGui.MainClient.Quest.Folder.Objective.progress.Text:split("/")[1] ==
                Player.PlayerGui.MainClient.Quest.Folder.Objective.progress.Text:split("/")[2]
     then
        Rep.TakeQuest:FireServer("Completed")
     end
    return A
end



local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("UnConventional")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

local Toggle1 = Section1:CreateToggle("Auto Mob", Settings.Fight, function(State)
Settings.Fight = State
spawn(
    function()
        game:GetService("RunService").Stepped:connect(
            function()
                pcall(
                    function()
                        if Settings.Fight then
                            if not Player.Character:FindFirstChild("Head"):FindFirstChild("LeftGlow") then
                                VirtualInputManager:SendKeyEvent(true, 49, false, game)
                            end
                            if Player.Character.Humanoid.Health ~= 0 and Player.Character:FindFirstChild("Head") then
                                for i, v in pairs(Player.Character:GetChildren()) do
                                    if v:IsA("BasePart") then
                                        v.CanCollide = false
                                    end
                                end
                            end
                        end
                    end
                )
            end
        )
    end
)
spawn(
    function()
        while Settings.Fight do
            wait()
            pcall(
                function()
                    Q(Settings.Quest)
                    if Player.Character.Humanoid.Health ~= 0 then
                        if
                            Distance(getNearestMobs().PrimaryPart) < 10
                         then
                            game:GetService("VirtualUser"):ClickButton1(Vector2.new(9e9,9e9))
                        end
                        Player.Character.Humanoid:MoveTo(getNearestMobs().PrimaryPart.Position)
                    end
                end
            )
        end
    end
)

end)

local Toggle1 = Section1:CreateToggle("AutoQuest", Settings.AutoQuest, function(State)
    Settings.AutoQuest = State
end)
local Dropdown1 = Section1:CreateDropdown("Quests", Quests, function(Name)
	Settings.Quest = Name 
end)
    


local Toggle1 = Section1:CreateToggle("Anti Stun", Settings.AntiStun, function(State)
Settings.AntiStun = State
spawn(function()
while wait() and Settings.AntiStun do
    pcall(
        function()
            for i, v in pairs(Player.Character:GetChildren()) do
                if v.Name == "Stunned" then
                    v:Destroy()
                end
            end
        end
    )
end 
end)
end)


local Toggle1 = Section1:CreateToggle("Anti TimeStop", Settings.AntiTimeStop, function(State)
Settings.AntiTimeStop = State
spawn(function()
while wait() and Settings.AntiTimeStop do
    pcall(
        function()
            repeat
                wait()
            until Player.Character
            for i, v in pairs(Player.Character:GetChildren()) do
                if v.Name == "TimeStop" then
                    v:Destroy()
                end
            end
        end
    )
end 
end)
end)

local Toggle1 = Section1:CreateToggle("Anti Knockback Mob", Settings.Infinite, function(State)
Settings.Infinite = State
local OldNameCall = nil
OldNameCall =
    hookmetamethod(
    game,
    "__namecall",
    function(...)
        local Args = {...}
        local Self = Args[1]
        if getnamecallmethod() == "FireServer" and tostring(Self) == "Knockback" and Settings.Infinite then
            return wait(math.huge)
        end
        return OldNameCall(...)
    end
)
end)

local Toggle = Section1:CreateToggle("HitBox", Settings.Sys, function(State)
Settings.Sys = State

game:GetService("RunService").Stepped:connect(
    function()
        if Settings.Sys then
            for i, v in pairs(Player.Character:GetChildren()) do
                pcall(
                    function()
                        if v:IsA("BasePart")  then
                            v.CanCollide = false
                        end
                    end
                )
            end
        end
    end
)
spawn(function()
while Settings.Sys do
    wait(1)
    pcall(
        function()
            for i, v in pairs(Workspace:GetDescendants()) do
                if table.find(Hell, v.Name) and v:FindFirstChild("HumanoidRootPart") then
                    v.LowerTorso.CanCollide = false
                    v.LowerTorso.Material = "Neon"
                    v.LowerTorso.Transparency = 0.5
                    v.LowerTorso.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
                    v.HumanoidRootPart.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
                    v.HumanoidRootPart.CanCollide = false
                end
            end
        end
    )
end
end)
end)
local Slider2 = Section1:CreateSlider("Hitbox Radius", 0,50,Settings.Size,false, function(Value)
Settings.Size = Value
end)


local Button1 = Section1:CreateButton("Anti Player knockback", function()
    hookfunction(getsenv(Player.PlayerScripts.MoveHandler)._G.knockback, function(...) return; end)
end)
local Button1 = Section1:CreateButton("Anti Flash Bang", function()
    hookfunction(getsenv(Player.PlayerScripts.MoveHandler)._G.flasheffect, function(...) return; end)
end)
local Table = {"Power","Speed","Trick","Recovery","Defense"}

local Dropdown1 = Section1:CreateDropdown("Stats", Table, function(Name)
	Settings.Power = Name
end)

local Toggle = Section1:CreateToggle("Auto Update Stat", Settings.System, function(State)
Settings.System = State
spawn(
    function()
        while Settings.System do
            wait()
            ReplicatedStorage.StatPoint:InvokeServer(Settings.Power)
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
game:GetService("RunService").Stepped:connect(
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
game:GetService("RunService").Stepped:connect(
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
local Players = Players
local LP = Player
local Mouse = LP:GetMouse()
Mouse.KeyDown:connect(
    function(k)
        if k:lower() == "h" then
            Max = Max + 1
            getgenv().Fly = false
            if Settings.Sex2 then
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
                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                    BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
                    spawn(
                        function()
                            repeat
                                wait()
                                LP.Character.Humanoid.PlatformStand = false
                                if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
                                    SPEED = 16
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
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, Player)
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
game:GetService("TeleportService"):Teleport(game.PlaceId, Player) end)



local Button1 = Section1:CreateButton("???", function()
while wait() do
    pcall(
        function()
            for i, v in pairs(Player.PlayerGui.Menu:GetChildren()) do
                if v:IsA("TextLabel") then
                    v.Text = HttpService:GenerateGUID(false)
                elseif v.ClassName ~= "TextLabel" then
                    for i, v in pairs(v:GetChildren()) do
                        if v:IsA("TextLabel") then
                            v.Text = HttpService:GenerateGUID(false)
                        elseif v.ClassName ~= "TextLabel" then
                            for i, v in pairs(v:GetChildren()) do
                                if v:IsA("TextLabel") then
                                    v.Text = HttpService:GenerateGUID(false)
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
while wait() do
for i,v in pairs(Workspace.NPCS:GetChildren()) do
if v:IsA("Model") and v:FindFirstChild("Humanoid") then
v.Name = HttpService:GenerateGUID(false)
end end 
for i,v in pairs(Workspace.Live:GetChildren()) do
if v:IsA("Model") and v:FindFirstChild("Humanoid") then
v.Name = HttpService:GenerateGUID(false)
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
while wait() do
Save()
end end)
