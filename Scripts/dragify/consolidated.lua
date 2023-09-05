
-- remove any usage of dx,dy if you want the drag point to always be at the AnchorPoint of Frame

local Mouse = game:GetService("Players").LocalPlayer:GetMouse();						-- can user workspace.Camera.ViewportSize if preferred
local InputChanged = game:GetService("UserInputService").InputChanged;					-- only call GetService once

local Frame,dx,dy = script.Parent,nil,nil;												-- frame to be affected
Frame.Position = UDim2.fromOffset(Mouse.ViewSizeX/2, Mouse.ViewSizeY/4);				-- if the frame position is not based on an Offset

local function updateInput()
	Frame.Position = UDim2.fromOffset(Mouse.X - dx, Mouse.Y - dy);
end

Frame.InputBegan:Connect(function(input)
	if(input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch)then
		dx,dy = Mouse.X - Frame.Position.X.Offset,Mouse.Y - Frame.Position.Y.Offset;		
		select(1, InputChanged:Connect(updateInput), input:GetPropertyChangedSignal("UserInputState"):Wait()):Disconnect();
	end;
end);
