-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/Project%20Lazarus-ZOMBIES"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=443406476 or nil~=getgenv()["&Xsj8bt%w4dkW]pboXCA$_mWXt%.gw0d"])then return end;
getgenv()["&Xsj8bt%w4dkW]pboXCA$_mWXt%.gw0d"] = true;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}
repeat wait() until game:IsLoaded() wait()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)


local OldNameCall = nil
OldNameCall =
    hookmetamethod(
    game,
    "__namecall",
    function(self, ...)
        local Args = {...}
        if getgenv().Wallbang and getnamecallmethod() == "FindPartOnRayWithIgnoreList" then
        table.insert(Args[2], game.GetService(game, 'Workspace').Ignore)
        table.insert(Args[2], game.GetService(game, 'Workspace').Map)
        end 
        if getnamecallmethod() == "FireServer" and self.Name == "SendData" then
        return nil
        
        end 
        return OldNameCall(self, unpack(Args))
    end
)

getgenv().Speed = 25
game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(v)
	if v == "0" then --"Shift to run" 0 == shift
		print("Running")
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().Speed 
	end
end)

game.Players.LocalPlayer:GetMouse().KeyUp:connect(function(v)
	if v == "0" then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 
	end
end)

local OldNameCall
OldNameCall =
    hookmetamethod(
    game,
    "__newindex",
    function(A, B, C)
        if (not checkcaller() and A.ClassName == "Humanoid" and (B == "WalkSpeed" or B == "JumpPower")) then
            return
        end
        return OldNameCall(A, B, C)
    end
)




    
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Project Larus")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")


local Toggle1 = Section1:CreateToggle("Bring Heads", nil, function(State)
getgenv().Get = State
game:GetService("RunService").Stepped:connect(
    function()
        if getgenv().Get then
            pcall(function()
            for i, v in pairs(game:GetService("Workspace").Baddies:GetChildren()) do
                if v:FindFirstChild("Head") then
                    v.HeadBox.Transparency = 0
                    v.HeadBox.Material = "Neon"
                    v.HeadBox.CanCollide = false
                    v.HeadBox.Anchored = true
                    v.HeadBox.Position =
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(5, 0, 5)
                end
            end
            end)
        end
    end
)
end)



local Toggle1 = Section1:CreateToggle("GodMode", nil, function(State)
getgenv().God = State
game.Players.LocalPlayer.Character.Humanoid.Health = 0
game:GetService("RunService").Stepped:connect(
    function()
        if getgenv().God then
            if game.Players.LocalPlayer.Character:FindFirstChild("Health") and game.Players.LocalPlayer.Character.Humanoid.Changed:wait(2) and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
                game.Players.LocalPlayer.Character:WaitForChild("Health"):remove()
            end
        end
    end
)
end)


local Toggle1 = Section1:CreateToggle("No Recoil", nil, function(State)
getgenv().Recoil = State
for i, v in pairs(game.Players.LocalPlayer:WaitForChild("Backpack"):GetChildren()) do
    if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then
    local o = require(v)
    o.GunKick = 0
    o.ViewKick.Pitch.Min = 0
    o.ViewKick.Pitch.Max = 0
    o.ViewKick.Yaw.Min = 0
    o.ViewKick.Yaw.Max = 0
    end
end

game.Players.LocalPlayer:WaitForChild("Backpack").ChildAdded:Connect(
    function(v)
        if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then
            if getgenv().Recoil then
                local o = require(v)
                o.GunKick = 0
                o.ViewKick.Pitch.Min = 0
                o.ViewKick.Pitch.Max = 0
                o.ViewKick.Yaw.Min = 0
                o.ViewKick.Yaw.Max = 0
            end
        end
    end
)

end)

local Toggle1 = Section1:CreateToggle("Instant Reload", nil, function(State)
getgenv().InstaReload = State
for i, v in pairs(game.Players.LocalPlayer:WaitForChild("Backpack"):GetChildren()) do
    if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then
        local o = require(v)
        for o, f in pairs(o.ReloadSequence) do
            getfenv(f).wait = function(time)
                if getgenv().InstaReload then
                    return
                else
                    return wait(time)
                end
            end
        end
    end
end
game.Players.LocalPlayer:WaitForChild("Backpack").ChildAdded:Connect(
    function(v)
        if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then
            local o = require(v)

            if getgenv().InstaReload then
                for o, f in pairs(o.ReloadSequence) do
                    getfenv(f).wait = function(time)
                        if getgenv().InstaReload then
                            return
                        else
                            return wait(time)
                        end
                    end
                end
            end
        end
    end
)
end)



