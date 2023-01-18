return function()
    local Humanoid = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")
    game:GetService("VirtualUser"):SetKeyDown("0x20");
    task.wait(0.1);
    game:GetService("VirtualUser"):SetKeyUp("0x20");
    repeat task.wait() until Humanoid:GetState().Value == 7; -- wait until state is "Landed"
end;
