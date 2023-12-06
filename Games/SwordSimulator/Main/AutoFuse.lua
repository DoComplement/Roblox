if(not game:IsLoaded())then game.Loaded:Wait()end;
if(getgenv()["@Esz#O8k(9]1HBol~S8C"]~=nil or not table.find({7026949294,11127874647},game.PlaceId))then return end; -- game.PlaceId can return 0 under certain conditions if game is not loaded
getgenv()["@Esz#O8k(9]1HBol~S8C"] = true;

local localUserId = game:GetService("Players").LocalPlayer.UserId;

local plrData,craftingSlots = require(game:GetService("ReplicatedStorage").Saturn.Modules.Client["PlayerData - Client"]),nil;
if(not plrData.HasLoaded)then plrData.Loaded:Wait()end; 	-- wait until data is loaded
plrData 	  = plrData.Replica.Data.Main;
craftingSlots = plrData.CraftingSlots;


local wait,lower,Connect = task.wait,string.lower,newcclosure(game.Changed.Connect); -- a unique "Connect" function is created every time ":Connect" is invoked, but they each serve the same purpose
local COLOR_PICKS = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DoComplement/Roblox/main/Colors/ColorPicks.lua")), "Error loading Colors")();
assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/t2s_v2.lua")), "Error loading TableToString")();

