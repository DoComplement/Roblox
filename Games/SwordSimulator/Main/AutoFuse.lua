if game.PlaceId ~= 7026949294 then return end;
if game:IsLoaded() == false then game.Loaded:Wait() end;

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

local LocalPlayer = game:GetService("Players").LocalPlayer;
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local UserInputService = game:GetService("UserInputService");
local DungeonHandler = LocalPlayer.PlayerScripts.PlayerHandler.Miscallenious.DungeonHandler;

local PlayerData = require(ReplicatedStorage.Saturn.Modules.Client["PlayerData - Client"]);
if PlayerData.Replica.Data == nil then PlayerData.Loaded:Wait(); end; -- wait until data is loaded
PlayerData = PlayerData.Replica.Data.Main;

local Gems = LocalPlayer.PlayerGui.Main.Left.GemsBar.GemsBar.Amount;
local Colors = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Colors/ColorPicks.lua"))();
assert(Colors ~= nil and  pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/t2s_v2.lua", "nil return from HttpGet"))), "Error loading http-script");

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
		[1] = ReplicatedStorage.Events.FusePet; -- Fuse Items
		[2] = ReplicatedStorage.Events.CraftItem; -- Antimatter Conversion
		[3] = ReplicatedStorage.Events.ClaimCraftedItem; -- Claim Antimatter Conversion
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
			[true] = "009600";
			[false] = "960000";
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
		["AutoLoad"] = false;
		["AutoSave"] = false;
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
Instances.MainGui = CreateInstance("ScreenGui", {Name = "MainGui", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Global})syn.protect_gui(Instances.MainGui)Instances.MainGui.Parent = game:GetService("CoreGui");
Instances.ItemFrame = CreateInstance("Frame", {Parent =  Instances.MainGui, Active = true, Selectable = true, Draggable = true, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0.8, 0, 0.35, 0), Size = UDim2.new(0, 235, 0, 260), Visible = false});
Instances.ItemScroller = CreateInstance("ScrollingFrame", {Parent = Instances.ItemFrame, Active = true, BackgroundColor3 = Color3.fromHex("ffffff"), CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = 'Y', ScrollingDirection = 'Y', ScrollBarThickness = 0, Position = UDim2.new(0.05, 0, 0.26, 0), Size = UDim2.new(0, 215, 0, 186),BottomImage = "", MidImage = "", TopImage = ""});
local TextBox = CreateInstance("TextBox", {Parent = Instances.ItemFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0.05, 0, 0.1, 0), Size = UDim2.new(0, 215, 0, 30), Font = Enum.Font.SourceSans, Text = "Search", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000});
Instances.Info = CreateInstance("ImageButton", {Parent = Instances.ItemFrame,BackgroundTransparency = 1.000,Position = UDim2.new(0.01, 0, 0, 0),Size = UDim2.new(0, 25, 0, 25),ZIndex = 2,Image = "rbxassetid://3926305904",ImageColor3 = Color3.fromRGB(150, 150, 150),ImageRectOffset = Vector2.new(4, 804),ImageRectSize = Vector2.new(36, 36)});
Instances.Close = CreateInstance("ImageButton", {Parent = Instances.ItemFrame,BackgroundTransparency = 1.000,Position = UDim2.new(0.9, 0, 0.01, 0),Size = UDim2.new(0, 25, 0, 25),ZIndex = 2,Image = "rbxassetid://3926305904",ImageColor3 = Color3.fromRGB(150, 150, 150),ImageRectOffset = Vector2.new(285, 5),ImageRectSize = Vector2.new(24, 24)});
CreateInstance("UIListLayout", {Parent = Instances.ItemScroller, HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.Name, Padding = UDim.new(0, 10)});

