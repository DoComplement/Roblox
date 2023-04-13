-- messages after each clear will reappear every time the dev console is re-opened
-- the function can be bound to a keybind to clear the console on some command as well as setting the command to F9 so the console always opens cleared
if(not game:IsLoaded())then game.Loaded:Wait()end;

local VirtualUser = game:GetService("VirtualUser");
local ChatBar = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar;
local DevConsoleUi = game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI;

local function OpenDevConsole()
    if(not DevConsoleUI:FindFirstChild("MainView"))then
        ChatBar:SetTextFromInput("/console",VirtualUser:CaptureController());
        VirtualUser:TypeKey("0x0D",ChatBar:CaptureFocus()); -- Press Enter Key
        DevConsoleUI.ChildAdded:Wait();
    end;
    return game.GetChildren(DevConsoleUI.MainView.ClientLog);
end;

return function()
    for _,inst in ipairs(OpenDevConsole()) do
        if(tonumber(inst.Name)~=nil)then
            Instance.Visible = false;
        end;
    end;
end;
