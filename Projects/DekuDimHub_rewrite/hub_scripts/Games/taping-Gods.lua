-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/taping-Gods"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=5346447287 or nil~=getgenv()["lCZ~`1yC-&2iwV3lXXUV8p53Q~_evZOn"])then return end;
getgenv()["lCZ~`1yC-&2iwV3lXXUV8p53Q~_evZOn"] = true;

for i,v in pairs(getgc(true)) do
    if type(v)=="table" and rawget(v,"Remote") then
        if type(v.Remote)=="userdata" then
            v.Remote.Name=v.Name--built different
        end
    end
end
local l = require(game:GetService("ReplicatedStorage").Modules.Utils.Network).InvokeServer
local function remote(remote, ...)
    local key = getupvalue(l, 1)
    function ToByteArgs(p61)
        if 255 < p61 then

        else
            return p61;
        end;
        return math.floor(p61 / 256) % 256;
    end;
    function ToByteString(p62)
        return string.char(ToByteArgs(p62));
    end;
    local decodedkey = ToByteString(key)
    if remote:IsA("RemoteEvent") then
        lole = "FireServer"
    elseif remote:IsA("RemoteFunction") then
        lole="InvokeServer"
    else
        return 'fuck'
    end
    remote[lole](remote,decodedkey, ...)
end
remote(game:GetService("ReplicatedStorage").Communication.Functions.EquipBest)
remote(game:GetService("ReplicatedStorage").Communication.Functions.Tap)
egg ={}
for i,v in pairs(game:GetService("Workspace").Eggs:GetDescendants()) do
if v.ClassName == "Model" and v:FindFirstChild("EggName") then
table.insert(egg,v.Name)
end end 

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/im-retarded-3"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Taping gods")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("AutoFarms")
local Section2 = Tab1:CreateSection("Misc")
local SectionA = Tab1:CreateSection("Teleports")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")
local Toggle1 = Section1:CreateToggle("Auto Tap", nil, function(State)
doo = State
while doo do wait(0.5)
remote(game:GetService("ReplicatedStorage").Communication.Functions.Tap)
end end)


local Toggle1 = Section1:CreateToggle("Auto Starter Boss", nil, function(State)
ss1 = State
game:GetService('RunService').Stepped:connect(function()
pcall(function()
if ss1 then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
game:GetService("ReplicatedStorage").Communication.Events.AttackBoss:FireServer()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Bosses.Starter.UpperTorso.CFrame *CFrame.new(0,-10,0)
end
end) end) end)
local Toggle1 = Section1:CreateToggle("Auto Circus Boss", nil, function(State)
ss2 = State
game:GetService('RunService').Stepped:connect(function()
pcall(function()
if ss2 then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
game:GetService("ReplicatedStorage").Communication.Events.AttackBoss:FireServer()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Bosses.Circus.UpperTorso.CFrame *CFrame.new(0,-10,0)
end
end) end) end)
local Toggle1 = Section1:CreateToggle("Auto Dino Boss", nil, function(State)
ss3 = State
game:GetService('RunService').Stepped:connect(function()
pcall(function()
if ss3 then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
game:GetService("ReplicatedStorage").Communication.Events.AttackBoss:FireServer()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Bosses.Dino.UpperTorso.CFrame *CFrame.new(0,-10,0)
end
end) end) end)
local Toggle1 = Section1:CreateToggle("Auto Potions", nil, function(State)
potions = State
while potions do wait()
game:GetService("ReplicatedStorage").Communication.Events.BuyPotion:FireServer("x2 Speed")
game:GetService("ReplicatedStorage").Communication.Events.BuyPotion:FireServer("x2 Taps")
game:GetService("ReplicatedStorage").Communication.Events.BuyPotion:FireServer("x2 Luck")
game:GetService("ReplicatedStorage").Communication.Events.BuyPotion:FireServer("x2 Diamonds")
end
end)

local Toggle1 = Section2:CreateToggle("Auto Egg", nil, function(State)
Egg = State
game:GetService('RunService').Stepped:connect(function()
pcall(function()
if Egg then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Eggs[egg].EggName.CFrame* CFrame.new(0,3,0)
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
remote(game:GetService("ReplicatedStorage").Communication.Functions.HatchEgg,egg)


end end) end) end)
local Dropdown1 = Section2:CreateDropdown("Select Egg")
Dropdown1:AddToolTip("Select Egg")
for i,v in next, egg do
Dropdown1:AddOption(v, function(String)
egg = String
end)
end
local Toggle1 = Section2:CreateToggle("Auto Craft Pets", nil, function(State)
tt1 = State
while tt1 do wait()
callremote(game:GetService("ReplicatedStorage").Communication.Functions.CraftAllPets)
end end)

