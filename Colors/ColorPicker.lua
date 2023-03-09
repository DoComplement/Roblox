local function CreateInstance(ObjectType, Properties)
	local Instance = CreateInstance(ObjectType);
	for Attribute, Value in next, Properties do
		Instance[Attribute] = Value;
	end;
	return Instance;
end)

local ScreenGui = CreateInstance("ScreenGui", {
	Parent = game:GetService("CoreGui"),
	Name = "ColorPicker",
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
});
local Frame = CreateInstance("Frame", {
	Parent = ScreenGui,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	Position = UDim2.new(0.0690362304, 0, 0.115960099, 0),
	Size = UDim2.new(0, 241, 0, 105)
});

local Button = CreateInstance("TextButton", {
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
CreateInstance("UICorner", {
	CornerRadius = UDim.new(1, 0),
	Parent = Button
});
local Keep = CreateInstance("TextButton", {
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
CreateInstance("UICorner", {
	CornerRadius = UDim.new(1, 0),
	Parent = Keep
});
local Next = CreateInstance("TextButton", {
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
CreateInstance("UICorner", {
	CornerRadius = UDim.new(1, 0),
	Parent = Next
});

local Filename = "ColorPicks_"..tostring(math.random(1e+3, 1e+4))..".lua";
writefile(Filename, "return {");

local Changed,Index = CreateInstance("BindableEvent").Event,nil;
local Colors = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Colors/All.lua"))();

task.defer(function()
	for idx,Color in ipairs(Colors) do
		Index=idx;
		Button.BackgroundColor3 = Color;
		Button.Text = BrickColor.new(Color).Name;
		Changed:Wait();
	end;
	ScreenGui:Destroy();
end);

local c1,c2 = nil,nil;
c1 = Next.MouseButton1Down:Connect(function() Changed:Fire() end);
c2 = Keep.MouseButton1Down:Connect(function()
	appendfile(Filename, "\n\t["..Index.."] = Color3.new("..tostring(Button.BackgroundColor3)..");\t-- "..Button.Text));
	Changed:Fire();
end);
ScreenGui.Destroying:Once(function()
	appendfile(Filename, "\n};");
	c1=c1:Disconnect();
	c2=c2:Disconnect();
end)

