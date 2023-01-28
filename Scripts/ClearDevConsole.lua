-- messages after each clear will reappear every time the dev console is re-opened
-- the function can be bound to a keybind to clear the console on some command as well as setting the command to F9 so the console always opens cleared

local function OpenDevConsole(DevConsoleUI)
    if DevConsoleUI:FindFirstChild("MainView") ~= nil then
        return DevConsoleUI.MainView;
    end;
    local Box = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar;
    game:GetService("VirtualUser"):CaptureController();
    Box:SetTextFromInput("/console");
    Box:CaptureFocus();
    game:GetService("VirtualUser"):TypeKey("0x0D"); -- Press Enter Key
    return DevConsoleUI:WaitForChild("MainView");
end;

return function()
    for _,Instance in ipairs(OpenDevConsole(game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI).ClientLog:GetChildren()) do
        if tonumber(Instance.Name) == nil then continue; end;
        Instance.Visible = false; 
    end;
end;
