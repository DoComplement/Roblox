local PlayerData = require(game.ReplicatedStorage.Saturn.Modules.Client["PlayerData - Client"]).Replica.Data.Main
-- local PetsModule = require(game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.Storage.PetsModule)
local Events = game.ReplicatedStorage.Events

local Elements = game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.Elements:GetChildren()
-- local Rarities = game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.Rarities:GetChildren() -- used for delete all of a rarity

-- access rarity via PetsModule[ITEMNAME].Rarity

local function CreateTable(TABLE)
    local NewTable = {}
    for _,v in next, TABLE do NewTable[tostring(v)]=true end -- all are initialized to be true so elements arent unintentionally deleted as the index is added
    return NewTable
end

local function deleteSweep(v, Type, Quantity) -- v -> ItemTable

	if Quantity then 
		if Quantity <= 0 then return end
	else 
		Quantity = PlayerData[Type.."Storage"] + 1 
	end
	
	local count = 1
    for x, c in next, PlayerData[Type..'s'] do
        if c.Base == v[1] then
            local Boost = nil
            if c["Enchants"] then for n,_ in next, c["Enchants"] do Boost=n;end;end
            if (c.Level==2 and v["IgnoreFused"]) or (c.Level==3 and v["IgnoreOmega"]) or (c.Level==4 and v["IgnoreAnti"])  or 
               (c["Element"] and v["Auras"][c["Element"]]) or (Boost and v["Enchants"][c["Enchants"][Boost].Level]) then 
                continue 
            end
			
			Events.DeleteItem:InvokeServer(Type..'s', x)
			if count < Quantity then count = count + 1 else break end
        end
    end
end

-- example table
local pets2Delete = {[1]={"Grave Queen", true, 
                       ["IgnoreFused"]=false, 
                       ["IgnoreOmega"]=false, 
                       ["IgnoreAnti"]=false,
                       ["Auras"]=CreateTable(Elements),
                       ["Enchants"]={true, true, true, true, true, true}},
                    [2]={"Grave Kitsune", true, 
                       ["IgnoreFused"]=false, 
                       ["IgnoreOmega"]=false, 
                       ["IgnoreAnti"]=false,
                       ["Auras"]=CreateTable(Elements),
                       ["Enchants"]={true, true, true, true, true, true}},
}

local weps2Delete = {[1]={"Halloween Halberd", true, 
                       ["IgnoreFused"]=false, 
                       ["IgnoreOmega"]=false, 
                       ["IgnoreAnti"]=false,
                       ["Auras"]=CreateTable(Elements),
                       ["Enchants"]={true, true, true, true, true, true}}
}

for _,ItemTable in next, pets2Delete do deleteSweep(ItemTable, "Pet") end
for _,ItemTable in next, weps2Delete do deleteSweep(ItemTable, "Weapon") end
