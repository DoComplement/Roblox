-- "https://raw.githubusercontent.com/1201for/V.G-Hub-Part-3/main/Bid-Battles"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=9603033881 or nil~=getgenv()["]qLwQ.c8wWoyXA?oc^PDHHH`P*N9_sMR"])then return end;
getgenv()["]qLwQ.c8wWoyXA?oc^PDHHH`P*N9_sMR"] = true;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}
repeat wait() until game:IsLoaded() wait()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
local Name = "Bid Battles.json"

Des = {}
if makefolder then
    makefolder("V.G Hub")
end
getgenv().delay2 = 0.1
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


local Plots = game:GetService("Workspace").Plots
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
Player.CharacterAdded:Connect(function()
    wait(1)
    Character = Player.Character
end)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Value = Player.SaveVars
local Events = ReplicatedStorage.Events
local Debris = game:GetService("Workspace").Debris
local Auctions = Debris.Auctions


local v1 = require(ReplicatedStorage.Modules.UIModule)
local v2 = require(ReplicatedStorage.Modules.Repairs)
local v3 = require(ReplicatedStorage.Modules.Safes)
local v4 = require(ReplicatedStorage.Modules.Items)
local v5 = require(ReplicatedStorage.Modules.Garages)
for i,v in pairs(v2.Thresholds) do
    v.RepairTime = 0
end 
local Say = function()
    local Egg = 0
    for i, v in pairs(Auctions:GetChildren()) do
        if tostring(Auctions[v.Name]:GetAttribute("GarageLocation")) == game:GetService("Players").LocalPlayer.NonSaveVars.OwnsPlot.Value then
        for i, A in pairs(v.Items:GetChildren()) do
            if A.Name ~= nil then
                local Number = tonumber(v4[v.Name].Price)
                Egg = Egg + Number
            end
        end
        Egg2 = Egg2 + 1
        print("Box Price = " .. Egg)
        game:GetService("StarterGui"):SetCore(
            "SendNotification",
            {
                Title = "Auction " .. Egg2,
                Text = "$" .. Egg .. " its worth Credits to Uae#3623 for this feature"
            }
        )
        Egg = 0
        end
end 
end



for i,v in pairs(v3) do
    v = 0 
end 
wait = task.wait

local Load = function()
    for i, v in pairs(game:GetService("Workspace").InteriorSpawns:GetChildren()) do
        if v:IsA("BasePart") then
            task.wait(0.1)
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(0, 10, 0))
        end
    end
end
local Gamepasses = function()
    for i, v in pairs(Player.Gamepasses:GetChildren()) do
        if v:IsA("BoolValue") then
            v.Value = true
        end
    end
end
local Maps = {}
for i, v in pairs(game:GetService("Workspace").InteriorSpawns:GetChildren()) do
    if v:IsA("BasePart") then
        table.insert(Maps, v.Name)
    end
end

local Guis = {}
for i, v in pairs(ReplicatedStorage.GUIs:GetChildren()) do
    if v:IsA("ScreenGui") then
        table.insert(Guis, v.Name)
    end
end

local Actions = {}

for i,v in pairs(v5) do
    table.insert(Actions,v.Name)
end 

local GetPlot = function()
    local Target
    for i, v in pairs(Plots:GetChildren()) do
        for i, v in pairs(v:GetChildren()) do
            if v.Owner.Value == game.Players.LocalPlayer.Name then
                Target = v
            end
        end
    end
    return Target
end



v1:Notify(game.Players.LocalPlayer,"V.G hub Is Loading")
wait()
pcall(
    function()
        Events.Data.SetStoreAccess:FireServer("Me")
    end
)
wait(0.2)
v1:Notify(game.Players.LocalPlayer,"V.G hub Is Loaded Thank Your For waiting")


local function UpdateAuctioneerText(v)
    Events.UI.UpdateAuctioneerText:Fire(v)
end 

Auctions.ChildAdded:Connect(function()
    Say()
end)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Bid Battles")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("AutoFarms")
local Section2 = Tab1:CreateSection("Misc")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")



