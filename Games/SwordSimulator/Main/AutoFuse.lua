if(game.PlaceId~=7026949294 or getgenv()["@Esz#O8k(9]1HBol~S8C"]~=nil)then return end;
getgenv()["@Esz#O8k(9]1HBol~S8C"]=true;
if(not game:IsLoaded())then game.Loaded:Wait()end;

-- Consolidate Instance & Toggle Button CreateInstance and Connect calls using a file containing unique info (Name, DataType, Parent, Connecting Function, Arguments, etc.)
-- Perhaps modify CreateInstance to take a function as the third parameter to return an instance and connection
--[[
	CreateInstance(OT, P, F)
		...
		return Instance, Instance.MouseButton1Click:Connect(F);
	end;
]]

-- Create an Antimatter Queue Frame with an AutoCollect toggle (to remove the Retrieve Queue function)
-- Look into a way of checking the queue via an in-game function, or a signal rather than having a thread that counts down until an item is ready to be grabbed

-- Add a frame to IgnoreElementedFrame with buttons for each Element to toggle which Elements will be ignored

local CreateInstance = function(ObjectType, Properties)
	local Instance = Instance.new(ObjectType);
	for Attribute, Value in next, Properties do
		Instance[Attribute] = Value;
	end;
	return Instance;
end;

local wait = task.wait;
local LocalPlayer = game:GetService("Players").LocalPlayer;
local UserInputService = game:GetService("UserInputService");
local DungeonHandler = LocalPlayer.PlayerScripts.PlayerHandler.Miscallenious.DungeonHandler;

local PlayerData = require(game.ReplicatedStorage.Saturn.Modules.Client["PlayerData - Client"]);
if(PlayerData.Replica.Data==nil)then PlayerData.Loaded:Wait()end; -- wait until data is loaded
PlayerData = PlayerData.Replica.Data.Main;

