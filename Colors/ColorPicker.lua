local CreateInstance
CreateInstance = hookfunction(Instance.new, function(ObjectType, Properties)
	if checkcaller() and type(Properties) == "table" then
		local Instance = CreateInstance(ObjectType)
		for Attribute, Value in next, Properties do
			Instance[Attribute] = Value
		end
		return Instance
	else
		return CreateInstance(ObjectType, Properties) 
	end
end)

local ScreenGui = Instance.new("ScreenGui", {
	Parent = game:GetService("CoreGui"),
	Name = "ColorPicker",
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
});
local Frame = Instance.new("Frame", {
	Parent = ScreenGui,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	Position = UDim2.new(0.0690362304, 0, 0.115960099, 0),
	Size = UDim2.new(0, 241, 0, 105)
});

local Button = Instance.new("TextButton", {
	Name = "Button",
	Parent = Frame,
	BackgroundColor3 = Color3.fromRGB(0, 150, 150),
	BorderSizePixel = 0,
	Position = UDim2.new(0.102102205, 0, 0.112744287, 0),
	Size = UDim2.new(0, 190, 0, 30),
	ZIndex = 2,
	Font = Enum.Font.GothamMedium,
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 13.000,
	TextWrapped = true,
});
Instance.new("UICorner", {
	CornerRadius = UDim.new(1, 0),
	Parent = Button
});
local Keep = Instance.new("TextButton", {
	Name = "Keep",
	Parent = Frame,
	BackgroundColor3 = Color3.fromRGB(0, 150, 0),
	BorderSizePixel = 0,
	Position = UDim2.new(0.133443952, 0, 0.540857196, 0),
	Size = UDim2.new(0, 80, 0, 30),
	ZIndex = 2,
	Font = Enum.Font.GothamMedium,
	Text = "Keep",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 13.000,
	TextWrapped = true,
});
Instance.new("UICorner", {
	CornerRadius = UDim.new(1, 0),
	Parent = Keep
});
local Next = Instance.new("TextButton", {
	Name = "Next",
	Parent = Frame,
	BackgroundColor3 = Color3.fromRGB(0, 150, 0),
	BorderSizePixel = 0,
	Position = UDim2.new(0.523485422, 0, 0.540857196, 0),
	Size = UDim2.new(0, 80, 0, 30),
	ZIndex = 2,
	Font = Enum.Font.GothamMedium,
	Text = "Next",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 13.000,
	TextWrapped = true,
});
Instance.new("UICorner", {
	CornerRadius = UDim.new(1, 0),
	Parent = Next
});
local Filename = "ColorPicks_"..tostring(math.random(1e+6, 1e+7))..".lua";
writefile(Filename, "return {");
local Changed = false;
local Index = 1;
local Colors = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Colors/All.lua"))();

local t,c1,c2
t = task.defer(function()
	for _,Color in ipairs(Colors) do
		Button.BackgroundColor3 = Color3.new(unpack(Color));
		Button.Text = tostring(BrickColor.new(Button.BackgroundColor3));
		Changed = true;
		while Changed do task.wait() end
		if Button.Text == "Hot pink" then ScreenGui:Destroy() end
	end
end);

local function PickColor()
	appendfile(Filename, "\n\t["..Index.."] = {"..tostring(Button.BackgroundColor3).."},\t-- "..tostring(BrickColor.new(Button.BackgroundColor3)))
	Changed = false;
	Index = Index + 1;
	if Button.Text == "Hot pink" then ScreenGui:Destroy() end
end

c1 = Next.MouseButton1Down:Connect(function() Changed = false end);
c2 = Keep.MouseButton1Down:Connect(PickColor);
ScreenGui.Destroying:Once(function()
	appendfile(Filename, "\n};");
	task.cancel(t);
	c1:Disconnect();
	c2:Disconnect();
end)

