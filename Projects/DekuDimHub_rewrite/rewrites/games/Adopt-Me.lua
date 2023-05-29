
--"https://raw.githubusercontent.com/1201for/V.G-Hub/main/Games/Adopt-Me

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=920587237 or nil~=getgenv()["AnIN.1mb!)=:zU-Bb3.m"])then return end;
getgenv()["AnIN.1mb!)=:zU-Bb3.m"] = true;

local Mouse = Player:GetMouse();
if(nil~=getConnections)then
	for _,con in ipairs(Player.Idled)do
		con:Disable();
	end;
else
	local VirtualUser = game:GetService("VirtualUser");
	Player.Idled:Connect(function()
		wait(math.random(15,33));
		
		VirtualUser:CaptureController();
		VirtualUser:ClickButton2(Vector2.new(Mouse.X,Mouse.Y),Workspace.Camera);
	end);
end;

repeat wait()until Player.PlayerGui:FindFirstChild("PlayButton",true);
do
	local function f()
		if Player.PlayerGui:FindFirstChild("NewsApp",true).Enabled then
			for i,v in ipairs(getConnections(Player.PlayerGui:FindFirstChild("PlayButton",true).MouseButton1Click)) do
				v:Fire()
			end
		end
		if Player.PlayerGui:FindFirstChild("ChooseParent",true) then
			for i,v in ipairs(getConnections(Player.PlayerGui:FindFirstChild("ChooseParent",true).MouseButton1Click)) do
				v:Fire()
			end
		end
		if(nil~=Workspace:FindFirstChild("ServerSidedMapSeats"))then
			Workspace.ServerSidedMapSeats:Destroy();
		end;
	end;
	RunService.Stepped:Connect(function()pcall(f)end);
end;

local pets = require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.pets;
local ButtonTemplate = Player.PlayerGui.DialogApp.Dialog.NormalDialog.Buttons.ButtonTemplate;

local Set = setfpscap
local getupvalue = getupvalue or debug.getupvalue
local getconstant = getconstant or debug.getconstant
local getconstants = getconstants or debug.getconstants
local getgc = getgc or get_gc_objects or debug.getgc
local getreg = getreg or getregistry or debug.getregistry
local get_thread_context = get_thread_context or getthreadcontext or getidentity or syn.get_thread_identity
local get_thread_identity = get_thread_context
local set_thread_context = set_thread_context or setthreadcontext or setidentity or syn.set_thread_identity
local set_thread_identity = set_thread_context

local Remotes = {};
local Table = {6152116144, 185655149};
local Inventorys = ReplicatedStorage.ClientDB.Inventory
local InventoryGiftsSubDB = require(Inventorys.InventoryGiftsSubDB);

local character = (Player.Character or Player.CharacterAdded:Wait());
if(not character.PrimaryPart)then
    character:GetPropertyChangedSignal("PrimaryPart"):Wait();
end;

local rootPart,humanoid = character.PrimaryPart,character.Humanoid;
Player.CharacterAdded:Connect(function(Char)
    Char:GetPropertyChangedSignal("PrimaryPart"):Wait();
    character,rootPart,humanoid = Char,Char.PrimaryPart,Char.Humanoid;
end);

local FireServer = Instance.new("RemoteEvent").FireServer;
local InvokeServer = Instance.new("RemoteFunction").InvokeServer;

local Baths = {
    "StylishShower",
    "CheapBathtub",
    "ModernShower",
    "Bathtub",
    "GingerbreadShower",
    "HotTub"
}

local FreeFoods = {
    "ham_vip",
    "water_vip",
    "chocolate_milk_vip",
    "popcorn_vip",
    "marshmallow_on_a_stick",
    "healing_apple",
    "teachers_apple",
}

local Beds = {
    "FancyPetBed",
    "ModernPetBed",
    "CircularPetBed",
    "RectangularPetBed",
    "NormalCrib",
    "BasicCrib",
    "RoyalCrib",
    "PoshCrib",
}
local Tasks = {
    "hungry",
    "sleepy",
    "thirsty",
    "bored",
    "dirty",
    "camping",
    "sick",
    "school",
    "pool_party",
    "salon",
    "pizza_party"
}


local Eggs = {
    "cracked_egg",
    "regular_pet_egg",
    "royal_egg",
    "retired_egg",
    "seasia_2023_egg"
}

local gifts = {
    "smallgift",
    "biggift",
    "massivegift",
    "legend_hat_2022_simple_chest",
    "legend_hat_2022_regal_chest"
}
local Obbys = {
    "miniworld",
    "coastal_climb",
    "shipwreck_bay",
    "ancient_ruins",
    "lonelypeak",
    "pyramid",
    "tinyisles"
}

local PP = {}

local Part = Instance.new("Part")
Part.Name = "P"
Part.Size = Vector3.new(9e9,0,9e9)
Part.Anchored = true
Part.Transparency = 0.5
Part.CFrame = CFrame.new(5000,5000,5000)
Part.Parent = Workspace

local Location = nil
for i, v in ipairs(getgc())do
    if(type(v)=="function"and getfenv(v).script == ReplicatedStorage.ClientModules.Core.InteriorsM.InteriorsM and nil~=table.find(getconstants(v), "LocationAPI/SetLocation"))then
		repeat wait()until v~=nil;
		Location = v;
		break;
    end;
