if(game.PlaceId~=2512643572 or getgenv()["[aE2%FlIp50`%hmMw(Rp"]~=nil)then return end;
getgenv()["[aE2%FlIp50`%hmMw(Rp"]=true;
if(not game:IsLoaded())then game.Loaded:Wait()end;

local fN,name = {},{};
do
	local chars = ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"):split('');
	local sz = #chars;
	for i = 1,math.random(5,16)do 
		name[i],fN[i] = chars[math.random(sz)],chars[math.random(sz)];
	end;
	name,fN = table.concat(name),table.concat(fN);
end;

local wait = task.wait;
local function createInstance(class,props)
	local inst = Instance.new(class);
	for prop,val in pairs(props) do
		inst[prop] = val;
	end;
	return inst;
end;

local MainUi_3 = createInstance("ScreenGui",{Name=name,Parent=game:GetService("CoreGui"),ZIndexBehavior=Enum.ZIndexBehavior.Global})
local MainFrame = createInstance("Frame",{Name="MainFrame",Parent=MainUi_3,Active=true,Draggable=true,BackgroundColor3=Color3.fromRGB(255,255,255),BorderColor3=Color3.fromRGB(27,42,53),BorderSizePixel=0,Position=UDim2.new(),Selectable=true,Size=UDim2.new(0,263,0,24),Visible=false})
createInstance("UIGradient",{Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(172,32,182)),ColorSequenceKeypoint.new(0.42,Color3.fromRGB(211,124,127)),ColorSequenceKeypoint.new(1.00,Color3.fromRGB(211,225,7))},Parent=MainFrame})
createInstance("UICorner", {CornerRadius = UDim.new(0, 5), Parent = MainFrame})
local Body = createInstance("Frame", {Name = "Body", Parent = MainFrame, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.9, 0), Size = UDim2.new(0, 263, 0, 189)})
createInstance("UICorner", {CornerRadius = UDim.new(0, 2), Parent = Body})
createInstance("UIGradient", {Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(56, 56, 56)), ColorSequenceKeypoint.new(0.62, Color3.fromRGB(107, 107, 107)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 134))}, Parent = Body})
local Title = createInstance("TextLabel", {Name = "Title", Parent = MainFrame, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, Position = UDim2.new(0.1, 0, 0.1, 0), Size = UDim2.new(0, 107, 0, 18), Font = Enum.Font.SourceSans, Text = "AutoBrew", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0.750, TextXAlignment = Enum.TextXAlignment.Left})
local Potions_B = createInstance("Frame", {Name = "Potions_B", Parent = Body, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.500, BorderSizePixel = 0, Position = UDim2.new(0.037, 0, 0.162, 0), Size = UDim2.new(0, 188, 0, 126)})
local P_Image1 = createInstance("ImageLabel", {Name = "P_Image1", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0.007, 0, 0.07, 0), Size = UDim2.new(0, 34, 0, 34), Image = "rbxasset://textures/ui/GuiImagePlaceholder.png", ImageTransparency = 1})
Instance.new("UICorner", Potions_B)
local P_Label1 = createInstance("TextLabel", {Name = "P_Label1", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(236, 87, 77), Position = UDim2.new(0.2, 0, 0.09, 0), Size = UDim2.new(0, 123, 0, 29), Font = Enum.Font.SourceSans, Text = "Empty Potion Slot", TextColor3 = Color3.new(), TextSize = 14})
Instance.new("UICorner", P_Label1)
local P_Reset1 = createInstance("ImageButton", {Name = "P_Reset1", Parent = Potions_B, BackgroundTransparency = 1, Position = UDim2.new(0.86, 0, 0.1, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://6764432408", ImageTransparency = 0.5, ImageRectOffset = Vector2.new(200, 600), ImageRectSize = Vector2.new(50, 50)})
local P_Bool1 = createInstance("BoolValue", {Parent = Potions_B, Name = "P_Bool1", Value = false})
local P_Bool2 = createInstance("BoolValue", {Parent = Potions_B, Name = "P_Bool2", Value = false})
local P_Bool3 = createInstance("BoolValue", {Parent = Potions_B, Name = "P_Bool3", Value = false})
local P_Reset2 = createInstance("ImageButton", {Name = "P_Reset2", Parent = Potions_B, BackgroundTransparency = 1, Position = UDim2.new(0.86, 0, 0.39, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://6764432408", ImageTransparency = 0.5, ImageRectOffset = Vector2.new(200, 600), ImageRectSize = Vector2.new(50, 50)})
local P_Image2 = createInstance("ImageLabel", {Name = "P_Image2", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0.00681, 0, 0.365, 0), Size = UDim2.new(0, 34, 0, 34), Image = "rbxasset://textures/ui/GuiImagePlaceholder.png", ImageTransparency = 1})
local P_Label2 = createInstance("TextLabel", {Name = "P_Label2", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(236, 87, 77), Position = UDim2.new(0.2, 0, 0.384, 0), Size = UDim2.new(0, 123, 0, 29), Font = Enum.Font.SourceSans, Text = "Empty Potion Slot", TextColor3 = Color3.new(), TextSize = 14})
Instance.new("UICorner", P_Label2)
local P_Label3 = createInstance("TextLabel", {Name = "P_Label3", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(236, 87, 77), Position = UDim2.new(0.2, 0, 0.678, 0), Size = UDim2.new(0, 123, 0, 29), Font = Enum.Font.SourceSans, Text = "Empty Potion Slot", TextColor3 = Color3.new(), TextSize = 14})
Instance.new("UICorner", P_Label3)
local P_Image3 = createInstance("ImageLabel", {Name = "P_Image3", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0.007, 0, 0.66, 0), Size = UDim2.new(0, 34, 0, 34), Image = "rbxasset://textures/ui/GuiImagePlaceholder.png", ImageTransparency = 1})
local P_Reset3 = createInstance("ImageButton", {Name = "P_Reset3", Parent = Potions_B, BackgroundTransparency = 1, Position = UDim2.new(0.86, 0, 0.688, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://6764432408", ImageTransparency = 0.5, ImageRectOffset = Vector2.new(200, 600), ImageRectSize = Vector2.new(50, 50)})
local C_Label = createInstance("TextLabel", {Name = "C_Label", Parent = Body, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, Position = UDim2.new(0.15, 0, 0.0212, 0), Size = UDim2.new(0, 76, 0, 21), Font = Enum.Font.SourceSans, Text = "Currently:  Idle", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left})
local Potions_N = createInstance("Frame", {Name = "Potions_N", Parent = Body, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.6, Position = UDim2.new(0.0353, 0, 0.86, 0), Size = UDim2.new(0, 188, 0, 19)})
createInstance("UICorner", {CornerRadius = UDim.new(0, 3), Parent = Potions_N})
local Potions_C = createInstance("ImageButton", {Name = "Potions_C", Parent = Potions_N, BackgroundTransparency = 1, Position = UDim2.new(0.88, 0, -0.25, 0), Rotation = 900, Selectable = false, Size = UDim2.new(0, 25, 0, 28), ZIndex = 2, Image = "rbxassetid://3926305904", ImageRectOffset = Vector2.new(564, 284), ImageRectSize = Vector2.new(36, 36)})
local P_List = createInstance("Frame", {Name = "P_List", Parent = Potions_N, BackgroundColor3 = Color3.fromRGB(53, 53, 53), BackgroundTransparency = 0.020, BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.97, 0), Size = UDim2.new(0, 188, 0, 0), Visible = true, ClipsDescendants = true})
createInstance("UIGradient", {Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.83, Color3.new()), ColorSequenceKeypoint.new(1.00, Color3.new())}, Parent = Potions_N});
local P_Title = createInstance("TextLabel", {Name = "P_Title", Parent = Body, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, Position = UDim2.new(0.21, 0, 0.87, 0), Size = UDim2.new(0, 63, 0, 15), Font = Enum.Font.SourceSans, Text = "Choose Potion(s)", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0.750, TextXAlignment = Enum.TextXAlignment.Left})
local Buttons = createInstance("Frame", {Name = "Buttons", Parent = Body, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0.79, 0, 0.1, 0), Size = UDim2.new(0, 46, 0, 155)})
local Inv_GameUi = createInstance("TextButton", {Name = "Inv_GameUi", Parent = Buttons, BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.806, 0, 0.43, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Inv.", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14})
createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Inv_GameUi})
local Inv_Ui = createInstance("TextButton", {Name = "Inv_Ui", Parent = Buttons, BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.806, 0, 0.62, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "UI", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14})
createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Inv_Ui})
local Pot_Upd = createInstance("TextButton", {Name = "Pot_Upd", Parent = Buttons, BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.806, 0, 0.81, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Upd.", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14})
createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Pot_Upd})
local Teleports = createInstance("ScrollingFrame", {Name = "Teleports", Parent = Buttons, Active = true, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, Position = UDim2.new(-0.155, 0, 0.058, 0), Size = UDim2.new(0, 52, 0, 55), CanvasSize = UDim2.new(0, 0, 0.95, 0), ScrollBarThickness = 9})
local Event_TP = createInstance("TextButton", {Name = "Event_TP", Parent = Teleports, BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.806, 0, 0.036, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Event", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14})
createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Event_TP})
local Lab_TP = createInstance("TextButton", {Name = "Lab_TP", Parent = Teleports, BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.806, 0, 0.23, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Lab", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14})
createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Lab_TP})
createInstance("UIListLayout", {Parent = Teleports, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0.04, 0)})
local Shard_TP = createInstance("TextButton", {Name = "Shard_TP", Parent = Teleports, BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.806, 0, 0.036, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Games", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14})
createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Shard_TP})
local Void_TP = createInstance("TextButton", {Name = "Void_TP", Parent = Teleports, BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.806, 0, 0.036, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Void", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14})
createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Void_TP})
local Spawn_TP = createInstance("TextButton", {Name = "Spawn_TP", Parent = Teleports, BackgroundColor3 = Color3.new(), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.806, 0, 0.036, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Spawn", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14})
createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Spawn_TP})
createInstance("UIListLayout", {Parent = Buttons, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0.04, 0)})
local C_Indicator = createInstance("ImageButton", {Name = "C_Indicator", Parent = Body, BackgroundTransparency = 1, Position = UDim2.new(0.039, 0, 0.015, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://3926309567", ImageRectOffset = Vector2.new(628, 420), ImageRectSize = Vector2.new(48, 48)})
local C_Color = createInstance("TextLabel", {Name = "C_Color", Parent = C_Indicator, BackgroundColor3 = RED, Position = UDim2.new(0.23, 0, 0.225, 0), Size = UDim2.new(0, 13, 0, 13), Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.new(), TextSize = 14})
createInstance("UICorner", {CornerRadius = UDim.new(0, 100), Parent = C_Color})
local B_Indicator = createInstance("ImageButton", {Name = "B_Indicator", Parent = Body, BackgroundTransparency = 1, Position = UDim2.new(0.67, 0, 0.015, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://3926309567", ImageRectOffset = Vector2.new(628, 420), ImageRectSize = Vector2.new(48, 48)})
local B_Color = createInstance("TextLabel", {Name = "B_Color", Parent = B_Indicator, BackgroundColor3 = RED, Position = UDim2.new(0.23, 0, 0.225, 0), Size = UDim2.new(0, 13, 0, 13), Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.new(), TextSize = 14})
createInstance("UICorner", {CornerRadius = UDim.new(0, 100), Parent = B_Color})
createInstance("ImageButton", {Name = "Main_C", Parent = MainFrame, BackgroundTransparency = 1, Position = UDim2.new(0.89, 0, -0.075, 0), Selectable = false, Size = UDim2.new(0, 25, 0, 28), ZIndex = 2, Image = "rbxassetid://3926305904", ImageColor3 = Color3.new(), ImageRectOffset = Vector2.new(564, 284), ImageRectSize = Vector2.new(36, 36)})
createInstance("ImageButton", {Name = "Warning_Icon", Parent = MainFrame, BackgroundColor3 = Color3.fromRGB(165, 0, 0), BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0.035, 0, -1, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://3926305904", ImageColor3 = Color3.fromRGB(255, 0, 0), ImageRectOffset = Vector2.new(364, 324), ImageRectSize = Vector2.new(36, 36), Visible = false})
createInstance("TextLabel", {Name = "Warning_Label", Parent = MainFrame, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, Position = UDim2.new(0.102, 0, -0.7, 0), Size = UDim2.new(0, 200, 0, 18), Font = Enum.Font.SourceSans, Text = "Warning! BrewingFrame Unloaded!", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0.750, Visible = false})

local RED,GREEN = Color3.fromRGB(214,0,0),Color3.fromRGB(0,214,0);
local f1 = Instance.new("Folder")f1.Name = fN;
local p_F, b_F, p_Max = nil,nil,nil;
local Event = game.ReplicatedStorage.NetworkRemoteEvent;
local FireServer = Event.FireServer;
local g_Constraint = false
local g_UIVis = true
local b_Constraint = false
local Main_Moving = false
local C_Moving = false
local p_L = {"Empty Potion Slot", "Empty Potion Slot", "Empty Potion Slot"};
local i_L = {{"rbxasset://textures/ui/GuiImagePlaceholder.png", 1}, {"rbxasset://textures/ui/GuiImagePlaceholder.png", 1}, {"rbxasset://textures/ui/GuiImagePlaceholder.png", 1}};
local t_L,g_P,n_T,i_T,p_T,p_Q,images,sum = {0.5, 0.5, 0.5},{},{},{},{},{},{},0;
local f_S = {13, 17, 24, 67, 60, 69, 62, 64, 72, 74, 76, 79, 82, 28, 86, 30, 33, 36, 39, 42, 45, 48, 51, 54};
local potions = {"+1 Level", "+1 Enchant", "Shadow Potion", "Max Level", "Max Enchant", "Max Shadow", "Potion of Money", "Potion of Worlds", "Potion of Bubbles"};

-- t_L = holds the transparency of the reset buttons 
-- p_L = potion slot text, images = potion image array, i_L = holds the slots images,
-- g_P = table of Potion Names, n_T = table of Instance names, i_T = table of Instances, p_T = table of instance parents
-- f_S = table of button functions, p_Q = array of user's potion count


local LP = game:GetService("Players").LocalPlayer;
if((LP.Character or LP.CharacterAdded:Wait()).PrimaryPart==nil)then 
	LP.Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
end;
local rootPart = LP.Character.PrimaryPart;

LP.CharacterAdded:Connect(function(Character)
	Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
	rootPart = Character.PrimaryPart;
end);

local closeFrames = nil;
do
	local Frames = {
		[1] = LP.PlayerGui.ScreenGui.StatsFrame.Coins.More;
		[2] = LP.PlayerGui.ScreenGui.StatsFrame.Gems.More;
		[3] = LP.PlayerGui.ScreenGui.MainButtons;
		[4] = LP.PlayerGui.ScreenGui.Settings;
		[5] = LP.PlayerGui.ScreenGui.StatsFrame.Codes;
		[6] = LP.PlayerGui.ScreenGui.StatsFrame.Index;
		[7] = LP.PlayerGui.ScreenGui.StatsFrame.Boosts;
		[8] = LP.PlayerGui.ScreenGui.StatsFrame.Prizes;
	};
	
	closeFrames = function(b)
		g_UIVis = b;
		for _,frame in ipairs(Frames)do
			frame.Visible = b;
		end;
	end;
end;

local getp1_F,getp2_F = nil,nil;
do
	local Mouse = LP:GetMouse();
	local StarterGui = game:GetService("StarterGui");
	local Notification1 = {
		Title = "Waiting for PetsFrame...";
		Text = "Please open your PetsFrame to initialize the potion quantities";
		Duration = 5;
	};
	local Notification2 = {
		Title = "PetsFrame found...";
		Text = "Please open your Potions tab to initialize the potion quantities";
		Duration = 5;
	};
	local Notification3 = {
		Title = "Potions tab found...";
		Text = "Processing potion quantities...";
		Duration = 5;
	};
	
	local m_B = LP.PlayerGui.ScreenGui.MainButtons;
	local m_UIL = m_B.UIListLayout;
	local tempGUI = Instance.new("ScreenGui",LP.PlayerGui);
	
	-- function to get the main button to the screen
	getp1_F = function()
		if(LP.PlayerGui.ScreenGui:FindFirstChild("PetsFrame")~=nil)then LP.PlayerGui.ScreenGui.PetsFrame.Parent = nil end;
		
		m_B.Pets.Position = UDim2.new();
		m_UIL.Parent = LP.PlayerGui; 
		
		if(not m_B.Visible)then m_B.Visible = true end;
		for i,v in ipairs(m_B:GetChildren()) do 
			if(v:IsA("ImageButton"))and v.Name~="Pets" then 
				v.Visible = false;
			end;
		end;

		StarterGui:SetCore("SendNotification",Notification1);
		local Pets,sz,ap = m_B.Pets,m_B.Pets.Size,m_B.Pets.AnchorPoint;
		Pets.Parent = tempGUI;
		Pets.Size = UDim2.new(0,100,0,100);
		Pets.AnchorPoint = Vector2.new(0.5,0.5);
		
		while(wait()and LP.PlayerGui.ScreenGui:FindFirstChild("PetsFrame")==nil)do
			Pets.Position = UDim2.fromOffset(Mouse.X,Mouse.Y);
		end;
	
		Pets.Size,Pets.AnchorPoint = sz,ap;
		Pets.Parent = m_B;
		m_B.Visible = false;
		m_UIL.Parent = m_B;
	end;
	
	-- function to count the total number of cumulative and unique potions the user contains
	getp2_F = function(vis)
		local p_UIL = p_F.Tabs.UIListLayout;
		p_F.Tabs.Potions.Position = UDim2.new()

		for _,v in ipairs(p_F.Tabs:GetChildren())do 
			if(v:IsA("ImageButton"))then 
				v.Visible = false;
			end;
		end;
		
		p_F.Main.Visible = false; 
		p_F.Stats.Visible = false; 
		p_UIL.Parent = LP.PlayerGui
		p_F.Main.Pages.Potions.List.Grid.UIGridLayout.CellSize = UDim2.fromScale(10, 10)

		StarterGui:SetCore("SendNotification",Notification2);

		wait(1);
		local Potions = p_F.Tabs.Potions
		local sz,ap = Potions.Size,Potions.AnchorPoint;
		Potions.Visible = true;
		Potions.Parent = tempGUI;
		Potions.Size = UDim2.new(0,100,0,100);
		Potions.AnchorPoint = Vector2.new(0.5,0.5);
		
		while(wait()and p_F.Main.Title.Text~="My Potions")do
			Potions.Position = UDim2.fromOffset(Mouse.X,Mouse.Y);
		end;
		
		Potions.Size,Potions.AnchorPoint = sz,ap;
		Potions.Parent = p_F.Tabs;
		p_F.Tabs.Potions.Visible = false;
		p_UIL.Parent = p_F.Tabs;
		
		local Text = p_F.Main.Counters.Stored.Amount.Text;
		p_Max = tonumber(Text:sub(Text:find('/')+1)); 
		
		StarterGui:SetCore("SendNotification",Notification3);

		wait(3) -- data may take a few seconds to load
		for _,v in ipairs(p_F.Main.Pages.Potions.List.Grid:GetChildren()) do
			if v:FindFirstChild("Detail") then 
				p_Q[table.find(potions,v.Detail.Inner.PotionName.Text)] += 1; 
				sum += 1;
			end;
		end;
	   
		p_F.Main.Pages.Potions.List.Grid.UIGridLayout.CellSize = UDim2.fromOffset(115, 115);
		LP.PlayerGui.ScreenGui.MainButtons.Pets.Position = UDim2.new();
		p_F.Tabs.Potions.Position = UDim2.new(1, 5, 0, 0);
		p_F.Main.Visible = true; 
		p_F.Stats.Visible = true;
		
		closeFrames(vis);
		for _,v in ipairs(p_F.Tabs:GetChildren()) do 
			if(v:IsA("ImageButton"))then 
				v.Visible = true;
			end;
		end;
		for _,v in ipairs(LP.PlayerGui.ScreenGui.MainButtons:GetChildren()) do 
			if(v:IsA("ImageButton"))then 
				v.Visible = true;
			end;
		end;
	end;
end;

local function reset(index)
	if(index==1)then
		if(i_T[13].ImageTransparency~=0.5)then
			for i=1,2 do
				i_T[8]["P_Label"..i].Text = i_T[8]["P_Label"..(i + 1)].Text;
				i_T[8]["P_Reset"..i].ImageTransparency = i_T[8]["P_Reset"..(i+1)].ImageTransparency;
				i_T[8]["P_Image"..i].Image = i_T[8]["P_Image"..(i + 1)].Image;
				i_T[8]["P_Image"..i].ImageTransparency = i_T[8]["P_Image"..(i+1)].ImageTransparency;
				i_T[8]["P_Bool"..i].Value = i_T[8]["P_Bool"..(i + 1)].Value;
				p_L[i] = i_T[8]["P_Label"..i].Text;
				t_L[i] = i_T[8]["P_Reset"..i].ImageTransparency;
				i_L[i][0] = i_T[8]["P_Image"..i].Image;
				i_L[i][1] = i_T[8]["P_Image"..i].ImageTransparency;
			end
			if(i_T[21].Text~="Empty Potion Slot")then
				i_T[21].Text = "Empty Potion Slot";
				i_T[24].ImageTransparency = 0.5;
				i_T[23].ImageTransparency = 1;
				i_T[16].Value = false;
				p_L[3] = i_T[21].Text;
				t_L[3] = 0.5;
				i_L[3][1] = 1;
			end
			if(g_Constraint and i_T[11].Text=="Empty Potion Slot")then
				g_Constraint = false;
				i_T[80].BackgroundColor3 = RED;
				i_T[25].Text = "Currently:  Idle";
			end;
		end;
	elseif(index==2)then
		if(i_T[17].ImageTransparency~=0.5)then
			i_T[19].Text = i_T[21].Text;
			i_T[18].Image = i_T[23].Image;
			i_T[18].ImageTransparency = i_T[23].ImageTransparency;
			i_T[17].ImageTransparency = i_T[24].ImageTransparency;
			i_T[15].Value = i_T[16].Value;
			p_L[2] = i_T[19].Text;
			t_L[2] = i_T[24].ImageTransparency;
			i_L[2][0] = i_T[23].Image;
			i_L[2][1] = i_T[23].ImageTransparency;
			if(i_T[21].Text~="Empty Potion Slot")then
				i_T[21].Text = "Empty Potion Slot";
				i_T[23].ImageTransparency = 1;
				i_T[24].ImageTransparency = 0.5;
				i_T[16].Value = false;
				p_L[3] = i_T[21].Text;
				t_L[3] = 0.5;
				i_L[3][1] = 1;
			end;
		end;
	elseif(index==3)then
		if(i_T[24].ImageTransparency~=0.5)then
			i_T[21].Text = "Empty Potion Slot";
			i_T[24].ImageTransparency = 0.5;
			i_T[23].ImageTransparency = 1;
			i_T[16].Value = false;
			p_L[3] = i_T[21].Text;
			t_L[3] = 0.5; i_L[3][1] = 1;
		end;
	end;
end;

local getBrewingFrame = nil;
do
	local frameTouch = CFrame.new(-1740.89038, 2705.99048, 11044.1572, -0.984202802, -4.41739587e-08, -0.177044764, -3.80400742e-08, 1, -3.80401666e-08, 0.177044764, -3.07044417e-08, -0.984202802);
	getBrewingFrame = function()
		FireServer(Event,"Teleport","LabSpawn");
		while(LP.PlayerGui.ScreenGui:FindFirstChild("BrewingFrame")==nil)do 
			rootPart.CFrame = frameTouch;
			wait()
		end;
	end;
end;

local cfun = function(index, obj)
	if index < 4 then
		obj.MouseButton1Click:Connect(function() reset(index) end)
	elseif(index==4)then
		obj.MouseButton1Click:Connect(function()FireServer(Event,"Teleport", "EventSpawn")end)
	elseif(index==5)then
		obj.MouseButton1Click:Connect(function() g_UIVis = not g_UIVis; closeFrames(g_UIVis) end)
	elseif(index==6)then
		obj.MouseButton1Click:Connect(function()FireServer(Event,"Teleport", "LabSpawn")end);
	elseif(index==7)then
		obj.MouseButton1Click:Connect(function() if b_F then b_F.Visible = not b_F.Visible end end) 
	elseif(index==8)then
		local BF,CF = nil,nil;
		obj.MouseButton1Click:Connect(function()
			BF = LP.PlayerGui.ScreenGui:FindFirstChild("BrewingFrame")~=nil;
			for i = 1, #p_Q do p_Q[i] = 0 end; sum = 0
			getp1_F(); getp2_F(LP.PlayerGui.ScreenGui.StatsFrame.Coins.More.Visible);
			LP.PlayerGui.ScreenGui.PetsFrame.Parent = nil;
			
			if(BF)then
				CF = rootPart.CFrame;
				getBrewingFrame();
				wait(3);
				rootPart.CFrame = CF;
			end;
		end)
	elseif(index==9)then
		obj.MouseButton1Click:Connect(function()FireServer("Teleport", "ShardReturn")end);
	elseif(index==10)then
		obj.MouseButton1Click:Connect(function()FireServer(Event,"Teleport", "ShardArea")end);
	elseif(index==11)then
		obj.MouseButton1Click:Connect(function()FireServer(Event,"Teleport", "OverworldSpawn")end);
	elseif(index==12)then
		obj.MouseButton1Click:Connect(function()
			if i_T[11].Text == "Empty Potion Slot" then
				i_T[25].Text = "No potions to brew!"
				wait(4)
				if not g_Constraint then i_T[25].Text = "Currently:  Idle" end
			else
				if g_Constraint then i_T[80].BackgroundColor3 = Color3.fromRGB(214, 0, 0); i_T[25].Text = "Currently:  Idle"
				else i_T[80].BackgroundColor3 = Color3.fromRGB(0, 214, 0); i_T[25].Text = "Currently:  Brewing" end
				g_Constraint = not g_Constraint
			end
		end)
	elseif index == 13 then
		obj.MouseButton1Click:Connect(function()
			if b_Constraint then i_T[83].BackgroundColor3 = Color3.fromRGB(214, 0, 0)
			else i_T[83].BackgroundColor3 = Color3.fromRGB(0, 214, 0) end
			b_Constraint = not b_Constraint
		end)
	elseif index == 14 then
		obj.MouseButton1Click:Connect(function()
			if i_T[28].Rotation == 0 and not C_Moving then
				C_Moving = true
				i_T[29]:TweenSize(UDim2.new(0, 188, 0, 0), "Out", "Sine", 0.5, true)
				repeat i_T[28].Rotation = i_T[28].Rotation + 10 wait(0.01) until i_T[28].Rotation == 90 
				C_Moving = false
			elseif not C_Moving then
				C_Moving = true
				i_T[29]:TweenSize(UDim2.new(0, 188, 0, 23 + 19*#b_F.Recipes:GetChildren()), "Out", "Sine", 0.5, true)
				repeat i_T[28].Rotation = i_T[28].Rotation - 10 wait(0.01) until i_T[28].Rotation == 0 
				C_Moving = false
			end 
		end)
	elseif index == 15 then
		obj.MouseButton1Click:Connect(function()
			if i_T[86].Rotation == 0 and not Main_Moving then
				Main_Moving = true
				if i_T[28].Rotation == 0 then 
					i_T[29]:TweenSize(UDim2.new(0, 188, 0, 0), "Out", "Sine", 0.5, true) 
					repeat i_T[28].Rotation = i_T[28].Rotation + 10 wait(0.01) until i_T[28].Rotation == 90 
				end
				i_T[28].Visible = false
				i_T[5]:TweenSize(UDim2.new(0, 263, 0, 0), "Out", "Sine", 0.5, true)
				i_T[5].ClipsDescendants = true
				repeat i_T[86].Rotation = i_T[86].Rotation + 10 wait(0.01) until i_T[86].Rotation == 90 
				Main_Moving = false
			elseif not Main_Moving then
				Main_Moving = true
				i_T[5]:TweenSize(UDim2.new(0, 263, 0, 189), "Out", "Sine", 0.5, true)
			repeat i_T[86].Rotation = i_T[86].Rotation - 10 wait(0.01) until i_T[86].Rotation == 0 
				i_T[5].ClipsDescendants = false
				i_T[28].Visible = true
				Main_Moving = false
			end 
		end)
	else
		local i = tonumber(obj.Name:sub(7))
		obj.MouseButton1Click:Connect(function()
			for x = 1, 3 do
				if(i_T[8]["P_Label"..x].Text=="Empty Potion Slot")then
					i_T[8]["P_Label"..x].Text = obj.Text;
					i_T[8]["P_Reset"..x].ImageTransparency = 0;
					i_T[8]["P_Image"..x].Image = images[i];
					i_T[8]["P_Image"..x].ImageTransparency = 0;
					i_T[8]["P_Bool"..x].Value = true;
					p_L[x] = obj.Text; 
					i_L[x][0] = images[i];
					i_L[x][1] = 0; 
					t_L[x] = 0;
					break;
				end;
			end;
		end);
	end;
end;

-- fills p_Q with blank data then removes the close button on the BrewingFrame
if(LP.PlayerGui.ScreenGui:FindFirstChild("BrewingFrame")==nil)then
	getBrewingFrame();
	FireServer(Event,"Teleport","LabLeaveSpawn");
end;
b_F = LP.PlayerGui.ScreenGui.BrewingFrame;

do
	local temp = nil;
	for i=1,#b_F.Recipes:GetChildren()-1 do
		temp = b_F.Recipes["Recipe"..i];

		local Temp = createInstance("TextButton",{Name=temp.Name,Parent=P_List,BackgroundColor3=Color3.fromRGB(180,180,180),BackgroundTransparency=0.250,Position=UDim2.new(0.035,0,0.035+0.105*(i-1),0),Size=UDim2.new(0,149,0,19),Font=Enum.Font.SourceSans,Text=temp.ItemName.Text,TextColor3=Color3.fromRGB(255,255,255),TextSize=14,TextStrokeTransparency=0.750});
		createInstance("TextLabel",{Name="q"..temp.Name,Parent=P_List,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Position=UDim2.new(0.84,0,0.035+0.105*(i-1),0),Size=UDim2.new(0,35,0,19),Font=Enum.Font.SourceSans,Text=":",TextColor3=Color3.fromRGB(255,255,255),TextSize=14,TextStrokeTransparency=0.750,TextXAlignment="Left"});
		createInstance("UICorner", {CornerRadius=UDim.new(0,8),Parent=Temp});
		
		images[i] = temp.ItemImage.Image;
		g_P[i] = temp.ItemName.Text;
	end;
end;

MainUi_3:Clone().Parent = f1;
n_T[1] = name;
i_T[1] = MainUi_3;
p_T[1] = game.CoreGui;
for i,v in ipairs(MainUi_3:GetDescendants())do
	i_T[i+1] = v; n_T[i+1] = v.Name; p_T[i+1] = v.Parent;
	for x,c in ipairs(f_S)do if((i+1)==c)then cfun(x,v)end;end;
end;

for i=1,9 do table.insert(p_Q, 0)end;
if(b_F:FindFirstChild("Close")~=nil)then 
	b_F.Close.Parent = nil;
end; 
b_F.Visible = false;

wait(1);getp1_F(); 
p_F = LP.PlayerGui.ScreenGui.PetsFrame; 
getp2_F(true);
do
	local CF = rootPart.CFrame;
	getBrewingFrame();
	wait(3);
	rootPart.CFrame = CF;
end;

-- checks if either the skip b_F is visible, given the visibile attribute value of the parent Brewing b_F
local function checkSkip(i)
	return(b_F.Brewing["Brew"..i].Brewing.Visible and b_F.Brewing["Brew"..i].Brewing.Skip.Visible);
end

task.defer(function()
	local function doStuff()
		if(LP.PlayerGui.ScreenGui:FindFirstChild("BrewingFrame")==nil)then
			i_T[88].Visible = true;
			while(wait(1)and LP.PlayerGui.ScreenGui:FindFirstChild("BrewingFrame")==nil)do
				i_T[87].Visible = not i_T[87].Visible;
			end;
			i_T[88].Visible = false;
			i_T[87].Visible = false;
		end;
		if not ((g_Constraint and i_T[80].BackgroundColor3==GREEN and i_T[25].Text=="Currently:  Brewing")
			or ((not g_Constraint)and i_T[80].BackgroundColor3==RED and(i_T[25].Text=="Currently:  Idle"or i_T[25].Text=="No potions to brew!")))then
			i_T[80].BackgroundColor3 = RED; 
			i_T[25].Text = "Currently:  Idle"; 
			g_Constraint = false;
		end;
	end;

	while(wait(1))do pcall(doStuff)end;
end)

task.defer(function()
	while(wait(0.8))do if(b_Constraint)then FireServer(Event,"BlowBubble")end;end;
end);

task.defer(function()
	local function doStuff()
		for i = 1,3 	do if(i_T[8]["P_Label"..i].Text~=p_L[i])then i_T[8]["P_Label"..i].Text = p_L[i]end;end;
		for i = 1,#g_P 	do if(i_T[29]["Recipe"..i].Text~=g_P[i])then i_T[29]["Recipe"..i].Text = g_P[i]end;end;
		for i = 1,3 	do if(i_T[8]["P_Image"..i].Image~=i_L[i][0])then i_T[8]["P_Image"..i].Image = i_L[i][0]end;end;
		for i = 1,3 	do if(i_T[8]["P_Image"..i].ImageTransparency~=i_L[i][1])then i_T[8]["P_Image"..i].ImageTransparency = i_L[i][1]end;end;
		for i = 1,3 	do if(i_T[8]["P_Reset"..i].ImageTransparency~=t_L[i])then i_T[8]["P_Reset"..i].ImageTransparency = t_L[i]end;end;
	end;

	while(wait(1))do pcall(doStuff)end;
end)

task.defer(function()
	while(wait(1))do
		for i,v in ipairs(i_T)do
			if(v.Parent==p_T[i])then continue end;
			if(v.Parent==nil)then
				for x,c in ipairs(f1:GetDescendants()) do 
					if(x~=i)then continue end;
					c:Clone().Parent = p_T[i];
					wait(0.5);
					v = p_T[i]:FindFirstChild(n_T[i]);
					for z,t in ipairs(v:GetDescendants()) do 
						if(t.Name=="C_Label")then 
							t.Text = i_T[25].Text;
						end;
						i_T[x + z] = t;
						p_T[x + z] = t.Parent;
						for y,w in ipairs(f_S)do
							if((x+z)==w)then 
								cfun(y,i_T[x + z]);
							end;
						end;
					end;
				end;
			else
				v.Parent = p_T[i];
			end;
			if(v.Name~=n_T[i])then 
				v.Name = n_T[i];
			end;
		end;
	end;
end);

-- checks if the user is capable of brewing some potion
local checkBrew = nil;
do
	local s_F,t_,idx = LP.PlayerGui.ScreenGui.StatsFrame,{},nil;
	local stats = {s_F["Gems"].Amount, s_F["Stars"].Amount, s_F["Crystals"].Amount, s_F["Magma"].Amount};

	local function doStuff(idx,b)
		if(idx<3)then 
			return(t_[1] >= 1e+7);
		elseif(idx==3)then 
			return(t_[1] >= 15e+6);
		elseif(idx==4)then
			b = (p_Q[1] > 2 and t_[2] >= 2e+7); 
			if(b)then 
				p_Q[1] -= 3; 
				sum -= 3; 
			end;
		elseif(idx==5)then 
			b = (p_Q[2] > 2 and t_[3] >= 2e+7); 
			if b then 
				p_Q[2] -= 3; 
				sum -= 3;
			end;
		elseif(idx==6)then 
			b = (p_Q[3] > 4 and t_[4] >= 1e+8);
			if b then 
				p_Q[3] -= 5;
				sum -= 5;
			end;
		elseif(idx==7)then 
			b = (p_Q[6] > 0 and p_Q[4] > 4);
			if b then 
				p_Q[6] -= 1;
				p_Q[4] -= 5;
				sum -= 6;
			end;
		elseif(idx==8)then 
			b = (p_Q[6] > 0 and p_Q[5] > 4);
			if b then 
				p_Q[6] -= 1; 
				p_Q[5] -= 5; 
				sum -= 6; 
			end;
		else 
			b = (p_Q[6] > 2 and t_[1] >= 25e+7); 
			if b then 
				p_Q[6] = p_Q[6] - 3; 
				sum -= 3; 
			end;
		end;
		return b;
	end;
	
	checkBrew = function(str)
		for i,v in ipairs(stats) do
			t_[i] = tonumber(v.Text:gsub(',', ''));
		end;
		
		return({pcall(doStuff,table.find(potions,str),nil)})[2];
	end
end;

task.defer(function()
	local function doStuff()
		for i,v in ipairs(p_Q)do 
			i_T[29]["qRecipe"..i].Text = (":  " .. v);
		end;
	end;
	
	while(wait(1))do pcall(doStuff)end;
end)

-- main loop
task.defer(function()
	while wait(1) do 
		if(i_T[80].BackgroundColor3~=GREEN or not b_F)then continue end;
		for i = 3, 1, -1 do
			if(checkSkip(i))then continue end;
			if(b_F.Brewing["Brew"..i].Empty.Visible)then
				for x = 1, 3 do
					if not(i_T[8]["P_Label"..x].Text ~= "Empty Potion Slot" and i_T[8]["P_Bool"..x].Value)then continue end; -- checks for a ready potion
					if(checkBrew(i_T[8]["P_Label"..x].Text)and sum<p_Max)then
						FireServer(Event,"BrewPotion",table.find(potions, i_T[8]["P_Label"..x].Text)); -- brews the potion
						i_T[8]["P_Bool"..x].Value = false;
					else 
						print("Either you\'ve maxed your potion storage, or you don\'t have enough resources to brew: " .. i_T[8]["P_Label"..x].Text); reset(x) 
					end;
					break;
				end;
			else
				for x=1,3 do 
					if(b_F.Brewing["Brew"..i].Brewing.ItemName.Text==i_T[8]["P_Label"..x].Text and not i_T[8]["P_Bool"..x].Value)then -- checks collected potion is still being brewed
						i_T[8]["P_Bool"..x].Value = true;
						break;
					end;
				end;
				p_Q[table.find(potions, b_F.Brewing["Brew"..i].Brewing.ItemName.Text)] += 1;  
				sum += 1;
				FireServer(Event,"ClaimPotion",i)
			end;
			wait(0.5);
		end;
	end;
end);

warn("\n\nProgram fully loaded! If you encounter any bugs/problems, or, if you have any questions/suggestions, ");
warn("please PM me either by discord - dooop#0496 - or through V3rmillion.net - Activities12 -");
MainFrame.Visible = true;f1[name].MainFrame.Visible = true;