local Button1 = Section2:CreateButton("Collect Chests", function()
for _,v in pairs(game:GetService("Workspace").Chests:GetDescendants()) do
if v:IsA("TouchTransmitter") then
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
end
end
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
local Toggle1 = Section2:CreateToggle("G Noclip", nil, function(State)
sex = State
noclip = false
game:GetService('RunService').Stepped:connect(function()
if noclip then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
plr = game.Players.LocalPlayer
mouse = plr:GetMouse()
mouse.KeyDown:connect(function(key)

if key == "g" then
if sex then
noclip = not noclip
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end end 
end) end)
local Toggle1 = Section2:CreateToggle("B Fly", nil, function(State)
sex2 = State
local gogo1000 = 0
local LP = game:service('Players').LocalPlayer
local MOUSE = LP:GetMouse()
MOUSE.KeyDown:connect(function(KEY)
if KEY:lower() == 'b' then
if sex2 then
local LP = game:service('Players').LocalPlayer
local MOUSE = LP:GetMouse()
gogo1000 = gogo1000 + 1
_G.FLYING = false
local T = LP.Character.Torso
local CONTROL = {F = 0, B = 0, L = 0, R = 0}
local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
local SPEED = 5
local function FLY()
_G.FLYING = true
local BG = Instance.new('BodyGyro', T)
local BV = Instance.new('BodyVelocity', T)
BG.P = 9e4
BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
BG.cframe = T.CFrame
BV.velocity = Vector3.new(0, 0.1, 0)
BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
spawn(function()
repeat wait()
LP.Character.Humanoid.PlatformStand = true
if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
SPEED = 50
elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
SPEED = 0
end
if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
BV.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
BV.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
else
BV.velocity = Vector3.new(0, 0.1, 0)
end
BG.cframe = game.Workspace.CurrentCamera.CoordinateFrame
until not _G.FLYING
CONTROL = {F = 0, B = 0, L = 0, R = 0}
lCONTROL = {F = 0, B = 0, L = 0, R = 0}
SPEED = 0
BG:destroy()
BV:destroy()
LP.Character.Humanoid.PlatformStand = false
end)
end
MOUSE.KeyDown:connect(function(KEY)
if KEY:lower() == 'w' then
CONTROL.F = 1
elseif KEY:lower() == 's' then
CONTROL.B = -1
elseif KEY:lower() == 'a' then
CONTROL.L = -1 
elseif KEY:lower() == 'd' then 
CONTROL.R = 1
end
end)
MOUSE.KeyUp:connect(function(KEY)
if KEY:lower() == 'w' then
CONTROL.F = 0
elseif KEY:lower() == 's' then
CONTROL.B = 0
elseif KEY:lower() == 'a' then
CONTROL.L = 0
elseif KEY:lower() == 'd' then
CONTROL.R = 0
end
end)
FLY()
if gogo1000 == 2 then
_G.FLYING = false
gogo1000 = 0
end
end
end
end) end)
local Button1 = Section2:CreateButton("Anti Lag", function()
for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then --- i stole this from the actual game LOL >-<
v.Material = Enum.Material.SmoothPlastic;
if v:IsA("Texture") then
v:Destroy();
end end;		
end;
end)

local Button1 = Section2:CreateButton("Teleport to RandomPlayer", function()
local randomPlayer = game.Players:GetPlayers()
[math.random(1,#game.Players:GetPlayers())]

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(randomPlayer.Character.Head.Position.X, randomPlayer.Character.Head.Position.Y, randomPlayer.Character.Head.Position.Z)) end)
local Button1 = Section2:CreateButton("Lag Switch F3", function()
local a = false
local b = settings()

game:service'UserInputService'.InputEnded:connect(function(i)
if i.KeyCode == Enum.KeyCode.F3 then
a = not a
b.Network.IncomingReplicationLag = a and 10 or 0
end
end) end) 
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
test={}
for _,v in pairs(game:GetService("Workspace").IslandsUnlock:GetDescendants()) do
if v:IsA("Part") then
table.insert(test,v.Name)
end end 
local Dropdown1 = SectionA:CreateDropdown("Select Location")
Dropdown1:AddToolTip("Select Location")
for i,v in next, test do
Dropdown1:AddOption(v, function(String)
test = String
end)
end
local Button1 = SectionA:CreateButton("Go to Selected Location", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").IslandsUnlock[test].CFrame * CFrame.new(0,20,0)
end)
local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)
Section3:CreateLabel("Credits DekuDimz#7960")
Section3:CreateLabel("Credits e621")
Section3:CreateLabel("Credits AlexR32#3232 Ui")




local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)
-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image")
local Option7 = Dropdown3:AddOption("Default", function(String)
	Window:SetBackground("2151741365")
end)
local Option8 = Dropdown3:AddOption("Hearts", function(String)
	Window:SetBackground("6073763717")
end)
local Option9 = Dropdown3:AddOption("Abstract", function(String)
	Window:SetBackground("6073743871")
end)
local Option10 = Dropdown3:AddOption("Hexagon", function(String)
	Window:SetBackground("6073628839")
end)
local Option11 = Dropdown3:AddOption("Circles", function(String)
	Window:SetBackground("6071579801")
end)
local Option12 = Dropdown3:AddOption("Lace With Flowers", function(String)
	Window:SetBackground("6071575925")
end)
local Option13 = Dropdown3:AddOption("Floral", function(String)
	Window:SetBackground("5553946656")
end)
Option7:SetOption()

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
