local hrp = game:GetService("Players").LocalPlayer.Character.PrimaryPart;

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(Character)
    Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
    hrp = Character.PrimaryPart;
end);

local eggQueue = {};
local boxQueue = {};
local a1,a2 = false,false;
local waitEvent = Instance.new("BindableEvent");

local function tp2Boxes(box,cf)
    a1 = true;
    cf = hrp.CFrame;
    while(#boxQueue>0)do
        box = table.remove(boxQueue);
        repeat hrp.CFrame = box.CFrame;
        until task.wait(0.1)and(box.Transparency~=0 or not(box.Parent));
    end;
    hrp.CFrame = cf;
    a1 = false;
    waitEvent:Fire();
end;


local f = game:GetService("ReplicatedStorage").EventControllers.Easter.EasterBadgeItem;
local g = f.Parent.GetEasterEggs;
local i = f.InvokeServer;

do                                                  -- initialize
    local ref = game:GetService("Players").LocalPlayer.PlayerGui.GUI.Craftsman.Pages.Easter.Scrolling:GetChildren();
    if(#ref>2)then
        local eggs = i(g);                              -- update frame
        for idx,egg in ipairs(ref)do
            if(egg.Name=="SampleBadge"and not(egg.Icon.Visible)and eggs[egg.Name]~=nil)then
                i(f,egg.Name);
            end;
        end;
    end;
end;

-- on egg claimed
local function checkEgg(egg)
    if(i(g)[egg]==1)then
        i(f,egg);
    end;
end;

local function tp2Eggs(egg,cf)
    a2 = true;
    cf = hrp.CFrame;
    while(#eggQueue>0)do
        egg = table.remove(eggQueue);
        hrp.CFrame = egg.CFrame;
        while(task.wait(0.3)and egg.Parent~=nil)do
            hrp.CFrame = egg.CFrame;
            fireproximityprompt(egg.ProximityPrompt, 2);
        end;
        task.delay(1,checkEgg,egg.Name);
    end;
    hrp.CFrame = cf;
    a2 = false;
    waitEvent:Fire();
end;

local function fillBox(box)
    table.insert(boxQueue,1,box);
    if(a1)then return end;
    if(a2)then
        waitEvent.Event:Wait();
    end;
    tp2Boxes();
end;

local function fillEgg(egg)
    table.insert(eggQueue,1,egg);
    if(a2)then return end;
    if(a1)then
        waitEvent.Event:Wait();
    end;
    tp2Eggs();
end;

for _,path in ipairs({Workspace.Easter["EASTER ISLAND EGG SPAWNS"],Workspace.Map.EGG_SPAWNS})do
    for idx,egg in ipairs(path:GetChildren())do
        egg.ChildAdded:Connect(fillEgg);
        fillEgg(egg:GetChildren()[1]);
    end;
end;

for _,box in ipairs(Workspace.Boxes:GetChildren())do
    table.insert(boxQueue,1,box);
end;

Workspace.Boxes.ChildAdded:Connect(fillBox);
tp2Eggs();
tp2Boxes();
