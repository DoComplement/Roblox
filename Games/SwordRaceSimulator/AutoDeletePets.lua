
-- Work in progress. The game doesn't automatically delete pets if eggs are being opened faster than expected, so this script is necessary;

local function SweepPetDelete()
    
end;

local DeletePet,DeleteToggles = game:GetService("ReplicatedStorage").Remotes.RE_PetDelete,{};
local PetInventory = game:GetService("Players").lpMT0dQb.PlayerGui.MainUI.UI.CenterMenu.PetsInventory.PetsContainer.Right.List;
PetInventory.ChildAdded:Connect(function(child)
    print("NewPet",child.Info.Power.Text);
    if DeleteToggles[child.Info.Power.Text] then
        print("Attempting Auto Delete",child.Info.Power.Text);
        DeletePet.FireServer(DeletePet,{child.Name});
    end;
end);

local function ToggleAutoPetDelete(Pet,Power)
    return function()
        DeleteToggles[Power]=not Pet.Deleting.Visible;
    end;
end;

local PetConfig = require(game.ReplicatedStorage.Modules.LocalConfig.PetConfig);
local floor,conversion = math.floor,{
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
local function ConnectAutoDeleteList(EggList)
    for _,Pet in ipairs(EggList.List.Pets:GetChildren()) do
        if Pet:IsA("TextButton") then
            Pet.MouseButton1Click:Connect(ToggleAutoPetDelete(Pet,Abbreviate(PetConfig[Pet.Name].Power)));
        end;
    end;
end;


local DrawUI = game:GetService("Players").LocalPlayer.PlayerGui.DrawUI;
for _,EggList in ipairs(DrawUI:GetChildren()) do
    ConnectAutoDeleteList(EggList)
end;

game:GetService("Players").LocalPlayer.PlayerGui.DrawUI.ChildAdded:Connect(ConnectAutoDeleteList);