Instances.FuseGui = CreateInstance("ScreenGui", {Name = "FuseGui", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})syn.protect_gui(Instances.FuseGui)Instances.FuseGui.Parent = game:GetService("CoreGui");
Instances.FuseFrame = CreateInstance("Frame", {Active = true, Selectable = true, Draggable = true, Visible = false, Parent = Instances.FuseGui, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0.7, 0, 0.65, 0), Size = UDim2.new(0, 522, 0, 180)});
Instances.FuseScroller = CreateInstance("ScrollingFrame", {Parent = Instances.FuseFrame, BackgroundColor3 = Color3.fromHex("ffffff"), CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = 'Y', ScrollingDirection = 'Y', ScrollBarThickness = 0, Position = UDim2.new(0.023, 0, 0.195, 0), Size = UDim2.new(0, 500, 0, 135),BottomImage = "", MidImage = "", TopImage = ""});
Instances.All = CreateInstance("TextButton", {Name = "All", Parent = Instances.FuseFrame, BackgroundColor3 = Color3.fromHex("960000"), BorderSizePixel = 0, Position = UDim2.new(0.904, 0, 0.015, 0), Size = UDim2.new(0, 45, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "All", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
Instances.Pets = CreateInstance("TextButton", {Name = "Pets", Parent = Instances.FuseFrame, BackgroundColor3 = Color3.fromHex("960000"), BorderSizePixel = 0, Position = UDim2.new(0.796, 0, 0.015, 0), Size = UDim2.new(0, 55, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Pets", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
Instances.Weapons = CreateInstance("TextButton", {Name = "Weapons", Parent = Instances.FuseFrame, BackgroundColor3 = Color3.fromHex("960000"), BorderSizePixel = 0, Position = UDim2.new(0.66, 0, 0.015, 0), Size = UDim2.new(0, 70, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Weapons", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
CreateInstance("TextLabel", {Name = "Label", Parent = Instances.FuseFrame, BackgroundColor3 = Color3.fromHex("ffffff"), BackgroundTransparency = 1.000, Position = UDim2.new(0.53, 0, 0.045, 0), Size = UDim2.new(0, 72, 0, 20), Font = Enum.Font.Gotham, Text = "Remove:", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 13.000});
CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.All})CreateInstance("UICorner", {CornerRadius = UDim.new(1, A0), Parent = Instances.Pets})CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.Weapons});
CreateInstance("UIListLayout", {Parent = Instances.FuseScroller, HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 5)});

Instances.SettingsGui = CreateInstance("ScreenGui", {Name = "SettingsGui", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling});syn.protect_gui(Instances.SettingsGui);Instances.SettingsGui.Parent = game:GetService("CoreGui");
Instances.SettingsMain = CreateInstance("Frame", {Parent = Instances.SettingsGui, Selectable = true, Active = true, Draggable = true, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0.64, 80, 0.23, 120), Size = UDim2.new(0, 218, 0, 255), Visible = false});
Instances.Information = CreateInstance("TextButton", {Name = "Information", Parent = Instances.SettingsMain, BackgroundColor3 = Color3.fromHex("969696"), Size = UDim2.new(0, 108, 0, 24), Font = Enum.Font.GothamMedium, Text = "Information", TextColor3 = Color3.fromHex("ffffff"), TextSize = 14.000});
Instances.Settings = CreateInstance("TextButton", {Name = "Settings", Parent = Instances.SettingsMain, BackgroundColor3 = Color3.fromHex("969696"), BackgroundTransparency = 0.5, Position = UDim2.new(0.5, 0, 0, 0), Size = UDim2.new(0, 108, 0, 24), Font = Enum.Font.GothamMedium, Text = "Settings", TextColor3 = Color3.fromHex("ffffff"), TextSize = 14.000});

Instances.InformationFrame = CreateInstance("Frame", {Name = "InformationFrame", Parent = Instances.SettingsMain, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0.015, 0, 0.15, 0), Size = UDim2.new(0, 210, 0, 210)});
CreateInstance("TextLabel", {Name = "Label1", Parent = Instances.InformationFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0.007, 1, 0.01, 0), Size = UDim2.new(0, 206, 0, 52), Font = Enum.Font.SourceSans, Text = "Click the buttons in the search frame with the names of items you want to have fused automatically.", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000, TextWrapped = true});
CreateInstance("TextLabel", {Name = "Label2", Parent = Instances.InformationFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0.007, 1, 0.275, 0), Size = UDim2.new(0, 206, 0, 52), Font = Enum.Font.SourceSans, Text = "Click the number by each item in the Fuse frame to change the quantity of items fused toward antimatter.", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000, TextWrapped = true});
CreateInstance("TextLabel", {Name = "Label3", Parent = Instances.InformationFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0.007, 1, 0.535, 0), Size = UDim2.new(0, 206, 0, 45), Font = Enum.Font.SourceSans, Text = "Report any issues or concerns to Activities12 on v3rmillion or loverboy#3970 on discord", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000, TextWrapped = true});
CreateInstance("TextLabel", {Name = "Toggle1", Parent = Instances.InformationFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0.007, 1, 0.77, 0), Size = UDim2.new(0, 206, 0, 21), Font = Enum.Font.SourceSans, Text = "Toggle SearchFrame:    LeftControl + G", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000});
CreateInstance("TextLabel", {Name = "Toggle2", Parent = Instances.InformationFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0.007, 1, 0.88, 0), Size = UDim2.new(0, 206, 0, 21), Font = Enum.Font.SourceSans, Text = " Toggle FuseFrame:        LeftControl + M", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000});

