
_G.P_ = true

local function createInstance(class, props)
	local inst = Instance.new(class)
	for i, v in pairs(props) do
		inst[i] = v
	end

	return inst
end

local ScreenGui = createInstance("ScreenGui", {Parent = game:GetService("CoreGui"), ZIndexBehavior = Enum.ZIndexBehavior.Global})
local Frame = createInstance("Frame", {Parent = ScreenGui, Active = true, Selectable = true, Draggable = true, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.new(0.492992043, 0, 0.19077307, 0), Size = UDim2.new(0, 235, 0, 276)})
local ScrollingFrame = createInstance("ScrollingFrame", {Parent = Frame, Active = true, Selectable = true, BackgroundColor3 = Color3.fromRGB(255, 255, 255), AutomaticCanvasSize = 'Y', Position = UDim2.new(0.0418327153, 0, 0.260869563, 0), Size = UDim2.new(0, 215, 0, 186), CanvasSize = UDim2.new(0, 0, 0, 186)})
local UIListLayout = createInstance("UIListLayout", {Parent = ScrollingFrame, HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 10)})
local TextBox = createInstance("TextBox", {Parent = Frame, BackgroundColor3 = Color3.fromRGB(255, 255, 255), Position = UDim2.new(0.0418327153, 0, 0.101449274, 0), Size = UDim2.new(0, 214, 0, 29), Font = Enum.Font.SourceSans, Text = "Enter Item Name Here", TextColor3 = Color3.fromRGB(0, 0, 0), TextSize = 14.000})
local Events = game:GetService("ReplicatedStorage").Events

Pressed = false
local List, Evols, Omegs = {},table.create(3, ''),table.create(3, '')

local connection
connection = TextBox:GetPropertyChangedSignal("Text"):Connect(function()
	if TextBox.Text == "Enter Item Name Here" then return end
	local str = string.lower(TextBox.Text)

	if string.match(str, "remove all") or string.match(str, "delete all") then
		repeat if #str ~= #TextBox.Text then return end
			wait()			
		until not TextBox:IsFocused()
		table.clear(List) 
	end 

	repeat if #str ~= #TextBox.Text then return end
	    wait()
	until not (TextBox:IsFocused() or Pressed)

    if str == "destroy gui" then ScreenGui:Destroy() end          -- only include this line for testing/while the gui is not implemented
	
	TextBox.Text = "Enter Item Name Here"
end)

TextBox.Destroying:Once(function() connection:Disconnect() end)

local function sp(t, n) 
    for _,v in next, t do 
        if v[1]==n then 
            return false 
        end 
    end 
    return true 
end

local function connectSignal(ItemButton, TextContainer)
    local connection
    
	connection = TextContainer:GetPropertyChangedSignal("Text"):Connect(function()
	
		if TextContainer.Text == "Enter Item Name Here" or TextContainer.Text == "" then ItemButton.Visible = sp(List, ItemButton.Text) return end

		-- if the text input matches somewhere in the name of ItemButton, then the Button will remain visible
		ItemButton.Visible = (string.match(ItemButton.Name, string.lower(TextContainer.Text)) ~= nil) and sp(List, ItemButton.Text)
	end)
	
	ItemButton.Destroying:Once(function() connection:Disconnect() end)
end

