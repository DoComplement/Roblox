
local WeaponNotification = game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.LeftButtons.WeaponInv.Notification
local PetNotification = game:GetService("Players").LocalPlayer.PlayerGui.Main.Left.LeftButtons.PetInventory.Notification

local ReplicatedStorage=game:GetService("ReplicatedStorage")
local PlayerData = require(ReplicatedStorage.Saturn.Modules.Client["PlayerData - Client"]).Replica.Data.Main
local Events = ReplicatedStorage.Events

local AutoWeapon = {{"Candycorn Thrasher"},
                   ["Candycorn Thrasher"]={4, "Strength", 6}
                  }

local AutoPet = {{"Marshmellow Queen"},
                   ["Marshmellow Queen"] ={4, "Coins", 6}
                  }



-- maybe also include a Quantity variable
local function EnchantItem(EnchantAll, EquippedOnly, ItemType, AutoTable) 
	for x = 1, #AutoTable do
    	if EquippedOnly then
    		for i,c in next, PlayerData.EquippedItems[ItemType] do
    			local n,v = nil,nil
    			if ItemType == "Weapons" then
    				n,v = i,PlayerData.Weapons[i]
    			else
    				n,v = c,PlayerData.Pets[c]
    			end
    			
    			if (table.find(AutoTable[1], v.Base) or EnchantAll) and (v.Level == AutoTable[v.Base][1]) then
    				local ref = AutoTable[v.Base]
    				local a,_ = pcall(function() return not v["Enchants"][ref[2]].Level == ref[3] end)
    				
    				-- include an "ignore lower" in others for this section
    				if not a then
    					Events.EnchantItem:InvokeServer(ItemType, n, {[ref[2]]={[tostring(ref[3])]=true}})
    					print("Enchanted", v.Base, "with", ref[2], ref[3])
    				end
    			end
    		end
    	else
    		for i,v in next, PlayerData[ItemType] do
    			if (table.find(AutoTable[1], v.Base) or EnchantAll) and (v.Level == AutoTable[v.Base][1]) then
    			    local ref = AutoTable[v.Base]
    			    local a,_ = pcall(function() return not v["Enchants"][ref[2]].Level == ref[3] end)
    	
    				if not a then 
    					Events.EnchantItem:InvokeServer(ItemType, i, {[ref[2]]={[tostring(ref[3])]=true}})
    					print("Enchanted", v.Base, "with", ref[2], ref[3])
    				end
    			end
    		end
    	end
    end
end

WeaponNotification.Amount:GetPropertyChangedSignal("Text"):Connect(function()
    if WeaponNotification.Visible and #AutoWeapon[1] > 0 then
        -- Weapons and Pets do not have the same enchant types
        EnchantItem(false, false, "Weapons", AutoWeapon)
    end
end)

PetNotification.Amount:GetPropertyChangedSignal("Text"):Connect(function()
    if PetNotification.Visible and #AutoPet[1] > 0 then
        -- Weapons and Pets do not have the same enchant types
        EnchantItem(false, false, "Pets", AutoPet)
    end
end)



