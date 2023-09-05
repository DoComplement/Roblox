-- fixed error where multiple gui objects could be moved simultaneously
-- there still exists erroneous cases where, when trying to move a gui object while other dragified objects are overlapping, the unintended gui object may be selected and dragged

-- remove any usage of dx,dy if you want the drag point to always be at the AnchorPoint of Frame

local Mouse = game:GetService("Players").LocalPlayer:GetMouse();						-- can user workspace.Camera.ViewportSize if you do not want to user Mouse

-- use newcclosure for the following functions
local InputChanged = game:GetService("UserInputService").InputChanged;					-- ease-of-access

-- a new event-connection function is made each namecall ( game.Changed:Connect(...) ), so use these for performance
local Connect,Wait = game.Changed.Connect,game.Changed.Wait;
local GetPropertyChangedSignal = game.GetPropertyChangedSignal;
local Disconnect = game.Changed:Once(tick).Disconnect;

local MB1,Touch = Enum.UserInputType.MouseButton1,Enum.UserInputType.Touch;

-- converts scale to offset
local function normalize(Frame, Position)
	if(Position.X.Scale == 0 and Position.Y.Scale == 0)then 
		return;
	elseif(Frame.Parent ~= nil and Frame.Parent.ClassName ~= "ScreenGui")then
		Frame.Position = UDim2.fromOffset(Position.X.Scale*Frame.Parent.Size.X.Offset, Position.Y.Scale*Frame.Parent.Size.Y.Offset);
	else
		Frame.Position = UDim2.fromOffset(Position.X.Scale*Mouse.ViewSizeX, Position.Y.Scale*Mouse.ViewSizeY);
	end
end

local target,active = {},nil;

local function pop()table.remove(target)end;
local function add(Frame)
	return function()
		if(active)then
			table.insert(target, 1, Frame);
		else
			target[#target + 1] = Frame;
		end;
	end
end

return function(Frame)
	local dx,dy = nil,nil;												
	normalize(Frame, Frame.Position);

	local function updateInput()
		Frame.Position = UDim2.fromOffset(Mouse.X - dx, Mouse.Y - dy);
	end
	
	Frame.MouseEnter:Connect(add(Frame));
	Frame.MouseLeave:Connect(pop);
	
	Frame.InputBegan:Connect(function(input)
		print(#target, Frame, target[#target]);
		if(target[#target] == Frame and(input.UserInputType == MB1 or input.UserInputType == Touch))then
			active,dx,dy = true,Mouse.X - Frame.Position.X.Offset,Mouse.Y - Frame.Position.Y.Offset;		
			active = Disconnect(select(1, Connect(InputChanged, updateInput), Wait(GetPropertyChangedSignal(input, "UserInputState"))));
		end;
	end);
end;