local LEFT = Enum.TextXAlignment.Left;
local UDIM_CORNER = UDim.new(1,0);
local FONTS = {
	[1] = Enum.Font.GothamMedium;
	[2] = Enum.Font.SourceSans;
};	
local COLORS = {
	[1] = Color3.fromHex("ffffff"); 		-- White
	[2] = Color3.fromHex("000000"); 		-- Black
	[3] = Color3.fromHex("960000");		 	-- Red
	[4] = Color3.fromHex("009600");			-- Green
	[5] = Color3.fromRGB(150,150,150); 		-- Gray
	[6] = Color3.fromRGB(200,200,200); 		-- Gray-White
	[7] = Color3.fromRGB(46,141,213); 		-- Light Blue
};
local UDIM2 = {
	[1]  = UDim2.new(0,76,0,30);
	[2]  = UDim2.new(0,473,0,30);
	[3]  = UDim2.new(0,0,-0.002,0);
	[4]  = UDim2.new(0,190,0,30);
	[5]  = UDim2.new(0.483,0,-0.002,0);
	[6]  = UDim2.new(0.652,0,-0.002,0);
	[7]  = UDim2.new(0.822,0,-0.002,0);
	[8]  = UDim2.new(0,80,0,30);
	[9]  = UDim2.new(0.41,0,0,0);
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

local INST {
	
	{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.Name,Padding=UDim.new(0,10)}
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
		[1] = {};		-- Pet Fuses
		[2] = {};		-- Weapon Fuses
	};
	[4] = {};		-- Connections
	[5] = { 	
		-- Remotes
		[1] = game:GetService("ReplicatedStorage").Events.FusePet; 				-- Fuse Items
		[2] = game:GetService("ReplicatedStorage").Events.CraftItem; 			-- Antimatter Conversion
		[3] = game:GetService("ReplicatedStorage").Events.ClaimCraftedItem;		-- Claim Antimatter Conversion
	};
	[6] = {	
		-- Notifications
		[1] = game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.LeftButtons.PetInventory.Notification;		-- Pets Notification
		[2] = game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.LeftButtons.WeaponInv.Notification;		-- Weapons Notification
	};	
	[7] = {	
		-- Toggles
		[1]  = true;		-- Pet Enhancement is inactive
		[2]  = true;		-- Weapon Enhancement is inactive
		[3]  = true; 		-- AutoLoad Toggle
		[4]  = true; 		-- AutoSave Toggle
		[5]  = true; 		-- ResetText Toggle
		[6]  = false; 		-- Gems Toggle
		[7]  = false; 		-- Print Toggle
		[8]  = false; 		-- LoadFuse Toggle
		[9]  = true; 		-- IgnoreEquipped Toggle
		[10] = true; 		-- IgnoreEnchanted Toggle
		[11] = true; 		-- IgnoreElemented Toggle
		[12] = false; 		-- SaveQueue Toggle
	};
	[8] = {	
		-- String Constants
		[1] = "Pets";
		[2] = "Weapons";
	};
	[9] = { 
		-- Queue
		[1] = false; 	-- Pet Signal Queue
		[2] = false; 	-- Weapon Signal Queue
		[3] = 0; 		-- Fuse Frame Count
		[4] = 10; 		-- Element Enabled Count
	};
	[10] = { 
		-- bool-color constants
		[true]  = COLORS[4];	-- green
		[false] = COLORS[3];	-- red
	};
	[11] = { 
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


local fmtTable = nil;
local function setVals(class, parent, props)
	local inst = Instance.new(class);
	for prop,val in next,(props or fmtTable)do
		inst[prop] = val;
	end;
	inst.Parent = parent;	-- assign parent last to avoid erroneous game-listener assignments
	return inst;
end;

fmtTable = setmetatable({}, {
	__call = function(self, class, parent, fmt, clean)
		if(clean)then
			fmtTable = setmetatable(fmt, getmetatable(self));
		elseif(fmt)then
			for idx,val in next,fmt do
				rawset(self, idx, val);
			end;
		end;
		return setVals(class, parent);
	end;
});

local Instances,BindableEvents = {},{Second = Instance.new("BindableEvent")};

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ newcclosure here is untested @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
local InvokeServer = newcclosure(Main[5][1].InvokeServer);
local Fire 		   = newcclosure(BindableEvents.Second.Fire);

local function createCornerBtns(tbl, parents)
	for _,parent in ipairs(parents)do
		Instance.new("UICorner", tbl[parent]).CornerRadius = UDIM_CORNER;	-- don't worry, everything will be fine 
	end;
end;

if(syn~=nil)then
	Instances.MainGui 	  = fmtTable("ScreenGui", nil, {Name="MainGui",ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Global}, true)syn.protect_gui(Instances.MainGui)Instances.MainGui.Parent = game:GetService("CoreGui");
	Instances.FuseGui 	  = fmtTable("ScreenGui", nil, {Name="FuseGui",ZIndexBehavior=Enum.ZIndexBehavior.Sibling})syn.protect_gui(Instances.FuseGui)Instances.FuseGui.Parent = game:GetService("CoreGui");
	Instances.SettingsGui = fmtTable("ScreenGui", nil, {Name = "SettingsGui"});syn.protect_gui(Instances.SettingsGui);Instances.SettingsGui.Parent = game:GetService("CoreGui");
elseif(gethui~=nil)then
	local parent = gethui();
	Instances.MainGui 	  = fmtTable("ScreenGui", parent, {Name="MainGui",ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Global}, true);
	Instances.FuseGui 	  = fmtTable("ScreenGui", parent, {Name="FuseGui",ZIndexBehavior=Enum.ZIndexBehavior.Sibling});
	Instances.SettingsGui = fmtTable("ScreenGui", parent, {Name="SettingsGui"});
end;

-- Search Frame
Instances.ItemFrame    = fmtTable("Frame", Instances.MainGui, 	  {Active=true,Selectable=true,Draggable=true,Visible=false,BackgroundColor3=COLORS[1],Position=UDim2.new(0.8,0,0.35,0),Size=UDim2.new(0,235,0,260)}, true);
Instances.FuseFrame    = fmtTable("Frame", Instances.FuseGui,  	  {Position = UDim2.new(0.7,0,0.65,0), Size = UDim2.new(0,522,0,180)});
Instances.SettingsMain = fmtTable("Frame", Instances.SettingsGui, {Position = UDim2.new(0.64,80,0.23,120), Size = UDim2.new(0,218,0,255)});

Instances.ItemScroller  = fmtTable("ScrollingFrame", Instances.ItemFrame, 	 {Active=true,BackgroundColor3=COLORS[1],CanvasSize=UDIM2[23],AutomaticCanvasSize='Y',ScrollingDirection='Y',ScrollBarThickness=0,Position=UDim2.new(0.05,0,0.26,0),Size=UDim2.new(0,215,0,186),BottomImage='',MidImage='',TopImage=''}, true);
Instances.FuseScroller  = fmtTable("ScrollingFrame", Instances.FuseFrame, 	 {Name = "FuseFrame",	  Position = UDim2.new(0.01775,0,0.195,0), Size = UDim2.new(0,503,0,135)});
Instances.QueueScroller = fmtTable("ScrollingFrame", Instances.FuseFrame, 	 {Name = "QueueFrame", 	  Visible = false});
Instances.SettingsFrame = fmtTable("ScrollingFrame", Instances.SettingsMain, {Name = "SettingsFrame", Position = UDIM2[19], Size = UDIM2[20], BorderSizePixel = 0, CanvasPosition = Vector2.new()});

local TextBox = setVals("TextBox", Instances.ItemFrame, {BackgroundColor3=COLORS[1],Position=UDim2.new(0.05,0,0.1,0),Size=UDim2.new(0,215,0,30),Font=FONTS[2],Text="Search",TextColor3=COLORS[2],TextSize=14});
Instances.Info  = fmtTable("ImageButton", Instances.ItemFrame, {Position=UDim2.new(0.01,0,0,0),  Image="rbxassetid://3926305904",ImageRectOffset=Vector2.new(4,804),ImageRectSize=Vector2.new(36,36),Size=UDIM2[17],ZIndex=2,BackgroundTransparency=1,ImageColor3=COLORS[5]}, true);
Instances.Close = fmtTable("ImageButton", Instances.ItemFrame, {Position=UDim2.new(0.9,0,0.01,0),Image="rbxassetid://3926305904",ImageRectOffset=Vector2.new(285,5),ImageRectSize=Vector2.new(24,24)});


-- Queue Frame
Instances.PetsHeader    = fmtTable("TextLabel", Instances.QueueScroller, {Name = "PetsHeader",BackgroundColor3=COLORS[1],Size=UDim2.new(0,517,0,23),Font=FONTS[2],Text="     (0/"..craftingSlots..") - Pets",TextColor3=COLORS[2],TextScaled=true,TextSize=14,TextWrapped=true,TextXAlignment=LEFT}, true);
Instances.WeaponsHeader = fmtTable("TextLabel", Instances.QueueScroller, {Name = "WepsHeader", LayoutOrder = 2, Text = "     (0/"..craftingSlots..") - Weapons"});


Instances.Information = fmtTable("TextButton", Instances.SettingsMain, {Name="Information",BackgroundColor3=COLORS[5],BorderSizePixel=0,Size=UDIM2[18],Font=FONTS[1],Text="Information",TextColor3=COLORS[1],TextSize=14}, true);
Instances.Settings    = fmtTable("TextButton", Instances.SettingsMain, {Name="Settings",BackgroundColor3=COLORS[6],Position=UDim2.new(0.5,0,0,0),Text="Settings"});


-- Fuse Frame
Instances.ToggleFrame = setVals("TextButton", Instances.FuseFrame, {Name="ToggleFrame",Position=UDim2.new(0.01632,0,0.015,0),Text="Queue",Size=UDIM2[22],BackgroundColor3=COLORS[3],TextSize=13,TextWrapped=true});
Instances.Weapons     = setVals("TextButton", Instances.FuseFrame, {Name = "Weapons", Position = UDim2.new(0.6485,0,0.015,0), Text = "Weapons"});
Instances.Pets        = setVals("TextButton", Instances.FuseFrame, {Name = "Pets",	  Position = UDim2.new(0.784,0,0.015,0),  Text = "Pets", Size = UDim2.new(0,55,0,30)});
Instances.All         = setVals("TextButton", Instances.FuseFrame, {Name = "All",	  Position = UDim2.new(0.89,0,0.015,0),   Text = "All",  Size = UDim2.new(0,45,0,30)});
setVals("TextLabel", Instances.FuseFrame, {Name="Label",BackgroundColor3=COLORS[1],BackgroundTransparency=1,Position=UDim2.new(0.5185,0,0.045,0),Size=UDim2.new(0,72,0,20),Font=Enum.Font.Gotham,Text="Remove:",TextColor3=COLORS[2],TextSize=13});


-- Information Frame
Instances.InformationFrame = setVals("Frame", Instances.SettingsMain, {Name = "InformationFrame", BackgroundColor3 = COLORS[1], Position = UDIM2[19], Size=UDIM2[20]});
fmtTable("TextLabel", Instances.InformationFrame, {Name = "Toggle1",BackgroundColor3=COLORS[1],Position=UDim2.new(0.007,1,0.77,0),Size=UDIM2[21],Font=FONTS[2],Text="Toggle SearchFrame:    LeftControl + G",TextColor3=COLORS[2],TextSize=14}, true);
fmtTable("TextLabel", Instances.InformationFrame, {Name = "Toggle2", Position = UDim2.new(0.007,1,0.88,0),  Text = " Toggle FuseFrame:        LeftControl + M"});
fmtTable("TextLabel", Instances.InformationFrame, {Name = "Label1",  Position = UDim2.new(0.007,1,0.01,0),  Text = "Click the buttons in the search frame with the names of items you want to have fused automatically.", Size = UDim2.new(0,206,0,52), TextWrapped = true});
fmtTable("TextLabel", Instances.InformationFrame, {Name = "Label2",  Position = UDim2.new(0.007,1,0.275,0), Text = "Click the number by each item in the Fuse frame to change the quantity of items fused toward antimatter."});
fmtTable("TextLabel", Instances.InformationFrame, {Name = "Label3",  Position = UDim2.new(0.007,1,0.535,0), Text = "Please report any issues or concerns to Activities12 on v3rmillion or loverboy#3970 on discord.", Size = UDim2.new(0,206,0,45)});


-- Settings Frame
Instances.IgnoreElemented = setVals("Frame",Instances.SettingsFrame,{Name="IgnoreElemented",BackgroundColor3=COLORS[1],Position=UDim2.new(0,0,0.5,0),Size=UDim2.new(0,210,0,111)});
Instances.Elements = setVals("Frame",Instances.IgnoreElemented,{Name="Elements",BackgroundColor3=COLORS[1],BackgroundTransparency=1,BorderSizePixel=0,Position=UDim2.new(0,0,0.378,0),Size=UDim2.new(0,210,0,68)});
Instances.IgnoreElementedFrame = fmtTable("Frame", Instances.IgnoreElemented, {Name = "IgnoreElementedFrame", BackgroundColor3 = COLORS[1], Size = UDIM2[13]}, true);
Instances.IgnoreEnchantedFrame = fmtTable("Frame", Instances.SettingsFrame, {Name = "IgnoreEnchantedFrame"});
Instances.IgnoreEquippedFrame  = fmtTable("Frame", Instances.SettingsFrame, {Name = "IgnoreEquippedFrame"});
Instances.PrintToggleFrame     = fmtTable("Frame", Instances.SettingsFrame, {Name = "PrintToggleFrame"});
Instances.GemsToggleFrame      = fmtTable("Frame", Instances.SettingsFrame, {Name = "GemsToggleFrame"});
Instances.ResetTextFrame       = fmtTable("Frame", Instances.SettingsFrame, {Name = "ResetTextFrame"});
Instances.SaveQueueFrame 	   = fmtTable("Frame", Instances.SettingsFrame, {Name = "SaveQueueFrame"});
Instances.AutoLoadFrame        = fmtTable("Frame", Instances.SettingsFrame, {Name = "AutoLoadFrame"});
Instances.AutoSaveFrame        = fmtTable("Frame", Instances.SettingsFrame, {Name = "AutoSaveFrame"});
Instances.LoadFuseFrame        = fmtTable("Frame", Instances.SettingsFrame, {Name = "LoadFuseFrame"});

-- Toggle Buttons
Instances.IgnoreElementedButton = fmtTable("TextButton", Instances.IgnoreElementedFrame, {Name="IgnoreElementedButton",BackgroundColor3=COLORS[4],BorderSizePixel=0,Position=UDIM2[14],Size=UDIM2[22],ZIndex=2,Font=FONTS[1],Text="Ignore Elemented",TextColor3=COLORS[1],TextSize=12,TextWrapped=true}, true);
Instances.IgnoreEnchantedButton = fmtTable("TextButton", Instances.IgnoreEnchantedFrame, {Name = "IgnoreEnchantedButton", Text = "Ignore Enchanted"});
Instances.IgnoreEquippedButton  = fmtTable("TextButton", Instances.IgnoreEquippedFrame,  {Name = "IgnoreEquippedButton",  Text = "Ignore Equipped"});
Instances.ResetTextButton   = fmtTable("TextButton", Instances.ResetTextFrame, {Name = "ResetTextButton", Text = "ResetText");
Instances.AutoLoadButton    = fmtTable("TextButton", Instances.AutoLoadFrame,  {Name = "AutoLoadButton",  Text = "AutoSave"});
Instances.AutoSaveButton    = fmtTable("TextButton", Instances.AutoSaveFrame,  {Name = "AutoSaveButton",  Text = "AutoLoad"});
Instances.PrintToggleButton = fmtTable("TextButton", Instances.PrintToggleFrame, {Name = "PrintToggleButton", Text = "Print", BackgroundColor3 = COLORS[3]});
Instances.GemsToggleButton  = fmtTable("TextButton", Instances.GemsToggleFrame,  {Name = "GemsToggleButton",  Text = "Gems"});
Instances.SaveQueueButton   = fmtTable("TextButton", Instances.SaveQueueFrame,   {Name = "SaveQueueButton",   Text = "SaveQueue"});
Instances.LoadFuseButton    = fmtTable("TextButton", Instances.LoadFuseFrame, 	 {Name = "LoadFuseButton",	  Text = "LoadFuse"});

setVals("UIGridLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,CellPadding=UDim2.new(0,8,0,0),CellSize=UDim2.new(0,33,0,33)},Instances.Elements);
Instance.new("UIListLayout",Instances.SettingsFrame).SortOrder = Enum.SortOrder.LayoutOrder; -- should be fine

-- Information Labels
fmtTable("TextLabel", Instances.IgnoreEnchantedFrame, {Name="IgnoreEnchantedLabel",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDim2.new(0.36,0,0.02,0),Size=UDIM2[15],Font=FONTS[2],Text="Enchanted - Damage+, Coins+, etc. - items will be ignored during fusing events.",TextColor3=COLORS[2],TextSize=11,TextWrapped=true});
fmtTable("TextLabel", Instances.GemsToggleFrame, {Name = "GemsToggleLabel", Text = "Toggles fusing when you have sufficient gems. Disable if you have much more than 10M gems.", Position = UDIM2[16], TextSize = 10});
fmtTable("TextLabel", Instances.SaveQueueFrame,  {Name = "SaveQueueLabel",  Text = "Automatically stores Antimatter queue into: SwordSimData/QueueData"});
fmtTable("TextLabel", Instances.ResetTextFrame, {Name = "ResetTextLabel", Text = "Resets the search bar text to \"Search\" three seconds after the box's focus is lost.", TextSize = 12});
fmtTable("TextLabel", Instances.AutoLoadFrame,  {Name = "AutoLoadLabel",  Text = "Auto-Load stored data upon script-execution, or, if not yet loaded, load saved data."});
fmtTable("TextLabel", Instances.AutoSaveFrame,  {Name = "AutoSaveLabel",  Text = "Auto-Save the state of the each Frame and Toggles upon any respective interaction."});
fmtTable("TextLabel", Instances.LoadFuseFrame,  {Name = "LoadFuseLabel",  Text = "Will run a single-fuse search on all loaded items upon load."});
fmtTable("TextLabel", Instances.IgnoreEquippedFrame, {Name = "IgnoreEquippedLabel", Text = "Equipped items will be ignored during fusing events.", Position = UDim2.new(0.36,0,0.01,0)});
fmtTable("TextLabel", Instances.PrintToggleFrame,    {Name = "PrintToggleLabel",    Text = "Toggles printing any item fuse event to the standard console.", Size = UDim2.new(0,130,0,30)});

createCornerBtns(Instances, {"ToggleFrame","SaveQueueButton","All","Pets","Weapons","LoadFuseButton","PrintToggleButton","IgnoreEquippedButton","IgnoreEnchantedButton","AutoLoadButton","ResetTextButton","AutoSaveButton","GemsToggleButton","IgnoreElementedButton","IgnoreElementedButton"});
setVals("UIListLayout", fmtTable(INST[4], {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0,5)}, Instances.FuseScroller);
setVals("UIListLayout", INST[4], Instances.QueueScroller);		-- queue frame
setVals("UIListLayout", INST[4], Instances.ItemScroller);
Instance.new("UICorner", Instances.InformationFrame);
Instance.new("UICorner", Instances.SettingsMain);
Instance.new("UICorner",Instances.FuseFrame);
Instance.new("UICorner",Instances.ItemFrame);

local hdr_fmt,saveQueue,newQueueItem,SAVE_DATA = "     (%d/%d) - %s",nil,nil,nil;
do
	-- function to format a time, of the format returned by os.time, into an extended date
	local FRMT = "%02i/%02i/%04i, %02i:%02i:%02i";
	local function frmtDate(date)
		return FRMT:format(date.month, date.day, date.year, date.hour, date.min, date.sec);
	end;

	do	-- save queue
		local queueFile   = "SwordSimData/QueueData.json";
		local legibleFile = "SwordSimData/QueueData_LEGIBLE.lua";
		
		if(not isfolder("SwordSimData"))then makefolder("SwordSimData")end;									-- check folder existense
		if(not isfile(queueFile))then writefile(queueFile, "[]")end;										-- check json file existence
		
		local mtb = {
			__index = function(self, idx)
				return rawset(self, idx, {})[idx];
			end;
		};
		
		local localName	= game:GetService("Players").LocalPlayer.Name;
		local function check_list(queue)
			for item,list in next,queue do
				for rel_dat,name in next,list do
					if(name == localName)then
						list[rel_date] = nil;
					end;
				end;
			end;
		end;
	
		local function getQueue(queue)
			for cast,data in next,plrData.QueuedItems do
				check_list(setmetatable(queue[cast], mtb));															-- clear local releasedates
				for _,item in next,data do
					queue[cast][item.ItemData.Base][frmtDate(os.date("!*t", item.ReleaseDate))] = localName;		-- assign releasedate
				end;
			end;
			return queue;
		end;
		
		local HttpService   = game:GetService("HttpService");
		local Encode,Decode = HttpService.JSONEncode,HttpService.JSONDecode;
		local fileName      = "SwordSimData/AutoFuseData/AutoSave_"..localUserId..".json";					-- save data file directory
		
		SAVE_DATA = newcclosure(function()
			writefile(fileName, Encode(HttpService, SaveData));												-- update autosave data
		end);
		
		saveQueue = newcclosure(function()
			local queue = getQueue(Decode(HttpService, readfile(queueFile)));								-- get formatted data
			writefile(queueFile,   Encode(HttpService, queue));												-- write json
			writefile(legibleFile, t2s(queue, nil, true));													-- write "legible" format
		end);
	end;

	do	-- newQueueItem	
		local rel_fmt = "&gt;   <u>%s</u>:   %s";									-- release date format
		local order = {Pets = 1,Weapons = 3};																-- item type LayoutOrder constants 
		local tbl = {RichText=true,BackgroundColor3=COLORS[1],BorderSizePixel=0,Size=UDIM2[12],Font=FONTS[2],TextColor3=COLORS[2],TextSize=14,TextXAlignment=LEFT}
		newQueueItem = newcclosure(function(cast, uid, name, releaseDate)
			if(Main[7][12])then saveQueue()end;
			
			-- create a textlabel to represent an item in the antimatter queue
			setVals("TextLabel", fmtTable(tbl, {Name = uid, LayoutOrder = order[cast], Text = rel_fmt:format(name, frmtDate(os.date("*t", releaseDate)))}), Instances.QueueScroller);
			Instances[cast.."Header"].Text = hdr_fmt:format(Main[11][cast], craftingSlots, cast);		-- update the header based on the quantity of items in the respective queue
		end);
	end;
end;

task.defer(function()
	if(plrData.Gamepasses["1296775568"])then return end;										-- do nothing if user has max crafting slots
	local devProdIds = {1296775568, 1296775418, 1296775177, 1296774844, 1296774588};			-- DevProduct IDs for crafting slot tiers (in reverse-tier order)
	for idx = 5,1,-1 do																			-- Index in reverse for easy table.remove calls
		if(not plrData.Gamepasses[tostring(devProdIds[idx])])then break end;					-- If plr doesn't own one tier, the rest are not owned
		table.remove(devProdIds);
	end;
	
	local con = nil;
	con = Connect(game:GetService("MarketplaceService").PromptProductPurchaseFinished, function(userId, productId, isPurchased)
		if(userId==localUserId and productId==devProdIds[#devProdIds]and isPurchased)then								-- if local user purchased more crafting slots
			
			table.remove(devProdIds);																					-- remove productId from reference table for later disconnection
			craftingSlots += 2;																							-- increment local craftingSlots quantity
			if(Main[7][12])then saveQueue()end;																			-- save if toggled
				
			Instances.PetsHeader.Text    = hdr_fmt:format(Main[11].Pets,    craftingSlots, "Pets");						-- update Pets header
			Instances.WeaponsHeader.Text = hdr_fmt:format(Main[11].Weapons, craftingSlots, "Weapons");					-- update Weapons header
			
			if(#devProdIds == 0)then con = con:Disconnect()end;															-- disconnect if the last (purchaseable) crafting slot tier was purchased
		end;																											-- shame on the devs for making the price of the slots exponentially increase with each tier...
	end);																												-- the last tier costs 39999 robux -_-
	table.insert(Main[4], con);				--	for disconnection if the gui is destroyed mid-game		
end);

-- 
table.insert(Main[4], Connect(Instances.QueueScroller.ChildRemoved, function(child)
	if(child.LayoutOrder==1)then
		Instances.PetsHeader.Text    = hdr_fmt:format(Main[11].Pets,    craftingSlots, "Pets");
	else
		Instances.WeaponsHeader.Text = hdr_fmt:format(Main[11].Weapons, craftingSlots, "Weapons");
	end;
end));

-- initialize antimatter queue frame (use same thread)
for cast,data in next,plrData.QueuedItems do
	for uid,item in next,data do
		Main[11][cast] += 1																	-- increment queue quantity
		newQueueItem(cast, uid, item.ItemData.Base, item.ReleaseDate);						-- create a new queue frame
	end;
end;

-- scans for a new queued item
local function getNewQueueItem(cast)
	while wait()do
		for uid,item in next,plrData.QueuedItems[cast]do
			if(not Instances.QueueScroller:FindFirstChild(uid))then									-- if item doesn't have a corresponding queue frame
				return uid, item.ItemData.Base, item.ReleaseDate;									-- return data to create a new queue frame
			end;
		end;
	end;
end;

-- Fuse Items
local function fuseItems(list,item,cast,change)
	if(item.Level~=3)then 																	-- Antimatter crafting has different logic
		InvokeServer(Main[5][1], cast, list[3]); 											-- Fuse non-antimatter items
		if(Main[7][7])then print(3, item.Base, "fused to", Main[2][item.Level])end;		
		return false;																		-- indicate there is potential for further fusing
	elseif(Main[11][cast] < craftingSlots)then												-- if there is an open queue slot for antimatter fusing
		InvokeServer(Main[5][2], cast, list[3]);											-- Antimatter Conversion Remote
		Main[11][cast] += 1;																-- increment respective queue quantity
		if(Main[7][7])then print(list[2], item.Base, "fused to Antimatter")end;
		newQueueItem(cast, getNewQueueItem(cast));
	end;
	return change;
end;

-- Check Ignore Toggles
local function checkIgnoreToggles(tag, cast)
	-- check if IgnoreEquipped is enabled and if the item is equipped
	if(Main[7][9]and((cast=="Weapons"and plrData.EquippedItems.Weapons[tag]~=nil)or table.find(plrData.EquippedItems.Pets, tag)~=nil))then
		return true;
	end;
	-- check if IgnoreElemented is enabled and if the item has an aura
	if(Main[7][11]and SaveData.Elements[plrData[cast][tag].Element])then
		return true;
	end;
	-- check if IgnoreEnchanted is enabled and if the item has an enchantment
	return(Main[7][10]and next(plrData[cast][tag].Enchants or{})~=nil);
end;

local function runEnhanceCheck(items,cast,change,list)
	for tag,item in next,plrData[cast]do
		if(not Main[1][item.Level]or not items[item.Base]or checkIgnoreToggles(tag, cast))then		-- Item Validation, lack of "not"-distrubution is required
			continue; 
		end;
		
		list = items[item.Base][item.Level]; 														-- ease-of-access		
		if(not list[1])then continue end; 															-- validate enabled
		
		list[2] += 1;																				-- increment tag quantity in reference table
		list[3][list[2]] = tag; 																	-- set tag
		if(#list[3] <= list[2])then																	-- if ready to be fused
			change = fuseItems(list, item, cast, change);											-- Fuse Items
			list[2] = 0;																			-- reset tag quantity
		end;
	end;
	
	for _,list in next,items do
		list[1][2],list[2][2],list[3][2] = 0,0,0;													-- reset table tag quantities
	end;
	
	if(cast == "Pets")then																			-- indicate which signal is active
		Main[7][1] = change;
	else
		Main[7][2] = change;
	end;
end;

local temptEnhanceCast = nil;
do	-- Check Toggles from Gem Signal
	local function checkToggles(idx)
		for _,list in next,Main[3][idx]do
			if(list[1][1]or list[1][2]or list[1][3])then return(true)end;						-- check if any toggles are active
		end;
		return false;
	end;

	-- Calls enhance function if Gem Toggle and any Fuse Toggle is enabled
	temptEnhanceCast = function(idx)
		if(nil ~= table.find(Main[1], true)and checkToggles(idx))then
			Main[7][idx] = false;																-- indicate fusing is active
			repeat runEnhanceCheck(Main[3][idx], Main[8][idx], true)until Main[7][idx];			-- Enhance Items function
		end;
	end;
end;


do	-- Item Fuse Frame Connections
	local function toggleFrameBtn(fuseBtn, list, idx, itm_idx)
		local val = nil;																		-- temp upvalue
		return function()
			val = not list[1];
			
			SaveData["Items"][lower(fuseBtn.Parent.Name)][1][itm_idx] = val; 					-- Update AutoSave Data
			list[1],fuseBtn.BackgroundColor3 = val,Main[10][val]; 								-- Update respective Item List and Button Color
			if(Main[7][4])then SAVE_DATA()end;						 							-- Update Save File
			
			if(not val)then return end;
			if(not Main[7][idx])then															-- if fusing is already active
				if(Main[9][idx])then return end;												-- return if a signal is already in queue
				Main[9][idx] = true;															-- indicate signal is in queue
				while(not Main[7][idx])do wait()end; 											-- wait the active signal is finished
			end;
			
			Main[7][idx] = false; 																-- set inactive to false
			Main[9][idx] = false; 																-- indicate no signal is in queue
			repeat runEnhanceCheck(Main[3][idx], Main[8][idx], true)until Main[7][idx];			-- calling enhance items function
		end;
	end;

	local function updateFuseQnty(bulkBtn, anti, list)
		local data,bulk = nil,nil;										-- temp upvalues
		return function()
			-- assign respective upvalues
			data = SaveData.Items[lower(anti.Parent.Name)];			-- reference data
			bulk = (#list[3] - 1);										-- new item quantity
			
			if(bulk==0)then 											-- if lower yield is reached
				bulk = 8;												-- set to valid max
				for idx = 1,8 do			
					list[3][idx] = '';									-- update tags
				end;
			else
				list[3][bulk + 1] = nil;								-- remove last tag
			end;
			
			list[1],data[1][3] = false,false;							-- disable fusing to avoid unintenional fusing
			anti.BackgroundColor3 = COLORS[3]; 							-- set button color to red to indicate disabled fusing
				
			bulkBtn.Text,data[2] = bulk,bulk;							-- update tag quantity, antimatter fuse quantity
			if(Main[7][4])then SAVE_DATA()end;
		end;
	end;


	local function deallocateFrame(signals, itemBtn)
		for _,con in ipairs(signals)do con:Disconnect()end;				-- disconnect button connections
		SaveData.Items[lower(itemBtn.Text)] = nil; 					-- remove item from SaveData
		itemBtn.Value.Value = true;										-- itemBtn will now be visible in the search frame
		
		-- update quantity of items in the fuse frame
		if(Main[9][3] == 1)then											-- if only 1 item existed in the frame...
			Main[9][3] = 0;
			Instances.FuseFrame.Visible = false;						-- set FuseFrame visibility to false
		else
			Main[9][3] -= 1;											-- decrement quantity
		end
		
		if(Main[7][4])then SAVE_DATA()end;
	end;

	local match = string.match;
	local function searchConnection(itemBtn)
		return Connect(TextBox:GetPropertyChangedSignal("Text"),function()
			
			if(TextBox.Text=="Search" or TextBox.Text=="")then							-- if search content is not sufficed
				itemBtn.Visible = itemBtn.Value.Value;									-- itembtn visibility reflects fuse state
				return;
			end;

			-- if the text input matches somewhere in the name of ItemButton, then the Button will remain visible
			itemBtn.Visible = (itemBtn.Value.Value and match(itemBtn.Name,lower(TextBox.Text))~=nil);
		end);
	end;
	
	local function floormatTable(class, parent, ref, tbl);
		for idx,val in next,tbl do
			ref[idx] = val;
		end;
		return setVals(class, parent, ref);
	end;
	
	local tbls = {
		{BackgroundTransparency=1,BackgroundColor3=COLORS[1],Size=UDIM2[2]};
		{Name="Item",BorderSizePixel=0,Position=UDIM2[3],Size=UDIM2[4],ZIndex=2,Font=FONTS[1],TextColor3=COLORS[1],TextSize=13,TextWrapped=true};
		{BackgroundColor3=COLORS[3],BorderSizePixel=0,ZIndex=2,Font=FONTS[1],TextColor3=COLORS[1],TextSize=13,TextWrapped=true};
		{Name="FuseQuantity",BackgroundColor3=COLORS[1],BorderSizePixel=0,Position=UDIM2[9],Size=UDIM2[10],ZIndex=2,Font=FONTS[1],Text="8",TextColor3=COLORS[2],TextScaled=true,TextSize=13,TextWrapped=true};
		{"Item","Evolve","Omega","Antimatter","FuseQuantity"};
		{BackgroundColor3=COLORS[7],BorderSizePixel=0,Size=UDIM2[4],AutomaticSize='X',ZIndex=2,Font=FONTS[1],TextColor3=COLORS[1],TextSize=13,TextWrapped=true}
	}

	local funcs = {
		function(ItemFrame) ItemFrame:Destroy() end;
		function(ref, Signals, itemBtn) ref[itemBtn.Text] = deallocateFrame(Signals, itemBtn) end;
		function(itemBtn) itemBtn.Visible = itemBtn.Value.Value end;
		function(bindEvent) Fire(bindEvent, 8, false, false, false) end)
	};

	local function connectMakeFuseFrame(itemBtn,idx,item)
		Main[9][3] += 1;
		local FRAME = {};	-- create a frame for an item being monitered for fusing
		FRAME.ItemFrame    = floormatTable("Frame", Instances.FuseScroller, tbls[1], {Name = itemBtn.Name});
		FRAME.Item         = floormatTable("TextButton", FRAME.ItemFrame, tbls[2], {BackgroundColor3 = COLOR_PICKS[math.random(153)], Text = itemBtn.Text});
		FRAME.Evolve       = floormatTable("TextButton", FRAME.ItemFrame, tbls[3], {Name = "Evolve",     Position = UDIM2[5], Text = "Evolved", Size = UDIM2[1]});
		FRAME.Omega        = floormatTable("TextButton", FRAME.ItemFrame, tbls[3], {Name = "Omega",      Position = UDIM2[6], Text = "Omega"});
		FRAME.Antimatter   = floormatTable("TextButton", FRAME.ItemFrame, tbls[3], {Name = "Antimatter", Position = UDIM2[7], Text = "Antimatter", Size = UDIM2[8]}));
		FRAME.FuseQuantity = setVals("TextButton", FRAME.ItemFrame, tbls[4]);
		createCornerBtns(FRAME, tbls[5]);

		local Signals = {
			[1] = Connect(FRAME.Evolve.MouseButton1Click,		toggleFrameBtn(FRAME.Evolve, 	 item[1], idx, 1));							-- "toggle normal fusing" signal
			[2] = Connect(FRAME.Omega.MouseButton1Click,		toggleFrameBtn(FRAME.Omega, 	 item[2], idx, 2));							-- "toggle omega fusing" signal
			[3] = Connect(FRAME.Antimatter.MouseButton1Click,	toggleFrameBtn(FRAME.Antimatter, item[3], idx, 3));							-- "toggle antimatter fusing" signal
			[4] = Connect(FRAME.FuseQuantity.MouseButton1Click,	updateFuseQnty(FRAME.FuseQuantity, FRAME.Antimatter, item[3]));				-- "update fuse quantity" signal
			[5] = FRAME.Item.MouseButton1Click:Once(funcs[1](FRAME.ItemFrame));																-- "destroy the frame" signal
		};
		FRAME.ItemFrame.Destroying:Once(funcs[2](Main[3][idx], Signals, itemBtn));															-- deallocates the item savedata and frame signals
	end
	
	local function makeClickedSignal(itemBtn,idx)
		local ref = {{nil, 0, {'','',''}}, {nil, 0, {'','',''}}, {nil, 0}};
		return function(BULK, TOG1, TOG2, TOG3)
			itemBtn.Value.Value = false;							-- itembtn will be invisible in the search frame
			Instances.FuseFrame.Visible = true;						-- the fuse frame will be visible
			
			local item = table.clone(ref);
			item[1][1] = TOG1;									-- normal fusing
			item[2][1] = TOG2;									-- evolved fusing
			item[3][1] = TOG3;									-- omega fusing
			item[3][3] = table.create(BULK, '');
			
			Main[3][idx][itemBtn.Text] = item; 						-- add item to main data
			connectMakeFuseFrame(itemBtn, idx, item); 				-- create frame in FuseFrame
			SaveData.Items[itemBtn.Name] = { 						-- add item to SaveData
				[1] = {TOG1, TOG2, TOG3};
				[2] = BULK;											-- antimatter fuse quantity
			};
			if(Main[7][4])then SAVE_DATA()end; 						-- Save if enabled
		end;
	end;

	local function makeButton(name,idx)
		local itemBtn = floormatTable("TextButton", Instances.ItemScroller, tbls[6], {Name = lower(name), Text = name});
		Instance.new("UICorner",itemBtn); 
		table.insert(Main[4], searchConnection(itemBtn));																																		-- search connection
		table.insert(Main[4], Connect(setVals("BoolValue",itemBtn,{Name="Value",Value=true}):GetPropertyChangedSignal("Value"),funcs[3](itemBtn));			-- toggle visible connection
		
		local bindEvent = Instance.new("BindableEvent");
		table.insert(Main[4], Connect(bindEvent.Event,makeClickedSignal(itemBtn,idx)));												-- add item to fuse frame
		table.insert(Main[4], Connect(itemBtn.MouseButton1Click,funcs[4](bindEvent));					-- update SaveData with item content
		BindableEvents[itemBtn.Name] = bindEvent;																					-- store event in global reference
	end;

	for _,pet in ipairs(game:GetService("ReplicatedStorage").Storage.Pets:GetChildren())    do makeButton(pet.Name, 1)end;			-- make Pet item buttons
	for _,wpn in ipairs(game:GetService("ReplicatedStorage").Storage.Weapons:GetChildren()) do makeButton(wpn.Name, 2)end;			-- make Weapon item buttons
end;

-- FocusLost function
table.insert(Main[4], Connect(TextBox.FocusLost,function()
	wait(3);																	-- give the user time to react
	
	-- a signal could be active after destroying the gui because of wait, so Instances~=nil must be checked to avoid an error
	if(Instances~=nil and not TextBox:IsFocused()and Main[7][5])then			-- if the search box is not being used and ResetText is enabled
		TextBox.Text = "Search";
	end;
end));

do	-- Toggle ScreenUI(s) visibility
	local UserInputService = game:GetService("UserInputService");
	table.insert(Main[4], Connect(UserInputService.InputBegan,function(key,isProc)
		if(isProc or key.UserInputType.Value~=8 or not(UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)))then 
			return;
		elseif(key.KeyCode.Value==109)then											-- if M-key is pressed
			Instances.FuseFrame.Visible = not Instances.FuseFrame.Visible;
		elseif(key.KeyCode.Value==103)then											-- if G-key is pressed
			Instances.ItemFrame.Visible = not Instances.ItemFrame.Visible;
			Instances.SettingsMain.Visible = false;
		end;
	end));
end;

-- Toggle QueueFrame<->FuseFrame visibility
table.insert(Main[4], Connect(Instances.ToggleFrame.MouseButton1Click, function()
	if(Instances.QueueScroller.Visible)then
		Instances.ToggleFrame.Text = "Queue";
		Instances.QueueScroller.Visible = false;
		Instances.FuseScroller.Visible = true;
	else
		Instances.ToggleFrame.Text = "Fuse";
		Instances.QueueScroller.Visible = true;
		Instances.FuseScroller.Visible = false;
	end;
end));

do	-- General Remove Pets/Weapons function
	local function delCastItems(tbl)
		return function()
			for Item in next,tbl do
				Instances.FuseScroller[lower(Item)]:Destroy();
			end;
		end;
	end;
	
	table.insert(Main[4], Connect(Instances.Pets.MouseButton1Click,	   delCastItems(Main[3][1]))); 				-- Called when Pets button is pressed
	table.insert(Main[4], Connect(Instances.Weapons.MouseButton1Click, delCastItems(Main[3][2])));				-- Called when Weapons button is pressed
end;

-- RemoveAll function, called when Instances.All is pressed
table.insert(Main[4], Connect(Instances.All.MouseButton1Click,function()
	for _,Frame in ipairs(Instances.FuseScroller:GetChildren())do
		Frame:Destroy();
	end;
end));

-- Called when Info button is pressed
table.insert(Main[4], Connect(Instances.Info.MouseButton1Click,function()Instances.SettingsMain.Visible = not Instances.SettingsMain.Visible end));

-- updates gem toggles and calls pets/weapon checks if either are inactive when gems are obtained
-- the significance of this function is to call the enhance item function if enough gems have been obtained 
table.insert(Main[4], Connect(game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.GemsBar.GemsBar.Amount:GetPropertyChangedSignal("Text"),function()
	Main[1][1] = (plrData.Gems >= 10000);									-- toggle for normal fusing
	Main[1][2] = (plrData.Gems >= 200000);								 	-- toggle for enhance fusing

	if(Main[7][6])then 													-- checks Gems Toggle
		if(Main[7][1])then temptEnhanceCast(1)end;						-- if Pets toggle is inactive, check Pets
		if(Main[7][2])then temptEnhanceCast(2)end;						-- if Weapons toggle is inactive, check Weapons
	end;
end));

do
	-- General Settings/Information Frame Toggle
	local function setVisToggles(FRAME1, FRAME2, BTN1, BTN2)
		return function()
			if(not FRAME1.Visible)then 
			
				BTN1.BackgroundColor3 = COLORS[5];		-- opaque
				BTN2.BackgroundColor3 = COLORS[6];		-- translucent
				
				FRAME1.Visible = true;
				FRAME2.Visible = false;
			end;
		end;
	end;
	
	-- InformationFrame and SettingsFrame toggles
	table.insert(Main[4], Connect(Instances.Settings.MouseButton1Click,		setVisToggles(Instances.SettingsFrame, 	  Instances.InformationFrame, Instances.Settings,    Instances.Information)));
	table.insert(Main[4], Connect(Instances.Information.MouseButton1Click,	setVisToggles(Instances.InformationFrame, Instances.SettingsFrame,    Instances.Information, Instances.Settings)));
end;

do	-- General Check Pets/Weapons function for Fusing
	-- a valid egg hatch will return data from the remote call, so pet fusing could be linked there (but eh, this works fine)
	local function checkCastFuse(idx)
		return function()
			if(not(Main[6][idx].Visible and Main[7][idx]))then return end;						-- if Notification was cleared or Enhancement is active
			
			local Amount = Main[6][idx].Amount.Text;											-- reference
			wait(); 																			-- allow time for text to POTENTIALLY change
			
			if(Main[6][idx].Amount.Text~=Amount)then return end;								-- if enhancing is inactive and text is unchanged			
			
			Main[7][idx] = false; 																-- indicate fusing is active (inactive = false)
			repeat runEnhanceCheck(Main[3][idx],Main[8][idx],true)until Main[7][idx]; 			-- repeat until inactive = true
		end;
	end;

	table.insert(Main[4], Connect(Main[6][1].Amount:GetPropertyChangedSignal("Text"),checkCastFuse(1)));		-- Called when a new pet has been obtained
	table.insert(Main[4], Connect(Main[6][2].Amount:GetPropertyChangedSignal("Text"),checkCastFuse(2)));		-- Called when a new weapon has been obtained
end;

do	-- General ItemFrame/FuseFrame Visible Changed Function for AutoSave
	local function frameVisChanged(idx, Frame)
		return function()
			SaveData.Visible[idx] = Frame.Visible;
			if(Main[7][4])then SAVE_DATA()end;
		end;
	end;
	
	table.insert(Main[4], Connect(Instances.ItemFrame:GetPropertyChangedSignal("Visible"),frameVisChanged(1, Instances.ItemFrame)));		-- Called when ItemFrame visibility has changed
	table.insert(Main[4], Connect(Instances.FuseFrame:GetPropertyChangedSignal("Visible"),frameVisChanged(2, Instances.FuseFrame)));		-- Called when FuseFrame visibility has changed
end;

do	-- General Logic Button Toggle
	local function toggleChanged(idx, name)
		return function()
			local val = not Main[7][idx];										-- reference bool
			Main[7][idx],SaveData.Toggles[name] = val,val;						-- assign data toggle values
			Instances[name.."Button"].BackgroundColor3 = Main[10][val];			-- update relevant button color
			
			if(idx==4)then return(SAVE_DATA())end; 							-- save regardless if toggling AutoSave
			if(Main[7][4])then SAVE_DATA()end; 								-- if AutoSave is enabled
			if(val)then
				if(idx==5)then TextBox.Text = "Search"; 						-- if ResetText is enabled
				elseif(idx==12)then saveQueue()end; 							-- if SaveQueue is enabled
			end;
		end;
	end;
		
	table.insert(Main[4], Connect(Instances.AutoLoadButton.MouseButton1Click,			toggleChanged(3, 	"AutoLoad"))); 					-- Called when AutoLoad button is clicked
	table.insert(Main[4], Connect(Instances.AutoSaveButton.MouseButton1Click,			toggleChanged(4, 	"AutoSave"))); 					-- Called when AutoSave button is clicked
	table.insert(Main[4], Connect(Instances.LoadFuseButton.MouseButton1Click,			toggleChanged(8, 	"LoadFuse"))); 					-- Called when LoadFuse button is clicked
	table.insert(Main[4], Connect(Instances.ResetTextButton.MouseButton1Click,			toggleChanged(5,	"ResetText"))); 				-- Called when ResetText button is clicked
	table.insert(Main[4], Connect(Instances.SaveQueueButton.MouseButton1Click,			toggleChanged(12, 	"SaveQueue"))); 				-- Called when SaveQueue button is clicked
	table.insert(Main[4], Connect(Instances.GemsToggleButton.MouseButton1Click,			toggleChanged(6,	"GemsToggle"))); 				-- Called when Gems button is clicked
	table.insert(Main[4], Connect(Instances.PrintToggleButton.MouseButton1Click,		toggleChanged(7, 	"PrintToggle"))); 				-- Called when Print button is clicked
	table.insert(Main[4], Connect(Instances.IgnoreEquippedButton.MouseButton1Click,		toggleChanged(9, 	"IgnoreEquipped")));			-- Called when IgnoreEquipped button is clicked
	table.insert(Main[4], Connect(Instances.IgnoreEnchantedButton.MouseButton1Click,	toggleChanged(10, 	"IgnoreEnchanted"))); 			-- Called when IgnoreEnchanted button is clicked
end;

-- Toggle IgnoreElemented Button
table.insert(Main[4], Connect(Instances.IgnoreElementedButton.MouseButton1Click,function()
	if(Main[9][4]==0)then return end;											-- do nothing if zero elements are being ignored, 	
	local val = not Main[7][11];												-- reference toggle value
	SaveData.Toggles.IgnoreElemented = val;										-- assign savedata
	Instances.IgnoreElementedButton.BackgroundColor3 = Main[10][val];			-- update toggle button color
	Main[7][11] = val;															-- update main data toggle value
	
	if(Main[7][4])then SAVE_DATA()end;											-- save, if enabled
end));

do 	-- Connections for Ignore-Element-Toggles
	local function toggleAuraBtn(AURA, BTN)
		return function()
			if(BTN.ImageTransparency==0.5)then									-- if toggle is disabled
				SaveData.Elements[AURA] = true									-- enable toggle data value
				BTN.ImageTransparency = 0;										-- indicate toggle is enabled
				Main[9][4] += 1;												-- increment ignored elements count
			else
				SaveData.Elements[AURA] = false
				BTN.ImageTransparency = 0.5;
				Main[9][4] -= 1;
			end;
			
			-- Disable stuff if zero Elements are being ignored
			if(0==Main[9][4]and Main[7][11])then 
				Instances.IgnoreElementedButton.BackgroundColor3 = COLORS[3];
				SaveData.Toggles.IgnoreElemented = false;
				Main[7][11] = false;
			end;
			
			if(Main[7][4])then SAVE_DATA()end;
		end;
	end;
	
	-- assigns the images to element toggle buttons
	local template = "rbxthumb://type=Asset&id=%i&w=150&h=150";
	for Aura,Data in next,require(game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.Elements)do
		local auraBtn = setVals("ImageButton", Instances.Elements, {Name=Aura.."ToggleButton",BackgroundColor3=COLORS[1],BackgroundTransparency=0,BorderSizePixel=0,Size=UDIM2[11],Image=template:format(Data.Image)});
		table.insert(Main[4], Connect(auraBtn.MouseButton1Click,toggleAuraBtn(Aura, auraBtn)));		-- clicked connection
	end;
end;

Instances.Close.MouseButton1Click:Once(function()Instances.MainGui:Destroy()end); 					-- Called when Close button is pressed

-- Loop for checking if items are finished upgrading to Antimatter
do
	-- Retrieve Queue: returns the Quantity of taken slots in the antimatter gui category 
	local function checkAntimatterQueue(cast)
		for uid,item in next,plrData.QueuedItems[cast]do
			if(item.ReleaseDate<=os.time())then
				InvokeServer(Main[5][3],cast,uid);													-- Collect antimatter item
				Main[11][cast] -= 1; 																-- Update respective queue quantity
				Instances.QueueScroller[uid]:Destroy();												-- Destroy the frame representing the collected item
				if(Main[7][12])then saveQueue()end;
				if(Main[7][7])then print("Antimatter",item.ItemData.Base,"retrieved.")end;
			end
		end;
	end;
	
	table.insert(Main[4],Connect(BindableEvents.Second.Event,function()
		if(Main[7][1])then checkAntimatterQueue("Pets")end; 										-- check antimatter pet queue
		if(Main[7][2])then checkAntimatterQueue("Weapons")end; 										-- check antimatter weapon queue
	end));
end;

do	-- hooks
	local DungeonHandler,time = game:GetService("Players").LocalPlayer.PlayerScripts.PlayerHandler.Miscallenious.DungeonHandler,nil;
	time = hookfunction(os.time, newcclosure(function()
		if(getcallingscript()==DungeonHandler)then 
			Fire(BindableEvents.Second);														-- Called once every second
		end;
		return time();
	end));
	
	-- scans for a new queue item
	BindableEvents.QueueHook = Instance.new("BindableEvent");
	table.insert(Main[4], Connect(BindableEvents.QueueHook.Event, function(cast)
		Main[11][cast] += 1;
		newQueueItem(cast, getNewQueueItem(cast));
	end));
	
	BindableEvents.ClaimHook = Instance.new("BindableEvent");
	table.insert(Main[4], Connect(BindableEvents.ClaimHook.Event, function(cast, uid)
		Main[11][cast] -= 1; 																							-- Update respective queue quantity
		Instances.QueueScroller[uid]:Destroy();																			-- Destroy the frame representing the collected item
	end));
	
	local namecall = nil;
	namecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
		if(getnamecallmethod()=="InvokeServer")then
			if(self==Main[5][2])then															-- if user manually fuses an omega-tier item
				Fire(BindableEvents.QueueHook, ...);											-- Scans for the new queue item
			elseif(self==Main[5][3])then														-- (failsafe) if user manually collects an antimatter (will only occur if an error is present)
				Fire(BindableEvents.ClaimHook, ...);
			end;
		end;
		return namecall(self, ...);																-- Module script expects a response
	end));
	
	-- Deallocate Memory
	Instances.MainGui.Destroying:Once(function()
		hookmetamethod(game, "__namecall", namecall);											-- reset game.__namecall
		hookfunction(os.time, time);															-- reset os.time

		if(Main[7][4])then 
			SAVE_DATA();																		-- save on close
			Main[7][4] = false; 																-- disable any future save attempts
		end;
		
		for _,con in ipairs(Main[4])do con:Disconnect()end;										-- disconnect ALL (<- imagine underlined and bold) FuseGui Connections
		
		Instances.FuseGui:Destroy();
		Instances.SettingsGui:Destroy();
		
		Main,Instances,BindableEvents,getgenv()["@Esz#O8k(9]1HBol~S8C"] = nil,nil,nil,nil;
	end);
end;

do	-- Load Saved Data
	local fileName = "SwordSimData/AutoFuseData/AutoSave_"..localUserId..".json";
	if(not isfile(fileName))then																						-- if there is no savedata
		if(not isfolder("SwordSimData/AutoFuseData"))then makefolder("SwordSimData/AutoFuseData")end;					-- make folder :)
		Instances.ItemFrame.Visible    = true;
		Instances.FuseFrame.Visible    = true;
		Instances.SettingsMain.Visible = true;
		return SAVE_DATA();																								-- initial save
	end;
	
	-- assert data format
	local data = assert(game:GetService("HttpService"):JSONDecode(readfile(fileName)),"table expected from data fetch: workspace/"..fileName);
	if(not(data.Toggles and data.Toggles.AutoLoad))then return end;		-- return if AutoLoad is nil or disabled
	
	local ref,trns,val = {
		-- SaveData constants
		AutoLoad        = 3;
		AutoSave        = 4;
		ResetText       = 5;
		GemsToggle      = 6;
		PrintToggle     = 7;
		LoadFuse        = 8;
		IgnoreEquipped  = 9;
		IgnoreEnchanted = 10;
		IgnoreElemented = 11;
		SaveQueue       = 12;
	},{ 
		-- Transparency constants
		[true]  = 0;
		[false] = 0.5;
	},nil;
	
	-- Validate and Load Toggle Data
	Main[9][4] = 0;
	for name,list in next,SaveData do
		if(not data[name]or name=="Items")then continue end;												-- validate and extradite
		assert(type(data[name])=="table", "table expected when reading \""..name);							-- assert format
		for idx in next,list do
			val = (type(data[name][idx])=="boolean"and data[name][idx]);									-- obtain toggle state
			list[idx] = val;																				-- assign toggle state
			if(name=="Elements")then															
				Instances.Elements[idx.."ToggleButton"].BackgroundTransparency = trns[val];					-- assign transparency state
				if(val)then Main[9][4] += 1 end; 															-- Count enabled, ignored elements
			elseif(name~="Visible")then
				Main[7][ref[idx]] = val;																	-- assign toggle visibility
				Instances[idx.."Button"].BackgroundColor3 = Main[10][val];									-- assign toggle background color
			end;
		end;
	end;
	
	-- assign fram visibility
	Instances.ItemFrame.Visible = SaveData.Visible[1];
	Instances.FuseFrame.Visible = SaveData.Visible[2];
	if(Main[7][12])then saveQueue()end; 																	-- saveQueue if enabled
	val = SaveData.Visible[2];																				-- SaveData is smaller than Instances
	
	-- Disable ignoring elements if zero elements are being ignored
	if(0==Main[9][4]and Main[7][11])then
		Instances.IgnoreElementedButton.BackgroundColor3 = COLORS[3];										-- red = disabled
		Main[7][11] = false;																				-- disable :( ?
	end;
	
	if(type(data.Items)~="table")then return end;															-- validate item data format
	local dataFrame,toggles = nil,nil;																		-- temp values
	for name,item in next,data["Items"]do					
	
		assert(Instances.ItemScroller[lower(name)]~=nil, "invalid item in \"Items\": "..name); 									-- Validate item name
		assert(type(item)=="table"and type(item[1])=="table", "table expected in \"Items\" when referencing: "..name);			-- Validate referenced data is a table of size 2
		if(type(item[2])~="number"or item[2]<=0 or item[2]>=9)then 																-- Validate Antimatter Fuse Quantity and Data Type
			-- normal values
			item[2] = 8;
			item[1][3] = false;
		end;
		
		toggles = {
			[1] = (type(item[1][1])=="boolean"and item[1][1]); 												-- normal fusing toggle
			[2] = (type(item[1][2])=="boolean"and item[1][2]); 												-- evolved fusing toggle
			[3] = (type(item[1][3])=="boolean"and item[1][3]);												-- omega fusing toggle
		};
		
		Fire(BindableEvents[lower(name)],item[2],unpack(toggles)); 											-- Make Button in Fuse Frame (will save if enabled)
			
		dataFrame = Instances.FuseScroller[lower(name)];													-- get reference button
		dataFrame.FuseQuantity.Text = item[2];																-- update fuse text
		dataFrame.Evolve.BackgroundColor3 = Main[10][toggles[1]];											-- update normal fuse toggle button color
		dataFrame.Omega.BackgroundColor3 = Main[10][toggles[2]];											-- update evolve fuse toggle button color
		dataFrame.Antimatter.BackgroundColor3 = Main[10][toggles[3]];										-- update omega fuse toggle button color
	end;
	
	Instances.FuseFrame.Visible = val; 																		-- calling the bindable event will open the fuseframe, so re-set the value
	if(dataFrame~=nil and SaveData.Toggles.LoadFuse)then 
		temptEnhanceCast(1); 																				-- calling pet enhancement function
		temptEnhanceCast(2); 																				-- calling weapon enhancement function
	end;
end;

-- Deallocate table variables that will not be used in the script from this moment forward
for idx = 13,23 do UDIM2[idx] = nil end;
COLORS[7] = nil;
