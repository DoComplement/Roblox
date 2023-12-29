local ReplicatedStorage = Game:GetService("ReplicatedStorage");
local EquipItem = ReplicatedStorage.Events.EquipItem;

local PlayerData = require(ReplicatedStorage.Saturn.Modules.Client["PlayerData - Client"]).Replica.Data.Main;
local Boosts = require(ReplicatedStorage.Saturn.Modules.GameDependent.BoostsCalculator);
local PetsModule = require(ReplicatedStorage.Saturn.Modules.GameDependent.Storage.PetsModule);
local WeaponsModule = require(ReplicatedStorage.Saturn.Modules.GameDependent.WeaponsModule);

local function GetMinValueIndex(Values, Min, Index)
	for Count,Value in ipairs(Values) do
		if Value ~= -1 and Value < Min then
			Index,Min = Count,Value;
		end;
	end;
	return Index;
end;

--[[ EquipBest Modules ]]
local function SortItems(Items, Values, Power, ID, Index)
	for Iter = 1,Index do
		if(Values[Iter] == -1 or not(Power == -1 or Values[Iter] < Power) then
			continue;
		else
			if Values[Index] ~= -1 and (Power == -1 or Values[Index] < Values[Iter]) then 
				Values[Index],Items[Index] = Values[Iter],Items[Iter];
			end;
			Values[Iter],Items[Iter] = Power,ID;
			return GetMinValueIndex(Values, Values[Index], Index);
		end;
	end;
	return Index;
end;

--[[ Current Events = {
	"Christmas2022",
	"Halloween2022",
	nil
]]
local function GetItemPower(id, item, data, calculator, ignoreVanity, event)
	if(data.Vanity)then
		if(ignoreVanity)then 
			return nil;
		end;
		return -1;
	end;
	
	data = data.Tags;
	if(event and (not data or data[1] ~= event))then
		return nil;
	end;
		
	-- calculates relative power of item read (Temp is invalid for Pet Category, Power is invalid for Weapon Category)
	local power_A,power_B = calculator(id, item);
	if(power_B ~= 0)then
		return power_B;
	end;
	return power_A;
end;

local function GatherBest(Storage, Module, Items, Calculator, IgnoreVanity, Event)
	local Values,Index = table.create(#Items, 0), 1;
	
	-- loops through storage of item "Category"
    for ID,Item,Power in next,Storage do 
		Power = GetItemPower(ID, Item, Module[Item.Base], Calculator, IgnoreVanity, Event);
		if(Power)then  
			Index = SortItems(Items, Values, Power, ID, Index);
		end;
    end;
	return Items;
end;

-- gathers bets items of Category - Pet,Weapon - and equips those items 
local function EquipBest(Category, IgnoreVanity, Event)
    local EquippedItems,Best = {};
	
	-- sets general variables based on input Category
    if Category == "Pet" then 
        EquippedItems = PlayerData.EquippedItems.Pets;
		Best = GatherBest(PlayerData["Pets"],     PetsModule, 	 table.create(PlayerData["PetEquips"], ''),    Boosts["CalculatePetBoosts"],    IgnoreVanity, Event);
    else
    	for ID in next,PlayerData.EquippedItems.Weapons do EquippedItems[#EquippedItems + 1] = ID end;	-- gathers equipped weapons
    	Best = GatherBest(PlayerData]["Weapons"], WeaponsModule, table.create(PlayerData["WeaponEquips"], ''), Boosts["CalculateWeaponBoosts"], IgnoreVanity, Event);
    end;
	
    for _,ID in ipairs(Best) do
        if(not table.find(EquippedItems, ID))then 
            EquipItem:InvokeServer(Category..'s', EquippedItems);	-- Unequip Current items
			return task.delay(2, EquipItem.InvokeServer, EquipItem, Category..'s', Best);
        end;
    end;
end;

-- EquipBest("Weapons", true, "Christmas2022");
