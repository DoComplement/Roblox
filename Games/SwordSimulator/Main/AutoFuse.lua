if(getgenv()["@Esz#O8k(9]1HBol~S8C"]~=nil or not table.find({7026949294,11127874647},game.PlaceId))then return end;
getgenv()["@Esz#O8k(9]1HBol~S8C"] = true;
if(not game:IsLoaded())then game.Loaded:Wait()end;

-- Create an Antimatter Queue Frame with an AutoCollect toggle (to remove the Retrieve Queue function)
-- Look into a way of checking the queue via an in-game function, or a signal rather than having a thread that counts down until an item is ready to be grabbed

-- Add a frame to IgnoreElementedFrame with buttons for each Element to toggle which Elements will be ignored

local wait,lower,Connect = task.wait,string.lower,game.Changed.Connect; -- a unique "Connect" function is created every time, but they server the same purpose
local PlayerData = require(game:GetService("ReplicatedStorage").Saturn.Modules.Client["PlayerData - Client"]);
if(not PlayerData.Replica.Data)then PlayerData.Loaded:Wait()end; -- wait until data is loaded
PlayerData = PlayerData.Replica.Data.Main;

local COLOR_PICKS = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DoComplement/Roblox/main/Colors/ColorPicks.lua")), "Error loading Colors")();
assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/t2s_v2.lua")), "Error loading TableToString")();

local UDIM_CORNER = UDim.new(1,0);
local FONT = Enum.Font.GothamMedium;
local COLORS = {
	[1] = Color3.fromHex("ffffff"); -- White
	[2] = Color3.fromHex("000000"); -- Black
	[3] = Color3.fromHex("960000"); -- Red
	[4] = Color3.fromHex("009600"); -- Green
	[5] = Color3.fromRGB(46,141,213); -- Light Blue
	[6] = Color3.fromRGB(150,150,150); -- Gray
};
local UDIM2 = {
	[1] = UDim2.new(0,76,0,30);
	[2] = UDim2.new(0,473,0,30);
	[3] = UDim2.new(0,0,-0.002,0);
	[4] = UDim2.new(0,190,0,30);
	[5] = UDim2.new(0.483,0,-0.002,0);
	[6] = UDim2.new(0.652,0,-0.002,0);
	[7] = UDim2.new(0.822,0,-0.002,0);
	[8] = UDim2.new(0,80,0,30);
	[9] = UDim2.new(0.41,0,0,0);
	[10] = UDim2.new(0,30,0,30);
	[11] = UDim2.new(0,100,0,100);
	[12] = UDim2.new(0,70,0,30);
	[13] = UDim2.new(0,210,0,42);
	[14] = UDim2.new(0.01,0,0.15,0);
	[15] = UDim2.new(0,130,0,40);
	[16] = UDim2.new(0.36,0,0.03,0);
	[17] = UDim2.new(0,25,0,25);
	[18] = UDim2.new(0,108,0,24);
	[19] = UDim2.new(0.015,0,0.15,0);
	[20] = UDim2.new(0,210,0,210);
	[21] = UDim2.new(0,206,0,21);
	[22] = UDim2.new();
};

local Main = {
	[1] = {	-- Gem Toggles
		[1] = PlayerData.Gems >= 10000, -- Normal Fuse Gem Cost
		[2] = PlayerData.Gems >= 200000, -- Enhanced Fuse Gem Cost
		[3] = true, -- Omega Fuse Cost is Free
		[4] = false; -- Antimatter can not be Fused
	};
	[2] = {	-- Level Table
		[1] = "Evolved"; 
		[2] = "Omega";
	};
	[3] = {
		[1] = {}; -- Pet Fuses
		[2] = {}; -- Weapon Fuses
	};
	[4] = {}; -- Connections
	[5] = {}; -- Functions
	[6] = { -- Remotes
		[1] = game:GetService("ReplicatedStorage").Events.FusePet; -- Fuse Items
		[2] = game:GetService("ReplicatedStorage").Events.CraftItem; -- Antimatter Conversion
		[3] = game:GetService("ReplicatedStorage").Events.ClaimCraftedItem; -- Claim Antimatter Conversion
	};
	[7] = {	-- Notifications
		[1] = game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.LeftButtons.PetInventory.Notification;		-- Pets Notification
		[2] = game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.LeftButtons.WeaponInv.Notification;		-- Weapons Notification
	};	
	[8] = {	-- Toggles
		[1] = true;	-- Pet Enhancement is inactive
		[2] = true;	-- Weapon Enhancement is inactive
		[3] = true; -- AutoLoad Toggle
		[4] = true; -- AutoSave Toggle
		[5] = true; -- ResetText Toggle
		[6] = false; -- Gems Toggle
		[7] = false; -- Print Toggle
		[8] = false; -- LoadFuse Toggle
		[9] = true; -- IgnoreEquipped Toggle
		[10] = true; -- IgnoreEnchanted Toggle
		[11] = true; -- IgnoreElemented Toggle
	};
	[9] = { -- String Constants
		[1] = "Pets",
		[2] = "Weapons",
		[3] = "SwordSim AutoFuseData/AutoSave_"..game:GetService("Players").LocalPlayer.UserId..".lua";
	};
	[10] = { -- Queue
		[1] = false, -- Pet Signal Queue
		[2] = false; -- Weapon Signal Queue
		[3] = 0; -- Fuse Frame Count
		[4] = 10; -- Element Enabled Count
	};
	[11] = { -- boolean constans
		[1] = { -- Hex constants
			[true] = COLORS[4];
			[false] = COLORS[3];
		};
		[2] = { -- Transparency constants
			[true] = 0;
			[false] = 0.5;
		}
	}
};

local SaveData = { -- AutoSave Data
	["Visible"] = {
		[1] = true; -- SearchFrame Visibility
		[2] = true; -- FuseFrame Visibility
	};
	["Toggles"] = {
		["AutoLoad"] = true;
		["AutoSave"] = true;
		["ResetText"] = true;
		["GemsToggle"] = false;
		["PrintToggle"] = false;
		["LoadFuse"] = false;
		["IgnoreEquipped"] = true;
		["IgnoreEnchanted"] = true;
		["IgnoreElemented"] = true;
	};
	["Elements"] = {
		["Water"] = true;
		["Earth"] = true;
		["Light"] = true;
		["Shadow"] = true;
		["Wind"] = true;
		["Lightning"] = true;
		["Fire"] = true;
		["Galaxy"] = true;
		["Chaos"] = true;
		["Spooky"] = true;
	};
	["Items"] = {};
};