end;

local SetLocation = function(A, B, C)
    local O = get_thread_identity();
    set_thread_identity(2);
    Location(A, B, C);
    set_thread_identity(O);
end;

local Home = function()
	local tmp = Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model")
	if(nil~=tmp)then return(tmp.Name)end;
	return(false);
end;

local Store = function()
	local tmp = Workspace.Interiors:FindFirstChildWhichIsA("Model") 
	
	if(not(tmp)or(tmp.Name:match("MainMap")and tmp.Name:match("Neighborhood"))~=nil)then
		return false;
	end;
	return tmp.Name;
end;

local MainMap = function()
	local tmp = Workspace.Interiors:FindFirstChildWhichIsA("Model");
	
	if(not(tmp and tmp.Name:match("MainMap")))then
		return false;
	end;
	return tmp.Name;
end;

local Neighborhood = function()
	local tmp = Workspace.Interiors:FindFirstChildWhichIsA("Model");
	if(not(tmp and tmp.Name:match("Neighborhood")))then
        return false;
    end;
	return tmp.Name;
end

local GoToStore = function(Name)
    if(Store()==Name)then
        return true;
    end;

    SetLocation(Name, "MainDoor", {});
    while(Store()~=Name)do wait()end;
	return(Home());
end;

local GoToHome = function()
    SetLocation("housing", "MainDoor", {["house_owner"] = Player});
    while(not Home())do wait()end
    return(Home());
end;

local GoToNeighborhood = function()
    SetLocation("Neighborhood", "MainDoor", {});
    while(not Neighborhood())do wait()end
    return(Neighborhood());
end;

local GoToMainMap = function()
    SetLocation("MainMap", "Neighborhood/MainDoor", {})
    while(not MainMap())do wait()end
    return(MainMap());
end;

local GoToPersonsHouse = function(Name)
    SetLocation("housing","MainDoor",{["house_owner"] = Players[Name]});
    while(not Home())do wait()end;
    return(Home());
end;

local Bed = function()
    GoToHome();
	local tmp = nil;
    for i, v in ipairs(Workspace.HouseInteriors.furniture:GetChildren())do
		tmp = v:FindFirstChildWhichIsA("Model");
        if(nil~=(tmp and table.find(Beds, tmp.Name)))then
            return(string.split(v.Name,"true/")[2]);
        end;
    end;
end;

local Cash = nil;
do
	local stiffy = {
    "CashRegister",
    "GoldenCashRegister"
	}
	Cash = function()
		local tmp = nil;
		for i, v in pairs(Workspace.HouseInteriors.furniture:GetChildren()) do
			tmp = v:FindFirstChildWhichIsA("Model");
			if(nil~=(tmp and table.find(stiffy, tmp.Name)))then
				return string.split(v.Name,"true/")[2];
			end;
		end;
	end;
end;

local Showers = function(Name)
    GoToHome();
	local tmp = nil;
    for i, v in pairs(Workspace.HouseInteriors.furniture:GetChildren())do
		tmp = v:FindFirstChildWhichIsA("Model");
		if(nil~=(tmp and table.find(Baths, tmp.Name)))then
            return string.split(v.Name,"true/")[2];
        end;
    end;
end;

local AilmentFurnitues = {}
local Neon = {}
local Spec = {}
local Key = {}
local PetID
local Pet
local PetsShow = {}
local List = {}
local JoJo = {}
local GGO = {}


for i, v in next,pets do
    local key = tostring(v.id) .. " - " .. tostring(v.properties.age) .. " years old"
    if not table.find(List, Key) then
        print(key)
        PetsShow[key] = v
        table.insert(List, key)
        table.sort(List)
    end
end
for i, v in pairs(pets) do
    if not table.find(JoJo,tostring(v["id"])) then
        local Key2 = tostring(v["id"])
        GGO[Key2] = v
        table.insert(JoJo,Key2)
        table.sort(JoJo)
    end
end

UserInputService.WindowFocusReleased:Connect(function()
    if(not Render)then return end;
    RunService:Set3dRenderingEnabled(false);
    if(not table.find(Table, game.PlaceId))then
        Set(15);
    else
        Set();
    end;
end);

UserInputService.WindowFocused:Connect(function()
    if(Render)then
        RunService:Set3dRenderingEnabled(true);
        Set(100);
    end;
end);

for idx,val in next,getupvalue(require(ReplicatedStorage.Fsys).load("RouterClient").init, 4)do
    val.Name = idx;
end;

pcall(InvokeServer, ReplicatedStorage.API:FindFirstChild("DailyLoginAPI/ClaimDailyReward"));

if(Key~=nil)then
    PetID = Key.unique;
    Pet = grabPet(PetID);
end;

