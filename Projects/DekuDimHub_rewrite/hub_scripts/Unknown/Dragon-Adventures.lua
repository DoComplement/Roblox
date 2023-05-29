
-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/Games/Dragon-Adventures"

repeat wait() until game:IsLoaded()
local Table = {3475397644, 5391312853, 3752680052, 4174118306, 3475419198, 3475422608, 4601778915, 4869039553, 5777228223, 3623549100, 3737848045, 3487210751, 4728805070, 5777228223}
if not table.find(Table, game.PlaceId) then return end
repeat
    wait()
until game:IsLoaded()
wait()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local StarterGui = game:GetService("StarterGui")

local Player = Players.LocalPlayer
local wait = task.wait 
local spawn = task.spawn




local Config = {
    WindowName = "V.G Hub",
    Color = Color3.fromRGB(255, 128, 64),
    Keybind = Enum.KeyCode.RightControl
}

Player.Idled:connect(
    function()
        VirtualUser:ClickButton2(Vector2.new())
    end
)
repeat
    wait()
until Player.Character


local Settings = {}

local GetConnections = function(A, B)
    for i,v in pairs(getconnections(A[tostring(B)])) do
        v:Fire()
    end 
end 

Player.PlayerGui.NodeGui.BoostFrame.ChildAdded:Connect(
    function(v)
        if v:IsA("Frame") and v:FindFirstChild("ClickButton") then
            wait(0.5)
            GetConnections(v.ClickShadowButton,"MouseButton1Down") 
        end
    end
)


if Player.PlayerGui:FindFirstChild("IntroFrame") then
    local Eh = Player.PlayerGui.IntroGui.IntroFrame.PlayButton
    local VirtualUser = VirtualUser
    Eh.Size = UDim2.new(9e9, 9e9, 9e9, 9e9)
    wait(1)
    VirtualUser:ClickButton1(Vector2.new(9e9, 9e9))
    wait(1)
    Eh.Size = UDim2.new(0, 0, 0, 0)
end
local D = {"🕹️Player", "Guest"}

local function GetDragons()
    local Target
    for i, v in ipairs(Player.Character.Dragons:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChild("HumanoidRootPart") then
            Target = v
        end
    end
    return Target
end
if game.PlaceId ~= 5777228223 then
    pcall(
        function()
            ReplicatedStorage.Remotes.SpinWheelRemote:InvokeServer()
            ReplicatedStorage.Remotes.ClaimWheelRemote:FireServer()

            StarterGui:SetCoreGuiEnabled(1, true)
            StarterGui:SetCoreGuiEnabled(2, true)
            StarterGui:SetCoreGuiEnabled(3, true)
        end
    )
end
Worlds = {}
local Poop = require(ReplicatedStorage.Storage.Worlds.Worlds)
for i, v in pairs(Poop) do
    table.insert(Worlds, v.Name .. " " .. v.GameId)
end

function Invis()
    local Clone = Player.Character.LowerTorso.Root:Clone()
    Player.Character.LowerTorso.Root:remove()
    Clone.Parent = Player.Character.LowerTorso
end

getgenv().Text = Drawing.new("Text")
Text.Color = Color3.new(0, 1, 1)
Text.Font = 1
Text.Outline = true
Text.OutlineColor = Color3.new(0, 0, 0)
Text.Position = Vector2.new(30, Workspace.CurrentCamera.ViewportSize.Y - 100)
Text.Size = 25
Text.Text = ""
Text.Visible = true

Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(
    function()
        Text.Position = Vector2.new(20, Workspace.CurrentCamera.ViewportSize.Y - 100)
    end
)

spawn(
    function()
        while wait() do
            Text.Text = Player.Settings.CurrentFish.Value
        end
    end
)

function fuckyou()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site
        if foundAnything == "" then
            Site =
                HttpService:JSONDecode(
                game:HttpGet(
                    "https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100"
                )
            )
        else
            Site =
                HttpService:JSONDecode(
                game:HttpGet(
                    "https://games.roblox.com/v1/games/" ..
                        PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. foundAnything
                )
            )
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0
        for i, v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _, Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile =
                                pcall(
                                function()
                                    delfile("NotSameServers.json")
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end
                            )
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(
                        function()
                            writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs))
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, Player)
                        end
                    )
                    wait(4)
                end
            end
        end
    end

    function Teleport()
        while wait() do
            pcall(
                function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end
            )
        end
    end

    -- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
    Teleport()
end

