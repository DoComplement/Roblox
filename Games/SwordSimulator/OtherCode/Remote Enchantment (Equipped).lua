
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local PlayerData = require(ReplicatedStorage.Saturn.Modules.Client["PlayerData - Client"]).Replica.Data.Main
local Events = ReplicatedStorage.Events

for i,_ in next, PlayerData.EquippedItems.Weapons do
    if not (PlayerData.Weapons[i]["Enchants"] and PlayerData.Weapons[i]["Enchants"]["Strength"]) then
        Events.EnchantItem:InvokeServer("Weapons",tostring(i), {["Strength"]={['6']=true}})
    end
end

-- maybe also include a Quantity variable
local function EnchantItem(EquippedOnly, ItemType, EnchantType, EnchantLevel, ItemName, ItemLevel, Quantity) 
	local count,T = 0,{ItemType, nil, {[EnchantType]={[tostring(EnchantLevel)]=true}}}
	
	Quantity = Quantity or 1000
	if EquippedOnly then
		for i,c in next, PlayerData.EquippedItems[ItemType] do
		    if count == Quantity then return end
			local v = nil
			if ItemType == "Weapons" then
				T[2],v = i,PlayerData.Weapons[i]
			else
				T[2],v = c,PlayerData.Pets[c]
			end
			
			if (v.Base == ItemName) and (v.Level == ItemLevel or ItemLevel == nil) then
			    local a,_ = pcall(function() return v["Enchants"][EnchantType].Level == EnchantLevel end)
				
				-- include an "ignore lower" in others for this section
				if not a then
				    count = count + 1
					Events.EnchantItem:InvokeServer(table.unpack(T))
					print("Enchanting", v.Base, "with", EnchantType, EnchantLevel)
				end
			end
		end
	end;
    for i,v in next, PlayerData[ItemType] do
        if count == Quantity then return end;
        if (v.Base == ItemName) and (v.Level == ItemLevel or ItemLevel == nil) then 
            
            T[2] = i 
            local a,b = pcall(function() return v["Enchants"][EnchantType].Level == EnchantLevel end)

            if not a then
                count = count + 1
                Events.EnchantItem:InvokeServer(table.unpack(T))
                print("Enchanting", v.Base, "with", EnchantType, EnchantLevel)
            end
        end
    end
end

-- Weapons and Pets do not have the same enchant types
EnchantItem(false, "Weapons", "Strength", 6, "Candycorn Thrasher", 4)
EnchantItem(false, "Pets", "Coins", 6, "Autumn Bird", 4, 15)