local Ailments = Player.PlayerGui.AilmentsMonitorApp.Ailments;
local Unequip = ReplicatedStorage.API["ToolAPI/Unequip"];
local Equip = ReplicatedStorage.API["ToolAPI/Equip"];
local ActivateFurniture = ReplicatedStorage:FindFirstChild("HousingAPI/ActivateFurniture",true);
local BuyItem = ReplicatedStorage:FindFirstChild("ShopAPI/BuyItem",true);
local BakeItem = ReplicatedStorage:FindFirstChild("ToolAPI/BakeItem",true);
local CreatePetObject = ReplicatedStorage:FindFirstChild("PetObjectAPI/CreatePetObject",true);
local ConsumeFoodItem = ReplicatedStorage:FindFirstChild("PetAPI/ConsumeFoodItem",true);
local HealWithDoctor = ReplicatedStorage:FindFirstChild("MonitorAPI/HealWithDoctor",true);
local ChooseTeam = ReplicatedStorage.API["TeamAPI/ChooseTeam"];

local function grabPet(id)
    InvokeServer(Unequip,PetID);
    return InvokeServer(Equip,id);
end;

local function consume_it(id)
    InvokeServer(CreatePetObject, "__Enum_PetObjectCreatorType_2", {unique_id = id})
    FireServer(ConsumeFoodItem, id);
end;

local a = {};
do
    local function sleepy(c)
        while(wait(3)and PetFarm and c.Parent==Ailments)do
            print(Pet);
            InvokeServer(ActivateFurniture, Player, Bed(), "UseBlock", {cframe = rootPart.CFrame}, Pet);
        end
    end;
    a.sleepy = function(c)
        task.defer(sleepy,c);
        c.AncestryChanged:Wait();
        Pet = grabPet(PetId);
    end;
end;

a.dirty = function(c)
    while c.Parent == Ailments and wait(3) do
        wait();
        InvokeServer(ActivateFurniture, Player, Showers(), "UseBlock", {cframe = rootPart.CFrame}, Pet);
    end
    Pet = grabPet(PetID);
end;

a.hungry = function(c)
    
    InvokeServer(BuyItem, "food", "pizza", {});
    InvokeServer(BakeItem);
    
    while Player.Character:FindFirstChild("PizzaTool") do wait() end
    while not Player.Character:FindFirstChild("PizzaTool") do wait() end
    
    for i,v in next,require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food or {}do
        if(v.id=="pizza")then
            wait(2);
            consume_it(v.unique);
            c.AncestryChanged:Wait();
            return;
        end
    end
end;

a.thirsty = function(c)
    InvokeServer(BuyItem, "food", "tea", {});
    local Tea
    for i, v in next,require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.food or {}do
        if(v.id=="tea")then
            wait(2);
            consume_it(v.unique);
            c.AncestryChanged:Wait();
            return;
        end;
    end;
end;

a.sick = function(c)
    repeat wait()FireServer(HealWithDoctor);
    until c.Parent ~= Ailments
end;

a.adoption_party = function(c)
    GoToStore("Nursery");
    c.AncestryChanged:Wait();
end;

a.school = function(c)
    GoToStore("School");
    c.AncestryChanged:Wait();
end;

a.pizza_party = function(c)
    GoToStore("PizzaShop");
    c.AncestryChanged:Wait();
end;

a.salon = function(c)
    GoToStore("Salon");
    c.AncestryChanged:Wait();
end;

do
    local CF = CFrame.new(Workspace.StaticMap.Pool.PoolOrigin.Position + Vector3.new(0, 5, 0))
    a.pool_party = function(c)
        GoToMainMap()
        rootPart.CFrame = CF;
        c.AncestryChanged:Wait();
    end;
end;

do
    local CF = CFrame.new(Workspace.StaticMap.Campsite.CampsiteOrigin.Position + Vector3.new(0, 5, 0));
    a.camping = function(c)
        GoToMainMap()
        rootPart.CFrame = CF;
        c.AncestryChanged:Wait();
    end;
end;

do
    local CF = CFrame.new(Workspace.StaticMap.Park.AilmentTarget.Position + Vector3.new(0, 5, 0));
    a.bored = function(c)
        GoToMainMap()
        rootPart.CFrame = CF;
        c.AncestryChanged:Wait();
    end;
end;





local Library = assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/Library.lua")),"error loading linorial lib")();
local ThemeManager = assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/ThemeManager.lua")),"error loading linorial lib ThemeManager")();
local SaveManager = assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/SaveManager.lua")),"error loading linorial lib SaveManager")();

