if(not game:IsLoaded())then game.Loaded:Wait()end;
if(getgenv()["@Esz#O8k(9]1HBol~S8C"]~=nil or not table.find({7026949294,11127874647},game.PlaceId))then return end; -- game.PlaceId can return 0 under certain conditions if game is not loaded
getgenv()["@Esz#O8k(9]1HBol~S8C"] = true;

local localUserId = game:GetService("Players").LocalPlayer.UserId;
local localName = game:GetService("Players").LocalPlayer.Name;

local plrData,craftingSlots = require(game:GetService("ReplicatedStorage").Saturn.Modules.Client["PlayerData - Client"]),nil;
if(not plrData.HasLoaded)then plrData.Loaded:Wait()end; -- wait until data is loaded
plrData = plrData.Replica.Data.Main;
craftingSlots = plrData.CraftingSlots;


local wait,lower,Connect = task.wait,string.lower,game.Changed.Connect; -- a unique "Connect" function is created every time ":Connect" is invoked, but they each serve the same purpose
local COLOR_PICKS = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DoComplement/Roblox/main/Colors/ColorPicks.lua")), "Error loading Colors")();
assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/t2s_v2.lua")), "Error loading TableToString")();

local LEFT = Enum.TextXAlignment.Left;
local UDIM_CORNER = UDim.new(1,0);
local FONTS = {
	[1] = Enum.Font.GothamMedium;
	[2] = Enum.Font.SourceSans;
};	
local COLORS = {
	[1] = Color3.fromHex("ffffff"); -- White
	[2] = Color3.fromHex("000000"); -- Black
	[3] = Color3.fromHex("960000"); -- Red
	[4] = Color3.fromHex("009600"); -- Green
	[5] = Color3.fromRGB(150,150,150); -- Gray
	[6] = Color3.fromRGB(200,200,200); -- Gray-White
	[7] = Color3.fromRGB(46,141,213); -- Light Blue
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
	[12] = UDim2.new(0,473,0,15);
	[13] = UDim2.new(0,210,0,42);
	[14] = UDim2.new(0.01,0,0.15,0);
	[15] = UDim2.new(0,130,0,40);
	[16] = UDim2.new(0.36,0,0.03,0);
	[17] = UDim2.new(0,25,0,25);
	[18] = UDim2.new(0,109,0,24);
	[19] = UDim2.new(0.015,0,0.15,0);
	[20] = UDim2.new(0,210,0,210);
	[21] = UDim2.new(0,206,0,21);
	[22] = UDim2.new(0,70,0,30);
	[23] = UDim2.new();
};

local Main = {
	[1] = {	
		-- Gem Toggles
		[1] = (plrData.Gems>=10000);	-- Normal Fuse Gem Cost
		[2] = (plrData.Gems>=200000); 	-- Enhanced Fuse Gem Cost
		[3] = true; 					-- Omega Fuse Cost is Free
		[4] = false; 					-- Antimatter can not be Fused
	};
	[2] = {	
		-- Level constants
		[1] = "Evolved"; 
		[2] = "Omega";
	};
	[3] = {
		[1] = {};	-- Pet Fuses
		[2] = {};	-- Weapon Fuses
	};
	[4] = {};	-- Connections
	[5] = {};	-- Functions
	[6] = { 	
		-- Remotes
		[1] = game:GetService("ReplicatedStorage").Events.FusePet; 				-- Fuse Items
		[2] = game:GetService("ReplicatedStorage").Events.CraftItem; 			-- Antimatter Conversion
		[3] = game:GetService("ReplicatedStorage").Events.ClaimCraftedItem;		-- Claim Antimatter Conversion
	};
	[7] = {	
		-- Notifications
		[1] = game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.LeftButtons.PetInventory.Notification;		-- Pets Notification
		[2] = game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.LeftButtons.WeaponInv.Notification;		-- Weapons Notification
	};	
	[8] = {	
		-- Toggles
		[1]  = true;	-- Pet Enhancement is inactive
		[2]  = true;	-- Weapon Enhancement is inactive
		[3]  = true; 	-- AutoLoad Toggle
		[4]  = true; 	-- AutoSave Toggle
		[5]  = true; 	-- ResetText Toggle
		[6]  = false; 	-- Gems Toggle
		[7]  = false; 	-- Print Toggle
		[8]  = false; 	-- LoadFuse Toggle
		[9]  = true; 	-- IgnoreEquipped Toggle
		[10] = true; 	-- IgnoreEnchanted Toggle
		[11] = true; 	-- IgnoreElemented Toggle
		[12] = false; 	-- SaveQueue Toggle
	};
	[9] = {	
		-- String Constants
		[1] = "Pets";
		[2] = "Weapons";
	};
	[10] = { 
		-- Queue
		[1] = false; 	-- Pet Signal Queue
		[2] = false; 	-- Weapon Signal Queue
		[3] = 0; 		-- Fuse Frame Count
		[4] = 10; 		-- Element Enabled Count
	};
	[11] = { 
		-- bool-color constants
		[true]  = COLORS[4];	-- green
		[false] = COLORS[3];	-- red
	};
	[12] = { 
		-- Queue quantities
		["Pets"] 	= 0;
		["Weapons"] = 0;
	};
};

-- AutoSave Data
local SaveData = {
	["Visible"] = {
		[1] = true; -- SearchFrame Visibility
		[2] = true; -- FuseFrame Visibility
	};
	["Toggles"] = {
		["AutoLoad"]        = true;
		["AutoSave"]        = true;
		["ResetText"]       = true;
		["GemsToggle"]      = false;
		["PrintToggle"]     = false;
		["LoadFuse"]        = false;
		["IgnoreEquipped"]  = true;
		["IgnoreEnchanted"] = true;
		["IgnoreElemented"] = true;
		["SaveQueue"]       = false;
	};
	["Elements"] = {
		["Water"]     = true;
		["Earth"]     = true;
		["Light"]     = true;
		["Shadow"]    = true;
		["Wind"]      = true;
		["Lightning"] = true;
		["Fire"]      = true;
		["Galaxy"]    = true;
		["Chaos"]     = true;
		["Spooky"]    = true;
	};
	["Items"] = {};
};

local function setVals(class, props, parent)
	local inst = Instance.new(class);
	for prop,val in next,props do
		inst[prop] = val;
	end;
	inst.Parent = parent;	-- assign parent last to avoid erroneous game-listener assignments
	return inst;
end;

local Instances,BindableEvents = {},{};
BindableEvents.Second = Instance.new("BindableEvent");

local InvokeServer = Main[6][1].InvokeServer;
local Fire = BindableEvents.Second.Fire;

local function createCornerBtns(tbl,parents)
	for _,parent in ipairs(parents)do
		Instance.new("UICorner",tbl[parent]).CornerRadius = UDIM_CORNER;	-- should be fine
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

