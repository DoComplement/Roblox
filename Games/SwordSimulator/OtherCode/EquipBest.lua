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
	for Iter=1,Index do
		if Values[Iter] ~= -1 and (Power == -1 or Values[Iter] < Power) then
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
local function GetItemPower(ID, Item, Data, Calculator, IgnoreVanity, Event)
	if Data["Vanity"] ~= nil then
		if IgnoreVanity then return end;
		return -1;
	else 
		local Tags = Data["Tags"];
		if Event ~= nil and (Tags == nil or Tags[1] ~= Event) then return end;
			
		-- calculates relative power of item read (Temp is invalid for Pet Category, Power is invalid for Weapon Category)
		local Power,Temp = Calculator(ID,Item);
		if Temp ~= 0 then
			return Temp;
		end;
		return Power;
	end;
end;

local function GatherBest(Storage, Module, Items, Calculator, IgnoreVanity, Event)
	local Values = table.create(table.getn(Items), 0);
	local Index = 1;
	
	-- loops through storage of item "Category"
    for ID,Item in next, Storage do 
		local Power = GetItemPower(ID, Item, Module[Item.Base], Calculator, IgnoreVanity, Event);
		if Power ~= nil then  
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
		Best = GatherBest(PlayerData["Pets"], PetsModule, table.create(PlayerData["PetEquips"], ''), Boosts["CalculatePetBoosts"], IgnoreVanity, Event);
    else
    	for ID,_ in next, PlayerData.EquippedItems.Weapons do EquippedItems[table.getn(EquippedItems) + 1] = ID end;	-- gathers equipped weapons
    	Best = GatherBest(PlayerData]["Weapons"], WeaponsModule, table.create(PlayerData["WeaponEquips"], ''), Boosts["CalculateWeaponBoosts"], IgnoreVanity, Event);
    end;
	
    for _,ID in ipairs(Best) do
        if table.find(EquippedItems, ID) == nil then 
            EquipItem:InvokeServer(Category..'s', EquippedItems);	-- Unequip Current items
		task.wait(2);
		EquipItem:InvokeServer(Category..'s', Best);
            return;
        end;
    end;
end;

-- EquipBest("Weapons", true, "Christmas2022");