local Window = Library:CreateWindow({
    Title = MarketplaceService:GetProductInfo(game.PlaceId).Name,
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab("Main"), 
    Misc = Window:AddTab("Misc"),
    Events = Window:AddTab("Events"),
    ["UI Settings"] = Window:AddTab("UI Settings"),
}

local LeftGroupBox = Tabs.Main:AddLeftGroupbox("AutoFarms")
local LeftGroupBox2 = Tabs.Main:AddLeftGroupbox("Quick Helper")
local RightGroupBox = Tabs.Main:AddRightGroupbox("Quick Misc")
local RightGroupBox2 = Tabs.Main:AddRightGroupbox("Teleports")

local LeftBox = Tabs.Misc:AddLeftGroupbox("Groupbox")
local RightBox = Tabs.Misc:AddRightGroupbox("Groupbox")

local LeftEventGroupBox = Tabs.Events:AddLeftGroupbox("AutoFarms")

local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")

do
    local AddAddative = ReplicatedStorage.API["MonitorAPI/AddAdditive"];
    LeftGroupBox:AddToggle("BabyFarm", {Text = "BabyFarm", Default = false,Tooltip = ""}):OnChanged(function(State)
        BabyFarm = State;
        
        if(State)then
            InvokeServer(ChooseTeam, "Babies", true);
            while(BabyFarm)do
                for i,v in ipairs(Ailments:GetChildren())do
                    wait(0.1);
                    FireServer(AddAddative, v.Name, math.random(100));
                end;
                wait(1);
            end;
        else
            InvokeServer(ChooseTeam, "Parents", true);
        end;
    end);
end;

do
    local function d(root)
        if(nil~=(root and root:FindFirstChild("Root")))then
            root.Root:Destroy();
        end;
    end;
    
    RightGroupBox:AddToggle("AutoInvis", {Text = "Auto Invis", Default = false,Tooltip = ""}):OnChanged(function(State)
        Invis = State;
        while(wait()and Invis)do
            d(character:FindFirstChild("LowerTorso"));
        end;
    end);
end;

RightGroupBox:AddToggle("S3FDH", {Text = "Auto Egg hunt", Default = false,Tooltip = ""}):OnChanged(function(State)
    Test = State;
    
    while(wait()and Test)do
       for _,child in ipairs(Workspace.EggHuntEggs:GetChildren())do
            if("Model"==child.ClassName)then
                rootPart.CFrame = child:GetModelCFrame();
            end;
       end;
   end;
end);

RunService.RenderStepped:Connect(function()
    if(Hoe)then humanoid:ChangeState(11)end;
end);
RightGroupBox:AddToggle("SFDH", {Text = "Auto Spring Fest", Default = false,Tooltip = ""}):OnChanged(function(State)
    Hoe = State;
    while(wait()and Hoe)do
        local str1 = (require(ReplicatedStorage.ClientModules.Game.InteriorHelpers.FashionMinigameInterior).get_join_timer_display_string_now():gsub('%d',''))
        local str2 = (require(ReplicatedStorage.ClientModules.Game.InteriorHelpers.FurnitureMinigameInterior).get_join_timer_display_string_now():gsub('%d',''))
        if(str2 < str1)then
            GoToStore("FurnitureMinigame");
            rootPart.CFrame = Workspace.Interiors.FurnitureMinigame.Minigame.JoinZone.Collider.CFrame;
        elseif(str1 < str2)then
            GoToStore("FashionMinigame");
            rootPart.CFrame = Workspace.Interiors.FashionMinigame.Minigame.JoinZone.Collider.CFrame;  
        end;
    end 
end)

RightGroupBox:AddToggle("CPU", {Text = "CPU Usage Improver", Default = false,Tooltip = ""}):OnChanged(function(State)Render = State end);

do
    local con = nil;
    local function check(part)
        if(part:IsA("BasePart"))then
            part.Transparency = 1;
        end;
    end;
    
    RightGroupBox:AddToggle("Hide", {Text = "Low Render", Default = false,Tooltip = ""}):OnChanged(function(State)
        Hide = State;

        if(Hide)then
            for _,part in ipairs(Workspace.Interiors:GetDescendants())do
                check(part);
            end;

            con = Workspace.Interiors.DescendantAdded:Connect(check);
        else
            con:Disconnect();
        end;
    end)
end;

do
    local con = nil;
    local check = function()
        for _ = 1,50 do
            InvokeServer(ChooseTeam, "Babies", true);
        end;
    end;
    RightGroupBox:AddToggle("Crash", {Text = "Crash Server", Default = false,Tooltip = ""}):OnChanged(function(State)
        Crash = State;
        if(State)then
            con = RunService.RenderStepped:Connect(check);
        else
            con:Disconnect();
        end;
    end);
end;

do
    local Body = Player.PlayerGui.QuestApp.Board.Body.Contents.ScrollingFrame.QuestTemplate.Body;
    local ClaimQuest = ReplicatedStorage.API:FindFirstChild("QuestAPI/ClaimQuest");
    
    LeftGroupBox:AddToggle("FK", {Text = "Auto Claim Quest", Default = false,Tooltip = ""}):OnChanged(function(State)
        FK = State;
        while(wait()and FK)do 
            InvokeServer(ClaimQuest, tostring(Body:GetAttribute("QuestId")));
        end;
    end);
end;

do
    local Neons = {}
    local DoNeonFusion = ReplicatedStorage.API:FindFirstChild("PetAPI/DoNeonFusion");
    
    LeftGroupBox:AddToggle("Neon", {Text = "Auto Neon", Default = false,Tooltip = ""}):OnChanged(function(State)
        Neon = State;
        while Neon and wait() do
            local N = 0
            for i,v in next,pets do
                local Old = v.id;
                if(nil~=Old:match(v.id)and v.properties.age==6)then
                    N = N + 1;
                    Neons[#Neons + 1] = v.unique;
                    if(N==4)then
                        InvokeServer(DoNeonFusion,Neons);
                        table.clear(Neons);
                        N = 0;
                    end;
                end;
            end;
        end;
    end);
end;
        
LeftGroupBox:AddDropdown("Pets", {Values = List, Default = 1, Multi = false, Text = "Pets", Tooltip = ""}):OnChanged(function(State)Key = PetsShow[State]end);

RunService.RenderStepped:Connect(function()
    if(PetFarm)then
        Workspace.P.CFrame = rootPart.CFrame * CFrame.new(Vector3.new(0,-5,0));
        NoClip(humanoid);
    end;
end);

do
    local doof = function()
        while(wait(20)and PetFarm and Refresh)do
            Pet = grabPet(PetID);
        end;
    end;
    LeftGroupBox:AddToggle("Pet", {Text = "PetFarm", Default = false,Tooltip = ""}):OnChanged(function(State)
        PetFarm = State;
        if(not State)then return end;
        
        task.defer(doof);
        while(wait()and PetFarm)do
            local Ailment = Ailments:FindFirstChildWhichIsA("Frame");
            if(nil~=(Ailment and a[Ailment.Name]))then
                a[Ailment.Name](Ailment);
            end;
            if(not Pet or Pet.Parent~=Workspace.Pets)then
                Pet = grabPet(PetID);
            end;
        end;
    end);
end;

LeftGroupBox:AddToggle("SwitchOut", {Text = "SwitchOutFullyGrown", Default = false,Tooltip = ""}):OnChanged(function(State)
    SwitchOutFullyGrown = State;
    while(SwitchOutFullyGrown)do
        repeat wait()until PetFarm;
        local Pets = pets or {};
        if(nil~=Pets[tostring(PetID)]and Pets[PetID].properties.age~=6)then continue end;
        for _,pet in next,Pets do
            if(pet.properties.age~=6)then
                PetID = pet.unique;
            end;
        end;
    end;
end);

LeftGroupBox:AddToggle("SwitchOutEgg", {Text = "SwitchOutEgg", Default = false,Tooltip = ""}):OnChanged(function(State)
    SwitchOutEgg = State;
    while(SwitchOutEgg)do
        repeat wait()until PetFarm
        local Pets = pets or {};
        if(nil~=Pets[tostring(PetID)]and(nil~=Pets[PetID].id:match("egg")and not Pets[PetID].id:match("basic_egg")))then
            continue;
        end;
        for i, v in pairs(Pets) do
            if(nil~=v.id:match("egg")and not v.id:match("basic_egg"))then
                PetID = v.unique;
            end;
        end;
    end;
end);

LeftGroupBox:AddToggle("Species", {Text = "Switch Out Pet Species", Default = false,Tooltip = ""}):OnChanged(function(State)
    True = State;

    StarterGui:SetCore("SendNotification",{
        Title = "Warning",
        Text = "PetFarm must be off when turning this on "
    });
    while(True)do
        repeat wait()until PetFarm
        local Pets = pets or {};
        if(nil~=Pets[tostring(PetID)]and Pets[PetID].properties.age~=6)then
            continue;
        end;
        for _,pet in net,Pets do
            if(pet.properties.age~=6)then
                PetID = pet.unique;
            end;
        end;
    end;
end);

LeftGroupBox:AddToggle("Heal", {Text = "Heal Others", Default = false,Tooltip = ""}):OnChanged(function(State)
    HealOthers = State;
    while(wait(2)and HealOthers)do
        FireServer(HealWithDoctor);
    end;
end);

do
    local CreateFamily = ReplicatedStorage.API["FamilyAPI/CreateFamily"];
    local LeaveFamily = ReplicatedStorage.API["FamilyAPI/LeaveFamily"];
    
    RightGroupBox:AddToggle("Family", {Text = "No Baby Pick Up", Default = false,Tooltip = ""}):OnChanged(function(State)
        Family = State;
        if(Family)then
            InvokeServer(CreateFamily);
        else
            InvokeServer(LeaveFamily);
        end;
    end);
end;

RightGroupBox:AddToggle("Family3", {Text = "Auto Fly Pets", Default = false,Tooltip = ""}):OnChanged(function(State)end);                   -- not yet implemented
RightGroupBox:AddToggle("FWdsd", {Text = "Auto Buy Eggs", Default = false,Tooltip = ""}):OnChanged(function(State)
    Loll = State;
        while(wait(1)and Loll)do
            InvokeServer(BuyItem,"pets",Egg,{});
        end;
    end);
end);

RightGroupBox:AddToggle("FWdsd2", {Text = "Auto Buy Gifts", Default = false,Tooltip = ""}):OnChanged(function(State)
    Lol2 = State;
    while(wait(1)and Lol2)do
        InvokeServer(BuyItem,"gifts",Gifts,{});
    end;
end);

do
    local OpenGift = ReplicatedStorage.API:FindFirstChild("ShopAPI/OpenGift")
    LeftGroupBox2:AddToggle("FW44dsd", {Text = "Auto Open Gifts", Default = false,Tooltip = ""})
    Toggles.FW44dsd:OnChanged(function(State)
        System = State;
        while(wait(2)and System)do
            for _,gift in next,require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.gifts or {}do
                InvokeServer(Equip, gift.unique);
                InvokeServer(OpenGift, gift.unique);
            end;
        end;
    end);
end;

RightGroupBox:AddDropdown("Eggs", {Values = Eggs, Default = 1, Multi = false, Text = "Eggs", Tooltip = ""}):OnChanged(function(State)Egg = State end);
RightGroupBox:AddDropdown("Gifts", {Values = gifts, Default = 1, Multi = false, Text = "Gifts", Tooltip = ""}):OnChanged(function(State)Gifts = State end);

do
    local AcceptOrDeclineTradeRequest = ReplicatedStorage.API:FindFirstChild("TradeAPI/AcceptOrDeclineTradeRequest");
    local AcceptNegotiation = ReplicatedStorage.API:FindFirstChild("TradeAPI/AcceptNegotiation");
    local ConfirmTrade = ReplicatedStorage.API:FindFirstChild("TradeAPI/ConfirmTrade");

    LeftGroupBox2:AddToggle("Trade", {Text = "Auto Accept Trade", Default = false,Tooltip = ""}):OnChanged(function(State)
        Trade = State
        while(wait()and Trade)do
            for idx,plr in ipairs(Players:GetPlayers())do
                if(idx~=1)then
                    InvokeServer(AcceptOrDeclineTradeRequest,plr,true);
                end;
            end;
            FireServer(AcceptNegotiation);
            FireServer(ConfirmTrade);
            for _,con in pairs(getConnections(ButtonTemplate.MouseButton1Click))do
                con.Function();
                con:Fire();
            end;
        end;
    end);
end;

do
    local BuyRefreshment = ReplicatedStorage.API:FindFirstChild("RefreshmentStandAPI/BuyRefreshment");
    LeftGroupBox2:AddToggle("Buy", {Text = "AutoBuy From Player", Default = false,Tooltip = ""}):OnChanged(function(State)
        Buy = State;
        while(wait()and Buy)do 
            InvokeServer(BuyRefreshment,"hotdog_stand",Playt);
            InvokeServer(BuyRefreshment,"lemonade_stand",Playt);
            for i,v in pairs(getConnections(ButtonTemplate.MouseButton1Click)) do
                v.Function();
                v:Fire();
            end;
        end;
    end);
end;

LeftGroupBox2:AddToggle("Transfer", {Text = "Transfer Money To Said Player", Default = false,Tooltip = ""}):OnChanged(function(State)
    Sus = State;
    while(wait()and Sus)do
        GoToPersonsHouse(tostring(Playt));
        rootPart.CFrame = Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model"):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6));
        wait(2);
        local Is = Cash();
        if(Is)then
            InvokeServer(ActivateFurniture,Playt,Is,"UseBlock",50,character)
            for i,v in ipairs(getConnections(ButtonTemplate.MouseButton1Click))do
                v.Function();
                v:Fire();
            end;
        end;
    end;
end);

do
    local AddItemToOffer = ReplicatedStorage.API:FindFirstChild("TradeAPI/AddItemToOffer");
    local SendTradeRequest = ReplicatedStorage.API:FindFirstChild("TradeAPI/SendTradeRequest");
    local AcceptNegotiation = ReplicatedStorage.API:FindFirstChild("TradeAPI/AcceptNegotiation");
    local ConfirmTrade = ReplicatedStorage.API:FindFirstChild("TradeAPI/ConfirmTrade")
    
LeftGroupBox2:AddToggle("TransferPet", {Text = "Transfer Pets To Said Player", Default = false,Tooltip = ""})
Toggles.TransferPet:OnChanged(function(State)
    TransferPet = Toggles.TransferPet.Value 
    task.defer(function()
        while TransferPet and wait(1) do
            if not Player.PlayerGui.TradeApp.Frame.Visible then
                FireServer(SendTradeRequest, Playt)
            end 
            if Player.PlayerGui.TradeApp.Frame.Visible then
                if Petsd == "Pets" then
                    for i, v in pairs(pets) do
                        FireServer(AddItemToOffer, v.unique)
                    end
                end 
                if Petsd == "GrownPets" then
                    for i, v in pairs(pets) do
                        if v.properties.age == 6 then
                            FireServer(AddItemToOffer,v.unique)
                        end 
                    end
                end 
                if Petsd == "Eggs" then
                    for i, v in pairs(pets) do
                        if v.id:find("egg") and not v.id:find("_2022") then
                            FireServer(AddItemToOffer,v.unique)
                        end 
                    end
                end 
                if(Petsd == "Gifts" then
                    for i,v in next,require(ReplicatedStorage.ClientModules.Core.ClientData).get_data()[Player.Name].inventory.gifts do
                        FireServer(AddItemToOffer,v.unique);
                    end;
                end;
                FireServer(AcceptNegotiation);
                FireServer(ConfirmTrade);
                for i,v in ipairs(getConnections(ButtonTemplate.MouseButton1Click))do
                    v.Function();
                    v:Fire();
                end;
            end;
        end 
    end)
end)

LeftGroupBox2:AddInput("NFt", {Default = "UserName",Numeric = false,Finished = false,Text = "Select Player",Tooltip = nil,Placeholder = "WalkSpeed",}):OnChanged(function(String)
    for _,plr in ipairs(Players:GetPlayers())do
        if(plr.Name==String or String==plr.Name:match(String)or plr.DisplayName==String or String==plr.DisplayName:match(String))then
           Playt = plr;
        end;
    end;
end);

LeftGroupBox2:AddDropdown("Method", {Values = {"Pets","Gifts","GrownPets","Eggs"}, Default = 1, Multi = false, Text = "Transfer Items", Tooltip = ""}):OnChanged(function(State)Petsd = State end);

do
    local BeginQuiz = ReplicatedStorage.API:FindFirstChild("TradeAPI/BeginQuiz");
    local AnswerQuizQuestion = ReplicatedStorage.API:FindFirstChild("TradeAPI/AnswerQuizQuestion");
    LeftBox:AddButton("Grab Trading Linence", function()
        FireServer(BeginQuiz);
        for _,val in ipairs(getgc(true))do
            if(type(val)=="table"and nil~=rawget(val,"question_index"))then
                for _,idk in next,val.quiz do
                    FireServer(AnswerQuizQuestion,idk.answer);
                end;
            end;
        end;
    end);
end;

do
    local FinishObby = ReplicatedStorage.API["MinigameAPI/FinishObby"];
    LeftBox:AddButton("Give Badges", function()
        for i,v in pairs(Obbys) do 
            wait(0.5);
            FireServer(FinishObby, v);
        end;
    end);
end;


RightGroupBox2:AddInput("NFt", {Default = "UserName",Numeric = false,Finished = false,Text = "Select Player",Tooltip = nil,Placeholder = "WalkSpeed",})
Options.NFt:OnChanged(function(String)
    for _,plr in ipairs(Players:GetPlayers()) do
        if(plr.Name==String or String==plr.Name:match(String)or plr.DisplayName==String or String==plr.DisplayName:match(String))then
            GoToPersonsHouse(plr.Name)
            rootPart.CFrame = Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model"):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6));
        end;
    end;
end);

local Stores = {
    "CoffeeShop",
    "Supermarket",
    "PizzaShop",
    "ToyShop",
    "Obbies",
    "Neighborhood",
    "CampingShop",
    "AutoShop",
    "Nursery",
    "Cave",
    "IceCream",
    "PotionShop",
    "SkyCastle",
    "Hospital",
    "HatShop",
    "PetShop",
    "School",
    "BabyShop",
    "HotSpringHouse",
    "SafetyHub",
    "DebugInterior",
    "VIP",
    "Salon",
    "SpleefMinigame",
    "SimonSaysMinigame",
    "WinterCastle"
};

RightGroupBox2:AddDropdown("Stores", {Values = Stores, Default = 0, Multi = false, Text = "Locations", Tooltip = ""}):OnChanged(function(Value)
    GoToStore(Value);
    rootPart.CFrame = Workspace.Interiors:FindFirstChildWhichIsA("Model").Doors.MainDoor.WorkingParts.TouchToEnter.CFrame:ToWorldSpace(CFrame.new(0, 0, -6));
end);

RightGroupBox2:AddButton("Teleport Home", function()
    GoToHome()
    rootPart.CFrame = Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA("Model"):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6));
end):AddButton("Teleport MainMap", function()
    GoToMainMap();
    rootPart.CFrame = Workspace.Interiors:FindFirstChildWhichIsA("Model"):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6));
    rootPart.CFrame = CFrame.new(-247.35408, 17.3820152, -1518.88879);
