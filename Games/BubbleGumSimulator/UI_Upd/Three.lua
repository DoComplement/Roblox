
local HEADER = true
for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do if v:FindFirstChild("MainFrame") then HEADER = false end end

if HEADER then
    local chars = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 
    	'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}
    
    local fN = ""; local name = "";
    for i = 1, math.random(5, 16) do name = name .. chars[math.random(1, #chars)]; fN = fN .. chars[math.random(1, #chars)] end
    
    local function createInstance(class, props)
    	local inst = Instance.new(class)
    	for i, v in pairs(props) do
    		inst[i] = v
    	end
    
    	return inst
    end
    
    local MainUi_3 = createInstance("ScreenGui", {Name = name, Parent = game:GetService("CoreGui"), ZIndexBehavior = Enum.ZIndexBehavior.Global})
    local MainFrame = createInstance("Frame", {Name = "MainFrame", Parent = MainUi_3, Active = true, Draggable = true, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(27, 42, 53), BorderSizePixel = 0, Position = UDim2.new(0, 0, 0, 0), Selectable = true, Size = UDim2.new(0, 263, 0, 24), Visible = false})
    local UIGradient = createInstance("UIGradient", {Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(172, 32, 182)), ColorSequenceKeypoint.new(0.42, Color3.fromRGB(211, 124, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(211, 225, 7))}, Parent = MainFrame})
    local UICorner = createInstance("UICorner", {CornerRadius = UDim.new(0, 5), Parent = MainFrame})
    local Body = createInstance("Frame", {Name = "Body", Parent = MainFrame, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.9, 0), Size = UDim2.new(0, 263, 0, 189)})
    local UICorner_2 = createInstance("UICorner", {CornerRadius = UDim.new(0, 2), Parent = Body, Name = "UICorner_2"})
    local UIGradient_2 = createInstance("UIGradient", {Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(56, 56, 56)), ColorSequenceKeypoint.new(0.62, Color3.fromRGB(107, 107, 107)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(134, 134, 134))}, Parent = Body, Name = "UIGradient_2"})
    local Title = createInstance("TextLabel", {Name = "Title", Parent = MainFrame, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, Position = UDim2.new(0.1, 0, 0.1, 0), Size = UDim2.new(0, 107, 0, 18), Font = Enum.Font.SourceSans, Text = "AutoBrew", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000, TextStrokeTransparency = 0.750, TextXAlignment = Enum.TextXAlignment.Left})
    local Potions_B = createInstance("Frame", {Name = "Potions_B", Parent = Body, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.500, BorderSizePixel = 0, Position = UDim2.new(0.0370370895, 0, 0.162235066, 0), Size = UDim2.new(0, 188, 0, 126)})
    local P_Image1 = createInstance("ImageLabel", {Name = "P_Image1", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderSizePixel = 0, Position = UDim2.new(0.00680850819, 0, 0.0710000023, 0), Size = UDim2.new(0, 34, 0, 34), Image = "rbxasset://textures/ui/GuiImagePlaceholder.png", ImageTransparency = 1.000})
    local UICorner_3 = createInstance("UICorner", {Parent = Potions_B, Name = "UICorner_3"})
    local P_Label1 = createInstance("TextLabel", {Name = "P_Label1", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(236, 87, 77), Position = UDim2.new(0.2, 0, 0.09, 0), Size = UDim2.new(0, 123, 0, 29), Font = Enum.Font.SourceSans, Text = "Empty Potion Slot", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000})
    local UICorner_4 = createInstance("UICorner", {Parent = P_Label1, Name = "UICorner_4"})
    local P_Reset1 = createInstance("ImageButton", {Name = "P_Reset1", Parent = Potions_B, BackgroundTransparency = 1, Position = UDim2.new(0.86, 0, 0.1, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://6764432408", ImageTransparency = 0.5, ImageRectOffset = Vector2.new(200, 600), ImageRectSize = Vector2.new(50, 50)})
    local P_Bool1 = createInstance("BoolValue", {Parent = Potions_B, Name = "P_Bool1", Value = false})
    local P_Bool2 = createInstance("BoolValue", {Parent = Potions_B, Name = "P_Bool2", Value = false})
    local P_Bool3 = createInstance("BoolValue", {Parent = Potions_B, Name = "P_Bool3", Value = false})
    local P_Reset2 = createInstance("ImageButton", {Name = "P_Reset2", Parent = Potions_B, BackgroundTransparency = 1, Position = UDim2.new(0.860000014, 0, 0.3936508, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://6764432408", ImageTransparency = 0.5, ImageRectOffset = Vector2.new(200, 600), ImageRectSize = Vector2.new(50, 50)})
    local P_Image2 = createInstance("ImageLabel", {Name = "P_Image2", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderSizePixel = 0, Position = UDim2.new(0.00680850819, 0, 0.364650816, 0), Size = UDim2.new(0, 34, 0, 34), Image = "rbxasset://textures/ui/GuiImagePlaceholder.png", ImageTransparency = 1.000})
    local P_Label2 = createInstance("TextLabel", {Name = "P_Label2", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(236, 87, 77), Position = UDim2.new(0.2, 0, 0.38365081, 0), Size = UDim2.new(0, 123, 0, 29), Font = Enum.Font.SourceSans, Text = "Empty Potion Slot", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000})
    local UICorner_5 = createInstance("UICorner", {Parent = P_Label2, Name = "UICorner_5"})
    local P_Label3 = createInstance("TextLabel", {Name = "P_Label3", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(236, 87, 77), Position = UDim2.new(0.2, 0, 0.677999973, 0), Size = UDim2.new(0, 123, 0, 29), Font = Enum.Font.SourceSans, Text = "Empty Potion Slot", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000})
    local UICorner_6 = createInstance("UICorner", {Parent = P_Label3, Name = "UICorner_6"})
    local P_Image3 = createInstance("ImageLabel", {Name = "P_Image3", Parent = Potions_B, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderSizePixel = 0, Position = UDim2.new(0.00700000022, 0, 0.658999979, 0), Size = UDim2.new(0, 34, 0, 34), Image = "rbxasset://textures/ui/GuiImagePlaceholder.png", ImageTransparency = 1.000})
    local P_Reset3 = createInstance("ImageButton", {Name = "P_Reset3", Parent = Potions_B, BackgroundTransparency = 1, Position = UDim2.new(0.860000014, 0, 0.688000023, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://6764432408", ImageTransparency = 0.5, ImageRectOffset = Vector2.new(200, 600), ImageRectSize = Vector2.new(50, 50)})
    local C_Label = createInstance("TextLabel", {Name = "C_Label", Parent = Body, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, Position = UDim2.new(0.149019614, 0, 0.0211640205, 0), Size = UDim2.new(0, 76, 0, 21), Font = Enum.Font.SourceSans, Text = "Currently:  Idle", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000, TextXAlignment = Enum.TextXAlignment.Left})
    local Potions_N = createInstance("Frame", {Name = "Potions_N", Parent = Body, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.600, Position = UDim2.new(0.0352941193, 0, 0.862433851, 0), Size = UDim2.new(0, 188, 0, 19)})
    local UICorner_7 = createInstance("UICorner", {CornerRadius = UDim.new(0, 3), Parent = Potions_N, Name = "UICorner_7"})
    local Potions_C = createInstance("ImageButton", {Name = "Potions_C", Parent = Potions_N, BackgroundTransparency = 1.000, Position = UDim2.new(0.879999995, 0, -0.25, 0), Rotation = 90.000, Selectable = false, Size = UDim2.new(0, 25, 0, 28), ZIndex = 2, Image = "rbxassetid://3926305904", ImageRectOffset = Vector2.new(564, 284), ImageRectSize = Vector2.new(36, 36)})
    local P_List = createInstance("Frame", {Name = "P_List", Parent = Potions_N, BackgroundColor3 = Color3.fromRGB(53, 53, 53), BackgroundTransparency = 0.020, BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.970000029, 0), Size = UDim2.new(0, 188, 0, 0), Visible = true, ClipsDescendants = true})
    local UIGradient_3 = createInstance("UIGradient", {Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.83, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}, Parent = Potions_N, Name = "UIGradient_3"})
    local P_Title = createInstance("TextLabel", {Name = "P_Title", Parent = Body, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, Position = UDim2.new(0.209999993, 0, 0.870000005, 0), Size = UDim2.new(0, 63, 0, 15), Font = Enum.Font.SourceSans, Text = "Choose Potion(s)", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000, TextStrokeTransparency = 0.750, TextXAlignment = Enum.TextXAlignment.Left})
    local Buttons = createInstance("Frame", {Name = "Buttons", Parent = Body, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, BorderSizePixel = 0, Position = UDim2.new(0.790000021, 0, 0.100000001, 0), Size = UDim2.new(0, 46, 0, 155)})
    local Inv_GameUi = createInstance("TextButton", {Name = "Inv_GameUi", Parent = Buttons, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.805999994, 0, 0.430000007, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Inv.", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000})
    local UICorner_8 = createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Inv_GameUi, Name = "UICorner_8"})
    local Inv_Ui = createInstance("TextButton", {Name = "Inv_Ui", Parent = Buttons, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.805999994, 0, 0.620000005, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "UI", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000})
    local UICorner_9 = createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Inv_Ui, Name = "UICorner_9"})
    local Pot_Upd = createInstance("TextButton", {Name = "Pot_Upd", Parent = Buttons, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.805999994, 0, 0.810000002, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Upd.", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000})
    local UICorner_10 = createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Pot_Upd, Name = "UICorner_10"})
    local Teleports = createInstance("ScrollingFrame", {Name = "Teleports", Parent = Buttons, Active = true, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, Position = UDim2.new(-0.154564902, 0, 0.0580645166, 0), Size = UDim2.new(0, 52, 0, 55), CanvasSize = UDim2.new(0, 0, 0.949999988, 0), ScrollBarThickness = 9})
    local Event_TP = createInstance("TextButton", {Name = "Event_TP", Parent = Teleports, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.805999994, 0, 0.0364516117, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Event", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000})
    local UICorner_11 = createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Event_TP, Name = "UICorner_11"})
    local Lab_TP = createInstance("TextButton", {Name = "Lab_TP", Parent = Teleports, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.805999994, 0, 0.230000004, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Lab", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000})
    local UICorner_12 = createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Lab_TP, Name = "UICorner_12"})
    local UIListLayout = createInstance("UIListLayout", {Parent = Teleports, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0.0399999991, 0)})
    local Shard_TP = createInstance("TextButton", {Name = "Shard_TP", Parent = Teleports, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.805999994, 0, 0.0364516117, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Games", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000})
    local UICorner_13 = createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Shard_TP, Name = "UICorner_13"})
    local Void_TP = createInstance("TextButton", {Name = "Void_TP", Parent = Teleports, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.805999994, 0, 0.0364516117, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Void", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000})
    local UICorner_14 = createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Void_TP, Name = "UICorner_14"})
    local Spawn_TP = createInstance("TextButton", {Name = "Spawn_TP", Parent = Teleports, BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.660, BorderSizePixel = 0, Position = UDim2.new(0.805999994, 0, 0.0364516117, 0), Size = UDim2.new(0, 40, 0, 24), Font = Enum.Font.SourceSans, Text = "Spawn", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000})
    local UICorner_15 = createInstance("UICorner", {CornerRadius = UDim.new(0, 4), Parent = Spawn_TP, Name = "UICorner_15"})
    local UIListLayout_2 = createInstance("UIListLayout", {Parent = Buttons, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0.0399999991, 0), Name = "UIListLayout_2"})
    local C_Indicator = createInstance("ImageButton", {Name = "C_Indicator", Parent = Body, BackgroundTransparency = 1.000, Position = UDim2.new(0.039, 0, 0.015, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://3926309567", ImageRectOffset = Vector2.new(628, 420), ImageRectSize = Vector2.new(48, 48)})
    local C_Color = createInstance("TextLabel", {Name = "C_Color", Parent = C_Indicator, BackgroundColor3 = Color3.fromRGB(214, 0, 0), Position = UDim2.new(0.23, 0, 0.225, 0), Size = UDim2.new(0, 13, 0, 13), Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000})
    local UICorner_16 = createInstance("UICorner", {CornerRadius = UDim.new(0, 100), Parent = C_Color, Name = "UICorner_16"})
    local B_Indicator = createInstance("ImageButton", {Name = "B_Indicator", Parent = Body, BackgroundTransparency = 1.000, Position = UDim2.new(0.670372546, 0, 0.015, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://3926309567", ImageRectOffset = Vector2.new(628, 420), ImageRectSize = Vector2.new(48, 48)})
    local B_Color = createInstance("TextLabel", {Name = "B_Color", Parent = B_Indicator, BackgroundColor3 = Color3.fromRGB(214, 0, 0), Position = UDim2.new(0.23, 0, 0.225, 0), Size = UDim2.new(0, 13, 0, 13), Font = Enum.Font.SourceSans, Text = "", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000})
    local UICorner_17 = createInstance("UICorner", {CornerRadius = UDim.new(0, 100), Parent = B_Color, Name = "UICorner_17"})
    local Main_C = createInstance("ImageButton", {Name = "Main_C", Parent = MainFrame, BackgroundTransparency = 1.000, Position = UDim2.new(0.89, 0, -0.075000003, 0), Selectable = false, Size = UDim2.new(0, 25, 0, 28), ZIndex = 2, Image = "rbxassetid://3926305904", ImageColor3 = Color3.fromRGB(0, 0, 0), ImageRectOffset = Vector2.new(564, 284), ImageRectSize = Vector2.new(36, 36)})
    local Warning_Icon = createInstance("ImageButton", {Name = "Warning_Icon", Parent = MainFrame, BackgroundColor3 = Color3.fromRGB(165, 0, 0), BackgroundTransparency = 1.000, BorderSizePixel = 0, Position = UDim2.new(0.035, 0, -1, 0), Size = UDim2.new(0, 25, 0, 25), ZIndex = 2, Image = "rbxassetid://3926305904", ImageColor3 = Color3.fromRGB(255, 0, 0), ImageRectOffset = Vector2.new(364, 324), ImageRectSize = Vector2.new(36, 36), Visible = false})
    local Warning_Label = createInstance("TextLabel", {Name = "Warning_Label", Parent = MainFrame, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, Position = UDim2.new(0.101960786, 0, -0.7, 0), Size = UDim2.new(0, 200, 0, 18), Font = Enum.Font.SourceSans, Text = "Warning! BrewingFrame Unloaded!", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000, TextStrokeTransparency = 0.750, Visible = false})

    local f1 = Instance.new("Folder"); f1.Name = fN
    local p_F, b_F, p_Max
    local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
    local LP = game:GetService("Players").LocalPlayer
    local g_Constraint = false
    local g_UIVis = true
    local b_Constraint = false
    local Main_Moving = false
    local C_Moving = false
    local p_L = {"Empty Potion Slot", "Empty Potion Slot", "Empty Potion Slot"}
    local i_L = {{"rbxasset://textures/ui/GuiImagePlaceholder.png", 1}, {"rbxasset://textures/ui/GuiImagePlaceholder.png", 1}, {"rbxasset://textures/ui/GuiImagePlaceholder.png", 1}}
    local t_L = {0.5, 0.5, 0.5}; local g_P = {}; local n_T = {}; local i_T = {}; local p_T = {};  local p_Q = {}; local images = {}; local sum = 0
    local f_S = {13, 17, 24, 67, 60, 69, 62, 64, 72, 74, 76, 79, 82, 28, 86, 30, 33, 36, 39, 42, 45, 48, 51, 54}
    local potions = {"+1 Level", "+1 Enchant", "Shadow Potion", "Max Level", "Max Enchant", "Max Shadow", "Potion of Money", "Potion of Worlds", "Potion of Bubbles"}
    
    -- t_L = holds the transparency of the reset buttons 
    -- p_L = potion slot text, images = potion image array, i_L = holds the slots images,
    -- g_P = table of Potion Names, n_T = table of Instance names, i_T = table of Instances, p_T = table of instance parents
    -- f_S = table of button functions, p_Q = array of user's potion count
    
    local function closeFrames(b)
    	local s = {"Codes", "Index", "Boosts", "Prizes"};
    	for i = 1, #s do LP.PlayerGui.ScreenGui.StatsFrame[s[i]].Visible = b end
    	LP.PlayerGui.ScreenGui.StatsFrame.Coins.More.Visible = b
    	LP.PlayerGui.ScreenGui.StatsFrame.Gems.More.Visible = b
    	LP.PlayerGui.ScreenGui.MainButtons.Visible = b
    	LP.PlayerGui.ScreenGui.Settings.Visible = b
    end
    
    -- returns the index of a potion in the list based on the name of the potion in the parameter - str -
    local function getPotion(str)
    	for i = 1, #potions do if string.match(str, potions[i]) then return i end end
    end
    
    -- function to get the main button to the screen
    local function getp1_F()
    	if LP.PlayerGui.ScreenGui:FindFirstChild("PetsFrame") then LP.PlayerGui.ScreenGui:FindFirstChild("PetsFrame").Parent = nil end
    	local m_B = LP.PlayerGui.ScreenGui.MainButtons
    	local m_UIL = m_B.UIListLayout
        m_B.Pets.Position = UDim2.fromScale(0, 0)
    
    	m_UIL.Parent = LP.PlayerGui; if not m_B.Visible then m_B.Visible = true end
    	for i,v in pairs(m_B:GetChildren()) do if v:IsA("ImageButton") and v.Name ~= "Pets" then v.Visible = false end end
    
    	game:GetService("StarterGui"):SetCore("SendNotification", {
    		Title = "Waiting for PetsFrame...",
    		Text = "Please open your PetsFrame to initialize the potion quantities",
    		Duration = 5
    	})
    
    	repeat wait(); m_B.Pets.Position = UDim2.fromOffset(LP:GetMouse().X - (LP.PlayerGui.ScreenGui.AbsoluteSize.X/1920)*1696, LP:GetMouse().Y - (LP.PlayerGui.ScreenGui.AbsoluteSize.Y/973)*545) 
    	until LP.PlayerGui.ScreenGui:FindFirstChild("PetsFrame")
    
    	m_B.Visible = false
    	m_UIL.Parent = m_B
    end
    
    -- function to count the total number of cumulative and unique potions the user contains
    local function getp2_F(vis)
    	local p_UIL = p_F.Tabs.UIListLayout
        p_F.Tabs.Potions.Position = UDim2.new(0, 0, 0, 0)
    
    	for i, v in pairs(p_F.Tabs:GetChildren()) do if v:IsA("ImageButton") then v.Visible = false end end
    	p_F.Main.Visible = false; p_F.Stats.Visible = false; p_UIL.Parent = LP.PlayerGui
    	p_F.Main.Pages.Potions.List.Grid.UIGridLayout.CellSize = UDim2.fromScale(10, 10)
    
    	game:GetService("StarterGui"):SetCore("SendNotification", {
    		Title = "PetsFrame found...",
    		Text = "Please open your Potions tab to initialize the potion quantities",
    		Duration = 5
    	}) 
    
    	wait(1)
        p_F.Tabs.Potions.Visible = true
        repeat wait(); p_F.Tabs.Potions.Position = UDim2.fromOffset(LP:GetMouse().X - (LP.PlayerGui.ScreenGui.AbsoluteSize.X/1920)*1436, LP:GetMouse().Y - (LP.PlayerGui.ScreenGui.AbsoluteSize.Y/973)*202)
        until p_F.Main.Title.Text == "My Potions"
        p_F.Tabs.Potions.Visible = false
        p_UIL.Parent = p_F.Tabs
        
        p_Max = tonumber(string.sub(p_F.Main.Counters.Stored.Amount.Text, string.find(p_F.Main.Counters.Stored.Amount.Text, "/") + 1, string.len(p_F.Main.Counters.Stored.Amount.Text))) 
    	game:GetService("StarterGui"):SetCore("SendNotification", {
    		Title = "Potions tab found...",
    		Text = "Processing potion quantities...",
    		Duration = 5
    	}) 
    
    	wait(3) -- data may take a few seconds to load
       	for i,v in pairs(p_F.Main.Pages.Potions.List.Grid:GetChildren()) do
       		if v:FindFirstChild("Detail") then p_Q[getPotion(v.Detail.Inner.PotionName.Text)] = p_Q[getPotion(v.Detail.Inner.PotionName.Text)] + 1; sum = sum + 1 end
       	end
       
        p_F.Main.Pages.Potions.List.Grid.UIGridLayout.CellSize = UDim2.fromOffset(115, 115)
    	LP.PlayerGui.ScreenGui.MainButtons.Pets.Position = UDim2.new(0, 0, 0, 0)
    	p_F.Tabs.Potions.Position = UDim2.new(1, 5, 0, 0)
    	p_F.Main.Visible = true; p_F.Stats.Visible = true
    	closeFrames(vis)
    	for i, v in pairs(p_F.Tabs:GetChildren()) do if v:IsA("ImageButton") then v.Visible = true end end
    	for i, v in pairs(LP.PlayerGui.ScreenGui.MainButtons:GetChildren()) do if v:IsA("ImageButton") then v.Visible = true end end
    end
    
    b_F = LP.PlayerGui.ScreenGui:FindFirstChild("BrewingFrame")
    for i = 1, #b_F.Recipes:GetChildren() - 1 do
    	local temp = b_F.Recipes:FindFirstChild("Recipe"..i)
    
    	local Temp = createInstance("TextButton", {Name = temp.Name, Parent = P_List, BackgroundColor3 = Color3.fromRGB(180, 180, 180), BackgroundTransparency = 0.250, Position = UDim2.new(0.035, 0, 0.035 + 0.105*(i - 1), 0), Size = UDim2.new(0, 149, 0, 19), Font = Enum.Font.SourceSans, Text = temp.ItemName.Text, TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000, TextStrokeTransparency = 0.750})
        local TextLabel = createInstance("TextLabel", {Name = "q"..temp.Name, Parent = P_List, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1.000, Position = UDim2.new(0.84, 0, 0.035 + 0.105*(i - 1), 0), Size = UDim2.new(0, 35, 0, 19), Font = Enum.Font.SourceSans, Text = ":  ", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14.000, TextStrokeTransparency = 0.750, TextXAlignment = "Left"})
        local t_UIC = createInstance("UICorner", {CornerRadius = UDim.new(0, 8), Parent = Temp, Name = "UICorner_" .. tostring(17 + i)})
    	
    	table.insert(images, tostring(temp.ItemImage.Image))
    	table.insert(g_P, temp.ItemName.Text)
    end
    
    
    local function reset(index)
        if index == 1 then
            if i_T[13].ImageTransparency ~= 0.5 then
        		for i = 1, 2 do
        			i_T[8]["P_Label"..i].Text = i_T[8]["P_Label"..(i + 1)].Text
        			i_T[8]["P_Reset"..i].ImageTransparency = i_T[8]["P_Reset"..(i + 1)].ImageTransparency
        			i_T[8]["P_Image"..i].Image = i_T[8]["P_Image"..(i + 1)].Image
        			i_T[8]["P_Image"..i].ImageTransparency = i_T[8]["P_Image"..(i + 1)].ImageTransparency
        			i_T[8]["P_Bool"..i].Value = i_T[8]["P_Bool"..(i + 1)].Value
        			p_L[i] = i_T[8]["P_Label"..i].Text
        			t_L[i] = i_T[8]["P_Reset"..i].ImageTransparency
        			i_L[i][0] = i_T[8]["P_Image"..i].Image
        			i_L[i][1] = i_T[8]["P_Image"..i].ImageTransparency
        		end
        		if i_T[21].Text ~= "Empty Potion Slot" then
        			i_T[21].Text = "Empty Potion Slot"
        			i_T[24].ImageTransparency = 0.5
        			i_T[23].ImageTransparency = 1
        			i_T[16].Value = false
        			p_L[3] = i_T[21].Text
        			t_L[3] = 0.5
        			i_L[3][1] = 1
        		end
        		if g_Constraint and i_T[11].Text == "Empty Potion Slot" then
        			g_Constraint = false
        			i_T[80].BackgroundColor3 = Color3.fromRGB(214, 0, 0)
        			i_T[25].Text = "Currently:  Idle"
        		end
        	end
        elseif index == 2 then
            if i_T[17].ImageTransparency ~= 0.5 then
            	i_T[19].Text = i_T[21].Text
            	i_T[18].Image = i_T[23].Image
            	i_T[18].ImageTransparency = i_T[23].ImageTransparency
            	i_T[17].ImageTransparency = i_T[24].ImageTransparency
            	i_T[15].Value = i_T[16].Value
            	p_L[2] = i_T[19].Text
            	t_L[2] = i_T[24].ImageTransparency
            	i_L[2][0] = i_T[23].Image
            	i_L[2][1] = i_T[23].ImageTransparency
            	if i_T[21].Text ~= "Empty Potion Slot" then
            		i_T[21].Text = "Empty Potion Slot"
            		i_T[23].ImageTransparency = 1
            		i_T[24].ImageTransparency = 0.5
            		i_T[16].Value = false
            		p_L[3] = i_T[21].Text
            		t_L[3] = 0.5
            		i_L[3][1] = 1
            	end
            end
        elseif index == 3 then
            if i_T[24].ImageTransparency ~= 0.5 then
        		i_T[21].Text = "Empty Potion Slot"
        		i_T[24].ImageTransparency = 0.5
        		i_T[23].ImageTransparency = 1
        		i_T[16].Value = false
        		p_L[3] = i_T[21].Text
        	    t_L[3] = 0.5; i_L[3][1] = 1
        	end
        end
    end
    
    local function cfun(index, obj)
        if index < 4 then
        	obj.MouseButton1Down:Connect(function() reset(index) end)
        elseif index == 4 then
        	obj.MouseButton1Down:Connect(function()
        		game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer("Teleport", "EventSpawn")
        	end)
        elseif index == 5 then
        	obj.MouseButton1Down:Connect(function() g_UIVis = not g_UIVis; closeFrames(g_UIVis) end)
        elseif index == 6 then
        	obj.MouseButton1Down:Connect(function()
        		game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer("Teleport", "LabSpawn")
        	end)
        elseif index == 7 then
        	obj.MouseButton1Down:Connect(function() if b_F then b_F.Visible = not b_F.Visible end end) 
        elseif index == 8 then
        	obj.MouseButton1Down:Connect(function()
        		local t_bool = LP.PlayerGui.ScreenGui.StatsFrame.Coins.More.Visible
        		for i = 1, #p_Q do p_Q[i] = 0 end; sum = 0
        		getp1_F(); getp2_F(t_bool);
        		LP.PlayerGui.ScreenGui.PetsFrame.Parent = nil;
        	end)
        elseif index == 9 then
            obj.MouseButton1Down:Connect(function()
                game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer("Teleport", "ShardReturn")
            end)
        elseif index == 10 then
            obj.MouseButton1Down:Connect(function()
                game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer("Teleport", "ShardArea")
            end)
        elseif index == 11 then
            obj.MouseButton1Down:Connect(function()
                game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer("Teleport", "OverworldSpawn")
            end)
        elseif index == 12 then
        	obj.MouseButton1Down:Connect(function()
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
        	obj.MouseButton1Down:Connect(function()
        		if b_Constraint then i_T[83].BackgroundColor3 = Color3.fromRGB(214, 0, 0)
        		else i_T[83].BackgroundColor3 = Color3.fromRGB(0, 214, 0) end
        		b_Constraint = not b_Constraint
        	end)
        elseif index == 14 then
        	obj.MouseButton1Down:Connect(function()
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
        	obj.MouseButton1Down:Connect(function()
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
            obj.MouseButton1Down:Connect(function()
                local i = tonumber(string.sub(obj.Name, 7))
                for x = 1, 3 do
        			if i_T[8]["P_Label"..x].Text == "Empty Potion Slot" then
        				i_T[8]["P_Label"..x].Text = obj.Text
        				i_T[8]["P_Reset"..x].ImageTransparency = 0
        				i_T[8]["P_Image"..x].Image = images[i]
        				i_T[8]["P_Image"..x].ImageTransparency = 0
        				i_T[8]["P_Bool"..x].Value = true
        				p_L[x] = obj.Text; i_L[x][0] = images[i]
        				i_L[x][1] = 0; t_L[x] = 0
        				break
        			end 
        		end
            end)
        end
    end
    
    MainUi_3:Clone().Parent = f1
    n_T[1] = name; i_T[1] = MainUi_3; p_T[1] = game:GetService("CoreGui")
    for i, v in pairs(game:GetService("CoreGui")[name]:GetDescendants()) do
    	i_T[i + 1] = v; n_T[i + 1] = v.Name; p_T[i + 1] = v.Parent
    	for x = 1, #f_S do if (i + 1) == f_S[x] then cfun(x, v) end end
    end
    
    -- fills p_Q with blank data then removes the close button on the BrewingFrame
    for i = 1, 9 do table.insert(p_Q, 0) end
    if b_F:FindFirstChild("Close") then b_F.Close.Parent = nil end; b_F.Visible = false
    
    
    Event:FireServer("Teleport", "LabLeaveSpawn"); wait(0.5)
    LP.Character.HumanoidRootPart.CFrame = CFrame.new(-1697.16882, 1855.47021, 11037.1455, 1, 0, -1.93564623e-10, 0, 1, 0, 1.93564623e-10, 0, 1)

    wait(1)
    getp1_F(); p_F = LP.PlayerGui.ScreenGui:FindFirstChild("PetsFrame"); getp2_F(true) 
    Event:FireServer("Teleport", "LabSpawn"); wait(0.5)
    LP.Character.HumanoidRootPart.CFrame = CFrame.new(-1740.89038, 2705.99048, 11044.1572, -0.984202802, -4.41739587e-08, -0.177044764, -3.80400742e-08, 1, -3.80401666e-08, 0.177044764, -3.07044417e-08, -0.984202802)
    LP.PlayerGui.ScreenGui:WaitForChild("BrewingFrame")
    Event:FireServer("Teleport", "LabLeaveSpawn")
    LP.Character["HumanoidRootPart"].Anchored = false
    
    
    -- checks if either the skip b_F is visible, given the visibile attribute value of the parent Brewing b_F
    local function checkSkip(i)
    	return (b_F.Brewing["Brew"..i].Brewing.Visible and b_F.Brewing["Brew"..i].Brewing.Skip.Visible)
    end
    
    spawn(function()
    	while wait(1) do
    		pcall(function()
    			if not LP.PlayerGui.ScreenGui:FindFirstChild("BrewingFrame") then
    				i_T[88].Visible = true
    				repeat i_T[87].Visible = not i_T[87].Visible; wait(1) until LP.PlayerGui.ScreenGui:FindFirstChild("BrewingFrame")
    				i_T[88].Visible = false; i_T[87].Visible = false
    			end
    			if not ((g_Constraint and i_T[80].BackgroundColor3 == Color3.fromRGB(0, 214, 0) and i_T[25].Text == "Currently:  Brewing")
    				or ((not g_Constraint) and i_T[80].BackgroundColor3 == Color3.fromRGB(214, 0, 0) and (i_T[25].Text == "Currently:  Idle" or i_T[25].Text == "No potions to brew!"))) then
    				i_T[80].BackgroundColor3 = Color3.fromRGB(214, 0, 0); i_T[25].Text = "Currently:  Idle"; g_Constraint = false
    			end
    		end)
    	end
    end)
    
    spawn(function()
    	while wait(0.8) do if b_Constraint then game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer("BlowBubble") end end
    end)
    
    spawn(function()
    	while wait(1) do
    		pcall(function()
    			for i = 1, 3 do if i_T[8]["P_Label"..i].Text ~= p_L[i] then i_T[8]["P_Label"..i].Text = p_L[i] end end
    			for i = 1, #g_P do if i_T[29]["Recipe"..i].Text ~= g_P[i] then i_T[29]["Recipe"..i].Text = g_P[i] end end
    			for i = 1, 3 do if i_T[8]["P_Image"..i].Image ~= i_L[i][0] then i_T[8]["P_Image"..i].Image = i_L[i][0] end end
    			for i = 1, 3 do if i_T[8]["P_Image"..i].ImageTransparency ~= i_L[i][1] then i_T[8]["P_Image"..i].ImageTransparency = i_L[i][1] end end
    			for i = 1, 3 do if i_T[8]["P_Reset"..i].ImageTransparency ~= t_L[i] then i_T[8]["P_Reset"..i].ImageTransparency = t_L[i] end end
    		end)
    	end
    end)

    spawn(function()
    	while wait(1) do
    		for i = 1, #i_T do
    			if i_T[i].Parent ~= p_T[i] then 
    			    if i_T[i].Parent == nil then 
    			        pcall(function() i_T[i]:Destroy() end); 
    					for x, c in pairs(f1:GetDescendants()) do 
    					    if x == i then
    					        c:Clone().Parent = p_T[i]; wait(0.5); i_T[i] = p_T[i]:FindFirstChild(n_T[i])
    					        for z, t in pairs(i_T[i]:GetDescendants()) do 
    					            if t.Name == "C_Label" then t.Text = i_T[25].Text end
    					            i_T[x + z] = t
    					            p_T[x + z] = t.Parent
    					            for y = 1, #f_S do
    					                if (x + z) == f_S[y] then
    					                    cfun(y, i_T[x + z])
    					                end
    					            end
    					        end
    					    end
    					end  
    				else i_T[i].Parent = p_T[i] end end
    			if i_T[i].Name ~= n_T[i] then i_T[i].Name = n_T[i] end
    		end
    	end
    end)
    
    -- checks if the user is capable of brewing some potion
    local function checkBrew(str)
    	local s_F = LP.PlayerGui.ScreenGui.StatsFrame; local t_ = {}
    	local stats = {s_F["Gems"].Amount.Text, s_F["Stars"].Amount.Text, s_F["Crystals"].Amount.Text, s_F["Magma"].Amount.Text}
    	for i = 1, #stats do t_[i] = string.gsub(stats[i], ",", ""); t_[i] = tonumber(t_[i]) end
    	local index = getPotion(str)
    	local b
    	pcall(function()
    		if index < 3 then b = t_[1] >= 10000000 
    		elseif index == 3 then b = t_[1] >= 15000000
    		elseif index == 4 then b = (p_Q[1] > 2 and t_[2] >= 20000000); if b then p_Q[1] = p_Q[1] - 3; sum = sum - 3 end
    		elseif index == 5 then b = (p_Q[2] > 2 and t_[3] >= 20000000); if b then p_Q[2] = p_Q[2] - 3; sum = sum - 3 end
    		elseif index == 6 then b = (p_Q[3] > 4 and t_[4] >= 100000000); if b then p_Q[3] = p_Q[3] - 5; sum = sum - 5 end
    		elseif index == 7 then b = (p_Q[6] > 0 and p_Q[4] > 4); if b then p_Q[6] = p_Q[6] - 1; p_Q[4] = p_Q[4] - 5; sum = sum - 6 end
    		elseif index == 8 then b = (p_Q[6] > 0 and p_Q[5] > 4); if b then p_Q[6] = p_Q[6] - 1; p_Q[5] = p_Q[5] - 5; sum = sum - 6 end
    		else b = (p_Q[6] > 2 and t_[1] >= 250000000); if b then p_Q[6] = p_Q[6] - 3; sum = sum - 3 end end
    	end)
    	return b
    end
    
    spawn(function()
    	while wait(1) do 
    		pcall(function() for i = 1, #p_Q do if i_T[29]["qRecipe"..i].Text ~= (":  " .. tostring(p_Q[i])) then i_T[29]["qRecipe"..i].Text = (":  " .. tostring(p_Q[i])) end end end)
    	end
    end)
    
    -- main loop
    spawn(function()
    	while wait(1) do 
    		--pcall(function()
    			if (i_T[80].BackgroundColor3 == Color3.fromRGB(0, 214, 0) and b_F) then
    				for i = 3, 1, -1 do
    					if (not checkSkip(i)) then
    						if b_F.Brewing["Brew"..i].Empty.Visible then
    							for x = 1, 3 do
    								if i_T[8]["P_Label"..x].Text ~= "Empty Potion Slot" and i_T[8]["P_Bool"..x].Value then -- checks for a ready potion
    									if checkBrew(i_T[8]["P_Label"..x].Text) and sum < p_Max then
    										Event:FireServer("BrewPotion", getPotion(i_T[8]["P_Label"..x].Text)) -- brews the potion
    										i_T[8]["P_Bool"..x].Value = false
    									else print("Either you\'ve maxed your potion storage, or you don\'t have enough resources to brew: " .. i_T[8]["P_Label"..x].Text); reset(x) end break
    								end
    							end
    						else
    							for x = 1, 3 do 
    								if b_F.Brewing["Brew"..i].Brewing.ItemName.Text == i_T[8]["P_Label"..x].Text and not i_T[8]["P_Bool"..x].Value then -- checks collected potion is still being brewed
    									i_T[8]["P_Bool"..x].Value = true
    									break
    								end
    							end
    							p_Q[getPotion(b_F.Brewing["Brew"..i].Brewing.ItemName.Text)] = p_Q[getPotion(b_F.Brewing["Brew"..i].Brewing.ItemName.Text)] + 1;  sum = sum + 1
    							Event:FireServer("ClaimPotion", i)
    						end
    						wait(0.5)
    					end
    				end
    			end
    		--end) 
    	end
    end)
    
    warn("\n\nProgram fully loaded! If you encounter any bugs/problems, or, if you have any questions/suggestions, ")
    warn("please PM me either by discord - dooop#0496 - or through V3rmillion.net - Activities12 -")
    MainFrame.Visible = true; f1[name].MainFrame.Visible = true
end
