--[[ 
Is working, but breaks some in-game function for some reason 
In PetSimX, the user is not able to collect Lootbags while this is active
]]

--[[ getgenv().table2String ]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/Format_Table/table2String.lua"))()

-- Upvalues
local HookFunctionInputs = true     -- spy on inputs of functions found in studied table
local IncludeOutputs = true         -- include return values of corresponding function inputs
local ProtectedLibrary = {}         -- output library

--[[ Example Library to be studied (Protected table in Pet Simulator X) ]]
local Lib = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))
while not Lib.Loaded do game:GetService("RunService").Heartbeat:Wait() end

local UpdateLib = function()
    writefile("TestProtect.txt", getgenv().table2String(ProtectedLibrary, "ProtectedLibrary")) 
end

local function GetCount(Table)
    local Count = 0
    for _,_ in pairs(Table) do
        Count = Count + 1
    end
    return Count
end

--[[ will not work with protected tables, as the values return nil on non-server index ]]
local function CompareTables(Array1, Array2)
    if GetCount(Array1) ~= GetCount(Array2) then return false end
    for Index, Value in pairs(Array1) do
        if type(Value) == "table" and type(Array2[Index]) == "table" then
            if GetCount(Value) ~= GetCount(Array2[Index]) then 
                return false 
            elseif CompareTables(Value, Array2[Index]) == false then
                return false 
            end
        else
            if Value ~= Array2[Index] then
                return false 
            end
        end
    end return true
end

local function readMT(Metatable, Parent)
    if isreadonly(Metatable) then setreadonly(mt, false) end
    local MetatableIndex = Metatable.__index
    Metatable.__index = newcclosure(function(Self, Index)
        if Parent[Index] == nil then
            Parent[Index] = true    -- avoid stack overflow from infinite index loop
            local Element = Self[Index] -- will call .__index again
            
            if type(Element) == "table" then
                Parent[Index] = {}
                readMT(getrawmetatable(Element), Parent[Index])
                print("New Table found! \""..Index.."\"")
            else
                Parent[Index] = tostring(Element)
                print("New Index found!", Element, "at", Index)
            end
            UpdateLib()
        end
        return MetatableIndex(Self, Index)
    end)
    setreadonly(Metatable, true)
end

readMT(getrawmetatable(Lib), ProtectedLibrary)