local function createButton(Name, Type)
    local TextButton = createInstance("TextButton", {Name = string.lower(Name), Parent = ScrollingFrame, BackgroundColor3 = Color3.fromRGB(46, 141, 213), BorderSizePixel = 0, Size = UDim2.new(0, 190, 0, 30), AutomaticSize = 'X', ZIndex = 2, Font = Enum.Font.GothamMedium, Text = Name, TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 13.000, TextWrapped = true})
    local UICorner = createInstance("UICorner", {Parent = TextButton})
    connectSignal(TextButton, TextBox)
   
	TextButton.MouseButton1Down:Connect(function()
		table.insert(List, {Name, Type, 8, {true, true, true}})
		local size = #List
		TextButton.Visible = false; Pressed = true
		delay(3, function() Pressed = (size ~= #List) end)
    end)
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerData = require(ReplicatedStorage.Saturn.Modules.Client["PlayerData - Client"]).Replica.Data.Main

local LeftButtons = LocalPlayer.PlayerGui.Main.Left.LeftButtons
local PetNotification = LeftButtons.PetInventory.Notification
local WepNotificaiton = LeftButtons.WeaponInv.Notification

local FusePet = ReplicatedStorage.Events.FusePet
local CraftItem = ReplicatedStorage.Events.CraftItem
local ClaimCraftedItem = ReplicatedStorage.Events.ClaimCraftedItem

for _,v in next, game:GetService("ReplicatedStorage").Storage.Weapons:GetChildren() do createButton(v.Name, "Weapons") end
for _,v in next, game:GetService("ReplicatedStorage").Storage.Pets:GetChildren() do createButton(v.Name, "Pets") end

local function EnhanceItem(Table, Category, Quantity, Mode)
    
    -- table for remotefunction and counts to determine when to call the remote functions
    local Antis = table.create(Quantity, "")
    local AntiCount, OmegCount, EvolCount = 1, 1, 1
    
    -- loop through local pets/weapons storage (code is somewhat rhetorical)
    for i,v in next, PlayerData[Category] do 
		if v.Base == ItemName then 
			if PlayerData.Gems >= 10000 and Mode[1] and v.Level == 1 then
				Evols[EvolCount] = i
				if EvolCount == 3 then -- requires 3 pets to fuse
					FusePet:InvokeServer(Category, Evols)
					if _G.P_ then print(3, ItemName, "fused to 1 Evolved.") end
				end EvolCount = EvolCount%3 + 1
			else
				if PlayerData.Gems >= 200000 and Mode[2] and v.Level == 2 then
					Omegs[OmegCount] = i
					if OmegCount == 3 then -- requires 3 pets to fuse
						FusePet:InvokeServer(Category, Omegs)
						if _G.P_ then print(3, ItemName, "fused to 1 Omega.") end
					end OmegCount = OmegCount%3 + 1
				else
					if Mode[3] and check < PlayerData.CraftingSlots and v.Level == 3 then
						Antis[AntiCount] = i
						if AntiCount == Quantity then check = check + 1 -- increments the quantity of used slots
							CraftItem:InvokeServer(Category, Antis)
							if _G.P_ then print(Quantity, ItemName, "fused to 1 Antimatter.") end
							if check == PlayerData.CraftingSlots then return end
						end AntiCount = AntiCount%Quantity + 1
					end
				end
			end
        end
    end
end

local levelTable = {"Evolved", "Omega"}
local function EnhanceItem(Table, Category)
	local Changed = false

	for i,v in next, PlayerData[Category] do
		if Table[v.Base] and v.Level < 4 then
			local ReferenceTable = Table[v.Base][v.Level]
			if ReferenceTable[1] and PlayerData.Gems >= ReferenceTable[4] then
				ReferenceTable[3][ReferenceTable[2]] = i
				if ReferenceTable[2] == #ReferenceTable[3] then 
					if v.Level < 3 then -- Antimatter has different logic
						FusePet:InvokeServer(Category, ReferenceTable[3]) Changed = true
						if _G.P_ then print(3, v.Base, "fused to 1", levelTable[v.Level]) end
					else
						if check < PlayerData.CraftingSlots then
							check = check + 1
							CraftItem:InvokeServer(Category, ReferenceTable[3])
							if _G.P_ then print(ReferenceTable[2], v.Base, "fused to 1 Antimatter") end
						end
					end
				end
				ReferenceTable[2] = ReferenceTable[2]%#ReferenceTable[3] + 1
			end
		end
	end 
	
	return Changed
end

-- returns the Quantity of taken slots in the antimatter gui category
local function RetrieveQueue(Category)
    
    local count = 0
    
    -- loops through the queue and checks if any slots can be retrieved
    for i,v in next, PlayerData.QueuedItems[Category] do
        if v then count = count + 1
            if v.ReleaseDate <= os.time() - 2 then
                ClaimCraftedItem:InvokeServer(Category, i)
                if _G.P_ then print("Antimatter", v.ItemData.Base, "retrieved.") end
            end
        end
    end 
    
    return count    -- returns the Quantity of filled antimatter crafting slots
end

spawn(function() 
    while wait(1) do
        if #List > 0 then 
            for i,v in next, List do 
                check = RetrieveQueue(v[2])   -- update check with each call
                if v[4][1] or v[4][2] or (v[4][3] and check < PlayerData.CraftingSlots) then EnhanceItem(v[1], v[2], v[3], v[4]) end
            end
        else repeat wait(1) until #List > 0 end 
    end
end)


_G.WAIT_FOR_GEMS = true
local levelTable = {"Evolved", "Omega"}

local function FillTables(Table, Category)
	local Counts = create(#Table, {1, 1, 1})

	for i,v in next, PlayerData[Category] do
		if Table[v.Base] then
			Table[v.Base][v.Level][3][Counts[v.Level]] = i
			Counts[v.Level] = Counts[v.Level] + 1
		end
	end
end

local function EnhanceItems(Table, Category)
	local Reiterate = false
	for Name,Reference in next, Table do
		for 
		if SubTable[1] then
			if Count == 3 and check < PlayerData.CraftingSlots then -- Antimatter
				for i=1,#SubTable[3],SubTable[2] do
					if PlayerData[Category][SubTable[3][i + SubTable[2] - 1] then
						CraftItem:InvokeServer(Category, {unpack(SubTable[3], i, i+SubTable[2]-1)}) 
						if _G.P_ then print(ReferenceTable[2], v.Base, "fused to 1 Antimatter") end
						check = check + 1
						if check == PlayerData.CraftingSlots then return Reiterate end
					end
				end
			else
				for i=1,#SubTable[3],3 do
					if PlayerData.Gems >= SubTable[2] then
						if PlayerData[Category][SubTable[3][i + 2] then
							FusePet:InvokeServer(Category, {unpack(SubTable[3], i, i+2)})
							if _G.P_ then print(3, ItemName, "fused to 1", levelTable[v.Level]) end
							Reiterate = true
						end
					else
						if _G.WAIT_FOR_GEMS then Reiterate = true end
						break
					end
				end
			end
		end
	end
	
	return Reiterate
end

local PetConnection,WeaponConnection = nil,nil
local PetSignalCount,WeaponSignalCount = 0,0

PetConnection = PetNotification.Amount:GetPropertyChangedSignal("Text"):Connect(function()
	if PetNotification.Visible and PetSignalCount < 2 then -- can have max 1 signal active and 1 signal in queue
		PetSignalCount = PetSignalCount + 1
		while PetSignalCount == 2 do wait(1) end
		repeat FillTables(PetFuses, "Pets") until not EnhanceItems(PetFuses, "Pets")
		PetSignalCount = PetSignalCount - 1
	end
end)

WeaponConnection = WepNotification.Amount:GetPropertyChangedSignal("Text"):Connect(function()
	if WepNotification.Visible and WeaponSignalCount < 2 then
		WeaponSignalCount = WeaponSignalCount + 1
		while WeaponSignalCount == 2 do wait(1) end
		repeat FillTables(WeaponFuses, "Weapons") until not EnhanceItems(WeaponFuses, "Weapons")
		WeaponSignalCount = WeaponSignalCount - 1
	end
end)
