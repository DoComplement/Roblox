--[[ 
Is working, but breaks some in-game function for some reason 
In PetSimX, the user is not able to collect Lootbags while this is active
]]

--[[ getgenv().table2String ]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/Format_Table/table2String.lua"))()


--[[ Library to be studied ]]
local Lib = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))
while not Lib.Loaded do game:GetService("RunService").Heartbeat:Wait() end

local ProtectedLibrary = {}
local StudyFunctionInputs = true
local StudyFunctionOutputs = true

local UpdateLib = function()
    writefile("TestProtect.txt", getgenv().table2String(ProtectedLibrary, "ProtectedLibrary")) 
end

--[[ Will not work with protected tables ]]
local function Concat(Table, PaddingCharacter)
    if type(Table) == "table" then
    	for Index, Value in pairs(Table) do
    	    local FormattedIndex
    	    if type(Index) == "string" then
    	        FormattedIndex = "[\""..tostring(Index).."\"] = "
            else
                FormattedIndex = '['..tostring(Index).."] = "
            end
    	    
			if type(Value) == "table" then
				Table[Index] = FormattedIndex..Concat(Value, PaddingCharacter)
			else
				if type(Value) == "string" then
					Table[Index] = FormattedIndex..'\"'..tostring(Value)..'\"'
				else
					Table[Index] = FormattedIndex..tostring(Value)
				end
			end
    	end
	    
	    local Concatenation = table.concat(Table, PaddingCharacter)
		return (Concatenation == '' and "nil") or '{'..Concatenation..'}'
	else
		return tostring(Table)
	end
end
--[[ Fix the above function via the below problems ]]
--[[
	1) The table.concat method sometimes doesn't work as Table can be a dictionary with non-integer indices
	2) The output is alwaus string, and, thus, appears as a string in the corresponding index after the table2String conversion
		-> Potential Fix: include some string with the output of Concat and an override argument with table2String to interpret the type of the output
]]


local function CheckUnique(Inputs, Index, ...)
    local FormattedOutput = Concat({...}, ", ")
	task.delay(0, function()
		if not Inputs[Index] then -- check if unique input
			Inputs[Index] = {[1] = (StudyFunctionOutputs and FormattedOutput) or "Not Included"}
		elseif StudyFunctionOutputs then -- check if unique output
			local Unique = true
			for _, Value in ipairs(Inputs[Index]) do
				if Value == FormattedOutput then
					Unique = false
					break
				end
			end
			if Unique then
				table.insert(Inputs[Index], FormattedOutput)
			end
		end
	end)
	
	return ...
end
--[[ Fix the above function via the below problems ]]
--[[
	1) Some functions have too many upvalues (perhaps due to this function) and cannot be hooked as a result
		-> test if CheckUnique contributes significantly to the upvalues of attempted function hooks
]]


local function StudyFunction(HookingFunction, Inputs)
	local OldFunction
	OldFunction = hookfunction(HookingFunction, function(...)		
		return CheckUnique(Inputs, Concat({...}, ", "), OldFunction(...))
	end)
end

local function StudyTable(Metatable, Parent)
    if isreadonly(Metatable) then setreadonly(Metatable, false) end
    local MetatableIndex = Metatable.__index
    Metatable.__index = newcclosure(function(Self, Index)
        if Parent[Index] == nil then
            Parent[Index] = true    -- avoid stack overflow from infinite index loop
            local Element = Self[Index] -- will call .__index again
            local StringElement = tostring(Element)
            
            if type(Element) == "table" then
                Parent[Index] = {}
                StudyTable(getrawmetatable(Element), Parent[Index])
                print("New Table found! \""..Index.."\"")
            elseif type(Element) == "function" then
                local Success,ReturnStatement
				if StudyFunctionInputs then
					Parent[Index] = {
					    [StringElement] = {
					        ["Input Keys"] = {}
					    }
					}
					Success,ReturnStatement = pcall(StudyFunction, Element, Parent[Index][StringElement]["Input Keys"])
				else
					Parent[Index] = StringElement
				end
				print("New Function found!", StringElement, "at", Index)
				print("Function Hook Attemped:", tostring(StudyFunctionInputs)..", Hook Success:", Success)
				if not Success then
				   print("Error:", ReturnStatement) 
				end
			else
                Parent[Index] = StringElement
                print("New Index found!", StringElement, "at", Index)
            end
            UpdateLib()
        end
        return MetatableIndex(Self, Index)
    end)
    setreadonly(Metatable, true)
end

StudyTable(getrawmetatable(Lib), ProtectedLibrary)