local Instances,BindableEvents = {},{};
BindableEvents.Second = Instance.new("BindableEvent");

local InvokeServer = Main[6][1].InvokeServer;
local Fire = BindableEvents.Second.Fire;

local function setVals(class, props, parent)
	local inst = Instance.new(class);
	for prop,val in next,props do
		inst[prop] = val;
	end;
	inst.Parent = parent;
	return inst;
end;

local function createCorners(parents)
	for _,parent in ipairs(parents)do
		Instance.new("UICorner",parent).CornerRadius = UDIM_CORNER;	-- should be fine
	end;
end;

if(syn~=nil)then
	Instances.MainGui = setVals("ScreenGui",{Name="MainGui",ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Global})syn.protect_gui(Instances.MainGui)Instances.MainGui.Parent = game:GetService("CoreGui");
	Instances.FuseGui = setVals("ScreenGui",{Name="FuseGui",ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling})syn.protect_gui(Instances.FuseGui)Instances.FuseGui.Parent = game:GetService("CoreGui");
	Instances.SettingsGui = setVals("ScreenGui",{Name="SettingsGui",ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling});syn.protect_gui(Instances.SettingsGui);Instances.SettingsGui.Parent = game:GetService("CoreGui");
elseif(gethui~=nil)then
	local parent = gethui();
	Instances.MainGui = setVals("ScreenGui",{Name="MainGui",ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Global},parent)
	Instances.FuseGui = setVals("ScreenGui",{Name="FuseGui",ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},parent);
	Instances.SettingsGui = setVals("ScreenGui",{Name="SettingsGui",ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},parent);
end;

