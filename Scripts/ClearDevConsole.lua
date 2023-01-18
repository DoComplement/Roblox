-- messages after each clear will reappear every time the dev console is re-opened
-- the function can be bound to a keybind to clear the console on some command as well as setting the command to F9 so the console always opens cleared

local function OpenDevConsole()
    local Box = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
    
    game:GetService("VirtualUser"):CaptureController();
    Box:SetTextFromInput("/console");
    Box:CaptureFocus();
    game:GetService("VirtualUser"):TypeKey("0x0D"); -- Press Enter Key
end;

local function GetConsole()
    if game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI:FindFirstChild("MainView") == nil then
        OpenDevConsole();
    end;
    return game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView");
end;

return function()
    for _,Instance in ipairs(GetConsole().ClientLog:GetChildren()) do
        if tonumber(Instance.Name) ~= nil then
            Instance:Destroy();
        end;
    end;
end;