local Toggle1 = Section1:CreateToggle("AutoFarm", Settings.Start, function(State)
Settings.Start = State
spawn(
    function()
        while Settings.Start do
            pcall(
                function()
                    wait(1)
                    
                    if
                        not Player.PlayerGui:FindFirstChild("Auctions") and
                            not Player.PlayerGui:FindFirstChild("Bidding") and
                            wait(1)
                     then
                         v1:AddUI(Player,ReplicatedStorage.GUIs.Auctions)
                        for i, v in pairs(v5) do
                            if v.Name == (Settings.Actions) then
                                Events.Auctions.EnterQueue:InvokeServer(i)
                            end
                        end
                    end
                    if
                        Player.PlayerGui:FindFirstChild("Bidding") and Player.PlayerGui.Bidding.Buttons.Visible and
                            wait(1)
                     then
                        for i, v in pairs(getconnections(Player.PlayerGui.Bidding.Buttons.BidButton.MouseButton1Click)) do
                            wait(nil) wait(1)
                            v:Fire()
                        end
                    end

                    if Player.PlayerGui:FindFirstChild("ItemsWon") and wait(1) then
                        for i, v in pairs(
                            getconnections(Player.PlayerGui.ItemsWon.ItemsFrame.ConfirmButton.MouseButton1Click)
                        ) do
                            wait(nil)
                            v:Fire()
                        end
                        Events.Auctions.SellAllItems:InvokeServer("Default",{})
                        Player.PlayerGui.Circle:Destroy()
                        Player.PlayerGui.ItemsWon:Destroy()
                        
                    end
                end
            )
        end
    end
)
end)

local Dropdown1 = Section1:CreateDropdown("Auctions", Actions, function(String)
	Settings.Actions = String
end)

if Settings.Text == nil then
    Settings.Text = "Sex"
end 
local Toggle1 = Section1:CreateToggle("Spam Auctioner Message Box", Settings.Spam, function(State)
Settings.Spam = State
spawn(
    function()
        while wait(1) and Settings.Spam do
            pcall(
                function()
                    UpdateAuctioneerText(Settings.Text)
                end
            )
        end
    end
)
end)


Section1:CreateTextBox("Auctioner Message", "Text Here", false, function(String)
	Settings.Text = String
end)

local Button1 = Section1:CreateButton("Pop up Gui", function()
    v1:AddUI(Player, ReplicatedStorage.GUIs[Settings.Gui])
end)
local Button1 = Section1:CreateButton("Remove Gui", function()
    v1:RemoveUI(Player, ReplicatedStorage.GUIs[Settings.Gui])
end)
local Dropdown1 = Section1:CreateDropdown("Gui's", Guis, function(String)
	Settings.Gui = String
end)

local Toggle1 = Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
Settings.Go = State
RunService.Stepped:connect(
    function()
        if Settings.Go then
            Character:WaitForChild("Humanoid").WalkSpeed = Settings.WalkSpeed
       	    if Character:FindFirstChildOfClass('Humanoid').UseJumpPower then
			Character:WaitForChild('Humanoid').JumpPower = Settings.JumpPower
		    else
			Character:WaitForChild('Humanoid').JumpHeight  = Settings.JumpPower
			end 
            if not game:GetService("UserInputService").WindowFocusReleased then
                setfpscap(Settings.Fps)
            end
        end
    end
)

end)

Section2:CreateTextBox("Teleport To Player", "UserName Here", false, function(String)
for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if
        string.find(v.Name, String) or v.Name:lower():match(String) or v.Name:upper():match(String) or
            string.find(v.DisplayName, String) or
            v.DisplayName:lower():match(String) or
            v.DisplayName:upper():match(String)
     then
        Character.HumanoidRootPart.CFrame= CFrame.new(v.Character.HumanoidRootPart.Position)
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
            Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
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
                for i, v in pairs(Character:GetChildren()) do
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
            for i, v in pairs(Character:GetChildren()) do
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
            Character.Humanoid:ChangeState(11)
        end
    end
)
mouse = Player:GetMouse()
Player:GetMouse().KeyDown:connect(
    function(v)
        if v == "g" then
            if Settings.Sex then
                noclip = not noclip
                Character.Humanoid:ChangeState(11)
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
                                wait(getgenv().delay2)
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

Character.HumanoidRootPart.CFrame =
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
                wait(getgenv().delay2)
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait(getgenv().delay2)
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, Player)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait(getgenv().delay2) do
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
while wait(getgenv().delay2) do
Save()
end end)