Instances.ItemFrame = setVals("Frame",{Parent=Instances.MainGui,Active=true,Selectable=true,Draggable=true,BackgroundColor3=COLORS[1],Position=UDim2.new(0.8,0,0.35,0),Size=UDim2.new(0,235,0,260),Visible=false},Instances.MainGui);
Instances.ItemScroller = setVals("ScrollingFrame",{Active=true,BackgroundColor3=COLORS[1],CanvasSize=UDIM2[22],AutomaticCanvasSize='Y',ScrollingDirection='Y',ScrollBarThickness=0,Position=UDim2.new(0.05,0,0.26,0),Size=UDim2.new(0,215,0,186),BottomImage="",MidImage="",TopImage=""},Instances.ItemFrame);
local TextBox = setVals("TextBox",{BackgroundColor3=COLORS[1],Position=UDim2.new(0.05,0,0.1,0),Size=UDim2.new(0,215,0,30),Font=Enum.Font.SourceSans,Text="Search",TextColor3=COLORS[2],TextSize=14},Instances.ItemFrame);
Instances.Info = setVals("ImageButton",{BackgroundTransparency=1,Position=UDim2.new(0.01,0,0,0),Size=UDIM2[17],ZIndex=2,Image="rbxassetid://3926305904",ImageColor3=COLORS[6],ImageRectOffset=Vector2.new(4,804),ImageRectSize=Vector2.new(36,36)},Instances.ItemFrame);
Instances.Close = setVals("ImageButton",{BackgroundTransparency=1,Position=UDim2.new(0.9,0,0.01,0),Size=UDIM2[17],ZIndex=2,Image="rbxassetid://3926305904",ImageColor3=COLORS[6],ImageRectOffset=Vector2.new(285,5),ImageRectSize=Vector2.new(24,24)},Instances.ItemFrame);
setVals("UIListLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.Name,Padding=UDim.new(0,10)},Instances.ItemScroller);

Instances.FuseFrame = setVals("Frame",{Active=true,Selectable=true,Draggable=true,Visible=false,BackgroundColor3=COLORS[1],Position=UDim2.new(0.7,0,0.65,0),Size=UDim2.new(0,522,0,180)},Instances.FuseGui);
Instances.FuseScroller = setVals("ScrollingFrame",{BackgroundColor3=COLORS[1],CanvasSize=UDIM2[22],AutomaticCanvasSize='Y',ScrollingDirection='Y',ScrollBarThickness=0,Position=UDim2.new(0.023,0,0.195,0),Size=UDim2.new(0,500,0,135),BottomImage="",MidImage="",TopImage=""},Instances.FuseFrame);
Instances.All = setVals("TextButton",{Name="All",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDim2.new(0.904,0,0.015,0),Size=UDim2.new(0,45,0,30),ZIndex=2,Font=FONT,Text="All",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.FuseFrame);
Instances.Pets = setVals("TextButton",{Name="Pets",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDim2.new(0.796,0,0.015,0),Size=UDim2.new(0,55,0,30),ZIndex=2,Font=FONT,Text="Pets",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.FuseFrame);
Instances.Weapons = setVals("TextButton",{Name="Weapons",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDim2.new(0.66,0,0.015,0),Size=UDIM2[12],ZIndex=2,Font=FONT,Text="Weapons",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.FuseFrame);
setVals("TextLabel",{Name="Label",BackgroundColor3=COLORS[1],BackgroundTransparency=1,Position=UDim2.new(0.53,0,0.045,0),Size=UDim2.new(0,72,0,20),Font=Enum.Font.Gotham,Text="Remove:",TextColor3=COLORS[2],TextSize=13},Instances.FuseFrame);
setVals("UIListLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,5)},Instances.FuseScroller);

Instances.SettingsMain = setVals("Frame",{Selectable=true,Active=true,Draggable=true,BackgroundColor3=COLORS[1],Position=UDim2.new(0.64,80,0.23,120),Size=UDim2.new(0,218,0,255),Visible=false},Instances.SettingsGui);
Instances.Information = setVals("TextButton",{Name="Information",BackgroundColor3=COLORS[6],Size=UDIM2[18],Font=FONT,Text="Information",TextColor3=COLORS[1],TextSize=14},Instances.SettingsMain);
Instances.Settings = setVals("TextButton",{Name="Settings",BackgroundColor3=COLORS[6],BackgroundTransparency=0.5,Position=UDim2.new(0.5,0,0,0),Size=UDIM2[18],Font=FONT,Text="Settings",TextColor3=COLORS[1],TextSize=14},Instances.SettingsMain);

Instances.InformationFrame = setVals("Frame",{Name="InformationFrame",BackgroundColor3=COLORS[1],Position=UDIM2[19],Size=UDIM2[20]},Instances.SettingsMain);
setVals("TextLabel",{Name="Label1",BackgroundColor3=COLORS[1],Position=UDim2.new(0.007,1,0.01,0),Size=UDim2.new(0,206,0,52),Font=Enum.Font.SourceSans,Text="Click the buttons in the search frame with the names of items you want to have fused automatically.",TextColor3=COLORS[2],TextSize=14,TextWrapped=true},Instances.InformationFrame);
setVals("TextLabel",{Name="Label2",BackgroundColor3=COLORS[1],Position=UDim2.new(0.007,1,0.275,0),Size=UDim2.new(0,206,0,52),Font=Enum.Font.SourceSans,Text="Click the number by each item in the Fuse frame to change the quantity of items fused toward antimatter.",TextColor3=COLORS[2],TextSize=14,TextWrapped=true},Instances.InformationFrame);
setVals("TextLabel",{Name="Label3",BackgroundColor3=COLORS[1],Position=UDim2.new(0.007,1,0.535,0),Size=UDim2.new(0,206,0,45),Font=Enum.Font.SourceSans,Text="Please report any issues or concerns to Activities12 on v3rmillion or loverboy#3970 on discord.",TextColor3=COLORS[2],TextSize=14,TextWrapped=true},Instances.InformationFrame);
setVals("TextLabel",{Name="Toggle1",BackgroundColor3=COLORS[1],Position=UDim2.new(0.007,1,0.77,0),Size=UDIM2[21],Font=Enum.Font.SourceSans,Text="Toggle SearchFrame:    LeftControl + G",TextColor3=COLORS[2],TextSize=14},Instances.InformationFrame);
setVals("TextLabel",{Name="Toggle2",BackgroundColor3=COLORS[1],Position=UDim2.new(0.007,1,0.88,0),Size=UDIM2[21],Font=Enum.Font.SourceSans,Text=" Toggle FuseFrame:        LeftControl + M",TextColor3=COLORS[2],TextSize=14},Instances.InformationFrame);

Instances.SettingsFrame = setVals("ScrollingFrame",{Name="SettingsFrame",BackgroundColor3=COLORS[1],Position=UDIM2[19],Size=UDIM2[20],CanvasPosition=Vector2.new(),AutomaticCanvasSize='Y',CanvasSize=UDIM2[22],ScrollingDirection='Y',ScrollBarThickness=0,Visible=false,BottomImage='',MidImage='',TopImage=''},Instances.SettingsMain);
Instances.AutoLoadFrame = setVals("Frame",{Name="AutoLoadFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.PrintToggleFrame = setVals("Frame",{Name="PrintToggleFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.AutoSaveFrame = setVals("Frame",{Name="AutoSaveFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.ResetTextFrame = setVals("Frame",{Name="ResetTextFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.GemsToggleFrame = setVals("Frame",{Name="GemsToggleFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.LoadFuseFrame = setVals("Frame",{Name="LoadFuseFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.IgnoreEquippedFrame = setVals("Frame",{Name="IgnoreEquippedFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.IgnoreEnchantedFrame = setVals("Frame",{Name="IgnoreEnchantedFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.IgnoreElemented = setVals("Frame",{Name="IgnoreElemented",BackgroundColor3=COLORS[1],Position=UDim2.new(0,0,0.5,0),Size=UDim2.new(0,210,0,111)},Instances.SettingsFrame);
Instances.IgnoreElementedFrame = setVals("Frame",{Name="IgnoreElementedFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.IgnoreElemented);
Instances.IgnoreElementedButton = setVals("TextButton",{Name="IgnoreElementedButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[12],ZIndex=2,Font=FONT,Text="Ignore Elemented",TextColor3=COLORS[1],TextSize=12,TextWrapped=true},Instances.IgnoreElementedFrame);
Instances.IgnoreEnchantedButton = setVals("TextButton",{Name="IgnoreEnchantedButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[12],ZIndex=2,Font=FONT,Text="Ignore Enchanted",TextColor3=COLORS[1],TextSize=12,TextWrapped=true},Instances.IgnoreEnchantedFrame);
Instances.IgnoreEquippedButton = setVals("TextButton",{Name="IgnoreEquippedButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[12],ZIndex=2,Font=FONT,Text="Ignore Equipped",TextColor3=COLORS[1],TextSize=12,TextWrapped=true},Instances.IgnoreEquippedFrame);
Instances.LoadFuseButton = setVals("TextButton",{Name="LoadFuseButton",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[12],ZIndex=2,Font=FONT,Text="LoadFuse",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.LoadFuseFrame);
Instances.AutoLoadButton = setVals("TextButton",{Name="AutoLoadButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[12],ZIndex=2,Font=FONT,Text="AutoLoad",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.AutoLoadFrame);
Instances.AutoSaveButton = setVals("TextButton",{Name="AutoSaveButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[12],ZIndex=2,Font=FONT,Text="AutoSave",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.AutoSaveFrame);
Instances.ResetTextButton = setVals("TextButton",{Name="ResetTextButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[12],ZIndex=2,Font=FONT,Text="ResetText",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.ResetTextFrame);
Instances.GemsToggleButton = setVals("TextButton",{Name="GemsToggleButton",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[12],ZIndex=2,Font=FONT,Text="Gems",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.GemsToggleFrame);
Instances.PrintToggleButton = setVals("TextButton",{Name="PrintToggleButton",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[12],ZIndex=2,Font=FONT,Text="Print",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.PrintToggleFrame);

Instances.Elements = setVals("Frame",{Name="Elements",BackgroundColor3=COLORS[1],BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(0,0,0.378,0),Size=UDim2.new(0,210,0,68)},Instances.IgnoreElemented);

setVals("UIGridLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,CellPadding=UDim2.new(0,8,0,0),CellSize=UDim2.new(0,33,0,33)},Instances.Elements);
Instance.new("UIListLayout",Instances.SettingsFrame).SortOrder = Enum.SortOrder.LayoutOrder;

setVals("TextLabel",{Name="AutoLoadLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=Enum.Font.SourceSans,Text="Auto-Load stored data upon script-execution, or, if not yet loaded, load saved data.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.AutoLoadFrame);
setVals("TextLabel",{Name="AutoSaveLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=Enum.Font.SourceSans,Text="Auto-Save the state of the each Frame and Toggles upon any respective interaction.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.AutoSaveFrame);
setVals("TextLabel",{Name="ResetTextLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=Enum.Font.SourceSans,Text="Resets the search bar text to \"Search\" three seconds after the box's focus is lost.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.ResetTextFrame);
setVals("TextLabel",{Name="GemsToggleLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=Enum.Font.SourceSans,Text="Toggles fusing when you have sufficient gems. Disable if you have much more than 10M gems.",TextColor3=COLORS[2],TextSize=10,TextWrapped=true},Instances.GemsToggleFrame);
setVals("TextLabel",{Name="PrintToggleLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDim2.new(0.36,0,0.1,0),Size=UDim2.new(0,130,0,30),Font=Enum.Font.SourceSans,Text="Toggles printing any item fuse event to the standard console.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.PrintToggleFrame);
setVals("TextLabel",{Name="LoadFuseLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=Enum.Font.SourceSans,Text="Will run a single-fuse search on all loaded items upon load.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.LoadFuseFrame)
setVals("TextLabel",{Name="IgnoreEquippedLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDim2.new(0.36,0,0.01,0),Size=UDIM2[15],Font=Enum.Font.SourceSans,Text="Equipped items will be ignored during fusing events.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.IgnoreEquippedFrame);
setVals("TextLabel",{Name="IgnoreEnchantedLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDim2.new(0.36,0,0.02,0),Size=UDIM2[15],Font=Enum.Font.SourceSans,Text="Enchanted - Damage+, Coins+, etc. - items will be ignored during fusing events.",TextColor3=COLORS[2],TextSize=11,TextWrapped=true},Instances.IgnoreEnchantedFrame);
setVals("TextLabel",{Name="IgnoreElementedLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=Enum.Font.SourceSans,Text="Items with enabled Elements, specified by the toggles below, will be ignored during fusing events.",TextColor3=COLORS[2],TextSize=10,TextWrapped=true},Instances.IgnoreElementedFrame);

createCorners({Instances.All,Instances.Pets,Instances.Weapons,Instances.LoadFuseButton,Instances.PrintToggleButton,Instances.IgnoreEquippedButton,Instances.IgnoreEnchantedButton,Instances.AutoLoadButton,Instances.ResetTextButton,Instances.AutoSaveButton,Instances.GemsToggleButton,Instances.IgnoreElementedButton,Instances.IgnoreElementedButton});

-- Reset input Table
Main[5][1] = function(Table)
	for _,SubTable in next, Table do 
		for _,SubSubTable in ipairs(SubTable) do 
			SubSubTable[2] = 0;
		end;
	end;
end;

-- Retrieve Queue: returns the Quantity of taken slots in the antimatter gui category 
Main[5][2] = function(Category,Count)
	
    -- loops through the queue and checks if any slots can be retrieved
    for ID,Item in next, PlayerData.QueuedItems[Category] do
		if Item.ReleaseDate <= os.time() then
			InvokeServer(Main[6][3],Category,ID);	-- Collect Antimatter Remote
			if Main[8][7] then print("Antimatter", Item.ItemData.Base, "retrieved.") end;
			continue;
		end;
		Count += 1;
    end;
    
    return Count;   -- returns the Quantity of filled antimatter crafting slots
end;

-- Fuse Items
Main[5][3] = function(List, Item, Category, Unchanged)
	if(Item.Level~=3)then -- Antimatter has different logic
		InvokeServer(Main[6][1],Category,List[3]); -- Fuse Items Remote
		if(Main[8][7])then print(3, Item.Base, "fused to 1", Main[2][Item.Level])end;
		return false;
	elseif(Main[5][2](Category,0)<PlayerData.CraftingSlots)then
		InvokeServer(Main[6][2],Category,List[3]);	-- Antimatter Conversion Remote
		if(Main[8][7])then print(List[2], Item.Base, "fused to 1 Antimatter")end;
	end;
	return Unchanged;
end;

-- Check Ignore Toggles
Main[5][4] = function(Tag, Index)
	if(not(Main[8][9]or Main[8][10]or Main[8][11]))then return end;
	
	if(Main[8][9]and((Index==2 and PlayerData.EquippedItems.Weapons[Tag]~=nil)or table.find(PlayerData.EquippedItems.Pets,Tag)~=nil))then -- Check Equipped
		return true;
	end;
	
	if(Main[8][11]and SaveData.Elements[PlayerData[Main[9][Index]][Tag].Element]~=nil)then -- Check Elemented
		return true;
	end;
	
	return(Main[8][10]and next(PlayerData[Main[9][Index]][Tag].Enchants or{})~=nil); -- Check Enchanted
end;

-- Enhance Item
Main[5][5] = function(Table, Index, Unchanged, List)
	for Tag,Item in next, PlayerData[Main[9][Index]] do
		if(not Main[1][Item.Level]or not Table[Item.Base]or Main[5][4](Tag, Index))then -- Item Validation, lack of "not"-distrubution is required
			continue; 
		end;
		
		List = Table[Item.Base][Item.Level]; -- ease-of-access		
		if(not List[1])then continue end; -- validate enabled
		
		List[2] += 1;
		List[3][List[2]] = Tag; -- set Tag
		if List[2]>=#List[3]then 
			Unchanged = Main[5][3](List,Item,Main[9][Index],Unchanged);	-- Fuse Items
			List[2] = 0;
		end;
	end;
	
	Main[5][1](Table);	-- Reset Table
	Main[8][Index] = Unchanged;
end;

-- General Settings/Information Frame Toggle
Main[5][6] = function(Frame1, Frame2, Button1, Button2)
	return function()
		if(not Frame1.Visible)then 
		
			Button1.BackgroundTransparency = 0;
			Button2.BackgroundTransparency = 0.5;
			
			Frame2.Visible = false;
			Frame1.Visible = true;
		end;
	end;
end;

-- Toggle GUI Visible
local UserInputService = game:GetService("UserInputService");
Main[5][7] = function(Input)
	if(Input.UserInputType.Value~=8 or not(UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)))then 
		return;
	elseif(Input.KeyCode.Value==109)then
		Instances.FuseFrame.Visible = not Instances.FuseFrame.Visible;
	elseif(Input.KeyCode.Value==103)then
		Instances.ItemFrame.Visible = not Instances.ItemFrame.Visible;
		Instances.SettingsMain.Visible = false;
	end;
end;

-- FocusLost function
Main[5][8] = function()
	wait(3);
	if(Instances~=nil and not TextBox:IsFocused()and Main[8][5])then
		TextBox.Text = "Search";
	end;
end;

-- General Remove Pets/Weapons function
Main[5][9] = function(Index)
	return function()
		for Item in next,Main[3][Index]do
			Instances.FuseScroller[lower(Item)]:Destroy();
		end;
	end;
end;

-- General ItemFrame/FuseFrame Visible Changed Function for AutoSave
Main[5][10] = function(Index, Frame)
	return function()
		SaveData["Visible"][Index] = Frame.Visible;
		if(Main[8][4])then Main[5][11]()end;
	end;
end;

-- Save Data function
Main[5][11] = function()
	writefile(Main[9][3],"-- AutoSave Data, "..os.date().."\n\n"..t2s(SaveData));
end;

-- Check Toggles from Gem Signal
Main[5][12] = function(Index)
	for _,Table in next,Main[3][Index]do
		if(Table[1][1]or Table[1][2]or Table[1][3])then return(true)end;
	end;
	return false;
end;

-- Calls enhance function if Gem Toggle and any Fuse Toggle is enabled
Main[5][13] = function(Index)
	if table.find(Main[1], true)~=nil and Main[5][12](Index) then
		Main[8][Index] = false;
		repeat Main[5][5](Main[3][Index],Index,true)until Main[8][Index];	-- Enhance Items function
	end;
end;

-- updates gem toggles and calls pets/weapon checks if either are inactive when gems are obtained
-- the significance of this function is to call the enhance item function if enough gems have been obtained 
Main[5][14] = function()
	Main[1][1] = PlayerData.Gems >= 10000;	-- toggle for normal fusing
	Main[1][2] = PlayerData.Gems >= 200000;	-- toggle for enhance fusing

	if(Main[8][6])then -- checks Gems Toggle
		if(Main[8][1])then Main[5][13](1)end;	-- if Pets toggle is inactive, check Pets
		if(Main[8][2])then Main[5][13](2)end;	-- if Weapons toggle is inactive, check Weapons
	end;
end;

-- ToggleButton function
Main[5][15] = function(FuseButton, List, Type, Index)
	local Value = nil;
	return function()
		Value = not List[1];
		
		SaveData["Items"][lower(FuseButton.Parent.Name)][1][Index] = Value; -- Update AutoSave Data
		List[1],FuseButton.BackgroundColor3 = Value,Main[11][1][Value]; -- Update respective Item List and Button Color
		if(Main[8][4])then Main[5][11]()end; -- Update Save File
		
		if(not Value)then return end;
		if(not Main[8][Type])then	-- if active
			if Main[10][Type]then return end;	-- if a signal is already in queue
			Main[10][Type] = true;	-- indicate signal is in queue
			while(not Main[8][Type])do wait()end; -- wait until inactive
		end;
		
		Main[8][Type] = false; -- set inactive to false
		Main[10][Type]= false; -- indicate no signal is in queue
		repeat Main[5][5](Main[3][Type],Type,true)until Main[8][Type];	-- calling enhance items function
	end;
end;

-- UpdateFuseQuantity function
Main[5][16] = function(QuantityButton, Antimatter, List)
	local Data,Quantity = nil,nil;
	return function()
		Data = SaveData["Items"][lower(Antimatter.Parent.Name)];
		Quantity = #List[3]-1;
		
		if(Quantity==0)then 
			Quantity = 8
			for idx=1,8 do
				List[3][idx] = '';
			end;
		else
			List[3][Quantity+1] = nil;
		end;
		
		List[1],Data[1][3] = false,false;
		Antimatter.BackgroundColor3 = COLORS[3]; -- Red
		
		QuantityButton.Text,Data[2] = Quantity,Quantity;
		if(Main[8][4])then Main[5][11]()end;
	end;
end;

-- DeallocateFrame function
Main[5][17] = function(Signals, ItemButton)
	for _,con in ipairs(Signals) do con:Disconnect()end;
	SaveData["Items"][lower(ItemButton.Text)] = nil; -- set to nil before updating
	ItemButton.Value.Value = true;
	
	if(Main[10][3]==1)then
		Main[10][3] = 0;
		Instances.FuseFrame.Visible = false;
	else
		Main[10][3] -= 1;
	end
	
	if(Main[8][4])then Main[5][11]()end;
end;

-- CreateFrame function
Main[5][18] = function(ItemButton, Index, List)
	Main[10][3] += 1;
	local Objects = {};
	Objects.ItemFrame = setVals("Frame",{Name=ItemButton.Name,BackgroundTransparency=1,BackgroundColor3=COLORS[1],Size=UDIM2[2]},Instances.FuseScroller);
	Objects.Item = setVals("TextButton",{Name="Item",BackgroundColor3=COLOR_PICKS[math.random(153)],BorderSizePixel=0,Position=UDIM2[3],Size=UDIM2[4],ZIndex=2,Font=FONT,Text=ItemButton.Text,TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Objects.ItemFrame);
	Objects.Evolve = setVals("TextButton",{Name="Evolve",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[5],Size=UDIM2[1],ZIndex=2,Font=FONT,Text="Evolved",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Objects.ItemFrame);
	Objects.Omega = setVals("TextButton",{Name="Omega",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[6],Size=UDIM2[1],ZIndex=2,Font=FONT,Text="Omega",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Objects.ItemFrame);
	Objects.Antimatter = setVals("TextButton",{Name="Antimatter",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[7],Size=UDIM2[8],ZIndex=2,Font=FONT,Text="Antimatter",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Objects.ItemFrame);
	Objects.FuseQuantity = setVals("TextButton",{Name="FuseQuantity",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[9],Size=UDIM2[10],ZIndex=2,Font=FONT,Text="8",TextColor3=COLORS[2],TextScaled=true,TextSize=13,TextWrapped=true},Objects.ItemFrame);
	createCorners({Objects.Item,Objects.Evolve,Objects.Omega,Objects.Antimatter,Objects.FuseQuantity});

	local Signals = {
		[1] = Connect(Objects.Evolve.MouseButton1Click,Main[5][15](Objects.Evolve, List[1], Index, 1));
		[2] = Connect(Objects.Omega.MouseButton1Click,Main[5][15](Objects.Omega, List[2], Index, 2));
		[3] = Connect(Objects.Antimatter.MouseButton1Click,Main[5][15](Objects.Antimatter, List[3], Index, 3));
		[4] = Connect(Objects.FuseQuantity.MouseButton1Click,Main[5][16](Objects.FuseQuantity, Objects.Antimatter, List[3]));
		[5] = Objects.Item.MouseButton1Click:Once(function()Objects.ItemFrame:Destroy()end);
	};
	Objects.ItemFrame.Destroying:Once(function()Main[3][Index][ItemButton.Text] = Main[5][17](Signals, ItemButton)end);
end

-- RemoveAll function
Main[5][19] = function()
	for _,Frame in ipairs(Instances.FuseScroller:GetChildren())do
		Frame:Destroy();
	end;
end;

-- Load Data function
Main[5][20] = function()
	if(not isfile(Main[9][3]))then
		if(not isfolder("SwordSim AutoFuseData"))then
			makefolder("SwordSim AutoFuseData");
		end;
		Instances.ItemFrame.Visible = true;
		Instances.FuseFrame.Visible = true;
		Instances.SettingsMain.Visible = true;
		Main[5][11]();
		return;
	end;
	
	local Data = assert(loadstring(readfile(Main[9][3])),"Error, table expected from data fetch: workspace/"..Main[9][3])();
	if(not Data["Toggles"]or not Data["Toggles"]["AutoLoad"])then return end; -- if AutoLoad is nil or disabled
	
	local Reference,Value = {
		["AutoLoad"] = 3;
		["AutoSave"] = 4;
		["ResetText"] = 5;
		["GemsToggle"] = 6;
		["PrintToggle"] = 7;
		["LoadFuse"] = 8;
		["IgnoreEquipped"] = 9;
		["IgnoreEnchanted"] = 10;
		["IgnoreElemented"] = 11;
	},nil;
	
	-- Validate and Load Toggle Data
	Main[10][4] = 0;
	for Name,Table in next,SaveData do
		if(not Data[Name]or Name=="Items")then continue end;
		assert(type(Data[Name])=="table", "Error, table expected when reading \""..Name.."\" in fetched data");
		for Index in next,Table do
			Value = type(Data[Name][Index])=="boolean"and Data[Name][Index];
			Table[Index] = Value;
			if(Name=="Elements")then
				Instances[Index.."ToggleButton"].ImageTransparency = Main[11][2][Value];
				if(Value)then Main[10][4] += 1 end; -- Count enabled, ignored elements
			elseif(Name~="Visible")then
				Main[8][Reference[Index]] = Value;
				Instances[Index.."Button"].BackgroundColor3 = Main[11][1][Value];
			end;
		end;
	end;
	
	Instances.ItemFrame.Visible = SaveData["Visible"][1];
	Instances.FuseFrame.Visible = SaveData["Visible"][2];
	Value = SaveData["Visible"][2];
	
	-- Disable ignoring elements if zero elements are being ignored
	if(Main[10][4]==0 and Main[8][11])then
		Instances.IgnoreElementedButton.BackgroundColor3 = COLORS[3];
		Main[8][11] = false;
	end;
	
	-- Validate and Load Item Data
	if(type(Data["Items"])~="table")then return end;
	local DataFrame,BoolToggles = nil,nil;
	for Name,Info in next,Data["Items"]do
	
		assert(Instances.ItemScroller[lower(Name)]~=nil, "Error, invalid item in \"Items\": "..Name); -- Validate item name
		assert(type(Info)=="table" and type(Info[1])=="table", "Error, table expected in \"Items\" when referencing: "..Name); -- Validate referenced data is a table of size 2
		if(type(Info[2])~="number" or Info[2]<=0 or Info[2]>=9)then -- Validate Antimatter Fuse Quantity and Data Type
			Info[2] = 8;
			Info[1][3] = false;
		end;
		
		BoolToggles = {
			[1] = (type(Info[1][1])=="boolean"and Info[1][1]); 
			[2] = (type(Info[1][2])=="boolean"and Info[1][2]); 
			[3] = (type(Info[1][3])=="boolean"and Info[1][3]);
		};
		
		-- Make Button in Fuse Frame (will save if enabled)
		Fire(BindableEvents[lower(Name)],Info[2],unpack(BoolToggles)); 
		
		-- set button color accordingly
		DataFrame = Instances.FuseScroller[lower(Name)];
		DataFrame.FuseQuantity.Text = Info[2];
		DataFrame.Evolve.BackgroundColor3 = Main[11][1][BoolToggles[1]];
		DataFrame.Omega.BackgroundColor3 = Main[11][1][BoolToggles[2]];
		DataFrame.Antimatter.BackgroundColor3 = Main[11][1][BoolToggles[3]];
	end;
	
	Instances.FuseFrame.Visible = Value; -- calling the bindable event will have opened the fuseframe, so re-set the value
	
	if(DataFrame~=nil and SaveData["Toggles"]["LoadFuse"])then 
		Main[5][13](1); -- calling pet enhancement function
		Main[5][13](2); -- calling weapon enhancement function
	end;
end;

-- ResetText Button Toggle
Main[5][21] = function()
	local Value = not Main[8][5];
	Main[8][5],SaveData["Toggles"]["ResetText"] = Value,Value;
	Instances.ResetTextButton.BackgroundColor3 = Main[11][1][Value];
	if(Main[8][4])then Main[5][11]()end;
	if(Value)then TextBox.Text = "Search" end;
end;

-- General Logic Button Toggle
Main[5][22] = function(Index, Name)
	return function()
		local Value = not Main[8][Index];
		Main[8][Index],SaveData["Toggles"][Name] = Value,Value;
		Instances[Name.."Button"].BackgroundColor3 = Main[11][1][Value];
		if(Main[8][4]or Index==4)then Main[5][11]()end;
	end;
end;

-- General Check Pets/Weapons function for Fusing
Main[5][23] = function(Index)
	return function()
		-- if Notification is invisible or Enhancement is active
		if(not(Main[7][Index].Visible and Main[8][Index]))then return end;
		
		local Amount = Main[7][Index].Amount.Text;
		wait(); -- allow time for text to potentially change
		
		-- if enhancing is inactive and text is unchanged
		if(Main[7][Index].Amount.Text~=Amount)then return end;
		
		Main[8][Index] = false; -- set inactive = false
		repeat Main[5][5](Main[3][Index],Index,true)until Main[8][Index]; -- repeat until iactive = true
	end;
end;

-- Toggle Element button
Main[5][24] = function(Element, Button)
	return function()
		if(Button.ImageTransparency==0.5)then
		    SaveData["Elements"][Element] = true
			Button.ImageTransparency = 0;
			Main[10][4] += 1;
		else
		    SaveData["Elements"][Element] = false
			Button.ImageTransparency = 0.5;
			Main[10][4] -= 1;
		end;
		
		-- Disable if zero Elements are being ignored
		if(Main[10][4]==0 and Main[8][11])then 
			Instances.IgnoreElementedButton.BackgroundColor3 = COLORS[3];
			SaveData["Toggles"]["IgnoreElemented"] = false;
			Main[8][11] = false;
		end;
		
		if(Main[8][4])then Main[5][11]()end;
	end;
end;

-- Toggle IgnoreElemented Button
Main[5][25] = function()
	if(Main[10][4]==0)then
		Instances.IgnoreElementedButton.BackgroundColor3 = COLORS[3];
		Main[8][11] = false;
		return;
	end;
	
	local Value = not Main[8][11];
	SaveData["Toggles"]["IgnoreElemented"] = Value;
	Instances.IgnoreElementedButton.BackgroundColor3 = Main[11][1][Value];
	Main[8][11] = Value;
	
	if(Main[8][4])then Main[5][11]()end;
end;

do	-- MakeTextChangedSignal Function
	local match = string.match;
	Main[5][26] = function(ItemButton)
		return Connect(TextBox:GetPropertyChangedSignal("Text"),function()
			
			if(TextBox.Text=="Search" or TextBox.Text=="")then
				ItemButton.Visible = ItemButton.Value.Value;
				return;
			end;

			-- if the text input matches somewhere in the name of ItemButton, then the Button will remain visible
			ItemButton.Visible = (ItemButton.Value.Value and match(ItemButton.Name,lower(TextBox.Text))~=nil);
		end);
	end;
end;

-- MakeClickedSignal Function
Main[5][27] = function(ItemButton, Index)
	return function(Q, T1, T2, T3)
		ItemButton.Value.Value = false;
		Instances.FuseFrame.Visible = true;
		local List = { -- create formatted table
			[1] = {
				[1] = T1;
				[2] = 0;
				[3] = {'','',''};
			};
			[2] = {
				[1] = T2;
				[2] = 0;
				[3] = {'','',''};
			};
			[3] = {
				[1] = T3;
				[2] = 0;
				[3] = table.create(Q, '');
			};
		};
		Main[3][Index][ItemButton.Text] = List; 
		Main[5][18](ItemButton, Index, List); -- create frame in FuseFrame
		SaveData["Items"][ItemButton.Name] = { -- add SaveData
			[1] = {
				[1] = T1;
				[2] = T2;
				[3] = T3;
			};
			[2] = Q;
		};
		if(Main[8][4])then Main[5][11]() end; -- Save if enabled
	end;
end;

-- MakeButton Function
Main[5][28] = function(Name, Index)
    local ItemButton = setVals("TextButton",{Name=lower(Name),BackgroundColor3=COLORS[5],BorderSizePixel=0,Size=UDIM2[4],AutomaticSize='X',ZIndex=2,Font=FONT,Text=Name,TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.ItemScroller);
	Instance.new("UICorner", ItemButton); 
	table.insert(Main[4], Connect(setVals("BoolValue",{Name="Value",Value=true},ItemButton):GetPropertyChangedSignal("Value"),function()ItemButton.Visible = ItemButton.Value.Value end));
    table.insert(Main[4], Main[5][26](ItemButton));
	
	BindableEvents[ItemButton.Name] = Instance.new("BindableEvent");
	table.insert(Main[4], Connect(BindableEvents[ItemButton.Name].Event,Main[5][27](ItemButton, Index)));
	table.insert(Main[4], Connect(ItemButton.MouseButton1Click,function()Fire(BindableEvents[ItemButton.Name],8,false,false,false)end));
end;

-- Make ItemButtons for each Pet and Weapon
for _,Pet 	 in ipairs(game:GetService("ReplicatedStorage").Storage.Pets:GetChildren())   do Main[5][28](Pet.Name,	1)end;
for _,Weapon in ipairs(game:GetService("ReplicatedStorage").Storage.Weapons:GetChildren())do Main[5][28](Weapon.Name, 2)end;

table.insert(Main[4], Connect(TextBox.FocusLost,Main[5][8]));	-- Called when the Focus of the TextBox is lost
table.insert(Main[4], Connect(UserInputService.InputBegan,Main[5][7]));	-- Called when any Roblox Input Module Device is Interacted with

table.insert(Main[4], Connect(Instances.Pets.MouseButton1Click,Main[5][9](1))); -- Called when Pets button is pressed
table.insert(Main[4], Connect(Instances.Weapons.MouseButton1Click,Main[5][9](2))); -- Called when Weapons button is pressed
table.insert(Main[4], Connect(Instances.All.MouseButton1Click,Main[5][19]));	-- Called when All button is pressed

table.insert(Main[4], Connect(Instances.Info.MouseButton1Click,function()Instances.SettingsMain.Visible = not Instances.SettingsMain.Visible end));	-- Called when Info button is pressed
table.insert(Main[4], Connect(game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.GemsBar.GemsBar.Amount:GetPropertyChangedSignal("Text"),Main[5][14]));	-- Called when gems have been changed

table.insert(Main[4], Connect(Instances.Settings.MouseButton1Click,Main[5][6](Instances.SettingsFrame, Instances.InformationFrame, Instances.Settings, Instances.Information))); -- Called when Setting button is pressed
table.insert(Main[4], Connect(Instances.Information.MouseButton1Click,Main[5][6](Instances.InformationFrame, Instances.SettingsFrame, Instances.Information, Instances.Settings))); -- Called when Information button is pressed

table.insert(Main[4], Connect(Main[7][1].Amount:GetPropertyChangedSignal("Text"),Main[5][23](1)));	-- Called when a new pet has been obtained
table.insert(Main[4], Connect(Main[7][2].Amount:GetPropertyChangedSignal("Text"),Main[5][23](2)));	-- Called when a new weapon has been obtained

table.insert(Main[4], Connect(Instances.ItemFrame:GetPropertyChangedSignal("Visible"),Main[5][10](1, Instances.ItemFrame))); -- Called when ItemFrame visibility has changed
table.insert(Main[4], Connect(Instances.FuseFrame:GetPropertyChangedSignal("Visible"),Main[5][10](2, Instances.FuseFrame))); -- Called when FuseFrame visibility has changed

table.insert(Main[4], Connect(Instances.ResetTextButton.MouseButton1Click,Main[5][21])); -- Called when ResetText button is clicked
table.insert(Main[4], Connect(Instances.AutoLoadButton.MouseButton1Click,Main[5][22](3, "AutoLoad"))); -- Called when AutoLoad button is clicked
table.insert(Main[4], Connect(Instances.AutoSaveButton.MouseButton1Click,Main[5][22](4, "AutoSave"))); -- Called when AutoSave button is clicked
table.insert(Main[4], Connect(Instances.LoadFuseButton.MouseButton1Click,Main[5][22](8, "LoadFuse"))); -- Called when LoadFuse button is clicked
table.insert(Main[4], Connect(Instances.GemsToggleButton.MouseButton1Click,Main[5][22](6, "GemsToggle"))); -- Called when Gems button is clicked
table.insert(Main[4], Connect(Instances.PrintToggleButton.MouseButton1Click,Main[5][22](7, "PrintToggle"))); -- Called when Print button is clicked
table.insert(Main[4], Connect(Instances.IgnoreEquippedButton.MouseButton1Click,Main[5][22](9, "IgnoreEquipped")));-- Called when IgnoreEquipped button is clicked
table.insert(Main[4], Connect(Instances.IgnoreEnchantedButton.MouseButton1Click,Main[5][22](10, "IgnoreEnchanted"))); -- Called when IgnoreEnchanted button is clicked
table.insert(Main[4], Connect(Instances.IgnoreElementedButton.MouseButton1Click,Main[5][25])); -- Called when IgnoreElemented button is clicked

do 
	local Template = "rbxthumb://type=Asset&id=%i&w=150&h=150";
	for Aura,Data in next,require(game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.Elements)do
		Instances[Aura.."ToggleButton"] = setVals("ImageButton",{Name=Aura.."ToggleButton",BackgroundColor3=COLORS[1],BackgroundTransparency=0,BorderSizePixel=0,Size=UDIM2[11],Image=Template:format(Data.Image)},Instances.Elements);
		table.insert(Main[4], Connect(Instances[Aura.."ToggleButton"].MouseButton1Click,Main[5][24](Aura, Instances[Aura.."ToggleButton"])));
	end;
end;

table.insert(Main[4],Instances.Close.MouseButton1Click:Once(function()Instances.MainGui:Destroy()end)); -- Called when Close button is pressed

-- Loop for checking if items are finished upgrading to Antimatter 
-- Improvement: Check the antimatter frame to see if there are any weapons/pets in the collection frame
table.insert(Main[4],Connect(BindableEvents.Second.Event,function()
	if(Main[8][1])then Main[5][2]("Pets",0)end; -- attempt to retrieve any antimatter pets
	if(Main[8][2])then Main[5][2]("Weapons",0)end; -- attempt to retrieve any antimatter weapons
end));

local DungeonHandler = game:GetService("Players").LocalPlayer.PlayerScripts.PlayerHandler.Miscallenious.DungeonHandler;
local Time = nil;Time = hookfunction(os.time, function()
	if(BindableEvents~=nil and getcallingscript()==DungeonHandler)then 
		Fire(BindableEvents.Second); -- called once every second
	end;
	return Time();
end);

-- Deallocate Memory
Instances.MainGui.Destroying:Once(function()
	if(Main[8][4])then 
		Main[5][11]();
		Main[8][4] = false; -- disable any future save attempts
	end;
	
	for _,Connection in ipairs(Main[4])do Connection:Disconnect()end;
	
	Instances.FuseGui:Destroy();
	Instances.SettingsGui:Destroy();
	
	Main,Instances,BindableEvents,getgenv()["@Esz#O8k(9]1HBol~S8C"] = nil,nil,nil,nil;
end);

Main[5][20](); -- Load Saved Data

-- Deallocate not used local variables
for idx=12,22 do UDIM2[idx] = nil end;
COLORS[5],COLORS[6] = nil,nil;
Main[5][26],Main[5][27],Main[5][28] = nil,nil,nil;