end);

RightGroupBox:AddToggle("JoYes", {Text = "Auto Free Food", Default = false,Tooltip = ""}):OnChanged(function(State)
    Sus = State;
    while(wait()and JoYes)do
        InvokeServer(BuyItem, "food", Food, {});
    end;
end);

RightGroupBox:AddDropdown("Foods", {Values = FreeFoods, Default = 0, Multi = false, Text = "Free Foods", Tooltip = ""}):OnChanged(function(State)Food = State end);

 
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))();
LeftBox:AddToggle("ESP1", {Text = "Esp Toggle", Default = false,Tooltip = ""}):OnChanged(function(State)ESP:Toggle(State)end);
LeftBox:AddToggle("ESP2", {Text = "Esp Players", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.Players = State end);
LeftBox:AddToggle("ESP3", {Text = "Esp Tracers", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.Tracers = State end);
LeftBox:AddToggle("ESP4", {Text = "Esp Names", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.EspNames = State end);
LeftBox:AddToggle("ESP5", {Text = "Esp Boxes", Default = false,Tooltip = ""}):OnChanged(function(State)ESP.Boxes = State end);


LeftBox:AddToggle("SSS1", {Text = "Player Loop WalkSpeed/JumpPower", Default =  Toggle,Tooltip = "This is a tooltip"}):OnChanged(function(State)Toggle = State end);
Stepped:Connect(function()
    if(Toggle)then
        humanoid.WalkSpeed = WalkSpeed;
        humanoid.JumpPower = JumpPower;
    end;
end);

LeftBox:AddInput("SSF2", {Default = "WalkSpeed",Numeric = true,Finished = false,Text = "WalkSpeed",Tooltip = "Numbers Only",Placeholder = "WalkSpeed"}):OnChanged(function(State)WalkSpeed = State end);
LeftBox:AddInput("SSF3", {Default = "JumpPower",Numeric = true,Finished = false,Text = "JumpPower",Tooltip = "Numbers Only",Placeholder = "JumpPower"}):OnChanged(function(State)JumpPower = State end);

LeftBox:AddToggle("SSS4", {Text = "Infinite Jump",Default =  InfiniteJump,Tooltip = "toggle infinite jump"}):OnChanged(function(State)InfiniteJump = State end);
UserInputService.JumpRequest:Connect(function()
    if(InfiniteJump)then
        humanoid:ChangeState("Jumping");
    end;
end);

do
    local con = nil;
    local f = function()NoClip2(character)end;
    LeftBox:AddToggle("SSS5", {Text = "N NoClip",Default =  Sex2,Tooltip = "This is a tooltip"}):OnChanged(function(State)
        Sex2 = State;
        if(State)then
            con = RunService.Stepped:Connect(f);
        else
            con:Disconnect();
        end;
    end);
end;


do  -- fly function. will stop working if the user resets mid usage
    local con = nil;
    local c1,c2 = nil,nil;
    
    local S  = {F = 0, B = 0, L = 0, R = 0};
    -- local S2 = {F = 0, B = 0, L = 0, R = 0};
    
    local function f1(key)
        key = key:lower();
        if(key=='w')then
            S.F = 1;
        elseif(key=='s')then
            S.B = -1;
        elseif(key=='a')then
            S.L = -1;
        elseif(key=='d')then
            S.R = 1;
        end;
    end;
    local function f2(key)
        key = key:lower();
        if(key=='w')then
            S.F = 0;
        elseif(key=='s')then
            S.B = 0;
        elseif(key=='a')then
            S.L = 0;
        elseif(key=='d')then
            S.R = 0;
        end;
    end;
    
    local function reset()
        S.F,S.B,S.L,S.R = 0,0,0,0;
        -- S2.F,S2.B,S2.L,S2.R = 0,0,0,0;
    end;
    
    local v1,v2 = Vector3.new(9e9,9e9,9e9),Vector3.new(0,0.1,0);
    
    local function propagate(parent)
        c1 = Mouse.KeyDown:Connect(f1);
        c2 = Mouse.KeyUp:Connect(f2);
        
        local BodyGyro = Instance.new("BodyGyro");
        BodyGyro.P = 9e4;
        BodyGyro.maxTorque = v1;
        BodyGyro.cframe = parent.CFrame
        BodyGyro.Parent = parent;
        
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.velocity = v2;
        BodyVelocity.maxForce = v1;
        BodyVelocity.Parent = parent;
        
        repeat wait()
            humanoid.PlatformStand = true;
            local CF = Workspace.CurrentCamera.CoordinateFrame;
            if(S.L ~= -S.R or S.F ~= -S.B)then                                      -- speed set to 200
                BodyVelocity.velocity = (CF.lookVector*(S.F + S.B) + CF*CFrame.new(S.L + S.R, (S.F + S.B)*0.2, 0).p - CF.p)*200;
                -- S2 = {F = S.F, B = S.B, L = S.L, R = S.R};
            elseif(SPEED>0)then                                                     -- speed set to 0
                BodyVelocity.velocity = Vector3.new();
                -- BodyVelocity.velocity = (CF.lookVector*(S2.F + S2.B) + CF*CFrame.new(S2.L + S2.R, (S2.F + S2.B)*0.2, 0).p - CF.p)*SPEED;
            else
                BodyVelocity.velocity = v2;
            end
            BodyGyro.cframe = CF;
        until(not Fly);
        
        reset();
        BodyGyro:destroy();
        BodyVelocity:destroy();
        humanoid.PlatformStand = false;
    end;
    
    local R6,R15 = Enum.HumanoidRigType.R6,Enum.HumanoidRigType.R15;
    local function fly(key)
        if('h'~=key:lower())then return end;
        getgenv().Fly = not Fly;
        if(not Fly)then
            c1:Disconnect();
            c2:Disconnect();
            return;
        end;
        
        reset();
        if(humanoid.RigType==R6)then
            task.defer(propagate,rootPart);
        elseif(humanoid.RigType==R15)then
            task.defer(propagate,character:FindFirstChild("UpperTorso"));
        end;
    end;
    
    LeftBox:AddToggle("SSS6", {Text = "H Fly",Default =  Sex,Tooltip = "Fly By Pressing H"}):OnChanged(function(State)
        Sex = State;
        if(State)then
            con = Mouse.KeyDown:Connect(fly);
        else
            getgenv().Fly = false;
            con:Disconnect();
        end;
    end);
end;

do
    local Wood = Enum.Material.Wood;
    LeftBox:AddButton("FPS Booster", function()
        for _,child in ipairs(game:GetDescendants())do 
            if(child:IsA("Texture"))then
                child.Destroy();
            elseif(v:IsA("BasePart") then
                child.Material = Wood;
            end;
        end;
    end);
end;

LeftBox:AddButton("ServerHop", ServerHop);
LeftBox:AddButton("Rejoin", function()print(pcall(Rejoin))end);

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton("Unload", function()Library:Unload()end);
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightControl", NoUI = true, Text = "Menu keybind" }) 

Library.ToggleKeybind = Options.MenuKeybind 
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ "MenuKeybind" }) 
ThemeManager:SetFolder("V.G Hub")
SaveManager:SetFolder("V.G Hub/" .. game.PlaceId)
SaveManager:BuildConfigSection(Tabs["UI Settings"]) 
ThemeManager:ApplyToTab(Tabs["UI Settings"])