for i, v in pairs(Players:GetPlayers()) do
    if not table.find(D, tostring(v:GetRoleInGroup(2919215))) then
        fuckyou()
    end
end
Players.PlayerAdded:Connect(
    function(v)
        if not table.find(D, tostring(v:GetRoleInGroup(2919215))) then
            fuckyou()
        end
    end
)

local OldNameCall
OldNameCall =
    hookmetamethod(
    game,
    "__newindex",
    function(A, B, ...)
        if not checkcaller() and (B == "WalkSpeed" or B == "JumpPower") then
            return
        end
        return OldNameCall(A, B, ...)
    end
)




healing = {}
for i, v in pairs(ReplicatedStorage.Storage.Items.Items.Healing:GetChildren()) do
    if v.ClassName == "ModuleScript" then
        r = require(v)
        for i, v in pairs(r) do
            table.insert(healing, i)
        end
    end
end

foods = {}
for i, v in pairs(ReplicatedStorage.Storage.Items.Items.Food:GetChildren()) do
    if v.ClassName == "ModuleScript" then
        g = require(v)
        for i, v in pairs(g) do
            table.insert(foods, i)
        end
    end
end
list = {}
for i, v in pairs(ReplicatedStorage.Storage.Items.Items.Food:GetChildren()) do
    if v.ClassName == "ModuleScript" then
        f = require(v)
        for i, v in pairs(f) do
            table.insert(list, i)
        end
    end
end
Dragon = {}
for i, v in pairs(Player.Data.Dragons:GetChildren()) do
    if v:FindFirstChild("Age") then
        table.insert(Dragon, v.Value)
    end
end

Player.Character.Humanoid.JumpPower = 50
Player.Character.Humanoid.WalkSpeed = 30

local Noclip = function()
    if Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid") then
        Player.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(11)
        Player.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(10)
        for i,v in pairs(Player.Character:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end 
        end 
    end 
end 
local deku1 = {"SolsticeFlares", "SolsticeBoxes"}
local deku = {"Food", "Magic", "Resources"}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, CoreGui)

local Tab1 = Window:CreateTab("Dragon Adventures")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("AutoFarms")
local Section2 = Tab1:CreateSection("Misc")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

if game.PlaceId == 5777228223 then