local Gems = LocalPlayer.PlayerGui.Main.Left.GemsBar.GemsBar.Amount;
local Colors = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Colors/ColorPicks.lua"))();
assert(Colors~=nil and  pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/t2s_v2.lua", "nil return from HttpGet"))), "Error loading http-script");

local UDIM_CORNER = UDim.new(1,0);
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
		[1] = game.ReplicatedStorage.Events.FusePet; -- Fuse Items
		[2] = game.ReplicatedStorage.Events.CraftItem; -- Antimatter Conversion
		[3] = game.ReplicatedStorage.Events.ClaimCraftedItem; -- Claim Antimatter Conversion
	};
	[7] = {	-- Notifications
		[1] = LocalPlayer.PlayerGui.Main.Left.LeftButtons.PetInventory.Notification;		-- Pets Notification
		[2] = LocalPlayer.PlayerGui.Main.Left.LeftButtons.WeaponInv.Notification;		-- Weapons Notification
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
		[3] = "SwordSim AutoFuseData/AutoSave_"..LocalPlayer.UserId..".lua";
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

Instances.MainGui = CreateInstance("ScreenGui", {Name = "MainGui", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Global})syn.protect_gui(Instances.MainGui)Instances.MainGui.Parent = game:GetService("CoreGui");
Instances.ItemFrame = CreateInstance("Frame", {Parent =  Instances.MainGui, Active = true, Selectable = true, Draggable = true, BackgroundColor3 = COLORS[1], Position = UDim2.new(0.8, 0, 0.35, 0), Size = UDim2.new(0, 235, 0, 260), Visible = false});
Instances.ItemScroller = CreateInstance("ScrollingFrame", {Parent = Instances.ItemFrame, Active = true, BackgroundColor3 = COLORS[1], CanvasSize = UDIM2[22], AutomaticCanvasSize = 'Y', ScrollingDirection = 'Y', ScrollBarThickness = 0, Position = UDim2.new(0.05, 0, 0.26, 0), Size = UDim2.new(0, 215, 0, 186),BottomImage = "", MidImage = "", TopImage = ""});
local TextBox = CreateInstance("TextBox", {Parent = Instances.ItemFrame, BackgroundColor3 = COLORS[1], Position = UDim2.new(0.05, 0, 0.1, 0), Size = UDim2.new(0, 215, 0, 30), Font = Enum.Font.SourceSans, Text = "Search", TextColor3 = COLORS[2], TextSize = 14});
Instances.Info = CreateInstance("ImageButton", {Parent = Instances.ItemFrame,BackgroundTransparency = 1,Position = UDim2.new(0.01, 0, 0, 0),Size = UDIM2[17],ZIndex = 2,Image = "rbxassetid://3926305904",ImageColor3 = COLORS[6],ImageRectOffset = Vector2.new(4, 804),ImageRectSize = Vector2.new(36, 36)});
Instances.Close = CreateInstance("ImageButton", {Parent = Instances.ItemFrame,BackgroundTransparency = 1,Position = UDim2.new(0.9, 0, 0.01, 0),Size = UDIM2[17],ZIndex = 2,Image = "rbxassetid://3926305904",ImageColor3 = COLORS[6],ImageRectOffset = Vector2.new(285, 5),ImageRectSize = Vector2.new(24, 24)});
CreateInstance("UIListLayout", {Parent = Instances.ItemScroller, HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.Name, Padding = UDim.new(0, 10)});

Instances.FuseGui = CreateInstance("ScreenGui", {Name = "FuseGui", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})syn.protect_gui(Instances.FuseGui)Instances.FuseGui.Parent = game:GetService("CoreGui");
Instances.FuseFrame = CreateInstance("Frame", {Active = true, Selectable = true, Draggable = true, Visible = false, Parent = Instances.FuseGui, BackgroundColor3 = COLORS[1], Position = UDim2.new(0.7, 0, 0.65, 0), Size = UDim2.new(0, 522, 0, 180)});
Instances.FuseScroller = CreateInstance("ScrollingFrame", {Parent = Instances.FuseFrame, BackgroundColor3 = COLORS[1], CanvasSize = UDIM2[22], AutomaticCanvasSize = 'Y', ScrollingDirection = 'Y', ScrollBarThickness = 0, Position = UDim2.new(0.023, 0, 0.195, 0), Size = UDim2.new(0, 500, 0, 135),BottomImage = "", MidImage = "", TopImage = ""});
Instances.All = CreateInstance("TextButton", {Name = "All", Parent = Instances.FuseFrame, BackgroundColor3 = COLORS[3], BorderSizePixel = 0, Position = UDim2.new(0.904, 0, 0.015, 0), Size = UDim2.new(0, 45, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "All", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
Instances.Pets = CreateInstance("TextButton", {Name = "Pets", Parent = Instances.FuseFrame, BackgroundColor3 = COLORS[3], BorderSizePixel = 0, Position = UDim2.new(0.796, 0, 0.015, 0), Size = UDim2.new(0, 55, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Pets", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
Instances.Weapons = CreateInstance("TextButton", {Name = "Weapons", Parent = Instances.FuseFrame, BackgroundColor3 = COLORS[3], BorderSizePixel = 0, Position = UDim2.new(0.66, 0, 0.015, 0), Size = UDIM2[12], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Weapons", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
CreateInstance("TextLabel", {Name = "Label", Parent = Instances.FuseFrame, BackgroundColor3 = COLORS[1], BackgroundTransparency = 1, Position = UDim2.new(0.53, 0, 0.045, 0), Size = UDim2.new(0, 72, 0, 20), Font = Enum.Font.Gotham, Text = "Remove:", TextColor3 = COLORS[2], TextSize = 13});
CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.All})CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.Pets})CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.Weapons});
CreateInstance("UIListLayout", {Parent = Instances.FuseScroller, HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 5)});

Instances.SettingsGui = CreateInstance("ScreenGui", {Name = "SettingsGui", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling});syn.protect_gui(Instances.SettingsGui);Instances.SettingsGui.Parent = game:GetService("CoreGui");
Instances.SettingsMain = CreateInstance("Frame", {Parent = Instances.SettingsGui, Selectable = true, Active = true, Draggable = true, BackgroundColor3 = COLORS[1], Position = UDim2.new(0.64, 80, 0.23, 120), Size = UDim2.new(0, 218, 0, 255), Visible = false});
Instances.Information = CreateInstance("TextButton", {Name = "Information", Parent = Instances.SettingsMain, BackgroundColor3 = COLORS[6], Size = UDIM2[18], Font = Enum.Font.GothamMedium, Text = "Information", TextColor3 = COLORS[1], TextSize = 14});
Instances.Settings = CreateInstance("TextButton", {Name = "Settings", Parent = Instances.SettingsMain, BackgroundColor3 = COLORS[6], BackgroundTransparency = 0.5, Position = UDim2.new(0.5, 0, 0, 0), Size = UDIM2[18], Font = Enum.Font.GothamMedium, Text = "Settings", TextColor3 = COLORS[1], TextSize = 14});

Instances.InformationFrame = CreateInstance("Frame", {Name = "InformationFrame", Parent = Instances.SettingsMain, BackgroundColor3 = COLORS[1], Position = UDIM2[19], Size = UDIM2[20]});
CreateInstance("TextLabel", {Name = "Label1", Parent = Instances.InformationFrame, BackgroundColor3 = COLORS[1], Position = UDim2.new(0.007, 1, 0.01, 0), Size = UDim2.new(0, 206, 0, 52), Font = Enum.Font.SourceSans, Text = "Click the buttons in the search frame with the names of items you want to have fused automatically.", TextColor3 = COLORS[2], TextSize = 14, TextWrapped = true});
CreateInstance("TextLabel", {Name = "Label2", Parent = Instances.InformationFrame, BackgroundColor3 = COLORS[1], Position = UDim2.new(0.007, 1, 0.275, 0), Size = UDim2.new(0, 206, 0, 52), Font = Enum.Font.SourceSans, Text = "Click the number by each item in the Fuse frame to change the quantity of items fused toward antimatter.", TextColor3 = COLORS[2], TextSize = 14, TextWrapped = true});
CreateInstance("TextLabel", {Name = "Label3", Parent = Instances.InformationFrame, BackgroundColor3 = COLORS[1], Position = UDim2.new(0.007, 1, 0.535, 0), Size = UDim2.new(0, 206, 0, 45), Font = Enum.Font.SourceSans, Text = "Report any issues or concerns to Activities12 on v3rmillion or loverboy#3970 on discord", TextColor3 = COLORS[2], TextSize = 14, TextWrapped = true});
CreateInstance("TextLabel", {Name = "Toggle1", Parent = Instances.InformationFrame, BackgroundColor3 = COLORS[1], Position = UDim2.new(0.007, 1, 0.77, 0), Size = UDIM2[21], Font = Enum.Font.SourceSans, Text = "Toggle SearchFrame:    LeftControl + G", TextColor3 = COLORS[2], TextSize = 14});
CreateInstance("TextLabel", {Name = "Toggle2", Parent = Instances.InformationFrame, BackgroundColor3 = COLORS[1], Position = UDim2.new(0.007, 1, 0.88, 0), Size = UDIM2[21], Font = Enum.Font.SourceSans, Text = " Toggle FuseFrame:        LeftControl + M", TextColor3 = COLORS[2], TextSize = 14});

Instances.SettingsFrame = CreateInstance("ScrollingFrame", {Name = "SettingsFrame", Parent = Instances.SettingsMain, BackgroundColor3 = COLORS[1], Position = UDIM2[19], Size = UDIM2[20], CanvasPosition = Vector2.new(0, 0), AutomaticCanvasSize = 'Y', CanvasSize = UDIM2[22], ScrollingDirection = 'Y', ScrollBarThickness = 0, Visible = false, BottomImage = "", MidImage = "", TopImage = ""});
Instances.AutoLoadFrame = CreateInstance("Frame", {Name = "AutoLoadFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = COLORS[1], Size = UDIM2[13]});
Instances.PrintToggleFrame = CreateInstance("Frame", {Name = "PrintToggleFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = COLORS[1], Size = UDIM2[13]});
Instances.AutoSaveFrame = CreateInstance("Frame", {Name = "AutoSaveFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = COLORS[1], Size = UDIM2[13]});
Instances.ResetTextFrame = CreateInstance("Frame", {Name = "ResetTextFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = COLORS[1], Size = UDIM2[13]});
Instances.GemsToggleFrame = CreateInstance("Frame", {Name = "GemsToggleFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = COLORS[1], Size = UDIM2[13]});
Instances.LoadFuseFrame = CreateInstance("Frame", {Name = "LoadFuseFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = COLORS[1], Size = UDIM2[13]});
Instances.IgnoreEquippedFrame = CreateInstance("Frame", {Name = "IgnoreEquippedFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = COLORS[1], Size = UDIM2[13]});
Instances.IgnoreEnchantedFrame = CreateInstance("Frame", {Name = "IgnoreEnchantedFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = COLORS[1], Size = UDIM2[13]});
Instances.IgnoreElemented = CreateInstance("Frame", {Name = "IgnoreElemented", Parent = Instances.SettingsFrame, BackgroundColor3 = COLORS[1], Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.new(0, 210, 0, 111)});
Instances.IgnoreElementedFrame = CreateInstance("Frame", {Name = "IgnoreElementedFrame", Parent = Instances.IgnoreElemented, BackgroundColor3 = COLORS[1], Size = UDIM2[13]});
Instances.IgnoreElementedButton = CreateInstance("TextButton", {Name = "IgnoreElementedButton", Parent = Instances.IgnoreElementedFrame, BackgroundColor3 = COLORS[4], BorderSizePixel = 0, Position = UDIM2[14], Size = UDIM2[12], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Ignore Elemented", TextColor3 = COLORS[1], TextSize = 12, TextWrapped = true});
Instances.IgnoreEnchantedButton = CreateInstance("TextButton", {Name = "IgnoreEnchantedButton", Parent = Instances.IgnoreEnchantedFrame, BackgroundColor3 = COLORS[4], BorderSizePixel = 0, Position = UDIM2[14], Size = UDIM2[12], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Ignore Enchanted", TextColor3 = COLORS[1], TextSize = 12, TextWrapped = true});
Instances.IgnoreEquippedButton = CreateInstance("TextButton", {Name = "IgnoreEquippedButton", Parent = Instances.IgnoreEquippedFrame, BackgroundColor3 = COLORS[4], BorderSizePixel = 0, Position = UDIM2[14], Size = UDIM2[12], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Ignore Equipped", TextColor3 = COLORS[1], TextSize = 12, TextWrapped = true});
Instances.LoadFuseButton = CreateInstance("TextButton", {Name = "LoadFuseButton", Parent = Instances.LoadFuseFrame, BackgroundColor3 = COLORS[3], BorderSizePixel = 0, Position = UDIM2[14], Size = UDIM2[12], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "LoadFuse", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
Instances.AutoLoadButton = CreateInstance("TextButton", {Name = "AutoLoadButton", Parent = Instances.AutoLoadFrame, BackgroundColor3 = COLORS[4], BorderSizePixel = 0, Position = UDIM2[14], Size = UDIM2[12], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "AutoLoad", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
Instances.AutoSaveButton = CreateInstance("TextButton", {Name = "AutoSaveButton", Parent = Instances.AutoSaveFrame, BackgroundColor3 = COLORS[4], BorderSizePixel = 0, Position = UDIM2[14], Size = UDIM2[12], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "AutoSave", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
Instances.ResetTextButton = CreateInstance("TextButton", {Name = "ResetTextButton", Parent = Instances.ResetTextFrame, BackgroundColor3 = COLORS[4], BorderSizePixel = 0, Position = UDIM2[14], Size = UDIM2[12], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "ResetText", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
Instances.GemsToggleButton = CreateInstance("TextButton", {Name = "GemsToggleButton", Parent = Instances.GemsToggleFrame, BackgroundColor3 = COLORS[3], BorderSizePixel = 0, Position = UDIM2[14], Size = UDIM2[12], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Gems", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
Instances.PrintToggleButton = CreateInstance("TextButton", {Name = "PrintToggleButton", Parent = Instances.PrintToggleFrame, BackgroundColor3 = COLORS[3], BorderSizePixel = 0, Position = UDIM2[14], Size = UDIM2[12], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Print", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});

Instances.Elements = CreateInstance("Frame", {Name = "Elements", Parent = Instances.IgnoreElemented , BackgroundColor3 = COLORS[1], BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.378, 0), Size = UDim2.new(0, 210, 0, 68)});

CreateInstance("UIGridLayout", {Parent = Instances.Elements, HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center, CellPadding = UDim2.new(0, 8, 0, 0), CellSize = UDim2.new(0, 33, 0, 33)});CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.IgnoreElementedButton});
CreateInstance("UIListLayout", {Parent = Instances.SettingsFrame, SortOrder = Enum.SortOrder.LayoutOrder});CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.LoadFuseButton});CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.PrintToggleButton});CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.IgnoreEquippedButton});CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.IgnoreEnchantedButton});
CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.AutoLoadButton});CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.ResetTextButton});CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.AutoSaveButton});CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.GemsToggleButton});CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Instances.IgnoreElementedButton});

CreateInstance("TextLabel", {Name = "AutoLoadLabel", Parent = Instances.AutoLoadFrame, BackgroundColor3 = COLORS[1], BorderSizePixel = 0, Position = UDIM2[16], Size = UDIM2[15], Font = Enum.Font.SourceSans, Text = "Auto-Load stored data upon script-execution, or, if not yet loaded, load saved data", TextColor3 = COLORS[2], TextSize = 12, TextWrapped = true});
CreateInstance("TextLabel", {Name = "AutoSaveLabel", Parent = Instances.AutoSaveFrame, BackgroundColor3 = COLORS[1], BorderSizePixel = 0, Position = UDIM2[16], Size = UDIM2[15], Font = Enum.Font.SourceSans, Text = "Auto-Save the state of the each Frame and Toggles upon any respective interaction", TextColor3 = COLORS[2], TextSize = 12, TextWrapped = true});
CreateInstance("TextLabel", {Name = "ResetTextLabel", Parent = Instances.ResetTextFrame, BackgroundColor3 = COLORS[1], BorderSizePixel = 0, Position = UDIM2[16], Size = UDIM2[15], Font = Enum.Font.SourceSans, Text = "Resets the search bar text to \"Search\" three seconds after the box's focus is lost", TextColor3 = COLORS[2], TextSize = 12, TextWrapped = true});
CreateInstance("TextLabel", {Name = "GemsToggleLabel", Parent = Instances.GemsToggleFrame, BackgroundColor3 = COLORS[1], BorderSizePixel = 0, Position = UDIM2[16], Size = UDIM2[15], Font = Enum.Font.SourceSans, Text = "Toggles fusing when you have sufficient gems. Disable if you have much more than 10M gems.", TextColor3 = COLORS[2], TextSize = 10, TextWrapped = true});
CreateInstance("TextLabel", {Name = "PrintToggleLabel", Parent = Instances.PrintToggleFrame, BackgroundColor3 = COLORS[1], BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.1, 0), Size = UDim2.new(0, 130, 0, 30), Font = Enum.Font.SourceSans, Text = "Toggles printing any item fuse event to the standard console.", TextColor3 = COLORS[2], TextSize = 12, TextWrapped = true});
CreateInstance("TextLabel", {Name = "LoadFuseLabel", Parent = Instances.LoadFuseFrame, BackgroundColor3 = COLORS[1], BorderSizePixel = 0, Position = UDIM2[16], Size = UDIM2[15], Font = Enum.Font.SourceSans, Text = "Will run a single-fuse search on all loaded items upon load", TextColor3 = COLORS[2], TextSize = 12, TextWrapped = true})
CreateInstance("TextLabel", {Name = "IgnoreEquippedLabel", Parent = Instances.IgnoreEquippedFrame, BackgroundColor3 = COLORS[1], BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.01, 0), Size = UDIM2[15], Font = Enum.Font.SourceSans, Text = "Equipped items will be ignored during fusing events.", TextColor3 = COLORS[2], TextSize = 12, TextWrapped = true});
CreateInstance("TextLabel", {Name = "IgnoreEnchantedLabel", Parent = Instances.IgnoreEnchantedFrame, BackgroundColor3 = COLORS[1], BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.02, 0), Size = UDIM2[15], Font = Enum.Font.SourceSans, Text = "Enchanted (Damage+,Coins+) items will be ignored during fusing events.", TextColor3 = COLORS[2], TextSize = 11, TextWrapped = true});
CreateInstance("TextLabel", {Name = "IgnoreElementedLabel", Parent = Instances.IgnoreElementedFrame, BackgroundColor3 = COLORS[1], BorderSizePixel = 0, Position = UDIM2[16], Size = UDIM2[15], Font = Enum.Font.SourceSans, Text = "Items with enabled Elements, specified by the toggles below, will be ignored during fusing events.", TextColor3 = COLORS[2], TextSize = 10, TextWrapped = true});

AuraImages,LocalPlayer = nil; -- Deallocate

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
		if not Main[1][Item.Level]or Table[Item.Base]==nil or Main[5][4](Tag, Index)then -- Item Validation
			continue; 
		end;
		
		List = Table[Item.Base][Item.Level]; -- ease-of-access		
		if not List[1]then continue end; -- validate enabled
		
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
Main[5][7] = function(Input)
	if Input.UserInputType.Value==8 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)then 
		if Input.KeyCode.Value==109 then
			Instances.FuseFrame.Visible = not Instances.FuseFrame.Visible;
		elseif Input.KeyCode.Value==103 then
			Instances.ItemFrame.Visible = not Instances.ItemFrame.Visible;
			Instances.SettingsMain.Visible = false;
		end;
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
			Instances.FuseScroller[Item:lower()]:Destroy();
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
	for _,Table in next, Main[3][Index] do
		if(Table[1][1]or Table[1][2]or Table[1][3])then return true end;
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
		
		SaveData["Items"][FuseButton.Parent.Name:lower()][1][Index] = Value; -- Update AutoSave Data
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
		Data = SaveData["Items"][Antimatter.Parent.Name:lower()];
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
	for _,Connection in ipairs(Signals) do Connection:Disconnect() end;
	SaveData["Items"][ItemButton.Text:lower()] = nil; -- set to nil before updating
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
	Objects.ItemFrame = CreateInstance("Frame", {Name = ItemButton.Name, Parent = Instances.FuseScroller, BackgroundTransparency = 1, BackgroundColor3 = COLORS[1], Size = UDIM2[2]});
	Objects.Item = CreateInstance("TextButton", {Name = "Item", Parent = Objects.ItemFrame, BackgroundColor3 = Colors[math.random(1, 153)], BorderSizePixel = 0, Position = UDIM2[3], Size = UDIM2[4], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = ItemButton.Text, TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
	Objects.Evolve = CreateInstance("TextButton", {Name = "Evolve", Parent = Objects.ItemFrame, BackgroundColor3 = COLORS[3], BorderSizePixel = 0, Position = UDIM2[5], Size = UDIM2[1], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Evolved", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
	Objects.Omega = CreateInstance("TextButton", {Name = "Omega", Parent = Objects.ItemFrame, BackgroundColor3 = COLORS[3], BorderSizePixel = 0, Position = UDIM2[6], Size = UDIM2[1], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Omega", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
	Objects.Antimatter = CreateInstance("TextButton", {Name = "Antimatter", Parent = Objects.ItemFrame, BackgroundColor3 = COLORS[3], BorderSizePixel = 0, Position = UDIM2[7], Size = UDIM2[8], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Antimatter", TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
	Objects.FuseQuantity = CreateInstance("TextButton", {Name = "FuseQuantity", Parent = Objects.ItemFrame, BackgroundColor3 = COLORS[1], BorderSizePixel = 0, Position = UDIM2[9], Size = UDIM2[10], ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "8", TextColor3 = COLORS[2], TextScaled = true, TextSize = 13, TextWrapped = true});
	CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Objects.Item})CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Objects.Evolve})CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Objects.Omega})CreateInstance("UICorner", {CornerRadius = UDIM_CORNER, Parent = Objects.Antimatter})Instance.new("UICorner", Objects.FuseQuantity);

	local Signals = {
		[1] = Objects.Evolve.MouseButton1Click:Connect(Main[5][15](Objects.Evolve, List[1], Index, 1));
		[2] = Objects.Omega.MouseButton1Click:Connect(Main[5][15](Objects.Omega, List[2], Index, 2));
		[3] = Objects.Antimatter.MouseButton1Click:Connect(Main[5][15](Objects.Antimatter, List[3], Index, 3));
		[4] = Objects.FuseQuantity.MouseButton1Click:Connect(Main[5][16](Objects.FuseQuantity, Objects.Antimatter, List[3]));
		[5] = Objects.Item.MouseButton1Click:Once(function() Objects.ItemFrame:Destroy() end);
	};
	Objects.ItemFrame.Destroying:Once(function() Main[3][Index][ItemButton.Text] = Main[5][17](Signals, ItemButton) end);
end

-- RemoveAll function
Main[5][19] = function()
	local Order = Instances.FuseScroller.UIListLayout;Order.Parent = nil;
	for _,Frame in ipairs(Instances.FuseScroller:GetChildren()) do
		Frame:Destroy();
	end;
	Order.Parent = Instances.FuseScroller;
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
	
	local Success,Temp = pcall(loadstring(readfile(Main[9][3])));
	assert(Success and type(Temp)=="table", "Error! loadstring function failed (expected a table) to read data in file: workspace/"..Main[9][3]);
	if(Temp["Toggles"]==nil or not Temp["Toggles"]["AutoLoad"])then return end; -- if AutoLoad is nil or disabled
	
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
	for Name,Table in next, SaveData do
		if(Temp[Name]==nil or Name=="Items")then continue end;
		assert(type(Temp[Name])=="table", "Error! Invalid data type encountered (should be table) in save data when referencing \""..Name..'\"');
		for Index,_ in next, Table do
			Value = type(Temp[Name][Index])=="boolean" and Temp[Name][Index];
			Table[Index] = Value;
			if(Name=="Visible")then continue end;
			if(Name=="Elements")then
				Instances[Index.."ToggleButton"].ImageTransparency = Main[11][2][Value];
				if(not Value)then continue end;
				Main[10][4] += 1; -- Count enabled, ignored elements
			else
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
	if(type(Temp["Items"])~="table")then return end;
	local DataFrame,BoolToggles = nil,nil;
	for Name,Data in next,Temp["Items"]do
	
		assert(Instances.ItemScroller:WaitForChild(Name:lower()) ~= nil, "Error! Invalid item in save file: "..Name); -- Validate item name
		assert(type(Data)=="table" and type(Data[1])=="table", "Error! Invalid data format (should be a table) for main or main[1] of Item: "..Name); -- Validate referenced data is a table of size 2
		if(type(Data[2])~="number" or Data[2]<=0 or Data[2]>=9)then -- Validate Antimatter Fuse Quantity and Data Type
			Data[2] = 8;
			Data[1][3] = false;
		end;
		
		BoolToggles = {
			[1] = (type(Data[1][1])=="boolean" and Data[1][1]); 
			[2] = (type(Data[1][2])=="boolean" and Data[1][2]); 
			[3] = (type(Data[1][3])=="boolean" and Data[1][3]);
		};
		
		-- Make Button in Fuse Frame (will save if enabled)
		Fire(BindableEvents[Name:lower()],Data[2],unpack(BoolToggles)); 
		
		-- set button color accordingly
		DataFrame = Instances.FuseScroller:WaitForChild(Name:lower());
		DataFrame:WaitForChild("FuseQuantity").Text = Data[2];
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
	Instances.IgnoreElementedButton.BackgroundColor3 = Main[11][1][Value];
	Main[8][11] = Value;
	
	if(Main[8][4])then Main[5][11](); end;
end;

-- MakeTextChangedSignal Function
Main[5][26] = function(ItemButton)
    return TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		
		if(TextBox.Text=="Search" or TextBox.Text=="")then
			ItemButton.Visible = ItemButton.Value.Value;
			return;
		end;

		-- if the text input matches somewhere in the name of ItemButton, then the Button will remain visible
		ItemButton.Visible = (ItemButton.Value.Value and ItemButton.Name:match(TextBox.Text:lower())~=nil);
	end);
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
    local ItemButton = CreateInstance("TextButton", {Name = Name:lower(), Parent = Instances.ItemScroller, BackgroundColor3 = COLORS[5], BorderSizePixel = 0, Size = UDIM2[4],AutomaticSize = 'X', ZIndex = 2, Font = Enum.Font.GothamMedium, Text = Name, TextColor3 = COLORS[1], TextSize = 13, TextWrapped = true});
    Instance.new("UICorner", ItemButton); 
	table.insert(Main[4], CreateInstance("BoolValue", {Parent = ItemButton, Name = "Value", Value = true}):GetPropertyChangedSignal("Value"):Connect(function() ItemButton.Visible = ItemButton.Value.Value end));
    table.insert(Main[4], Main[5][26](ItemButton));
	
	BindableEvents[ItemButton.Name] = Instance.new("BindableEvent");
	table.insert(Main[4], BindableEvents[ItemButton.Name].Event:Connect(Main[5][27](ItemButton, Index)));
	table.insert(Main[4], ItemButton.MouseButton1Click:Connect(function() Fire(BindableEvents[ItemButton.Name],8,false,false,false) end));
end;

-- Make ItemButtons for each Pet and Weapon
for _,Pet 	 in ipairs(game.ReplicatedStorage.Storage.Pets:GetChildren())   do Main[5][28](Pet.Name,	 1)end;
for _,Weapon in ipairs(game.ReplicatedStorage.Storage.Weapons:GetChildren())do Main[5][28](Weapon.Name, 2)end;

table.insert(Main[4], TextBox.FocusLost:Connect(Main[5][8]));	-- Called when the Focus of the TextBox is lost
table.insert(Main[4], UserInputService.InputBegan:Connect(Main[5][7]));	-- Called when any Roblox Input Module Device is Interacted with

table.insert(Main[4], Instances.Pets.MouseButton1Click:Connect(Main[5][9](1))); -- Called when Pets button is pressed
table.insert(Main[4], Instances.Weapons.MouseButton1Click:Connect(Main[5][9](2))); -- Called when Weapons button is pressed
table.insert(Main[4], Instances.All.MouseButton1Click:Connect(Main[5][19]));	-- Called when All button is pressed

table.insert(Main[4], Instances.Info.MouseButton1Click:Connect(function() Instances.SettingsMain.Visible = not Instances.SettingsMain.Visible; end));	-- Called when Info button is pressed
table.insert(Main[4], Gems:GetPropertyChangedSignal("Text"):Connect(Main[5][14]));	-- Called when gems have been changed

table.insert(Main[4], Instances.Settings.MouseButton1Click:Connect(Main[5][6](Instances.SettingsFrame, Instances.InformationFrame, Instances.Settings, Instances.Information))); -- Called when Setting button is pressed
table.insert(Main[4], Instances.Information.MouseButton1Click:Connect(Main[5][6](Instances.InformationFrame, Instances.SettingsFrame, Instances.Information, Instances.Settings))); -- Called when Information button is pressed

table.insert(Main[4], Main[7][1].Amount:GetPropertyChangedSignal("Text"):Connect(Main[5][23](1)));	-- Called when a new pet has been obtained
table.insert(Main[4], Main[7][2].Amount:GetPropertyChangedSignal("Text"):Connect(Main[5][23](2)));	-- Called when a new weapon has been obtained

table.insert(Main[4], Instances.ItemFrame:GetPropertyChangedSignal("Visible"):Connect(Main[5][10](1, Instances.ItemFrame))); -- Called when ItemFrame visibility has changed
table.insert(Main[4], Instances.FuseFrame:GetPropertyChangedSignal("Visible"):Connect(Main[5][10](2, Instances.FuseFrame))); -- Called when FuseFrame visibility has changed

table.insert(Main[4], Instances.ResetTextButton.MouseButton1Click:Connect(Main[5][21])); -- Called when ResetText button is clicked
table.insert(Main[4], Instances.AutoLoadButton.MouseButton1Click:Connect(Main[5][22](3, "AutoLoad"))); -- Called when AutoLoad button is clicked
table.insert(Main[4], Instances.AutoSaveButton.MouseButton1Click:Connect(Main[5][22](4, "AutoSave"))); -- Called when AutoSave button is clicked
table.insert(Main[4], Instances.LoadFuseButton.MouseButton1Click:Connect(Main[5][22](8, "LoadFuse"))); -- Called when LoadFuse button is clicked
table.insert(Main[4], Instances.GemsToggleButton.MouseButton1Click:Connect(Main[5][22](6, "GemsToggle"))); -- Called when Gems button is clicked
table.insert(Main[4], Instances.PrintToggleButton.MouseButton1Click:Connect(Main[5][22](7, "PrintToggle"))); -- Called when Print button is clicked
table.insert(Main[4], Instances.IgnoreEquippedButton.MouseButton1Click:Connect(Main[5][22](9, "IgnoreEquipped")));-- Called when IgnoreEquipped button is clicked
table.insert(Main[4], Instances.IgnoreEnchantedButton.MouseButton1Click:Connect(Main[5][22](10, "IgnoreEnchanted"))); -- Called when IgnoreEnchanted button is clicked
table.insert(Main[4], Instances.IgnoreElementedButton.MouseButton1Click:Connect(Main[5][25])); -- Called when IgnoreElemented button is clicked

local Template = "rbxthumb://type=Asset&id=%i&w=150&h=150";
for Aura,Data in next,require(game.ReplicatedStorage.Saturn.Modules.GameDependent.Elements)do
    Instances[Aura.."ToggleButton"] = CreateInstance("ImageButton", {Name = Aura.."ToggleButton", Parent = Instances.Elements, BackgroundColor3 = COLORS[1], BackgroundTransparency = 0, BorderSizePixel = 0, Size = UDIM2[11], Image = Template:format(Data.Image)});
    table.insert(Main[4], Instances[Aura.."ToggleButton"].MouseButton1Click:Connect(Main[5][24](Aura, Instances[Aura.."ToggleButton"])));
end;
Template = nil;

table.insert(Main[4],Instances.Close.MouseButton1Click:Once(function()Instances.MainGui:Destroy()end)); -- Called when Close button is pressed

-- Loop for checking if items are finished upgrading to Antimatter 
-- Improvement: Check the antimatter frame to see if there are any weapons/pets in the collection frame
table.insert(Main[4],BindableEvents.Second.Event:Connect(function()
	if(Main[8][1])then Main[5][2]("Pets",0)end; -- attempt to retrieve any antimatter pets
	if(Main[8][2])then Main[5][2]("Weapons",0)end; -- attempt to retrieve any antimatter weapons
end));

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

for idx=22,12,-1 do UDIM2[idx]=nil end;
COLORS[5],COLORS[6] = nil,nil;
Main[5][26],Main[5][27],Main[5][28] = nil,nil,nil;
