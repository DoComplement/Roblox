-- "https://raw.githubusercontent.com/1201for/V.G-Hub-Part-3/main/Combata-Warriors"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=4282985734 or nil~=getgenv()["!Q&j1;!ix)+]IYUZ&8lhQ:7v%wWzl2P!"])then return end;
getgenv()["!Q&j1;!ix)+]IYUZ&8lhQ:7v%wWzl2P!"] = true;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}
repeat wait() until game:IsLoaded() wait()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local Name = "CombatWarriors.json"

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
    writefile("V.G Hub//" .. Name, game:GetService("HttpService"):JSONEncode(Des))
end

Settings = game:GetService("HttpService"):JSONDecode(readfile("V.G Hub//" .. Name))

local function Save()
    writefile("V.G Hub//" .. Name, game:GetService("HttpService"):JSONEncode(Settings))
end

for i, v in pairs(getgc(true)) do
    if type(v) == "table" and rawget(v, "Remote") then
        if type(v.Remote) == "userdata" then
            v.Remote.Name = v.Name
        end
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Combat Warriors")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")


local Toggle1 = Section1:CreateToggle("Auto Swing", Settings.Swing, function(State)
Settings.Swing = State
spawn(
    function()
        while Settings.Swing do
            wait(1)
            for i = 1, 3 do
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                    game:GetService("ReplicatedStorage").Communication.Events.MeleeSwing:FireServer(
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"),
                        i
                    )
                end
            end
        end
    end
)

end)

local Toggle1 = Section1:CreateToggle("No Fall Damage", Settings.NoFall, function(State)
Settings.NoFall = State
local OldNameCall = nil
OldNameCall =
    hookmetamethod(
    game,
    "__namecall",
    function(self, ...)
        local Args = {...}
        if self.Name == "StartFallDamage" or self.Name == "TakeFallDamage" and Settings.NoFall then
            return nil
        end
        return OldNameCall(self, unpack(Args))
    end
)
end)


local Toggle1 = Section1:CreateToggle("Anti Beartrap", Settings.AntiBear, function(State)
Settings.AntiBear = State
local OldNameCall = nil
OldNameCall =
    hookmetamethod(
    game,
    "__namecall",
    function(self, ...)
        local Args = {...}
        if self.Name == "GotHitRE"  and Settings.AntiBear then
            return nil
        end
        return OldNameCall(self, unpack(Args))
    end
)
end)


local Toggle = Section2:CreateToggle("HitBox", Settings.Sys, function(State)
Settings.Sys = State
spawn(function()
while Settings.Sys do
    wait(1)
    pcall(
        function()
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character then
                    v.Character.HumanoidRootPart.CanCollide = false
                    v.Character.HumanoidRootPart.Material = "Neon"
                    v.Character.HumanoidRootPart.Transparency = 0.7
                    v.Character.HumanoidRootPart.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
                end
            end
        end
    )
end
end)
end)
local Slider2 = Section2:CreateSlider("Hitbox Radius", 0,50,Settings.Size,false, function(Value)
Settings.Size = Value
end)

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()

local Toggle1 = Section2:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State
    ESP:Toggle(Settings.Esp)
end)

local Toggle1 = Section2:CreateToggle("PLayer Esp", Settings.PlayerEsp, function(State)
    Settings.PlayerEsp = State
    ESP.Players = Settings.PlayerEsp
end)
local Toggle1 = Section2:CreateToggle("Tracers Esp", Settings.Tracers, function(State)
    Settings.Tracers = State
    ESP.Tracers = Settings.Tracers
end)
local Toggle1 = Section2:CreateToggle("Name Esp", Settings.EspNames, function(State)
    ESP.Names = Settings.EspNames
    Settings.EspNames = State
end)
local Toggle1 = Section2:CreateToggle("Boxes Esp", Settings.Boxes, function(State)
    Settings.Boxes = State
    ESP.Boxes = Settings.Boxes
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
spawn(function()
while wait() do
Save()
end end)