Instances.SettingsFrame = CreateInstance("ScrollingFrame", {Name = "SettingsFrame", Parent = Instances.SettingsMain, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0.015, 0, 0.15, 0), Size = UDim2.new(0, 210, 0, 210), CanvasPosition = Vector2.new(0, 0), AutomaticCanvasSize = 'Y', CanvasSize = UDim2.new(0, 0, 0, 0), ScrollingDirection = 'Y', ScrollBarThickness = 0, Visible = false, BottomImage = "", MidImage = "", TopImage = ""});
Instances.AutoLoadFrame = CreateInstance("Frame", {Name = "AutoLoadFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Size = UDim2.new(0, 210, 0, 42)});
Instances.PrintToggleFrame = CreateInstance("Frame", {Name = "PrintToggleFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Size = UDim2.new(0, 210, 0, 42)});
Instances.AutoSaveFrame = CreateInstance("Frame", {Name = "AutoSaveFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Size = UDim2.new(0, 210, 0, 42)});
Instances.ResetTextFrame = CreateInstance("Frame", {Name = "ResetTextFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Size = UDim2.new(0, 210, 0, 42)});
Instances.GemsToggleFrame = CreateInstance("Frame", {Name = "GemsToggleFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Size = UDim2.new(0, 210, 0, 42)});
Instances.LoadFuseFrame = CreateInstance("Frame", {Name = "LoadFuseFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Size = UDim2.new(0, 210, 0, 42)});
Instances.IgnoreEquippedFrame = CreateInstance("Frame", {Name = "IgnoreEquippedFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Size = UDim2.new(0, 210, 0, 42)});
Instances.IgnoreEnchantedFrame = CreateInstance("Frame", {Name = "IgnoreEnchantedFrame", Parent = Instances.SettingsFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Size = UDim2.new(0, 210, 0, 42)});
Instances.IgnoreElemented = CreateInstance("Frame", {Name = "IgnoreElemented", Parent = Instances.SettingsFrame, BackgroundColor3 = Color3.fromHex("ffffff"), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.new(0, 210, 0, 111)});
Instances.IgnoreElementedFrame = CreateInstance("Frame", {Name = "IgnoreElementedFrame", Parent = Instances.IgnoreElemented, BackgroundColor3 = Color3.fromHex("ffffff"), Size = UDim2.new(0, 210, 0, 42)});
Instances.IgnoreElementedButton = CreateInstance("TextButton", {Name = "IgnoreElementedButton", Parent = Instances.IgnoreElementedFrame, BackgroundColor3 = Color3.fromHex("960000"), BorderSizePixel = 0, Position = UDim2.new(0.01, 0, 0.15, 0), Size = UDim2.new(0, 70, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Ignore Elemented", TextColor3 = Color3.fromHex("ffffff"), TextSize = 12.000, TextWrapped = true});
Instances.IgnoreEnchantedButton = CreateInstance("TextButton", {Name = "IgnoreEnchantedButton", Parent = Instances.IgnoreEnchantedFrame, BackgroundColor3 = Color3.fromHex("009600"), BorderSizePixel = 0, Position = UDim2.new(0.01, 0, 0.15, 0), Size = UDim2.new(0, 70, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Ignore Enchanted", TextColor3 = Color3.fromHex("ffffff"), TextSize = 12.000, TextWrapped = true});
Instances.IgnoreEquippedButton = CreateInstance("TextButton", {Name = "IgnoreEquippedButton", Parent = Instances.IgnoreEquippedFrame, BackgroundColor3 = Color3.fromHex("009600"), BorderSizePixel = 0, Position = UDim2.new(0.01, 0, 0.15, 0), Size = UDim2.new(0, 70, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Ignore Equipped", TextColor3 = Color3.fromHex("ffffff"), TextSize = 12.000, TextWrapped = true});
Instances.LoadFuseButton = CreateInstance("TextButton", {Name = "LoadFuseButton", Parent = Instances.LoadFuseFrame, BackgroundColor3 = Color3.fromHex("960000"), BorderSizePixel = 0, Position = UDim2.new(0.01, 0, 0.15, 0), Size = UDim2.new(0, 70, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "LoadFuse", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
Instances.AutoLoadButton = CreateInstance("TextButton", {Name = "AutoLoadButton", Parent = Instances.AutoLoadFrame, BackgroundColor3 = Color3.fromHex("009600"), BorderSizePixel = 0, Position = UDim2.new(0.01, 0, 0.15, 0), Size = UDim2.new(0, 70, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "AutoLoad", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
Instances.AutoSaveButton = CreateInstance("TextButton", {Name = "AutoSaveButton", Parent = Instances.AutoSaveFrame, BackgroundColor3 = Color3.fromHex("009600"), BorderSizePixel = 0, Position = UDim2.new(0.01, 0, 0.15, 0), Size = UDim2.new(0, 70, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "AutoSave", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
Instances.ResetTextButton = CreateInstance("TextButton", {Name = "ResetTextButton", Parent = Instances.ResetTextFrame, BackgroundColor3 = Color3.fromHex("009600"), BorderSizePixel = 0, Position = UDim2.new(0.01, 0, 0.15, 0), Size = UDim2.new(0, 70, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "ResetText", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
Instances.GemsToggleButton = CreateInstance("TextButton", {Name = "GemsToggleButton", Parent = Instances.GemsToggleFrame, BackgroundColor3 = Color3.fromHex("960000"), BorderSizePixel = 0, Position = UDim2.new(0.01, 0, 0.15, 0), Size = UDim2.new(0, 70, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Gems", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
Instances.PrintToggleButton = CreateInstance("TextButton", {Name = "PrintToggleButton", Parent = Instances.PrintToggleFrame, BackgroundColor3 = Color3.fromHex("960000"), BorderSizePixel = 0, Position = UDim2.new(0.01, 0, 0.15, 0), Size = UDim2.new(0, 70, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Print", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});

Instances.Elements = CreateInstance("Frame", {Name = "Elements", Parent = Instances.IgnoreElemented , BackgroundColor3 = Color3.fromHex("ffffff"), BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.378, 0), Size = UDim2.new(0, 210, 0, 68)});

CreateInstance("UIGridLayout", {Parent = Instances.Elements, HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center, CellPadding = UDim2.new(0, 8, 0, 0), CellSize = UDim2.new(0, 33, 0, 33)});CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.IgnoreElementedButton});
CreateInstance("UIListLayout", {Parent = Instances.SettingsFrame, SortOrder = Enum.SortOrder.LayoutOrder});CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.LoadFuseButton});CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.PrintToggleButton});CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.IgnoreEquippedButton});CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.IgnoreEnchantedButton});
CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.AutoLoadButton});CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.ResetTextButton});CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.AutoSaveButton});CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.GemsToggleButton});CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Instances.IgnoreElementedButton});

CreateInstance("TextLabel", {Name = "AutoLoadLabel", Parent = Instances.AutoLoadFrame, BackgroundColor3 = Color3.fromHex("ffffff"), BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.03, 0), Size = UDim2.new(0, 130, 0, 40), Font = Enum.Font.SourceSans, Text = "Auto-Load stored data upon script-execution, or, if not yet loaded, load saved data", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 12.000, TextWrapped = true});
CreateInstance("TextLabel", {Name = "AutoSaveLabel", Parent = Instances.AutoSaveFrame, BackgroundColor3 = Color3.fromHex("ffffff"), BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.03, 0), Size = UDim2.new(0, 130, 0, 40), Font = Enum.Font.SourceSans, Text = "Auto-Save the state of the each Frame and Toggles upon any respective interaction", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 12.000, TextWrapped = true});
CreateInstance("TextLabel", {Name = "ResetTextLabel", Parent = Instances.ResetTextFrame, BackgroundColor3 = Color3.fromHex("ffffff"), BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.03, 0), Size = UDim2.new(0, 130, 0, 40), Font = Enum.Font.SourceSans, Text = "Resets the search bar text to \"Search\" three seconds after the box's focus is lost", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 12.000, TextWrapped = true});
CreateInstance("TextLabel", {Name = "GemsToggleLabel", Parent = Instances.GemsToggleFrame, BackgroundColor3 = Color3.fromHex("ffffff"), BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.03, 0), Size = UDim2.new(0, 130, 0, 40), Font = Enum.Font.SourceSans, Text = "Toggles fusing when you have sufficient gems. Disable if you have much more than 10M gems.", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 10.000, TextWrapped = true});
CreateInstance("TextLabel", {Name = "PrintToggleLabel", Parent = Instances.PrintToggleFrame, BackgroundColor3 = Color3.fromHex("ffffff"), BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.1, 0), Size = UDim2.new(0, 130, 0, 30), Font = Enum.Font.SourceSans, Text = "Toggles printing any item fuse event to the standard console.", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 12.000, TextWrapped = true});
CreateInstance("TextLabel", {Name = "LoadFuseLabel", Parent = Instances.LoadFuseFrame, BackgroundColor3 = Color3.fromHex("ffffff"), BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.03, 0), Size = UDim2.new(0, 130, 0, 40), Font = Enum.Font.SourceSans, Text = "Will run a single-fuse search on all loaded items upon load", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 12.000, TextWrapped = true})
CreateInstance("TextLabel", {Name = "IgnoreEquippedLabel", Parent = Instances.IgnoreEquippedFrame, BackgroundColor3 = Color3.fromHex("ffffff"), BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.01, 0), Size = UDim2.new(0, 130, 0, 40), Font = Enum.Font.SourceSans, Text = "Equipped items will be ignored during fusing events.", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 12.000, TextWrapped = true});
CreateInstance("TextLabel", {Name = "IgnoreEnchantedLabel", Parent = Instances.IgnoreEnchantedFrame, BackgroundColor3 = Color3.fromHex("ffffff"), BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.02, 0), Size = UDim2.new(0, 130, 0, 40), Font = Enum.Font.SourceSans, Text = "Enchanted (Damage+,Coins+) items will be ignored during fusing events.", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 11.000, TextWrapped = true});
CreateInstance("TextLabel", {Name = "IgnoreElementedLabel", Parent = Instances.IgnoreElementedFrame, BackgroundColor3 = Color3.fromHex("ffffff"), BorderSizePixel = 0, Position = UDim2.new(0.36, 0, 0.03, 0), Size = UDim2.new(0, 130, 0, 40), Font = Enum.Font.SourceSans, Text = "Items with enabled Elements, specified by the toggles below, will be ignored during fusing events.", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 10.000, TextWrapped = true});

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
Main[5][2] = function(Category)
    local Count = 0;
	
    -- loops through the queue and checks if any slots can be retrieved
    for ID,Item in next, PlayerData.QueuedItems[Category] do
		if Item.ReleaseDate <= (os.time() - 2) then
			Main[6][3]:InvokeServer(Category, ID);	-- Collect Antimatter Remote
			if Main[8][7] then print("Antimatter", Item.ItemData.Base, "retrieved.") end;
			continue;
		end;
		Count += 1;
    end;
    
    return Count;   -- returns the Quantity of filled antimatter crafting slots
end;

-- Fuse Items
Main[5][3] = function(List, Item, Category, Unchanged)
	if Item.Level ~= 3 then -- Antimatter has different logic
		Main[6][1]:InvokeServer(Category, List[3]); -- Fuse Items Remote
		if Main[8][7] then print(3, Item.Base, "fused to 1", Main[2][Item.Level]); end;
		return false;
	end;
	if Main[5][2](Category) < PlayerData.CraftingSlots then
		Main[6][2]:InvokeServer(Category, List[3]);	-- Antimatter Conversion Remote
		if Main[8][7] then print(List[2], Item.Base, "fused to 1 Antimatter"); end;
	end;
	return Unchanged;
end;

-- Check Ignore Toggles
Main[5][4] = function(Tag, Index)
	if (Main[8][9] or Main[8][10] or Main[8][11]) == false then return;	end;
	
	if Main[8][9] and ((Index == 2 and rawget(PlayerData.EquippedItems.Weapons, Tag) ~= nil) or table.find(PlayerData.EquippedItems.Pets, Tag) ~= nil) then -- Check Equipped
		return true;
	end;
	
	local Item = PlayerData[Main[9][Index]][Tag];
	if Main[8][11] and SaveData["Elements"][rawget(Item, "Element")] then -- Check Elemented
		return true;
	end;
	
	if Main[8][10] == false then return; end; -- Check Enchanted
	for _,_ in next, rawget(v, "Enchants") or {} do return true; end; -- non-empty table => Enchanted
end;

-- Enhance Item
Main[5][5] = function(Table, Index)
	local Unchanged,List = true,nil;
	
	for Tag,Item in next, PlayerData[Main[9][Index]] do
		if Main[1][Item.Level] == false or Table[Item.Base] == nil or Main[5][4](Tag, Index) then -- Item Validation
			continue; 
		end;
		
		List = Table[Item.Base][Item.Level]; -- ease-of-access		
		if List[1] == false then continue; end; -- validate enabled
		
		List[2] += 1;
		List[3][List[2]] = Tag; -- set Tag
		if List[2] >= table.getn(List[3]) then 
			Unchanged = Main[5][3](List, Item, Main[9][Index], Unchanged);	-- Fuse Items
			List[2] = 0;
		end;
	end;
	
	Main[5][1](Table);	-- Reset Table
	Main[8][Index] = Unchanged;
end;

-- General Settings/Information Frame Toggle
Main[5][6] = function(Frame1, Frame2, Button1, Button2)
	return function()
		if Frame1.Visible then return; end;
		
		Button1.BackgroundTransparency = 0;
		Button2.BackgroundTransparency = 0.5;
		
		Frame2.Visible = false;
		Frame1.Visible = true;	
	end;
end;

-- Toggle GUI Visible
Main[5][7] = function(Input)
	if Input.UserInputType.Value ~= 8 or UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) == false then return; end;
	if Input.KeyCode.Value ==  109 then
		Instances.FuseFrame.Visible = not Instances.FuseFrame.Visible;
	elseif Input.KeyCode.Value == 103 then
		Instances.ItemFrame.Visible = not Instances.ItemFrame.Visible;
		Instances.SettingsMain.Visible = false;
	end;
end;

-- FocusLost function
Main[5][8] = function()
	task.wait(3);
	if TextBox == nil or TextBox:IsFocused() or Main[8][5] == false then return; end;
	TextBox.Text = "Search";
end;

-- General Remove Pets/Weapons function
Main[5][9] = function(Index)
	return function()
		for Item,_ in next, Main[3][Index] do
			Instances.FuseScroller[Item:lower()]:Destroy();
		end;
	end;
end;

-- General ItemFrame/FuseFrame Visible Changed Function for AutoSave
Main[5][10] = function(Index, Frame)
	return function()
		SaveData["Visible"][Index] = Frame.Visible;
		if Main[8][4] then Main[5][11](); end;
	end;
end;

-- Save Data function
Main[5][11] = function()
	writefile(Main[9][3], "-- AutoSave Data, "..os.date().."\n\n"..t2s(SaveData));
end;

-- Check Toggles from Gem Signal
Main[5][12] = function(Index)
	for _,Table in next, Main[3][Index] do
		if (Table[1][1] or Table[1][2] or Table[1][3]) then return true; end;
	end;
	return false;
end;

-- Calls enhance function if Gem Toggle and any Fuse Toggle is enabled
Main[5][13] = function(Index)
	if table.find(Main[1], true) == nil or Main[5][12](Index) == false then return; end;
	Main[8][Index] = false;
	repeat Main[5][5](Main[3][Index], Index) until Main[8][Index];	-- Enhance Items function
end;

-- updates gem toggles and calls pets/weapon checks if either are inactive when gems are obtained
-- the significance of this function is to call the enhance item function if enough gems have been obtained 
Main[5][14] = function()
	Main[1][1] = PlayerData.Gems >= 10000;	-- toggle for normal fusing
	Main[1][2] = PlayerData.Gems >= 200000;	-- toggle for enhance fusing

	if Main[8][6] == false then	return; end; -- checks Gems Toggle
	if Main[8][1] then Main[5][13](1); end;	-- if Pets toggle is inactive, check Pets
	if Main[8][2] then Main[5][13](2); end;	-- if Weapons toggle is inactive, check Weapons
end;

-- ToggleButton function
Main[5][15] = function(FuseButton, List, Type, Index)
	return function()
		local Value = not List[1];
		
		SaveData["Items"][FuseButton.Parent.Name:lower()][1][Index] = Value; -- Update AutoSave Data
		List[1],FuseButton.BackgroundColor3 = Value,Color3.fromHex(Main[11][1][Value]); -- Update respective Item List and Button Color
		if Main[8][4] then Main[5][11](); end; -- Update Save File
		
		if Value == false then return; end;
		if Main[8][Type] == false then	-- if active
			if Main[10][Type] then return; end;	-- if a signal is already in queue
			Main[10][Type] = true;	-- indicate signal is in queue
			while Main[8][Type] == false do task.wait(); end; -- wait until inactive
		end;
		Main[8][Type] = false; -- set inactive to false
		Main[10][Type] = false; -- indicate no signal is in queue
		repeat Main[5][5](Main[3][Type], Type) until Main[8][Type];	-- calling enhance items function
	end;
end;

-- UpdateFuseQuantity function
Main[5][16] = function(QuantityButton, Antimatter, List)
	return function()
		local Data = SaveData["Items"][Antimatter.Parent.Name:lower()];
		local Temp,Quantity = table.clone(List[3]),table.getn(List[3]) - 1;
		
		if Quantity == 0 then Quantity = 8; end;
		
		List[1],Data[1][3] = false,false;
		Antimatter.BackgroundColor3 = Color3.fromHex("960000");	
		
		table.clear(List[3]);
		for i=1,Quantity do List[3][i]=Temp[i] or ''; end;
		
		QuantityButton.Text,Data[2] = Quantity,Quantity;
		if Main[8][4] then Main[5][11](); end;
	end;
end;

-- DeallocateFrame function
Main[5][17] = function(Signals, ItemButton)
	for _,Connection in ipairs(Signals) do Connection:Disconnect(); end;
	SaveData["Items"][ItemButton.Text:lower()] = nil; -- set to nil before updating
	ItemButton.Value.Value = true;
	
	if Main[10][3] == 1 then
		Main[10][3] = 0;
		Instances.FuseFrame.Visible = false;
	else
		Main[10][3] -= 1;
	end
	
	if Main[8][4] then Main[5][11](); end;
end

-- CreateFrame function
Main[5][18] = function(ItemButton, Index, List)
	Main[10][3] += 1;
	local Objects = {};
	Objects.ItemFrame = CreateInstance("Frame", {Name = ItemButton.Name, Parent = Instances.FuseScroller, BackgroundTransparency = 1.000, BackgroundColor3 = Color3.fromHex("ffffff"), Size = UDim2.new(0, 473, 0, 30)});
	Objects.Item = CreateInstance("TextButton", {Name = "Item", Parent = Objects.ItemFrame, BackgroundColor3 = Color3.new(unpack(Colors[math.random(1, 153)])), BorderSizePixel = 0, Position = UDim2.new(0, 0, -0.002, 0), Size = UDim2.new(0, 190, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = ItemButton.Text, TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
	Objects.Evolve = CreateInstance("TextButton", {Name = "Evolve", Parent = Objects.ItemFrame, BackgroundColor3 = Color3.fromHex("960000"), BorderSizePixel = 0, Position = UDim2.new(0.483, 0, -0.002, 0), Size = UDim2.new(0, 76, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Evolved", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
	Objects.Omega = CreateInstance("TextButton", {Name = "Omega", Parent = Objects.ItemFrame, BackgroundColor3 = Color3.fromHex("960000"), BorderSizePixel = 0, Position = UDim2.new(0.652, 0, -0.002, 0), Size = UDim2.new(0, 76, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Omega", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
	Objects.Antimatter = CreateInstance("TextButton", {Name = "Antimatter", Parent = Objects.ItemFrame, BackgroundColor3 = Color3.fromHex("960000"), BorderSizePixel = 0, Position = UDim2.new(0.822, 0, -0.002, 0), Size = UDim2.new(0, 80, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "Antimatter", TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
	Objects.FuseQuantity = CreateInstance("TextButton", {Name = "FuseQuantity", Parent = Objects.ItemFrame, BackgroundColor3 = Color3.fromHex("ffffff"), BorderSizePixel = 0, Position = UDim2.new(0.41, 0, 0, 0), Size = UDim2.new(0, 30, 0, 30), ZIndex = 2, Font = Enum.Font.GothamMedium, Text = "8", TextColor3 = Color3.fromRGB(0, 0, 0), TextScaled = true, TextSize = 13.000, TextWrapped = true});
	CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Objects.Item})CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Objects.Evolve})CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Objects.Omega})CreateInstance("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Objects.Antimatter})Instance.new("UICorner", Objects.FuseQuantity);

	local Signals = {
		[1] = Objects.Evolve.MouseButton1Click:Connect(Main[5][15](Objects.Evolve, List[1], Index, 1));
		[2] = Objects.Omega.MouseButton1Click:Connect(Main[5][15](Objects.Omega, List[2], Index, 2));
		[3] = Objects.Antimatter.MouseButton1Click:Connect(Main[5][15](Objects.Antimatter, List[3], Index, 3));
		[4] = Objects.FuseQuantity.MouseButton1Click:Connect(Main[5][16](Objects.FuseQuantity, Objects.Antimatter, List[3]));
		[5] = Objects.Item.MouseButton1Click:Once(function() Objects.ItemFrame:Destroy() end);
	};
	Objects.ItemFrame.Destroying:Once(function() Main[3][Index][ItemButton.Text] = Main[5][17](Signals, ItemButton); end);
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
	if isfile(Main[9][3]) == false then
		if isfolder("SwordSim AutoFuseData") == false then
			makefolder("SwordSim AutoFuseData");
		end;
		Instances.ItemFrame.Visible = true;
		Instances.FuseFrame.Visible = true;
		Instances.SettingsMain.Visible = true;
		Main[5][11]();
		return;
	end;
	
	local Success,Temp = pcall(loadstring(readfile(Main[9][3])));
	assert(Success and type(Temp) == "table", "Error! loadstring function failed (expected a table) to read data in file: workspace/"..Main[9][3]);
	if Temp["Toggles"] == nil or Temp["Toggles"]["AutoLoad"] ~= true then return; end; -- if AutoLoad is nil or disabled
	
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
		if Temp[Name] == nil or Name == "Items" then continue; end;
		assert(type(Temp[Name]) == "table", "Error! Invalid data type encountered (should be table) in save data when referencing \""..Name..'\"');
		for Index,_ in next, Table do
			Value = type(Temp[Name][Index]) == "boolean" and Temp[Name][Index];
			Table[Index] = Value;
			if Name == "Visible" then continue; end;
			if Name == "Elements" then
				Instances[Index.."ToggleButton"].ImageTransparency = Main[11][2][Value];
				if Value == false then continue; end;
				Main[10][4] += 1; -- Count enabled, ignored elements
			else
				Main[8][Reference[Index]] = Value;
				Instances[Index.."Button"].BackgroundColor3 = Color3.fromHex(Main[11][1][Value]);
			end;
		end;
	end;
	
	Instances.ItemFrame.Visible = SaveData["Visible"][1];
	Instances.FuseFrame.Visible = SaveData["Visible"][2];
	Value = SaveData["Visible"][2];
	
	-- Disable ignoring elements if zero elements are being ignored
	if Main[10][4] == 0 and Main[8][11] then
		Instances.IgnoreElementedButton.BackgroundColor3 = Color3.fromHex("960000");
		Main[8][11] = false;
	end;
	
	-- Validate and Load Item Data
	if type(Temp["Items"]) ~= "table" then return; end;
	local DataFrame,BoolToggles = nil;
	for Name,Data in next, Temp["Items"] do
	
		assert(Instances.ItemScroller:WaitForChild(Name:lower()) ~= nil, "Error! Invalid item in save file: "..Name); -- Validate item name
		assert(type(Data) == "table" and type(Data[1]) == "table", "Error! Invalid data format (should be a table) for main or main[1] of Item: "..Name); -- Validate referenced data is a table of size 2
		if type(Data[2]) ~= "number" or Data[2] <= 0 or Data[2] >= 9 then -- Validate Antimatter Fuse Quantity and Data Type
			Data[2] = 8;
			Data[1][3] = false;
		end;
		
		BoolToggles = {
			[1] = type(Data[1][1]) == "boolean" and Data[1][1]; 
			[2] = type(Data[1][2]) == "boolean" and Data[1][2]; 
			[3] = type(Data[1][3]) == "boolean" and Data[1][3];
		};
		
		-- Make Button in Fuse Frame (will save if enabled)
		BindableEvents[Name:lower()]:Fire(Data[2], unpack(BoolToggles)); 
		
		-- set button color accordingly
		DataFrame = Instances.FuseScroller:WaitForChild(Name:lower());
		DataFrame:WaitForChild("FuseQuantity").Text = Data[2];
		DataFrame.Evolve.BackgroundColor3 = Color3.fromHex(Main[11][1][BoolToggles[1]]);
		DataFrame.Omega.BackgroundColor3 = Color3.fromHex(Main[11][1][BoolToggles[2]]);
		DataFrame.Antimatter.BackgroundColor3 = Color3.fromHex(Main[11][1][BoolToggles[3]]);
	end;
	
	Instances.FuseFrame.Visible = Value; -- calling the bindable event will have opened the fuseframe, so re-set the value
	
	if DataFrame == nil or SaveData["Toggles"]["LoadFuse"] == false then return; end;
	Main[5][13](1); -- calling pet enhancement function
	Main[5][13](2); -- calling weapon enhancement function
end;

-- ResetText Button Toggle
Main[5][21] = function()
	local Value = not Main[8][5];
	Main[8][5],SaveData["Toggles"]["ResetText"] = Value,Value;
	Instances.ResetTextButton.BackgroundColor3 = Color3.fromHex(Main[11][1][Value]);
	if Main[8][4] then Main[5][11](); end;
	
	if Value == false then return; end;
	TextBox.Text = "Search";
end;

-- General Logic Button Toggle
Main[5][22] = function(Index, Name)
	return function()
		local Value = not Main[8][Index];
		Main[8][Index],SaveData["Toggles"][Name] = Value,Value;
		Instances[Name.."Button"].BackgroundColor3 = Color3.fromHex(Main[11][1][Value]);
		if Main[8][4] or Index == 4 then Main[5][11](); end;
	end;
end;

-- General Check Pets/Weapons function for Fusing
Main[5][23] = function(Index)
	return function()
		-- if Notification is invisible or Enhancement is active
		if (Main[7][Index].Visible and Main[8][Index]) == false then return; end;
		
		local Amount = Main[7][Index].Amount.Text;
		task.wait(); -- allow time for text to potentially change
		
		-- if enhancing is inactive and text is unchanged
		if Main[7][Index].Amount.Text ~= Amount then return; end;
		
		Main[8][Index] = false; -- set inactive = false
		repeat Main[5][5](Main[3][Index], Index) until Main[8][Index]; -- repeat until iactive = true
	end;
end;

-- Toggle Element button
Main[5][24] = function(Element, Button)
	return function()
		if Button.ImageTransparency == 0.5 then
		    SaveData["Elements"][Element] = true
			Button.ImageTransparency = 0;
			Main[10][4] += 1;
		else
		    SaveData["Elements"][Element] = false
			Button.ImageTransparency = 0.5;
			Main[10][4] -= 1;
		end;
		
		-- Disable if zero Elements are being ignored
		if Main[10][4] == 0 and Main[8][11] then 
			Instances.IgnoreElementedButton.BackgroundColor3 = Color3.fromHex("960000");
			SaveData["Toggles"]["IgnoreElemented"] = false;
			Main[8][11] = false;
		end;
		
		if Main[8][4] then Main[5][11](); end;
	end;
end;

-- Toggle IgnoreElemented Button
Main[5][25] = function()
	if Main[10][4] == 0 then
		Instances.IgnoreElementedButton.BackgroundColor3 = Color3.fromHex("960000");
		Main[8][11] = false;
		return;
	end;
	
	local Value = not Main[8][11];
	Instances.IgnoreElementedButton.BackgroundColor3 = Color3.fromHex(Main[11][1][Value]);
	Main[8][11] = Value;
	
	if Main[8][4] then Main[5][11](); end;
end;

-- MakeTextChangedSignal Function
Main[5][26] = function(ItemButton)
    return TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		
		if TextBox.Text == "Search" or TextBox.Text == "" then
			ItemButton.Visible = ItemButton.Value.Value;
			return;
		end;

		-- if the text input matches somewhere in the name of ItemButton, then the Button will remain visible
		ItemButton.Visible = ItemButton.Value.Value and ItemButton.Name:match(TextBox.Text:lower()) ~= nil;
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
		if Main[8][4] then Main[5][11](); end; -- Save if enabled
	end;
end;

-- MakeButton Function
Main[5][28] = function(Name, Index)
    local ItemButton = CreateInstance("TextButton", {Name = Name:lower(), Parent = Instances.ItemScroller, BackgroundColor3 = Color3.fromRGB(46, 141, 213), BorderSizePixel = 0, Size = UDim2.new(0, 190, 0, 30),AutomaticSize = 'X', ZIndex = 2, Font = Enum.Font.GothamMedium, Text = Name, TextColor3 = Color3.fromHex("ffffff"), TextSize = 13.000, TextWrapped = true});
    Instance.new("UICorner", ItemButton); 
	table.insert(Main[4], CreateInstance("BoolValue", {Parent = ItemButton, Name = "Value", Value = true}):GetPropertyChangedSignal("Value"):Connect(function() ItemButton.Visible = ItemButton.Value.Value end));
    table.insert(Main[4], Main[5][26](ItemButton));
	
	BindableEvents[ItemButton.Name] = Instance.new("BindableEvent");
	table.insert(Main[4], BindableEvents[ItemButton.Name].Event:Connect(Main[5][27](ItemButton, Index)));
	table.insert(Main[4], ItemButton.MouseButton1Click:Connect(function() BindableEvents[ItemButton.Name]:Fire(8, false, false, false) end));
end;

-- Make ItemButtons for each Pet and Weapon
for _,Pet 	 in ipairs(ReplicatedStorage.Storage.Pets:GetChildren())    do Main[5][28](Pet.Name,	1) end;
for _,Weapon in ipairs(ReplicatedStorage.Storage.Weapons:GetChildren()) do Main[5][28](Weapon.Name, 2) end;

Main[5][26],Main[5][27],Main[5][28] = nil; -- Remove functions that will not be used again

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
table.insert(Main[4], Instances.LoadFuseButton.MouseButton1Click:Connect(Main[5][22](8, "LoadFuse")));-- Called when LoadFuse button is clicked
table.insert(Main[4], Instances.GemsToggleButton.MouseButton1Click:Connect(Main[5][22](6, "GemsToggle"))); -- Called when Gems button is clicked
table.insert(Main[4], Instances.PrintToggleButton.MouseButton1Click:Connect(Main[5][22](7, "PrintToggle"))); -- Called when Print button is clicked
table.insert(Main[4], Instances.IgnoreEquippedButton.MouseButton1Click:Connect(Main[5][22](9, "IgnoreEquipped")));-- Called when IgnoreEquipped button is clicked
table.insert(Main[4], Instances.IgnoreEnchantedButton.MouseButton1Click:Connect(Main[5][22](10, "IgnoreEnchanted"))); -- Called when IgnoreEnchanted button is clicked
table.insert(Main[4], Instances.IgnoreElementedButton.MouseButton1Click:Connect(Main[5][25])); -- Called when IgnoreElemented button is clicked

local Template = "rbxthumb://type=Asset&id=%i&w=150&h=150";
for Aura,Data in next, require(ReplicatedStorage.Saturn.Modules.GameDependent.Elements) do
    Instances[Aura.."ToggleButton"] = CreateInstance("ImageButton", {Name = Aura.."ToggleButton", Parent = Instances.Elements, BackgroundColor3 = Color3.fromHex("ffffff"), BackgroundTransparency = 0, BorderSizePixel = 0, Size = UDim2.new(0, 100, 0, 100), Image = Template:format(Data.Image)});
    table.insert(Main[4], Instances[Aura.."ToggleButton"].MouseButton1Click:Connect(Main[5][24](Aura, Instances[Aura.."ToggleButton"])));
end ReplicatedStorage,Template = nil;

table.insert(Main[4], Instances.Close.MouseButton1Click:Once(function() Instances.MainGui:Destroy() end)); -- Called when Close button is pressed

-- Loop for checking if items are finished upgrading to Antimatter 
-- Improvement: Check the antimatter frame to see if there are any weapons/pets in the collection frame
table.insert(Main[4], BindableEvents.Second.Event:Connect(function()
	if Main[8][1] then Main[5][2]("Pets"); end; -- attempt to retrieve any antimatter pets
	if Main[8][2] then Main[5][2]("Weapons"); end; -- attempt to retrieve any antimatter weapons
end));

local Time = nil;Time = hookfunction(os.time, function()
	if BindableEvents ~= nil and getcallingscript() == DungeonHandler then BindableEvents.Second:Fire(); end; -- called once every second
	return Time();
end);

-- Deallocate Memory
Instances.MainGui.Destroying:Once(function()
	if Main[8][4] then 
		Main[5][11]();
		Main[8][4] = false; -- disable any future save attempts
	end;
	
	for _,Connection in ipairs(Main[4]) do Connection:Disconnect() end;
	
	Instances.FuseGui:Destroy();
	Instances.SettingsGui:Destroy();
	
	Main,Instances,BindableEvents = nil;
end);

Main[5][20](); -- Load Saved Data