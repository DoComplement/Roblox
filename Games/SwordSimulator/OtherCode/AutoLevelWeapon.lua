-- get level calculator scripts

local pd = require(game:GetService("ReplicatedStorage").Saturn.Modules.Client["PlayerData - Client"]).Replica.Data.Main;

-- weps -> pd.Weapons
-- equipped weps -> pd.EquippedItems.Weapons

-- example, Exp can be nil if weapon hasn't defeated any mobs
local function checkWepExp(id, goal)
    return(pd.Weapons[id].Exp or 0)>=goal;
end;
