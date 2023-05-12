local function setVals(class, parent, props)
	local inst = Instance.new(class);
	for prop,val in next,props do
		inst[prop] = val;
	end;
	inst.Parent = parent;
	return inst;
end)

local ScreenGui = setVals("ScreenGui",game:GetService("CoreGui"), {
	Name = "ColorPicker",
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
});

local Frame = setVals("Frame", game:GetService("CoreGui"), {
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	Position = UDim2.new(0.0690362304, 0, 0.115960099, 0),
	Size = UDim2.new(0, 241, 0, 105)
});

local Button = setVals("TextButton", Frame, {
	Name = "Button",
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
setVals("UICorner", Button, {CornerRadius = UDim.new(1, 0)});
local Keep = setVals("TextButton", nil, {
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
setVals("UICorner", Keep, {CornerRadius = UDim.new(1, 0)});
local Next = setVals("TextButton", Frame, {
	Name = "Next",
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
setVals("UICorner", Next, {CornerRadius = UDim.new(1, 0)});

local Filename = "ColorPicks_"..tostring(math.random(1e+3, 1e+4))..".lua";
writefile(Filename, ");

local Changed,Index = Instance.new("BindableEvent").Event,nil;
local Colors = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DoComplement/Roblox/main/Colors/All.lua")),"failed to get colors")();

task.defer(function()
	for idx,Color in ipairs(Colors) do
		Index = idx;
		Button.BackgroundColor3 = Color;
		Button.Text = BrickColor.new(Color).Name;
		Changed:Wait();
	end;
	ScreenGui:Destroy();
end);

local fmt = {"return {"};
local c1,c2 = nil,nil;
c1 = Next.MouseButton1Down:Connect(function() Changed:Fire() end);
c2 = Keep.MouseButton1Down:Connect(function()
	
	fmt[#fmt + 1] = "\t["..Index.."] = Color3.new("..tostring(Button.BackgroundColor3)..");\t-- "..Button.Text;
	Changed:Fire();
end);

fmt[#fmt + 1] = "};";
ScreenGui.Destroying:Once(function()
	writefile(Filename, '\n');
	c1 = c1:Disconnect();
	c2 = c2:Disconnect();
end)

