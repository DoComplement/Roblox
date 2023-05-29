
-- https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub

if(nil~=getgenv()["iyy@B[W?^KMb:Lk[[p*_"])then return end;
getgenv()["iyy@B[W?^KMb:Lk[[p*_"] = true;
if(not game:IsLoaded())then game.Loaded:Wait()end;

local StartTime = tick();

assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Anti-Cheat")), "invalid anti cheat url")();
assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.G-Hub-Games-List")), "invalid game list url")();               -- loads Games and Unknown into game env

do  -- intro frame ?
    local BlurEffect = Instance.new("BlurEffect");
    BlurEffect.Size = 0;
    BlurEffect.Parent = game:GetService("Lighting");

    local ScreenGui = Instance.new("ScreenGui");
    if(not gethui)then
        if(nil~=syn)then syn.protect_gui(ScreenGui)end;
        ScreenGui.Parent = game:GetService("CoreGui");
    else
        ScreenGui.Parent = gethui();
    end;

    local ImageLabel = Instance.new("ImageLabel");
    ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1);
    ImageLabel.BackgroundTransparency = 1;
    ImageLabel.Position = UDim2.new(0.5, -151.5, 0.5, -131.5);
    ImageLabel.Rotation = 0;
    ImageLabel.Size = UDim2.new(0, 303, 0, 263);
    ImageLabel.Image = "rbxassetid://8429081004";
    ImageLabel.ImageTransparency = 1;
    ImageLabel.Parent = ScreenGui;

    for idx = 1,50,2 do
        BlurEffect.Size = idx;
        ImageLabel.ImageTransparency -= 0.1;
        task.wait();
    end;

    task.wait(0.1)
    ImageLabel:TweenPosition(UDim2.new(0.5, 342, 0.5, 131.5), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5);
    task.wait(0.1)

    for idx = 49,1,-2 do
        BlurEffect.Size = idx;
        ImageLabel.ImageTransparency += 0.1;
        wait()
    end

    BlurEffect:Destroy();
    ScreenGui:Destroy();
end;

SendNotification(
    "Warning";
    "RightControl to toggle if the gui does not show up then the game is not supported please try again later or never if the game is supported the gui will pop up reguardless GOOD DAY!";
    "rbxassetid://8429081004";
    5;
);
SendNotification(
    "Credits";
    "Applebees, CharWar Serverhops Toxic Mods screen thingy And Kiriot22 esp,IY for fly script inspiration,Staylin Save Settings,Felix for being sexy, E621 Anticheat bypasses";
    "rbxassetid://8429081004";
    5;
);

(queue_on_teleport or syn and syn.queue_on_teleport)([[
    if(nil~=getgenv()["iyy@B[W?^KMb:Lk[[p*_"])then return end;
    getgenv()["iyy@B[W?^KMb:Lk[[p*_"] = true;
	if(not game:IsLoaded())then game.Loaded:Wait()end;
    task.wait(5);
    print("ServerHopped or rejoined");
	assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub")), "invalid loader")();
]]);

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "V.G Hub Discord";
    Text = "Copy to clipboard?";
    Duration = 5,;
    Callback = function Instance.new("BindableFunction").OnInvoke(response)
        if(response=="Yes")then
            setclipboard("https://discord.gg/HUBfmJUA2H")
            SendNotification("Discord", "Discord Link Copying Sucessful", "rbxassetid://8429081004", 15);
        end;
    end;
    Button1 = "Yes";
    Button2 = "No";
});

(function()
    for pid,url in next,Games do
        if(pid==game.PlaceId)then
            assert(loadstring(game:HttpGet(url)), "invalid url: "..url)();
            return;
        end
    end
    
    for pid_list,url in next,Unknown do
        if(nil~=table.find(pid_list,game.PlaceId))then
            assert(loadstring(game:HttpGet(url)), "invalid url: "..url)();
            return;
        end;
    end;
end);

print("V.G Hub Took ", StartTime - tick(), " To Load");