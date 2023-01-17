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
	Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"),
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
});
local Frame = Instance.new("Frame", {
	Parent = ScreenGui,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	Position = UDim2.new(0.0690362304, 0, 0.115960099, 0),
	Size = UDim2.new(0, 241, 0, 115)
});
local Button = Instance.new("TextButton", {
	Name = "Button",
	Parent = Frame,
	BackgroundColor3 = Color3.fromRGB(0, 150, 150),
	BorderSizePixel = 0,
	Position = UDim2.new(0, 25, 0, 5),
	Size = UDim2.new(0, 190, 0, 30),
	ZIndex = 2,
	Font = Enum.Font.GothamMedium,
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 13.000,
	TextWrapped = true,
});
local End = Instance.new("TextButton", {
	Name = "End",
	Parent = Frame,
	BackgroundColor3 = Color3.fromRGB(150, 0, 0),
	BorderSizePixel = 0,
	Position = UDim2.new(0.328464687, 0, 0.712285757, 0),
	Size = UDim2.new(0, 80, 0, 30),
	ZIndex = 2,
	Font = Enum.Font.GothamMedium,
	Text = "End",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 13.000,
	TextWrapped = true,
});
local Next = Instance.new("TextButton", {
	Name = "Next",
	Parent = Frame,
	BackgroundColor3 = Color3.fromRGB(0, 0, 150),
	BorderSizePixel = 0,
	Position = UDim2.new(0, 130, 0, 45),
	Size = UDim2.new(0, 80, 0, 30),
	ZIndex = 2,
	Font = Enum.Font.GothamMedium,
	Text = "Next",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 13.000,
	TextWrapped = true,
});
local Add = Instance.new("TextButton", {
	Name = "Add",
	Parent = Frame,
	BackgroundColor3 = Color3.fromRGB(0, 150, 0),
	BorderSizePixel = 0,
	Position = UDim2.new(0, 30, 0, 45),
	Size = UDim2.new(0, 80, 0, 30),
	ZIndex = 2,
	Font = Enum.Font.GothamMedium,
	Text = "Add",
	TextColor3 = Color3.fromRGB(255, 255, 255),
	TextSize = 13.000,
	TextWrapped = true,
});

Instance.new("UICorner", {
	CornerRadius = UDim.new(1, 0),
	Parent = Button
});
Instance.new("UICorner", {
	CornerRadius = UDim.new(1, 0),
	Parent = End
})
Instance.new("UICorner", {
	CornerRadius = UDim.new(1, 0),
	Parent = Next
})
Instance.new("UICorner", {
	CornerRadius = UDim.new(1, 0),
	Parent = Add
})

local Filename = "RandomColorPicks_"..math.random(1e+6, 1e+7)..".lua";
writefile(Filename, "return {");
local Changed = false;
local Index = 1;

local t,c1,c2
t = task.defer(function()
	while true do
		Button.BackgroundColor3 = BrickColor.random().Color;
		Changed = true;
		while Changed do task.wait() end
	end
end);

local function PickColor()
	appendfile(Filename, "\n\t["..Index.."] = "..tostring(Button.BackgroundColor3)..',')
	Changed = false;
	Index = Index + 1;
end

c1 = Next.MouseButton1Down:Connect(function() Changed = false end);
c2 = Add.MouseButton1Down:Connect(PickColor);

End.MouseButton1Down:Once(function()
	appendfile(Filename, "\n};")
	task.cancel(t);
	c1:Disconnect();
	c2:Disconnect();
	ScreenGui:Destroy();
end);