local Toggle1 = Section1:CreateToggle("InfiniteAmmo", nil, function(State)
getgenv().InfiniteAmmo = State
for i, v in pairs(game.Players.LocalPlayer:WaitForChild("Backpack"):GetChildren()) do
    if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then
        local o = require(v)
        o.MagSize = math.huge
        o.StoredAmmo = math.huge
        o.MaxAmmo = math.huge
    end
end
game.Players.LocalPlayer:WaitForChild("Backpack").ChildAdded:Connect(
    function(v)
        if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then wait()
            local o = require(v)
            if getgenv().InfiniteAmmo then
            local o = require(v)
            o.MagSize = math.huge
            o.StoredAmmo = math.huge
            o.MaxAmmo = math.huge
            end
        end
    end
)
end)
local Toggle1 = Section1:CreateToggle("Fast FireRate", nil, function(State)
getgenv().Firerate = State
for i, v in pairs(game.Players.LocalPlayer:WaitForChild("Backpack"):GetChildren()) do
    if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then wait()
        local o = require(v)
        o.Semi = false
        o.FireTime = 0
    end
end
game.Players.LocalPlayer:WaitForChild("Backpack").ChildAdded:Connect(
    function(v)
        if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then wait()
            local o = require(v)
            if getgenv().Firerate then
            local o = require(v)
            o.Semi = false
            o.FireTime = 0
            end
        end
    end
)
end)

local Toggle1 = Section1:CreateToggle("WallBang", nil, function(State)
getgenv().Wallbang = State
for i, v in pairs(game.Players.LocalPlayer:WaitForChild("Backpack"):GetChildren()) do
    if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then wait()
        local o = require(v)
        o.BulletPenetration = 420.0
    end
end

game.Players.LocalPlayer:WaitForChild("Backpack").ChildAdded:Connect(
    function(v)
        if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then wait()
            local o = require(v)
            if getgenv().Wallbang then
                o.BulletPenetration = 420.0
            end
        end
    end
)
end)
local Toggle1 = Section1:CreateToggle("No Spread", nil, function(State)
getgenv().Spread = State
for i, v in pairs(game.Players.LocalPlayer:WaitForChild("Backpack"):GetChildren()) do
    if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then wait()
        local o = require(v)
        if getgenv().Spread then
            o.Spread.Min = 0
            o.Spread.Max = 0
        end
    end
end
game.Players.LocalPlayer:WaitForChild("Backpack").ChildAdded:Connect(
    function(v)
        if v.Name == "Weapon1" or v.Name == "Weapon2" or v.Name == "Weapon3" then wait()
            if getgenv().Spread then
                o.Spread.Min = 0
                o.Spread.Max = 0
            end
        end
    end
)
end)



local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()
ESP:AddObjectListener(game:GetService("Workspace").Baddies, {
    Color =  Color3.new(255,0,0),
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
        return  v.Name
    end,
    IsEnabled = "NPCs",
})
ESP.Players = false
local Toggle1 = Section1:CreateToggle("Enable Esp", nil, function(State)
    ESP:Toggle(State)
end)
local Toggle1 = Section1:CreateToggle("Zombie Esp", nil, function(State)
    ESP.NPCs = State 
    
end)
local Toggle1 = Section1:CreateToggle("Player", nil, function(State)
    ESP.Players = State
end)
local Toggle1 = Section1:CreateToggle("Tracers Esp", nil, function(State)
    ESP.Tracers = State
end)
local Toggle1 = Section1:CreateToggle("Name Esp", nil, function(State)
    ESP.Names = State
end)
local Toggle1 = Section1:CreateToggle("Boxes Esp", nil, function(State)
    ESP.Boxes = State
end)


local TextBox1 = Section2:CreateTextBox("Fps Cap", "Only numbers", true, function(Value)
    getgenv().Fps = Value
    pcall(function()
setfpscap(getgenv().Fps)
end)
end)

local TextBox1 = Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)
local TextBox1 = Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)


local Toggle1 = Section2:CreateToggle("Infinite Jump", nil, function(State)
Infinite = State
game:GetService("UserInputService").JumpRequest:connect(function()
	if Infinite then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end) end)

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()

local Toggle1 = Section1:CreateToggle("Player Esp", nil, function(State)
    ESP:Toggle(State)
end)
local Toggle1 = Section1:CreateToggle("Tracers Esp", nil, function(State)
    ESP.Tracers = State
end)
local Toggle1 = Section1:CreateToggle("Name Esp", nil, function(State)
    ESP.Names = State
end)
local Toggle1 = Section1:CreateToggle("Boxes Esp", nil, function(State)
    ESP.Boxes = State
end)


local Toggle1 = Section2:CreateToggle("G Noclip", nil, function(State)
sex = State
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
            if sex then
                noclip = not noclip
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end
        end
    end
)
end)
local Toggle1 = Section2:CreateToggle("B Fly", nil, function(State)
sex2 = State
local Max = 0
local Players = game.Players
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
Mouse.KeyDown:connect(
    function(k)
        if k:lower() == "b" then
            Max = Max + 1
            getgenv().Fly = false
            if sex2 then
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

