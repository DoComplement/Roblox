
-- initialize zone data table
local Zones = (function(Zones)
    for id,details in next,require(game.ReplicatedStorage.Modules.LocalConfig.WorldConfig) do
        Zones.zones[details.WorldName]=id;
        Zones[id]={};
    end;
    return Zones;
end)({zones={}});

do -- format zone data
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
    
    local function ConnectEggIndices(Name,Eggs,Count,Total)
        local function Update()
            Count+=1;
            print(Name,"TOTAL CHANGED:",Count..'/'..Total);
        end;
        
        Total=#Eggs-1;
        for idx,Pet in ipairs(Eggs) do
            if idx>1 and Pet.Info.Unlock.Visible then
                Count+=1;
                Pet.Info.Unlock:GetPropertyChangedSignal("Visible"):Once(Update);
            end;
        end
        Count=Total-Count;
    end;
    
    local List = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UI.CenterMenu.Index.PetsContainer.List;
    for Egg,Data in next,require(game.ReplicatedStorage.Modules.LocalConfig.DrawConfig) do
        if Data.Type==1 then
            ConnectEggIndices(Egg,List[Egg].List:GetChildren(),0,0);
            table.insert(Zones[Data.WorldIds],{
                [1]=Egg;
                [2]=Data.Price;
                [3]=Abbreviate(Data.Price);
            });
        end;
    end;
end;
