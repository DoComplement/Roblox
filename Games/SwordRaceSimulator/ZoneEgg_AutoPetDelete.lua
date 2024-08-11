--[[ (need to) optimize the code
optimize the scope
optimize the script itself to achieve the multiple tasks efficiently
]]

-- format zone data
local PetConfig = require(game.ReplicatedStorage.Modules.LocalConfig.PetConfig);
local Abbreviate = nil;

do
	local consts = {
		[1] = {1,""};
		[2] = {1e-3,"k"};
		[3] = {1e-6,"m"};
		[4] = {1e-9,"b"};
		[5] = {1e-12,"Qa"};
	}; -- and so on

	local log10 = math.log10;
	Abbreviate = function(num,idx)
		idx = consts[1 + log10(num)//3];
		if(not idx)then return(num)end;
		return (num*idx[1]*10)//10 .. idx[2];
	end;
end;

local DeleteToggles = {};
local function ToggleAutoPetDelete(Deleting1, Deleting2, Power)
    Deleting2.Parent.MouseButton1Click:Connect(function()
		Deleting1.Visible = not Deleting2.Visible; -- implicitely calls the signal below
    end);
    
    Deleting1:GetPropertyChangedSignal("Visible"):Connect(function()
        Deleting2.Visible = Deleting1.Visible;
        DeleteToggles[Power] = Deleting1.Visible;
    end);
end;

local DrawUI = game:GetService("Players").LocalPlayer.PlayerGui.DrawUI;
local DeletePet = game.ReplicatedStorage.Remotes.RE_PetDelete;
local List = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UI.CenterMenu.Index.PetsContainer.List;
local Signals = {};

local function ConnectEggIndices(Name,Eggs,Count,Total)
    local function Update()
        Count+=1;
        print(Name,"TOTAL CHANGED:",Count..'/'..Total);
    end;
    
    Total=#Eggs-1;
    for idx,Pet in ipairs(Eggs) do
        if idx==1 then continue end;
        local Deleting,Power = Pet.Info.Deleting,Abbreviate(PetConfig[Pet.Name].Power);
        Signals[Pet.Name] = Pet.Info.MouseButton1Click:Connect(function()
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

-- initialize zone data table
local Zones = (function(Zones)
    for id,details in next,require(game.ReplicatedStorage.Modules.LocalConfig.WorldConfig) do
        Zones.zones[details.WorldName]=id;
        Zones[id]={};
    end;
    return Zones;
end)({zones={}});

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

local PetsContainer = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UI.CenterMenu.PetsInventory.PetsContainer.Right.List;
PetsContainer.ChildAdded:Connect(function(child)
    if DeleteToggles[child.Info.Power.Text] then
        DeletePet.FireServer(DeletePet,{child.Name});
    end;
end);

local Size,Signal = #PetsContainer,nil;
local function ConnectAutoDeleteList(EggList)
	if #DrawUi:GetChildren()==Size then Signals,Signal=Signal:Disconnect(),nil end;
    for _,Pet in ipairs(EggList.List.Pets:GetChildren()) do
        if Pet:IsA("TextButton") and Signals[Pet.Name]~=nil then
			Signals[Pet.Name]=Signals[Pet.Name]:Disconnect();
            ToggleAutoPetDelete(Pet.Deleting,List[EggList.Name].List[Pet.Name].Info.Deleting,Abbreviate(PetConfig[Pet.Name].Power));
        end;
    end;
end;

for _,EggList in ipairs(DrawUI:GetChildren()) do
    ConnectAutoDeleteList(EggList)
end;

Signal = DrawUI.ChildAdded:Connect(ConnectAutoDeleteList);
