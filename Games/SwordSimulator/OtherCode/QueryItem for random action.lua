local PlayerData = require(game.ReplicatedStorage.Saturn.Modules.Client["PlayerData - Client"]).Replica.Data.Main
-- local PetsModule = require(game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.Storage.PetsModule)
local Events = game.ReplicatedStorage.Events

local Elements = game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.Elements:GetChildren()
-- local Rarities = game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.Rarities:GetChildren() -- used for delete all of a rarity

-- access rarity via PetsModule[ITEMNAME].Rarity


--[[

INCLUDE QUERY WITH WEAPON LEVEL (not the level that corresponds to tier (omega, antimatter, etc.)

]]

local ElementTable = {["nil"] = true}
for _,v in next, Elements do
	ElementTable[tostring(v)] = true
end

local function queryAction(Query, Type) -- v -> ItemTable
	local count,Quantity = 1,Query["Quantity"] or 10000
	
    for ID, Data in next, PlayerData[Type..'s'] do
        if Data.Base == Query["Name"] then
            local Boost, BoostLevel = nil,nil
            if Data["Enchants"] then 
				for B,T in next, Data["Enchants"] do 
					Boost=tostring(B)
					BoostLevel=tostring(T.Level)
				end
			end 
            if Query["Level"][Data.Level] or Query["Elements"][tostring(Data["Element"])] or 
			   Query["Enchants"][Boost] or Query["EnchantLevel"][BoostLevel] then 
                continue 
            end
			
			print(Type,"found.")
			--Events.DeleteItem:InvokeServer(Type..'s', x)	-- Action goes here
			if count < Quantity then count = count + 1 else return end
        end
    end
end

-- example table
local petTable = {
    [1] = {
        ["Name"] = "Jungle Wolf", 
        ["Level"]	= {true, true, true, false}, -- ignore normal, evolved, omega, anti (all = true implies ignore all)
        ["Elements"] = ElementTable, -- ignore specific element
		["Enchants"] = {["Coins"]=false, ["Speed"]=true, ["JumpHeight"]=true, ["nil"]=true},
        ["EnchantLevel"] = {true, true, true, true, true, false, ["nil"] = true}, -- ignore level of enchant
		["Quantity"] = 30
    };
};

local wepTable = {
    [1] = {
        ["Name"] = "Halloween Halberd", 
		["Level"]	= {true, true, true, false}, -- ignore normal, evolved, omega, anti (all = true implies ignore all)
        ["Elements"] = ElementTable, -- ignore specific element
		["Enchants"] = {["Strength"]=true, ["Speed"]=true, ["JumpHeight"]=true, ["nil"]=true},
        ["EnchantLevel"] = {true, true, true, true, true, false, ["nil"] = true}, -- ignore level of enchant
		["Quantity"] = nil
    };
};

petTable[1]["Elements"]["Shadow"] = false
for _,ItemTable in next, petTable do queryAction(ItemTable, "Pet") end