local Toggle1 = Section1:CreateToggle("Auto Easter Heavet ", Settings.Bake, function(State) 
local Sex = game:GetService("Workspace").Interactions.Nodes.Harvest.EventResources.ActiveNodes
Settings.Bake = State
Stepped:Connect(function()
    pcall(function()
        if Settings.Bake then
            NoClip2(Player.Character)
            for i,v in pairs(Player.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.velocity = Vector3.new(0,0,0)
                end 
            end 
        end 
    end)
end)

spawn(function()
    while wait() and Settings.Bake do
        pcall(function()
            for i,v in pairs(Sex:GetChildren()) do
                if v:IsA("Model") then
                    Player.Character:FindFirstChild("HumanoidRootPart").CFrame = v:GetModelCFrame() * CFrame.new(50, 200, 0)
                    Tween(Player.Character.PrimaryPart,
                        v:FindFirstChildWhichIsA("BasePart"),
                        200)
			Player.Character:FindFirstChild("HumanoidRootPart").CFrame = v:GetModelCFrame() * CFrame.new(0, 5, 0)
                    if Mag(v:GetModelCFrame(), Player.Character:GetModelCFrame()) < 15 and wait(3) then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    end 
                    
                    wait(20)
                end 
            end 
       end)
    end 
end)

end)

Toggle1:AddToolTip("FUCK YOU")
local Toggle1 = Section1:CreateToggle("Auto Chirstmas/easter egg farm", Settings.AutoEgg, function(State) 
Settings.AutoEgg = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.AutoEgg then
            pcall(
                function()
                    Noclip()
                end
            )
        end
    end
)
spawn(function()
while Settings.AutoEgg do
    wait()
    pcall(
        function()
            for i, v in pairs(Workspace.Interactions.Nodes.Harvest.EventEggs.ActiveNodes:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChildWhichIsA("BasePart") then
                         Player.Character.HumanoidRootPart.CFrame =
                        v:GetModelCFrame() * CFrame.new(40, 5, 0)
                    wait(1)
                    repeat wait()
                    Player.Character.Humanoid:MoveTo(
                        v:GetModelCFrame().Position
                    )
                    wait(3)
                    if Settings.AutoEgg == false then
                        break
                    end
                    VirtualInputManager:SendKeyEvent(true, "E", false, game)
                    until v == nil or Settings.AutoEgg == false or v.Harvested.Value == true and wait(6)
                end
            end
        end
    )
end
end)

end)
Toggle1:AddToolTip("Teleports to Eggs")
end 

if game.PlaceId == 3475397644 then

for i, v in pairs(Workspace.Interactions:GetDescendants()) do
    if v:IsA("TextLabel") and v.Name:match("Player")  then
        if
            v.Text ==
                Player.PlayerGui.WorkspaceGui[
                    Player.Name .. "_DisplayGui"
                ].ContainerFrame.NameLabel.Text 
         then
             Player.Character.HumanoidRootPart.CFrame = v.Parent.Parent.Parent.TeleportPart.CFrame

        end
    end
end


repeat
    wait()
until Workspace.Interactions.Plots.Plots[Player.Name .. "_Plot"]:WaitForChild(
    "Base"
)


ss1 = {}
for i, v in pairs(ReplicatedStorage.Storage.Items.Items.Eggs:GetChildren()) do
          if v.ClassName == "ModuleScript" then
       f = require(v)
        for i,v in pairs(f) do
        table.insert(ss1, i)
        end
    end
end





local Toggle1 = Section1:CreateToggle("Auto Incubate Eggs", Settings.Incubate, function(State) 
Settings.Incubate = State
spawn(function()
while Settings.Incubate do
    wait()
    for i, v in pairs(
        Workspace.Interactions.Plots.Plots[Player.Name .. "_Plot"].Base.Buildings:GetDescendants(

        )
    ) do
        if v.Name == "Incubator" then
            if not v:FindFirstChild("Egg") then
                v.IncubateRemote:InvokeServer(Settings.Egg)
            end
            if v:FindFirstChild("Egg") then
                v.ClaimRemote:InvokeServer()
            end
        end
    end
end

end)
end)

local Dropdown1 = Section1:CreateDropdown("Eggs", ss1, function(String)
    Settings.Egg = String
end)

local Button1 = Section1:CreateButton("Clear Base", function()
Workspace.Interactions.Plots.Plots[Player.Name.."_Plot"].DeleteAllRemote:FireServer()
end)


local Button1 = Section1:CreateButton("GoTo Base", function()
for i, v in pairs(Workspace.Interactions:GetDescendants()) do
    if v:IsA("TextLabel") and v.Name:match("Player")  then
        if
            v.Text ==
                Player.PlayerGui.WorkspaceGui[
                    Player.Name .. "_DisplayGui"
                ].ContainerFrame.NameLabel.Text 
         then
             firetouchinterest(Player.Character.HumanoidRootPart, v.Parent.Parent.Parent.TeleportPart, 0)

        end
    end
end
end)

local Button1 = Section1:CreateButton("Sell All Foods", function()
    for i, v in pairs(Player.Data.Resources:GetChildren()) do
        if table.find(foods,v.Name) and v.Value ~= 0 then wait(0.5)
            ReplicatedStorage.Remotes.SellItemRemote:FireServer(
                {["Amount"] = v.Value, ["ItemName"] = v.Name}
            )
        end
    end
end)




local Toggle1 = Section1:CreateToggle("Alchemy AutoFarm", Settings.Alchemy, function(State) 
Settings.Alchemy = State
spawn(
    function()
        while wait() and Settings.Alchemy do
            for i, v in pairs(Player.Data.Resources:GetChildren()) do
                if v.Name == Settings.AlchemyFoods and v.Value ~= 0 then
                    ReplicatedStorage.Remotes.RecycleResourceRemote:InvokeServer(Settings.AlchemyFoods == Settings.AlchemyFoodsamount)
                end
            end
        end
    end
)

end)

local Dropdown1 = Section1:CreateDropdown("Alchemy Foods",foods, function(String)
    Settings.AlchemyFoods = String
end)

local Dropdown1 = Section1:CreateDropdown("Alchemy Foods Amount",{1,5,10,15,20,25,50,75,100}, function(String)
    Settings.AlchemyFoodsamount = String
end)
Dropdown1:SetOption(tostring(1))

end



local Toggle1 = Section1:CreateToggle("Autocollect", nil, function(State)
Settings.AutoCollect = State

game:GetService("RunService").Stepped:connect(
    function()
        if Settings.AutoCollect then
            pcall(
                function()
                    Noclip()
                end
            )
        end
    end
)
spawn(function()
while Settings.AutoCollect do
    wait()
    pcall(
        function()
            for i, v in pairs(Workspace.Interactions.Nodes.Harvest[Settings.CollectionItem].ActiveNodes:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChildWhichIsA("BasePart") and Settings.AutoCollect then
                    Player.Character.HumanoidRootPart.CFrame =
                        v:FindFirstChildWhichIsA("BasePart").CFrame * CFrame.new(40, 5, 0)
                    wait(1)
                    repeat wait()
                    Player.Character.Humanoid:MoveTo(
                        v:FindFirstChildWhichIsA("BasePart").Position
                    )
                    wait(3)
                    VirtualInputManager:SendKeyEvent(true, "E", false, game)
                    until v == nil or Settings.AutoCollect == false or v:FindFirstChild("Harvested").Value == true and wait(6)
                end
            end
        end
    )
end
end)
end)



local Dropdown1 = Section1:CreateDropdown("Collection Item", deku, function(String)
    Settings.CollectionItem = String
end)

local Toggle1 = Section1:CreateToggle("Auto Egg", Settings.AutoEgg, function(State) 
Settings.AutoEgg = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.AutoEgg then
            pcall(
                function()
                    Noclip()
                end
            )
        end
    end
)
spawn(function()
while Settings.AutoEgg do
    wait()
    pcall(
        function()
            for i, v in pairs(Workspace.Interactions.Nodes.Harvest.Eggs.ActiveNodes:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChildWhichIsA("BasePart") then
                         Player.Character.HumanoidRootPart.CFrame =
                        v:FindFirstChildWhichIsA("BasePart").CFrame * CFrame.new(40, -3, 0)
                    wait(1)
                    repeat wait()
                    Player.Character.Humanoid:MoveTo(
                        v:FindFirstChildWhichIsA("BasePart").Position
                    )
                    wait(3)
                    if Settings.AutoEgg == false then
                        break
                    end
                    VirtualInputManager:SendKeyEvent(true, "E", false, game)
                    until v == nil or Settings.AutoEgg == false or v.Harvested.Value == true and wait(6)
                end
            end
        end
    )
end
end)

end)
Toggle1:AddToolTip("Teleports to Eggs")

local Toggle1 = Section1:CreateToggle("Auto Fishing", Settings.AutoFish, function(State)
Settings.AutoFish = State
spawn(
    function()
        while Settings.AutoFish do
            wait()
            pcall(function()
            local Fish = require(ReplicatedStorage["_replicationFolder"].FishingClient)

            local StartCasting = Fish.StartCasting
            local Click = Fish.Click
            StartCasting(Fish, StartCasting)

            if Fish.Snagged == true then
                Fish.ReelSignal:Fire()

                if
                    Player.PlayerGui.FishingGui.ContainerFrame.ReelingFrame.BarLabel.InnerLabel.PointerLabel.Position.X.Scale <=
                        Player.PlayerGui.FishingGui.ContainerFrame.ReelingFrame.BarLabel.InnerLabel.SafeBarLabel.Position.X.Scale +
                            .02
                 then
                    Click(Fish, Fish.Click)
                end
            end
            end)
        end
    end
)

end) 
Toggle1:CreateKeybind("T", function(Key)
end)

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()



local Button1 = Section1:CreateButton("Equip Selected Dragon", function()
for i,v in pairs(Player.Data.Dragons:GetDescendants()) do
if  v.ClassName == 'StringValue' and  v.Value == Settings.Dragon and v:FindFirstChild("Stats") then 
ReplicatedStorage.Remotes.EquipDragonRemote:InvokeServer(v.Name)
end end 
end) 




local Dropdown1 = Section1:CreateDropdown("Dragons", Dragon, function(String)
    Settings.Dragon = String
end)


local Button1 = Section1:CreateButton("Delete Selected Dragon Speice", function()
for i,v in pairs(Player.Data.Dragons:GetDescendants()) do
if  v.ClassName == 'StringValue' and  v.Value == Settings.DeleteDragon and v:FindFirstChild("Stats") then 
ReplicatedStorage.Remotes.DeleteDragonRemote:InvokeServer(v.Name)
end end 
end) 



local Dropdown1 = Section1:CreateDropdown("Delete Dragons", Dragon, function(String)
    Settings.DeleteDragon = String
end)

local Button1 = Section1:CreateButton("UnEquip All Dragons", function()
for i, v in pairs(Player.Character.Dragons:GetDescendants()) do
    if v.ClassName == "Model" and v:FindFirstChild("ID") then
        ReplicatedStorage.Remotes.UnequipDragonRemote:InvokeServer(v.Name)
    end
end
end)

local Toggle1 = Section1:CreateToggle("Auto Feed Dragon", Settings.AutoFeed, function(State) 
Settings.AutoFeed = State
spawn(function()
while Settings.AutoFeed do wait()
        if Settings.AutoFeed then
            pcall(
                function()
                    for i, v in pairs(Player.Character.Dragons:GetChildren()) do
                        if v.ClassName == "Model" and v:FindFirstChild("ID") then
                            ReplicatedStorage.Remotes.FeedDragonRemote:InvokeServer(
                                v.Name,
                                {["Amount"] = 1, ["ItemName"] = list}
                            )
                        end
                    end
                end
            )
        end
    end
end)
end)
local Dropdown1 = Section1:CreateDropdown("Food Items",list, function(String)
    list = String
end)
local Toggle1 = Section1:CreateToggle("Auto grow Dragons", Settings.AutoGrow, function(State) 
Settings.AutoGrow = State
spawn(function()
while Settings.AutoGrow do wait()
        if Settings.AutoGrow then
            pcall(
                function()
                    for i, v in pairs(Player.Character.Dragons:GetDescendants()) do
                        if v.ClassName == "Model" and v:FindFirstChild("ID") then
                            ReplicatedStorage.Remotes.GrowDragonRemote:InvokeServer(tostring(v.Name))
                        end
                    end
                end
            )
        end
    end
end)
end)
local Toggle1 = Section1:CreateToggle("Auto Heal Dragons", Settings.AutoHeal, function(State) 
Settings.AutoHeal = State
spawn(function()
while Settings.AutoHeal do wait(0.1)
        if Settings.AutoHeal then
            pcall(
                function()
                    for i, v in pairs(Player.Character.Dragons:GetChildren()) do
                        if v.ClassName == "Model" and v:FindFirstChild("ID") then
                            ReplicatedStorage.Remotes.HealDragonRemote:InvokeServer(
                                tostring(v.Name),
                                healing
                            )
                        end
                    end
                end
            )
        end
end
end)
end)



local Dropdown1 = Section1:CreateDropdown("Healing Items", healing, function(String)
    Settings.HealingItem = String
end)


local Toggle1 = Section1:CreateToggle("Auto Invis", Settings.AutoInvis, function(State)
Settings.AutoInvis = State
Invis()
Player.CharacterAdded:Connect(function()
if Settings.AutoInvis then
repeat wait() until Player.Character wait(3)
Invis() end end)
end)



local Label1 = Section2:CreateLabel("World Teleports")
local Button1 = Section2:CreateButton("Teleport to Selected World", function()
for i,v in pairs(Poop) do
if string.find(Worlds,v.GameId) then
ReplicatedStorage.Remotes.WorldTeleportRemote:InvokeServer(v.GameId,{})
end end 
end)


local Dropdown1 = Section2:CreateDropdown("Worlds",Worlds, function(String)
    Worlds = String
end)

local Toggle1 = Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
Settings.Go = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.Go then
            Player.Character:WaitForChild("Humanoid").WalkSpeed = Settings.WalkSpeed
            Player.Character:WaitForChild("Humanoid").JumpPower = Settings.JumpPower
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



local Toggle1 = Section2:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State
    ESP:Toggle(Settings.Esp)
end)
if game.PlaceId ~= 5777228223 then
local Toggle1 = Section2:CreateToggle("Egg Esp", Settings.EggEsp, function(State) 
ESP:AddObjectListener(Workspace.Interactions.Nodes.Harvest.Eggs.ActiveNodes, {
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
        return not Players:GetPlayerFromCharacter(v)
    end,
    CustomName = function(v)
        return  "Egg"
    end,
    IsEnabled = "Egg",
})
Settings.EggEsp = State
ESP.Egg = Settings.EggEsp
end)
end 

local Toggle1 = Section2:CreateToggle("Player Esp", Settings.PlayerEsp, function(State)
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

local Toggle1 = Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
Settings.InfiniteJump = State
game:GetService("UserInputService").JumpRequest:connect(
    function()
        if Settings.InfiniteJump then
            Player.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState("Jumping")
        end
    end
)
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
game:GetService("RunService").Stepped:connect(
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

local Toggle1 = Section2:CreateToggle("J Noclip", Settings.Sex, function(State)
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
        if v == "j" then
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
        Site = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
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
