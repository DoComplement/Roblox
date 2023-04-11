
local mouse = game.Players.LocalPlayer:GetMouse()
local uis = game:GetService("UserInputService")

uis.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 and uis:IsKeyDown(306) then
        print(mouse.target:GetFullName())
    end
end)