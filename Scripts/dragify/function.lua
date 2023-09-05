
-- remove any usage of dx,dy if you want the drag point to always be at the AnchorPoint of Frame

local Mouse = game:GetService("Players").LocalPlayer:GetMouse();						-- can user workspace.Camera.ViewportSize if preferred
local InputChanged = game:GetService("UserInputService").InputChanged;					-- only call GetService once

-- a new event-connection function is made each namecall ( game.Changed:Connect(...) ), so use these for performance
local Connect,Wait = game.Changed.Connect,game.Changed.Wait;
local GetPropertyChangedSignal = game.GetPropertyChangedSignal;
local Disconnect = game.Changed:Once(tick).Disconnect;

local MB1,Touch = Enum.UserInputType.MouseButton1,Enum.UserInputType.Touch;

return function(Frame)
    Frame.Position = UDim2.fromOffset(Mouse.ViewSizeX/2, Mouse.ViewSizeY/4);				-- use with caution
    
    local dx,dy = nil,nil;
    local function updateInput()
        Frame.Position = UDim2.fromOffset(Mouse.X - dx, Mouse.Y - dy);
    end;
    
    Frame.InputBegan:Connect(function(input)
    	if(input.UserInputType == MB1 or input.UserInputType == Touch)then
    		dx,dy = Mouse.X - Frame.Position.X.Offset,Mouse.Y - Frame.Position.Y.Offset;		
    		Disconnect(select(1, Connect(InputChanged, updateInput), Wait(GetPropertyChangedSignal(input, "UserInputState"))));
    	end;
    end);
end;
