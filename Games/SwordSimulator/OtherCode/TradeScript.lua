-- not finished

local Event = game.ReplicatedStorage.Events.Trading.AddItem
local PlayerData = require(game.ReplicatedStorage.Saturn.Modules.Client["PlayerData - Client"]).Replica.Data.Main
local count,quantity = 0,33


-- ATT: {Element = '', Enchants = '', Level = ''}
function add2Trade(ItemName, Type, Quantity, ATT)
	local count = 0
	Quantity = Quantity or 1000;
		
		
	for _,v in next, PlayerData[Type] do
		if v.Base ~= ItemName then continue end;
        if ATT then
            local _,b = pcall(function() 
                return (v.Element == ATT["Element"] or ATT["Element"]==nil) and 
                       (v.Enchants[ATT["Enchants"]].Level == ATT["Level"] or )
            end) 
            if not b then continue end
        end
        count = count + 1
        if count == Quantity then return end;
	end
end

add2Trade("Autumn Bird", "Pets", 4, {Element = "Wind", Enchants = "Coins", Level = 6})

for i,v in next, PlayerData.Pets do 
	if count == quantity then break end
	if v.Base == "Autumn Bird" and pcall(function() return v.Enchants.Coins.Level == 6 end) then
		count = count + 1
      	Event:InvokeServer("Pet", i);
        task.wait(math.random(0,1))
    end
end