-- Search Frame
Instances.ItemFrame = setVals("Frame",{Parent=Instances.MainGui,Active=true,Selectable=true,Draggable=true,BackgroundColor3=COLORS[1],Position=UDim2.new(0.8,0,0.35,0),Size=UDim2.new(0,235,0,260),Visible=false},Instances.MainGui);
Instances.ItemScroller = setVals("ScrollingFrame",{Active=true,BackgroundColor3=COLORS[1],CanvasSize=UDIM2[23],AutomaticCanvasSize='Y',ScrollingDirection='Y',ScrollBarThickness=0,Position=UDim2.new(0.05,0,0.26,0),Size=UDim2.new(0,215,0,186),BottomImage="",MidImage="",TopImage=""},Instances.ItemFrame);
local TextBox = setVals("TextBox",{BackgroundColor3=COLORS[1],Position=UDim2.new(0.05,0,0.1,0),Size=UDim2.new(0,215,0,30),Font=FONTS[2],Text="Search",TextColor3=COLORS[2],TextSize=14},Instances.ItemFrame);
Instances.Info = setVals("ImageButton",{BackgroundTransparency=1,Position=UDim2.new(0.01,0,0,0),Size=UDIM2[17],ZIndex=2,Image="rbxassetid://3926305904",ImageColor3=COLORS[5],ImageRectOffset=Vector2.new(4,804),ImageRectSize=Vector2.new(36,36)},Instances.ItemFrame);
Instances.Close = setVals("ImageButton",{BackgroundTransparency=1,Position=UDim2.new(0.9,0,0.01,0),Size=UDIM2[17],ZIndex=2,Image="rbxassetid://3926305904",ImageColor3=COLORS[5],ImageRectOffset=Vector2.new(285,5),ImageRectSize=Vector2.new(24,24)},Instances.ItemFrame);
setVals("UIListLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.Name,Padding=UDim.new(0,10)},Instances.ItemScroller);
Instance.new("UICorner",Instances.ItemFrame);

-- Fuse Frame
Instances.FuseFrame = setVals("Frame",{Active=true,Selectable=true,Draggable=true,Visible=false,BackgroundColor3=COLORS[1],Position=UDim2.new(0.7,0,0.65,0),Size=UDim2.new(0,522,0,180)},Instances.FuseGui);
Instances.FuseScroller = setVals("ScrollingFrame",{Name="FuseFrame",BackgroundColor3=COLORS[1],CanvasSize=UDIM2[23],AutomaticCanvasSize='Y',ScrollingDirection='Y',ScrollBarThickness=0,Position=UDim2.new(0.01775,0,0.195,0),Size=UDim2.new(0,503,0,135),BottomImage="",MidImage="",TopImage=""},Instances.FuseFrame);
Instances.All = setVals("TextButton",{Name="All",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDim2.new(0.89,0,0.015,0),Size=UDim2.new(0,45,0,30),ZIndex=2,Font=FONTS[1],Text="All",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.FuseFrame);
Instances.Pets = setVals("TextButton",{Name="Pets",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDim2.new(0.784,0,0.015,0),Size=UDim2.new(0,55,0,30),ZIndex=2,Font=FONTS[1],Text="Pets",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.FuseFrame);
Instances.Weapons = setVals("TextButton",{Name="Weapons",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDim2.new(0.6485,0,0.015,0),Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="Weapons",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.FuseFrame);
Instances.ToggleFrame = setVals("TextButton",{Name="ToggleFrame",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDim2.new(0.01632,0,0.015,0),Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="Queue",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.FuseFrame);
setVals("TextLabel",{Name="Label",BackgroundColor3=COLORS[1],BackgroundTransparency=1,Position=UDim2.new(0.5185,0,0.045,0),Size=UDim2.new(0,72,0,20),Font=Enum.Font.Gotham,Text="Remove:",TextColor3=COLORS[2],TextSize=13},Instances.FuseFrame);
setVals("UIListLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,5)},Instances.FuseScroller);
Instance.new("UICorner",Instances.FuseFrame);

-- Queue Frame
Instances.QueueScroller = setVals("ScrollingFrame",{Name="QueueFrame",BackgroundColor3=COLORS[1],AutomaticCanvasSize='Y',ScrollingDirection='Y',ScrollBarThickness=0,Position=UDim2.new(0.01775,0,0.195,0),Size=UDim2.new(0,503,0,135),Visible=false,CanvasSize=UDIM2[23],BottomImage="",MidImage="",TopImage=""},Instances.FuseFrame);
Instances.PetsHeader = setVals("TextLabel",{Name="PetsHeader",BackgroundColor3=COLORS[1],Size=UDim2.new(0,517,0,23),Font=FONTS[2],Text="     (0/"..craftingSlots..") - Pets",TextColor3=COLORS[2],TextScaled=true,TextSize=14,TextWrapped=true,TextXAlignment=LEFT},Instances.QueueScroller);
Instances.WeaponsHeader = setVals("TextLabel",{Name="WepsHeader",BackgroundColor3=COLORS[1],LayoutOrder=2,Size=UDim2.new(0,517,0,23),Font=FONTS[2],Text="     (0/"..craftingSlots..") - Weapons",TextColor3=COLORS[2],TextScaled=true,TextSize=14,TextWrapped=true,TextXAlignment=LEFT},Instances.QueueScroller);
setVals("UIListLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,5)},Instances.QueueScroller);

Instances.SettingsMain = setVals("Frame",{Selectable=true,Active=true,Draggable=true,BackgroundColor3=COLORS[1],Position=UDim2.new(0.64,80,0.23,120),Size=UDim2.new(0,218,0,255),Visible=false},Instances.SettingsGui);
Instances.Information = setVals("TextButton",{Name="Information",BackgroundColor3=COLORS[5],BorderSizePixel=0,Size=UDIM2[18],Font=FONTS[1],Text="Information",TextColor3=COLORS[1],TextSize=14},Instances.SettingsMain);
Instances.Settings = setVals("TextButton",{Name="Settings",BackgroundColor3=COLORS[6],BorderSizePixel=0,Position=UDim2.new(0.5,0,0,0),Size=UDIM2[18],Font=FONTS[1],Text="Settings",TextColor3=COLORS[1],TextSize=14},Instances.SettingsMain);
Instance.new("UICorner",Instances.SettingsMain);

-- Information Frame
Instances.InformationFrame = setVals("Frame",{Name="InformationFrame",BackgroundColor3=COLORS[1],Position=UDIM2[19],Size=UDIM2[20]},Instances.SettingsMain);
setVals("TextLabel",{Name="Label1",BackgroundColor3=COLORS[1],Position=UDim2.new(0.007,1,0.01,0),Size=UDim2.new(0,206,0,52),Font=FONTS[2],Text="Click the buttons in the search frame with the names of items you want to have fused automatically.",TextColor3=COLORS[2],TextSize=14,TextWrapped=true},Instances.InformationFrame);
setVals("TextLabel",{Name="Label2",BackgroundColor3=COLORS[1],Position=UDim2.new(0.007,1,0.275,0),Size=UDim2.new(0,206,0,52),Font=FONTS[2],Text="Click the number by each item in the Fuse frame to change the quantity of items fused toward antimatter.",TextColor3=COLORS[2],TextSize=14,TextWrapped=true},Instances.InformationFrame);
setVals("TextLabel",{Name="Label3",BackgroundColor3=COLORS[1],Position=UDim2.new(0.007,1,0.535,0),Size=UDim2.new(0,206,0,45),Font=FONTS[2],Text="Please report any issues or concerns to Activities12 on v3rmillion or loverboy#3970 on discord.",TextColor3=COLORS[2],TextSize=14,TextWrapped=true},Instances.InformationFrame);
setVals("TextLabel",{Name="Toggle1",BackgroundColor3=COLORS[1],Position=UDim2.new(0.007,1,0.77,0),Size=UDIM2[21],Font=FONTS[2],Text="Toggle SearchFrame:    LeftControl + G",TextColor3=COLORS[2],TextSize=14},Instances.InformationFrame);
setVals("TextLabel",{Name="Toggle2",BackgroundColor3=COLORS[1],Position=UDim2.new(0.007,1,0.88,0),Size=UDIM2[21],Font=FONTS[2],Text=" Toggle FuseFrame:        LeftControl + M",TextColor3=COLORS[2],TextSize=14},Instances.InformationFrame);
Instance.new("UICorner", Instances.InformationFrame);

-- Settings Frame
Instances.SettingsFrame = setVals("ScrollingFrame",{Name="SettingsFrame",BackgroundColor3=COLORS[1],Position=UDIM2[19],Size=UDIM2[20],BorderSizePixel=0,CanvasPosition=Vector2.new(),AutomaticCanvasSize='Y',CanvasSize=UDIM2[23],ScrollingDirection='Y',ScrollBarThickness=0,Visible=false,BottomImage='',MidImage='',TopImage=''},Instances.SettingsMain);
Instances.AutoLoadFrame = setVals("Frame",{Name="AutoLoadFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.PrintToggleFrame = setVals("Frame",{Name="PrintToggleFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.AutoSaveFrame = setVals("Frame",{Name="AutoSaveFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.ResetTextFrame = setVals("Frame",{Name="ResetTextFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.GemsToggleFrame = setVals("Frame",{Name="GemsToggleFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.LoadFuseFrame = setVals("Frame",{Name="LoadFuseFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.IgnoreEquippedFrame = setVals("Frame",{Name="IgnoreEquippedFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.IgnoreEnchantedFrame = setVals("Frame",{Name="IgnoreEnchantedFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.SaveQueueFrame = setVals("Frame",{Name="SaveQueueFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.SettingsFrame);
Instances.IgnoreElemented = setVals("Frame",{Name="IgnoreElemented",BackgroundColor3=COLORS[1],Position=UDim2.new(0,0,0.5,0),Size=UDim2.new(0,210,0,111)},Instances.SettingsFrame);
Instances.IgnoreElementedFrame = setVals("Frame",{Name="IgnoreElementedFrame",BackgroundColor3=COLORS[1],Size=UDIM2[13]},Instances.IgnoreElemented);
Instances.Elements = setVals("Frame",{Name="Elements",BackgroundColor3=COLORS[1],BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(0,0,0.378,0),Size=UDim2.new(0,210,0,68)},Instances.IgnoreElemented);

-- Toggle Buttons
Instances.IgnoreElementedButton = setVals("TextButton",{Name="IgnoreElementedButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="Ignore Elemented",TextColor3=COLORS[1],TextSize=12,TextWrapped=true},Instances.IgnoreElementedFrame);
Instances.IgnoreEnchantedButton = setVals("TextButton",{Name="IgnoreEnchantedButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="Ignore Enchanted",TextColor3=COLORS[1],TextSize=12,TextWrapped=true},Instances.IgnoreEnchantedFrame);
Instances.IgnoreEquippedButton = setVals("TextButton",{Name="IgnoreEquippedButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="Ignore Equipped",TextColor3=COLORS[1],TextSize=12,TextWrapped=true},Instances.IgnoreEquippedFrame);
Instances.LoadFuseButton = setVals("TextButton",{Name="LoadFuseButton",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="LoadFuse",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.LoadFuseFrame);
Instances.AutoLoadButton = setVals("TextButton",{Name="AutoLoadButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="AutoLoad",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.AutoLoadFrame);
Instances.AutoSaveButton = setVals("TextButton",{Name="AutoSaveButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="AutoSave",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.AutoSaveFrame);
Instances.ResetTextButton = setVals("TextButton",{Name="ResetTextButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="ResetText",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.ResetTextFrame);
Instances.GemsToggleButton = setVals("TextButton",{Name="GemsToggleButton",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="Gems",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.GemsToggleFrame);
Instances.PrintToggleButton = setVals("TextButton",{Name="PrintToggleButton",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="Print",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.PrintToggleFrame);
Instances.SaveQueueButton = setVals("TextButton",{Name="SaveQueueButton",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="SaveQueue",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.SaveQueueFrame);

setVals("UIGridLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,CellPadding=UDim2.new(0,8,0,0),CellSize=UDim2.new(0,33,0,33)},Instances.Elements);
Instance.new("UIListLayout",Instances.SettingsFrame).SortOrder = Enum.SortOrder.LayoutOrder; -- should be fine

-- Information Labels
setVals("TextLabel",{Name="AutoLoadLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=FONTS[2],Text="Auto-Load stored data upon script-execution, or, if not yet loaded, load saved data.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.AutoLoadFrame);
setVals("TextLabel",{Name="AutoSaveLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=FONTS[2],Text="Auto-Save the state of the each Frame and Toggles upon any respective interaction.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.AutoSaveFrame);
setVals("TextLabel",{Name="ResetTextLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=FONTS[2],Text="Resets the search bar text to \"Search\" three seconds after the box's focus is lost.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.ResetTextFrame);
setVals("TextLabel",{Name="GemsToggleLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=FONTS[2],Text="Toggles fusing when you have sufficient gems. Disable if you have much more than 10M gems.",TextColor3=COLORS[2],TextSize=10,TextWrapped=true},Instances.GemsToggleFrame);
setVals("TextLabel",{Name="PrintToggleLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDim2.new(0.36,0,0.1,0),Size=UDim2.new(0,130,0,30),Font=FONTS[2],Text="Toggles printing any item fuse event to the standard console.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.PrintToggleFrame);
setVals("TextLabel",{Name="LoadFuseLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=FONTS[2],Text="Will run a single-fuse search on all loaded items upon load.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.LoadFuseFrame)
setVals("TextLabel",{Name="IgnoreEquippedLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDim2.new(0.36,0,0.01,0),Size=UDIM2[15],Font=FONTS[2],Text="Equipped items will be ignored during fusing events.",TextColor3=COLORS[2],TextSize=12,TextWrapped=true},Instances.IgnoreEquippedFrame);
setVals("TextLabel",{Name="IgnoreEnchantedLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDim2.new(0.36,0,0.02,0),Size=UDIM2[15],Font=FONTS[2],Text="Enchanted - Damage+, Coins+, etc. - items will be ignored during fusing events.",TextColor3=COLORS[2],TextSize=11,TextWrapped=true},Instances.IgnoreEnchantedFrame);
setVals("TextLabel",{Name="IgnoreElementedLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=FONTS[2],Text="Items with enabled Elements, specified by the toggles below, will be ignored during fusing events.",TextColor3=COLORS[2],TextSize=10,TextWrapped=true},Instances.IgnoreElementedFrame);
setVals("TextLabel",{Name="SaveQueueLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[16],Size=UDIM2[15],Font=FONTS[2],Text="Automatically stores Antimatter queue into: SwordSimData/QueueData",TextColor3=COLORS[2],TextSize=10,TextWrapped=true},Instances.SaveQueueFrame);

createCornerBtns(Instances,{"ToggleFrame","SaveQueueButton","All","Pets","Weapons","LoadFuseButton","PrintToggleButton","IgnoreEquippedButton","IgnoreEnchantedButton","AutoLoadButton","ResetTextButton","AutoSaveButton","GemsToggleButton","IgnoreElementedButton","IgnoreElementedButton"});

local formatDate = nil;
do 	-- function to format a time, of the format returned by os.time, into an extended date
	local TEMPLATE = "%s, %s %i, %02i:%02i:%02i, %02i/%02i/%04i";
	local DAYS 	   = {"Sun","Mon","Tue","Wed","Thr","Fri","Sat"};
	local MONTHS   = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
	formatDate = function(date)
		return string.format(TEMPLATE, DAYS[date.wday], MONTHS[date.month], date.day, date.hour, date.min, date.sec, date.month, date.day, date.year);
	end;
end;

local saveQueue = nil;
do
	local queueFile   = "SwordSimData/QueueData.json";
	local legibleFile = "SwordSimData/QueueData.lua";
	
	if(not isfile(queueFile))then writefile(queueFile,"[]")end;		-- check json file existence
	if(not isfile(legibleFile))then writefile(legibleFile,'')end;	-- check lua file existence

	local function getQueue()
		local queue = {Slots = craftingSlots,Pets = {},Weapons = {}};		-- local data template
		for cast,data in next,plrData.QueuedItems do						-- loop through queue
			for uid,item in next,data do
				if(not queue[cast][item.ItemData.Base])then					-- check item existence in data template
					queue[cast][item.ItemData.Base] = {};
				end;
				queue[cast][item.ItemData.Base][uid] = formatDate(os.date("!*t",item.ReleaseDate));		-- assign releasedate
			end;
		end;
		return queue;
	end;
	
	local HttpService   = game:GetService("HttpService");
	local Encode,Decode = HttpService.JSONEncode,HttpService.JSONDecode;
	
	saveQueue = function()
		local queue = Decode(HttpService,readfile(queueFile));	-- get data
		queue[localName] = getQueue();							-- update local portion
		writefile(queueFile, Encode(HttpService,queue));		-- write json
		writefile(legibleFile, t2s(queue,nil,true));			-- write legible
	end;
end;

-- Reset input Table
Main[5][1] = function(items)
	for _,list in next,items do
		list[1][2],list[2][2],list[3][2] = 0,0,0;
	end;
end;

-- Retrieve Queue: returns the Quantity of taken slots in the antimatter gui category 
Main[5][2] = function(cast)
    for uid,item in next,plrData.QueuedItems[cast]do
		if(item.ReleaseDate<=os.time())then
			InvokeServer(Main[6][3],cast,uid);			-- Collect antimatter item
			Main[12][cast] -= 1; 						-- Update respective queue quantity
			Instances.QueueScroller[uid]:Destroy();		-- Destroy the frame representing the collected item
			if(Main[8][12])then saveQueue()end;
			if(Main[8][7])then print("Antimatter",item.ItemData.Base,"retrieved.")end;
		end
    end;
end;

task.defer(function()
	if(plrData.Gamepasses["1296775568"])then return end;							-- do nothing if user has max crafting slots
	local devProdIds = {1296775568,1296775418,1296775177,1296774844,1296774588};	-- DevProduct IDs for crafting slot tiers (in reverse-tier order)
	for idx = 5,1,-1 do																-- Index in reverse for easy table.remove calls
		if(not plrData.Gamepasses[tostring(devProdIds[idx])])then break end;		-- If plr doesn't own one tier, the rest are not owned
		table.remove(devProdIds);
	end;
	
	local con = nil;
	con = game:GetService("MarketplaceService").PromptProductPurchaseFinished:Connect(function(userId, productId, isPurchased)
		if(userId==localUserId and productId==devProdIds[#devProdIds]and isPurchased)then	-- if local user purchased more crafting slots
			
			table.remove(devProdIds);				-- remove productId from reference table for later disconnection
			craftingSlots += 2;						-- increment local craftingSlots quantity
			if(Main[8][12])then saveQueue()end;		-- save if toggled
			
			Instances.PetsHeader.Text = "     ("..Main[12]["Pets"]..'/'..craftingSlots..") - Pets";			-- update pets header
			Instances.WeaponsHeader.Text = "     ("..Main[12]["Weapons"]..'/'..craftingSlots..") - Weapons";	-- update weapons header
			
			if(#devProdIds==0)then con = con:Disconnect()end;	-- disconnect if there aren't 
		end;
	end);
	table.insert(Main[4],con);	--	for disconnection if the gui is destroyed mid-game
end);

-- 
table.insert(Main[4], Connect(Instances.QueueScroller.ChildRemoved, function(child)
	if(child.LayoutOrder==1)then
		Instances.PetsHeader.Text = "     ("..Main[12]["Pets"]..'/'..craftingSlots..") - Pets";
	else
		Instances.WeaponsHeader.Text = "     ("..Main[12]["Weapons"]..'/'..craftingSlots..") - Weapons";
	end;
end));

local newQueueItem = nil;
do
	local fmt1,fmt2 = "&gt;   <u>%s</u>:   %s","     (%d/%d) - %s";		-- release date format, item type header format
	local order = {Pets = 1,Weapons = 3};								-- item type LayoutOrder constants 
	newQueueItem = function(cast,uid,name,releaseDate)
		if(Main[8][12])then saveQueue()end;
		
		-- create a textlabel to represent an item in the antimatter queue
		setVals("TextLabel",{Name=uid,RichText=true,BackgroundColor3=COLORS[1],BorderSizePixel=0,LayoutOrder=order[cast],Size=UDIM2[12],Font=FONTS[2],Text=fmt1:format(name,formatDate(os.date("!*t",releaseDate))),TextColor3=COLORS[2],TextSize=14,TextXAlignment=LEFT},Instances.QueueScroller);
		Instances[cast.."Header"].Text = string.format(fmt2,Main[12][cast],craftingSlots,cast);		-- update the header based on the quantity of items in the respective queue
	end;
end;

-- initialize antimatter queue frame (global scope is preferred)
for cast,data in next,plrData.QueuedItems do
	for uid,item in next,data do
		Main[12][cast] += 1												-- increment queue quantity
		newQueueItem(cast,uid,item.ItemData.Base,item.ReleaseDate);		-- create a new queue frame
	end;
end;

-- scans for a new queued item
local function getNewQueueUid(cast)
	for uid,item in next,plrData.QueuedItems[cast]do
		if(not Instances.QueueScroller:FindFirstChild(uid))then		-- if item doesn't have a corresponding queue frame
			return uid,item.ItemData.Base,item.ReleaseDate;			-- return data to create a new queue frame
		end;
	end;
end;

-- Fuse Items
Main[5][3] = function(list,item,cast,change)
	if(item.Level~=3)then 										-- Antimatter crafting has different logic
		InvokeServer(Main[6][1],cast,list[3]); 					-- Fuse non-antimatter items
		if(Main[8][7])then print(3, item.Base,"fused to",Main[2][item.Level])end;
		return false;											-- indicate there is potential for further fusing
	elseif(Main[12][cast]<craftingSlots)then					-- if there is an open queue slot for antimatter fusing
		InvokeServer(Main[6][2],cast,list[3]);					-- Antimatter Conversion Remote
		Main[12][cast] += 1;									-- increment respective queue quantity
		task.defer(newQueueItem,cast,getNewQueueUid(cast));		-- create frame on a new thread to not slow (minutely, as is) fusing 
		if(Main[8][7])then print(list[2],item.Base,"fused to Antimatter")end;
	end;
	return change;
end;

-- Check Ignore Toggles
Main[5][4] = function(tag, cast)
	-- check if IgnoreEquipped is enabled and if the item is equipped
	if(Main[8][9]and((cast=="Weapons"and plrData.EquippedItems.Weapons[tag]~=nil)or table.find(plrData.EquippedItems.Pets,tag)~=nil))then
		return true;
	end;
	-- check if IgnoreElemented is enabled and if the item has an aura
	if(Main[8][11]and SaveData.Elements[plrData[cast][tag].Element])then
		return true;
	end;
	-- check if IgnoreEnchanted is enabled and if the item has an enchantment
	return(Main[8][10]and next(plrData[cast][tag].Enchants or{})~=nil);
end;

-- Enhance Item
Main[5][5] = function(items,cast,change,list)
	for tag,item in next,plrData[cast]do
		if(not Main[1][item.Level]or not items[item.Base]or Main[5][4](tag,cast))then 	-- Item Validation, lack of "not"-distrubution is required
			continue; 
		end;
		
		list = items[item.Base][item.Level]; 	-- ease-of-access		
		if(not list[1])then continue end; 		-- validate enabled
		
		list[2] += 1;				-- increment tag quantity in reference table
		list[3][list[2]] = tag; 	-- set tag
		if(#list[3]<=list[2])then							-- if ready to be fused
			change = Main[5][3](list,item,cast,change);		-- Fuse Items
			list[2] = 0;									-- reset tag quantity
		end;
	end;
	
	Main[5][1](items);			-- Reset table tag quantities
	if(cast=="Pets")then		-- indicate which signal is active
		Main[8][1] = change;
	else
		Main[8][2] = change;
	end;
end;

-- General Settings/Information Frame Toggle
Main[5][6] = function(FRAME1, FRAME2, BTN1, BTN2)
	return function()
		if(not FRAME1.Visible)then 
		
			BTN1.BackgroundColor3 = COLORS[5];	-- opaque
			BTN2.BackgroundColor3 = COLORS[6];	-- translucent
			
			FRAME1.Visible = true;
			FRAME2.Visible = false;
		end;
	end;
end;

-- Toggle GUI Visible
local UserInputService = game:GetService("UserInputService");
Main[5][7] = function(key,isProc)
	-- if a key is pressed while either the leftcontrol or rightcontrol is held down
	if(not isProc or key.UserInputType.Value~=8 or not(UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)))then 
		return;
	elseif(key.KeyCode.Value==109)then										-- if M-key is pressed
		Instances.FuseFrame.Visible = not Instances.FuseFrame.Visible;
	elseif(key.KeyCode.Value==103)then										-- if G-key is pressed
		Instances.ItemFrame.Visible = not Instances.ItemFrame.Visible;
		Instances.SettingsMain.Visible = false;
	end;
end;

-- FocusLost function
Main[5][8] = function()
	wait(3);	-- give the user time to react
	-- a signal could be active after destroying the gui because of wait, so Instances~=nil must be checked to avoid an error
	if(Instances~=nil and not TextBox:IsFocused()and Main[8][5])then	-- if the search box is not being used and ResetText is enabled
		TextBox.Text = "Search";
	end;
end;

-- General Remove Pets/Weapons function
Main[5][9] = function(idx)
	return function()
		for Item in next,Main[3][idx]do
			Instances.FuseScroller[lower(Item)]:Destroy();
		end;
	end;
end;

-- General ItemFrame/FuseFrame Visible Changed Function for AutoSave
Main[5][10] = function(idx, Frame)
	return function()
		SaveData["Visible"][idx] = Frame.Visible;
		if(Main[8][4])then Main[5][11]()end;
	end;
end;

do	-- Save Data function
	local header = "-- AutoSave Data, "..localName.."\n-- ";
	local fileName = "SwordSimData/AutoFuseData/AutoSave_"..localUserId..".lua";
	Main[5][11] = function()
		writefile(fileName,header..os.date().."\n\n"..t2s(SaveData,nil,true));
	end;
end;

-- Check Toggles from Gem Signal
Main[5][12] = function(idx)
	for _,list in next,Main[3][idx]do
		if(list[1][1]or list[1][2]or list[1][3])then return(true)end;		-- check if any toggles are active
	end;
	return false;
end;

-- Calls enhance function if Gem Toggle and any Fuse Toggle is enabled
Main[5][13] = function(idx)
	if(nil~=table.find(Main[1],true)and Main[5][12](idx))then
		Main[8][idx] = false;													-- indicate fusing is active
		repeat Main[5][5](Main[3][idx],Main[9][idx],true)until Main[8][idx];	-- Enhance Items function
	end;
end;

-- updates gem toggles and calls pets/weapon checks if either are inactive when gems are obtained
-- the significance of this function is to call the enhance item function if enough gems have been obtained 
Main[5][14] = function()
	Main[1][1] = (plrData.Gems>=10000);		-- toggle for normal fusing
	Main[1][2] = (plrData.Gems>=200000);	-- toggle for enhance fusing

	if(Main[8][6])then 							-- checks Gems Toggle
		if(Main[8][1])then Main[5][13](1)end;	-- if Pets toggle is inactive, check Pets
		if(Main[8][2])then Main[5][13](2)end;	-- if Weapons toggle is inactive, check Weapons
	end;
end;

-- ToggleButton function
Main[5][15] = function(fuseBtn, list, idx, itm_idx)
	local val = nil;		-- temp upvalue
	return function()
		val = not list[1];
		
		SaveData["Items"][lower(fuseBtn.Parent.Name)][1][itm_idx] = val; 	-- Update AutoSave Data
		list[1],fuseBtn.BackgroundColor3 = val,Main[11][val]; 				-- Update respective Item List and Button Color
		if(Main[8][4])then Main[5][11]()end;						 		-- Update Save File
		
		if(not val)then return end;
		if(not Main[8][idx])then					-- if fusing is already active
			if(Main[10][idx])then return end;		-- return if a signal is already in queue
			Main[10][idx] = true;					-- indicate signal is in queue
			while(not Main[8][idx])do wait()end; 	-- wait the active signal is finished
		end;
		
		Main[8][idx] = false; 		-- set inactive to false
		Main[10][idx] = false; 		-- indicate no signal is in queue
		repeat Main[5][5](Main[3][idx],Main[9][idx],true)until Main[8][idx];	-- calling enhance items function
	end;
end;

-- UpdateFuseQuantity function
Main[5][16] = function(bulkBtn, anti, list)
	local data,bulk = nil,nil;		-- temp upvalues
	return function()
		-- assign respective upvalues
		data = SaveData["Items"][lower(anti.Parent.Name)];	-- reference data
		bulk = (#list[3] - 1);								-- new item quantity
		
		if(bulk==0)then 				-- if lower yield is reached
			bulk = 8;					-- set to valid max
			for idx = 1,8 do			
				list[3][idx] = '';		-- update tags
			end;
		else
			list[3][bulk + 1] = nil;	-- remove last tag
		end;
		
		list[1],data[1][3] = false,false;		-- disable fusing to avoid unintenional fusing
		anti.BackgroundColor3 = COLORS[3]; 		-- set button color to red to indicate disabled fusing
		
		bulkBtn.Text,data[2] = bulk,bulk;		-- update tag quantity, antimatter fuse quantity
		if(Main[8][4])then Main[5][11]()end;
	end;
end;

-- DeallocateFrame function
Main[5][17] = function(signals, itemBtn)
	for _,con in ipairs(signals)do con:Disconnect()end;		-- disconnect button connections
	SaveData["Items"][lower(itemBtn.Text)] = nil; 			-- remove item from SaveData
	itemBtn.Value.Value = true;								-- itemBtn will now be visible in the search frame
	
	-- update quantity of items in the fuse frame
	if(Main[10][3]==1)then						-- if only 1 item existed in the frame...
		Main[10][3] = 0;
		Instances.FuseFrame.Visible = false;	-- set FuseFrame visibility to false
	else
		Main[10][3] -= 1;						-- decrement quantity
	end
	
	if(Main[8][4])then Main[5][11]()end;
end;

-- Create Item Fuse Frame function
Main[5][18] = function(itemBtn,idx,item)
	Main[10][3] += 1;
	local FRAME = {};	-- create a frame for an item being monitered for fusing
	FRAME.ItemFrame = setVals("Frame",{Name=itemBtn.Name,BackgroundTransparency=1,BackgroundColor3=COLORS[1],Size=UDIM2[2]},Instances.FuseScroller);
	FRAME.Item = setVals("TextButton",{Name="Item",BackgroundColor3=COLOR_PICKS[math.random(153)],BorderSizePixel=0,Position=UDIM2[3],Size=UDIM2[4],ZIndex=2,Font=FONTS[1],Text=itemBtn.Text,TextColor3=COLORS[1],TextSize=13,TextWrapped=true},FRAME.ItemFrame);
	FRAME.Evolve = setVals("TextButton",{Name="Evolve",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[5],Size=UDIM2[1],ZIndex=2,Font=FONTS[1],Text="Evolved",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},FRAME.ItemFrame);
	FRAME.Omega = setVals("TextButton",{Name="Omega",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[6],Size=UDIM2[1],ZIndex=2,Font=FONTS[1],Text="Omega",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},FRAME.ItemFrame);
	FRAME.Antimatter = setVals("TextButton",{Name="Antimatter",BackgroundColor3=COLORS[3],BorderSizePixel=0,Position=UDIM2[7],Size=UDIM2[8],ZIndex=2,Font=FONTS[1],Text="Antimatter",TextColor3=COLORS[1],TextSize=13,TextWrapped=true},FRAME.ItemFrame);
	FRAME.FuseQuantity = setVals("TextButton",{Name="FuseQuantity",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[9],Size=UDIM2[10],ZIndex=2,Font=FONTS[1],Text="8",TextColor3=COLORS[2],TextScaled=true,TextSize=13,TextWrapped=true},FRAME.ItemFrame);
	createCornerBtns(FRAME,{"Item","Evolve","Omega","Antimatter","FuseQuantity"});

	local Signals = {
		[1] = Connect(FRAME.Evolve.MouseButton1Click,Main[5][15](FRAME.Evolve, item[1], idx, 1));							-- "toggle normal fusing" signal
		[2] = Connect(FRAME.Omega.MouseButton1Click,Main[5][15](FRAME.Omega, item[2], idx, 2));								-- "toggle omega fusing" signal
		[3] = Connect(FRAME.Antimatter.MouseButton1Click,Main[5][15](FRAME.Antimatter, item[3], idx, 3));					-- "toggle antimatter fusing" signal
		[4] = Connect(FRAME.FuseQuantity.MouseButton1Click,Main[5][16](FRAME.FuseQuantity, FRAME.Antimatter, item[3]));		-- "update fuse quantity" signal
		[5] = FRAME.Item.MouseButton1Click:Once(function()FRAME.ItemFrame:Destroy()end);									-- "destroy the frame" signal
	};
	FRAME.ItemFrame.Destroying:Once(function()Main[3][idx][itemBtn.Text] = Main[5][17](Signals, itemBtn)end);				-- deallocates the item savedata and frame signals
end

-- RemoveAll function
Main[5][19] = function()
	for _,Frame in ipairs(Instances.FuseScroller:GetChildren())do
		Frame:Destroy();
	end;
end;

-- Load Data function
Main[5][20] = function()
	local fileName = "SwordSimData/AutoFuseData/AutoSave_"..localUserId..".lua";
	if(not isfile(fileName))then					-- if there is no savedata
		Instances.ItemFrame.Visible    = true;
		Instances.FuseFrame.Visible    = true;
		Instances.SettingsMain.Visible = true;
		Main[5][11]();								-- initial save
		return;
	end;
	
	-- assert data format
	local data = assert(loadstring(readfile(fileName)),"Error, table expected from data fetch: workspace/"..fileName)();
	if(not(data["Toggles"]and data["Toggles"]["AutoLoad"]))then return end;		-- return if AutoLoad is nil or disabled
	
	local ref,trns,val = {
		-- SaveData constants
		["AutoLoad"]        = 3;
		["AutoSave"]        = 4;
		["ResetText"]       = 5;
		["GemsToggle"]      = 6;
		["PrintToggle"]     = 7;
		["LoadFuse"]        = 8;
		["IgnoreEquipped"]  = 9;
		["IgnoreEnchanted"] = 10;
		["IgnoreElemented"] = 11;
		["SaveQueue"]       = 12;
	},{ 
		-- Transparency constants
		[true]  = 0;
		[false] = 0.5;
	},nil;
	
	-- Validate and Load Toggle Data
	Main[10][4] = 0;
	for name,list in next,SaveData do
		if(not data[name]or name=="Items")then continue end;									-- validate and extradite
		assert(type(data[name])=="table", "table expected when reading \""..name);				-- assert format
		for idx in next,list do
			val = (type(data[name][idx])=="boolean"and data[name][idx]);						-- obtain toggle state
			list[idx] = val;																	-- assign toggle state
			if(name=="Elements")then															
				Instances.Elements[idx.."ToggleButton"].BackgroundTransparency = trns[val];		-- assign transparency state
				if(val)then Main[10][4] += 1 end; 												-- Count enabled, ignored elements
			elseif(name~="Visible")then
				Main[8][ref[idx]] = val;														-- assign toggle visibility
				Instances[idx.."Button"].BackgroundColor3 = Main[11][val];						-- assign toggle background color
			end;
		end;
	end;
	
	-- assign fram visibility
	Instances.ItemFrame.Visible = SaveData.Visible[1];
	Instances.FuseFrame.Visible = SaveData.Visible[2];
	if(Main[8][12])then saveQueue()end; 					-- saveQueue if enabled
	val = SaveData.Visible[2];								-- SaveData is smaller than Instances
	
	-- Disable ignoring elements if zero elements are being ignored
	if(0==Main[10][4]and Main[8][11])then
		Instances.IgnoreElementedButton.BackgroundColor3 = COLORS[3];	-- red = disabled
		Main[8][11] = false;											-- disable :( ?
	end;
	
	if(type(data.Items)~="table")then return end;		-- validate item data format
	local dataFrame,toggles = nil,nil;						-- temp values
	for name,item in next,data["Items"]do					
	
		assert(Instances.ItemScroller[lower(name)]~=nil, "invalid item in \"Items\": "..name); 								-- Validate item name
		assert(type(item)=="table"and type(item[1])=="table", "table expected in \"Items\" when referencing: "..name);		-- Validate referenced data is a table of size 2
		if(type(item[2])~="number"or item[2]<=0 or item[2]>=9)then 															-- Validate Antimatter Fuse Quantity and Data Type
			-- normal values
			item[2] = 8;
			item[1][3] = false;
		end;
		
		toggles = {
			[1] = (type(item[1][1])=="boolean"and item[1][1]); 			-- normal fusing toggle
			[2] = (type(item[1][2])=="boolean"and item[1][2]); 			-- evolved fusing toggle
			[3] = (type(item[1][3])=="boolean"and item[1][3]);			-- omega fusing toggle
		};
		
		Fire(BindableEvents[lower(name)],item[2],unpack(toggles)); 		-- Make Button in Fuse Frame (will save if enabled)
			
		dataFrame = Instances.FuseScroller[lower(name)];				-- get reference button
		dataFrame.FuseQuantity.Text = item[2];							-- update fuse text
		dataFrame.Evolve.BackgroundColor3 = Main[11][toggles[1]];		-- update normal fuse toggle button color
		dataFrame.Omega.BackgroundColor3 = Main[11][toggles[2]];		-- update evolve fuse toggle button color
		dataFrame.Antimatter.BackgroundColor3 = Main[11][toggles[3]];	-- update omega fuse toggle button color
	end;
	
	Instances.FuseFrame.Visible = val; 									-- calling the bindable event will open the fuseframe, so re-set the value
	
	if(dataFrame~=nil and SaveData.Toggles.LoadFuse)then 
		Main[5][13](1); 	-- calling pet enhancement function
		Main[5][13](2); 	-- calling weapon enhancement function
	end;
end;

-- General Logic Button Toggle
Main[5][21] = function(idx,name)
	return function()
		local val = not Main[8][idx];									-- reference bool
		Main[8][idx],SaveData.Toggles[name] = val,val;					-- assign data toggle values
		Instances[name.."Button"].BackgroundColor3 = Main[11][val];		-- update relevant button color
		
		if(idx==4)then return(Main[5][11]())end; 		-- save regardless if toggling AutoSave
		if(Main[8][4])then Main[5][11]()end; 			-- if AutoSave is enabled
		if(val)then
			if(idx==5)then TextBox.Text = "Search"; 	-- if ResetText is enabled
			elseif(idx==12)then saveQueue()end; 		-- if SaveQueue is enabled
		end;
	end;
end;

-- General Check Pets/Weapons function for Fusing
-- a valid egg hatch will return data from the remote call, so pet fusing could be linked there (but eh, this works fine)
Main[5][22] = function(idx)
	return function()
		if(not(Main[7][idx].Visible and Main[8][idx]))then return end;			-- if Notification was cleared or Enhancement is active
		
		local Amount = Main[7][idx].Amount.Text;								-- reference
		wait(); 																-- allow time for text to POTENTIALLY change
		
		if(Main[7][idx].Amount.Text~=Amount)then return end;					-- if enhancing is inactive and text is unchanged			
		
		Main[8][idx] = false; 													-- indicate fusing is active (inactive = false)
		repeat Main[5][5](Main[3][idx],Main[9][idx],true)until Main[8][idx]; 	-- repeat until inactive = true
	end;
end;

-- Toggle Element button
Main[5][23] = function(AURA, BTN)
	return function()
		if(BTN.ImageTransparency==0.5)then			-- if toggle is disabled
		    SaveData.Elements[AURA] = true		-- enable toggle data value
			BTN.ImageTransparency = 0;				-- indicate toggle is enabled
			Main[10][4] += 1;						-- increment ignored elements count
		else
		    SaveData.Elements[AURA] = false
			BTN.ImageTransparency = 0.5;
			Main[10][4] -= 1;
		end;
		
		-- Disable stuff if zero Elements are being ignored
		if(0==Main[10][4]and Main[8][11])then 
			Instances.IgnoreElementedButton.BackgroundColor3 = COLORS[3];
			SaveData.Toggles.IgnoreElemented = false;
			Main[8][11] = false;
		end;
		
		if(Main[8][4])then Main[5][11]()end;
	end;
end;

-- Toggle IgnoreElemented Button
Main[5][24] = function()
	if(Main[10][4]==0)then return end;		-- do nothing if zero elements are being ignored, 
		-- Instances.IgnoreElementedButton.BackgroundColor3 = COLORS[3];
		-- Main[8][11] = false;
		-- return;
	-- end;
	
	local val = not Main[8][11];											-- reference toggle value
	SaveData.Toggles.IgnoreElemented = val;									-- assign savedata
	Instances.IgnoreElementedButton.BackgroundColor3 = Main[11][val];		-- update toggle button color
	Main[8][11] = val;														-- update main data toggle value
	
	if(Main[8][4])then Main[5][11]()end;									-- save, if enabled
end;

-- Toggle QueueFrame<->FuseFrame visibility
Main[5][25] = function()
	if(Instances.QueueScroller.Visible)then
		Instances.ToggleFrame.Text = "Queue";
		Instances.QueueScroller.Visible = false;
		Instances.FuseScroller.Visible = true;
	else
		Instances.ToggleFrame.Text = "Fuse";
		Instances.QueueScroller.Visible = true;
		Instances.FuseScroller.Visible = false;
	end;
end;

do	-- Item Search Function
	local match = string.match;
	Main[5][26] = function(itemBtn)
		return Connect(TextBox:GetPropertyChangedSignal("Text"),function()
			
			if(TextBox.Text=="Search" or TextBox.Text=="")then		-- if search content is not sufficed
				itemBtn.Visible = itemBtn.Value.Value;				-- itembtn visibility reflects fuse state
				return;
			end;

			-- if the text input matches somewhere in the name of ItemButton, then the Button will remain visible
			itemBtn.Visible = (itemBtn.Value.Value and match(itemBtn.Name,lower(TextBox.Text))~=nil);
		end);
	end;
end;

-- MakeClickedSignal Function
Main[5][27] = function(itemBtn,idx)
	return function(BULK,TOG1,TOG2,TOG3)
		itemBtn.Value.Value = false;			-- itembtn will be invisible in the search frame
		Instances.FuseFrame.Visible = true;		-- the fuse frame will be visible
		local item = {
			-- reference item fuse data format
			[1] = {
				-- normal fusing
				[1] = TOG1;
				[2] = 0;
				[3] = {'','',''};
			};
			[2] = {
				-- evolved fusing
				[1] = TOG2;
				[2] = 0;
				[3] = {'','',''};
			};
			[3] = {
				-- omega fusing
				[1] = TOG3;
				[2] = 0;
				[3] = table.create(BULK, '');
			};
		};
		Main[3][idx][itemBtn.Text] = item; 		-- add item to main data
		Main[5][18](itemBtn, idx, item); 		-- create frame in FuseFrame
		SaveData.Items[itemBtn.Name] = { 		-- add item to SaveData
			[1] = {
				[1] = TOG1;						-- normal fusing toggle
				[2] = TOG2;						-- evolved fusing toggle
				[3] = TOG3;						-- omega fusing toggle
			};
			[2] = BULK;							-- antimatter fuse quantity
		};
		if(Main[8][4])then Main[5][11]()end; 	-- Save if enabled
	end;
end;

-- MakeButton Function
Main[5][28] = function(name,idx)
    local itemBtn = setVals("TextButton",{Name=lower(name),BackgroundColor3=COLORS[7],BorderSizePixel=0,Size=UDIM2[4],AutomaticSize='X',ZIndex=2,Font=FONTS[1],Text=name,TextColor3=COLORS[1],TextSize=13,TextWrapped=true},Instances.ItemScroller);
	Instance.new("UICorner",itemBtn); 
	table.insert(Main[4], Main[5][26](itemBtn));																																		-- search connection
	table.insert(Main[4], Connect(setVals("BoolValue",{Name="Value",Value=true},itemBtn):GetPropertyChangedSignal("Value"),function()itemBtn.Visible = itemBtn.Value.Value end));		-- visibility changed
	
	local bindEvent = Instance.new("BindableEvent");
	table.insert(Main[4], Connect(bindEvent.Event,Main[5][27](itemBtn,idx)));											-- add item to fuse frame
	table.insert(Main[4], Connect(itemBtn.MouseButton1Click,function()Fire(bindEvent,8,false,false,false)end));			-- update SaveData with item content
	BindableEvents[itemBtn.Name] = bindEvent;																			-- store event in global reference
end;

for _,pet in ipairs(game:GetService("ReplicatedStorage").Storage.Pets:GetChildren())   do Main[5][28](pet.Name, 1)end;		-- make Pet item buttons
for _,wpn in ipairs(game:GetService("ReplicatedStorage").Storage.Weapons:GetChildren())do Main[5][28](wpn.Name, 2)end;		-- make Weapon item buttons

table.insert(Main[4], Connect(TextBox.FocusLost,Main[5][8]));								-- Called when the Focus of the TextBox is lost
table.insert(Main[4], Connect(UserInputService.InputBegan,Main[5][7]));						-- Called when any Roblox Input Module Device is Interacted with
table.insert(Main[4], Connect(Instances.ToggleFrame.MouseButton1Click, Main[5][25]));		-- Called when toggling between QueueFrame and FuseFrame

table.insert(Main[4], Connect(Instances.Pets.MouseButton1Click,Main[5][9](1))); 		-- Called when Pets button is pressed
table.insert(Main[4], Connect(Instances.Weapons.MouseButton1Click,Main[5][9](2)));		-- Called when Weapons button is pressed
table.insert(Main[4], Connect(Instances.All.MouseButton1Click,Main[5][19]));			-- Called when All button is pressed

table.insert(Main[4], Connect(Instances.Info.MouseButton1Click,function()Instances.SettingsMain.Visible = not Instances.SettingsMain.Visible end));					-- Called when Info button is pressed
table.insert(Main[4], Connect(game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.GemsBar.GemsBar.Amount:GetPropertyChangedSignal("Text"),Main[5][14]));		-- Called when gems have been changed

table.insert(Main[4], Connect(Instances.Settings.MouseButton1Click,Main[5][6](Instances.SettingsFrame, Instances.InformationFrame, Instances.Settings, Instances.Information))); 		-- Called when Setting button is pressed
table.insert(Main[4], Connect(Instances.Information.MouseButton1Click,Main[5][6](Instances.InformationFrame, Instances.SettingsFrame, Instances.Information, Instances.Settings))); 	-- Called when Information button is pressed

table.insert(Main[4], Connect(Main[7][1].Amount:GetPropertyChangedSignal("Text"),Main[5][22](1)));		-- Called when a new pet has been obtained
table.insert(Main[4], Connect(Main[7][2].Amount:GetPropertyChangedSignal("Text"),Main[5][22](2)));		-- Called when a new weapon has been obtained

table.insert(Main[4], Connect(Instances.ItemFrame:GetPropertyChangedSignal("Visible"),Main[5][10](1, Instances.ItemFrame)));	-- Called when ItemFrame visibility has changed
table.insert(Main[4], Connect(Instances.FuseFrame:GetPropertyChangedSignal("Visible"),Main[5][10](2, Instances.FuseFrame)));	-- Called when FuseFrame visibility has changed

table.insert(Main[4], Connect(Instances.AutoLoadButton.MouseButton1Click,Main[5][21](3, "AutoLoad"))); 						-- Called when AutoLoad button is clicked
table.insert(Main[4], Connect(Instances.AutoSaveButton.MouseButton1Click,Main[5][21](4, "AutoSave"))); 						-- Called when AutoSave button is clicked
table.insert(Main[4], Connect(Instances.LoadFuseButton.MouseButton1Click,Main[5][21](8, "LoadFuse"))); 						-- Called when LoadFuse button is clicked
table.insert(Main[4], Connect(Instances.ResetTextButton.MouseButton1Click,Main[5][21](5,"ResetText"))); 					-- Called when ResetText button is clicked
table.insert(Main[4], Connect(Instances.SaveQueueButton.MouseButton1Click,Main[5][21](12, "SaveQueue"))); 					-- Called when SaveQueue button is clicked
table.insert(Main[4], Connect(Instances.GemsToggleButton.MouseButton1Click,Main[5][21](6, "GemsToggle"))); 					-- Called when Gems button is clicked
table.insert(Main[4], Connect(Instances.PrintToggleButton.MouseButton1Click,Main[5][21](7, "PrintToggle"))); 				-- Called when Print button is clicked
table.insert(Main[4], Connect(Instances.IgnoreEquippedButton.MouseButton1Click,Main[5][21](9, "IgnoreEquipped")));			-- Called when IgnoreEquipped button is clicked
table.insert(Main[4], Connect(Instances.IgnoreEnchantedButton.MouseButton1Click,Main[5][21](10, "IgnoreEnchanted"))); 		-- Called when IgnoreEnchanted button is clicked
table.insert(Main[4], Connect(Instances.IgnoreElementedButton.MouseButton1Click,Main[5][24])); 								-- Called when IgnoreElemented button is clicked

do 	-- assigns the images to element toggle buttons
	local template = "rbxthumb://type=Asset&id=%i&w=150&h=150";
	for Aura,Data in next,require(game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.Elements)do
		local auraBtn = setVals("ImageButton",{Name=Aura.."ToggleButton",BackgroundColor3=COLORS[1],BackgroundTransparency=0,BorderSizePixel=0,Size=UDIM2[11],Image=template:format(Data.Image)},Instances.Elements);
		table.insert(Main[4], Connect(auraBtn.MouseButton1Click,Main[5][23](Aura, auraBtn)));		-- clicked connection
	end;
end;

Instances.Close.MouseButton1Click:Once(function()Instances.MainGui:Destroy()end); 	-- Called when Close button is pressed

-- Loop for checking if items are finished upgrading to Antimatter
table.insert(Main[4],Connect(BindableEvents.Second.Event,function()
	if(Main[8][1])then Main[5][2]("Pets")end; 		-- check antimatter pet queue
	if(Main[8][2])then Main[5][2]("Weapons")end; 	-- check antimatter weapon queue
end));

do	-- hooks
	local DungeonHandler = game:GetService("Players").LocalPlayer.PlayerScripts.PlayerHandler.Miscallenious.DungeonHandler;
	local time = os.time;
	
	-- bindable event for checking whether the dungeon is ready
	setreadonly(os,false);
	os.time = newcclosure(function()
		if(getcallingscript()==DungeonHandler)then 
			Fire(BindableEvents.Second);			-- Called once every second
		end;
		return time();
	end);
	setreadonly(os,true);
	
	-- scans for a new queue item
	BindableEvents.QueueHook = Instance.new("BindableEvent");
	table.insert(Main[4], Connect(BindableEvents.QueueHook.Event, function(cast) 
		local uid,name,releaseDate = getNewQueueUid(cast);	-- will lilely nil-instantiate every call
		while(not uid and wait())do							-- while a new item hasn't been found
			uid,name,releaseDate = getNewQueueUid(cast);	
		end;
		newQueueItem(cast,uid,name,releaseDate);
	end));
	
	local mt = getrawmetatable(game);
	local namecall = mt.__namecall;		-- the metamethod is manually obtained to reset if the gui is closed mid-game
	
	setreadonly(mt, false);
	mt.__namecall = newcclosure(function(self,...)
		if(getnamecallmethod()=="InvokeServer"and self==Main[6][2])then		-- if user manually fuses an omega-tier item
			Fire(BindableEvents.QueueHook,(...));	-- Scans for the new queue item
		end;
		return namecall(self,...);					-- Module script expects a response
	end);
	setreadonly(mt, true);
	
	-- Deallocate Memory
	Instances.MainGui.Destroying:Once(function()
		setreadonly(mt, false);
		mt.__namecall = namecall;	-- reset game.__namecall
		setreadonly(mt, true);
		
		setreadonly(os, false);
		os.time = time; 			-- reset os.time
		setreadonly(os, true);

		if(Main[8][4])then 
			Main[5][11]();
			Main[8][4] = false; 	-- disable any future save attempts
		end;
		
		for _,con in ipairs(Main[4])do con:Disconnect()end;		-- disconnect ALL FuseGui Connections
		
		Instances.FuseGui:Destroy();
		Instances.SettingsGui:Destroy();
		
		Main,Instances,BindableEvents,getgenv()["@Esz#O8k(9]1HBol~S8C"] = nil,nil,nil,nil;
	end);
end;

Main[5][20](); -- Load Saved Data

-- Deallocate table variables that will not be used in the script from this moment forward
for idx = 13,23 do UDIM2[idx] = nil end;
COLORS[7] = nil;
Main[5][26],Main[5][27],Main[5][28] = nil,nil,nil;
