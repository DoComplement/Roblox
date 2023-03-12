--[[ (need to) optimize the code
optimize the scope
optimize the script itself to achieve the multiple tasks efficiently
]]


-- initialize zone data table
local Zones = (function(Zones)
    for id,details in next,require(game.ReplicatedStorage.Modules.LocalConfig.WorldConfig) do
        Zones.zones[details.WorldName]=id;
        Zones[id]={};
    end;
    return Zones;
end)({zones={}});

-- format zone data
local PetConfig = require(game.ReplicatedStorage.Modules.LocalConfig.PetConfig);
local floor,conversion=math.floor,{
    [1]={4,1,''};
    [2]={7,1e+3,'k'};
    [3]={10,1e+6,'m'};
    [4]={13,1e+9,'b'};
    [5]={16,1e+12,"Qa"};
};
local function Abbreviate(num)
    local len=tostring(floor(num)):len();
    for _,d in ipairs(conversion) do
        if len<d[1] then
            return ((num/d[2]..d[3]):gsub("%.0+",''));
        end;
    end;
end;

local DeleteToggles = {};
local function ToggleAutoPetDelete(Deleting1,Deleting2,Power)
    
    -- Unnecessarily called when Deleting1.Visible is changed
    Deleting2:GetPropertyChangedSignal("Visible"):Connect(function()
        Deleting1.Visible = Deleting2.Visible;
    end);
    
    return function()
        Deleting2.Visible   = Deleting1.Visible;
        DeleteToggles[Power]= Deleting2.Visible;
    end;
end;

local DrawUI = game:GetService("Players").LocalPlayer.PlayerGui.DrawUI;
local DeletePet = game:GetService("ReplicatedStorage").Remotes.RE_PetDelete;
local List = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UI.CenterMenu.Index.PetsContainer.List;

local function ConnectAutoDeleteList(EggList)
    for _,Pet in ipairs(EggList.List.Pets:GetChildren()) do
        if Pet:IsA("TextButton") then
            Pet.Deleting:GetPropertyChangedSignal("Visible"):Connect(ToggleAutoPetDelete(Pet.Deleting,List[EggList.Name].List[Pet.Name].Info.Deleting,Abbreviate(PetConfig[Pet.Name].Power)));
        end;
    end;
end;

local function ConnectEggIndices(Name,Eggs,Count,Total)
    local function Update()
        Count+=1;
        print(Name,"TOTAL CHANGED:",Count..'/'..Total);
    end;
    
    Total=#Eggs-1;
    for idx,Pet in ipairs(Eggs) do
        if idx==1 then continue end;
        local Deleting,Power = Pet.Info.Deleting,Abbreviate(PetConfig[Pet.Name].Power);
        Pet.Info.MouseButton1Click:Connect(function()
            Deleting.Visible=not Deleting.Visible;
            DeleteToggles[Power]=Deleting.Visible;
        end);
        if Pet.Info.Unlock.Visible then
            Count+=1;
            Pet.Info.Unlock:GetPropertyChangedSignal("Visible"):Once(Update);
        end;
    end
    Count=Total-Count;
    print(Name,Count..'/'..Total);
end;

for Egg,Data in next,require(game.ReplicatedStorage.Modules.LocalConfig.DrawConfig) do
    if Data.Type==1 then
        print('\n',Data.WorldIds);
        ConnectEggIndices(Egg,List[Egg].List:GetChildren(),0,0);
        table.insert(Zones[Data.WorldIds],{
            [1]=Egg;
            [2]=Data.Price;
            [3]=Abbreviate(Data.Price);
        });
    end;
end;

local PetInventory = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UI.CenterMenu.PetsInventory.PetsContainer.Right.List;
PetInventory.ChildAdded:Connect(function(child)
    if DeleteToggles[child.Info.Power.Text] then
        DeletePet.FireServer(DeletePet,{child.Name});
    end;
end);

for _,EggList in ipairs(DrawUI:GetChildren()) do
    ConnectAutoDeleteList(EggList)
end;

DrawUI.ChildAdded:Connect(ConnectAutoDeleteList);
