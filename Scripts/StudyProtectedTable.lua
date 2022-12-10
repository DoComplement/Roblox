--[[ Should crash upon execution for now ]]

--[[ getgenv().table2String ]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/Format_Table/table2String.lua"))()

-- Upvalues
local HookFunctionInputs = true     -- spy on inputs of functions found in studied table
local IncludeOutputs = true         -- include return values of corresponding function inputs
local ProtectedLibrary = {}         -- output library

--[[ Example Library to be studied (Protected table in Pet Simulator X) ]]
local Lib = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))
while not Lib.Loaded do game:GetService("RunService").Heartbeat:Wait() end

local function UpdateOutput()
    writefile("PetSimX_ProtectedLibrary.txt", getgenv().table2String(ProtectedLibrary, "ProtectedLibrary"))
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

local function studyFunctionInputs(HookingFunction, Inputs)
    local OldFunction
    OldFunction = hookfunction(HookingFunction, function(...)
        local Args = {...}
        local Output = OldFunction(...)
        if Args[2] then -- input is a table
            
            local Unique = true
            for _,Value in pairs(Inputs) do
                if type(Value) == "table" and CompareTables(Value, Args) then
                    Unique = false
                    break
                end
            end
            
            if Unique then
                if IncludeOutputs then
                    Inputs[Args] = Output or "nil"
                else
                    table.insert(Inputs, Args)
                end
                UpdateOutput()
            end
        else
            if not Inputs[...] then
                if IncludeOutputs then
                    Inputs[Args] = Output or "nil"
                else
                    table.insert(Inputs, Args)
                end
                UpdateOutput()
            end
        end
        
        return Output
    end)
end

local function studyProtectedMetatable(Table, Parent)
    local mt = getrawmetatable(Table)
    if isreadonly(mt) then
        setreadonly(mt, false)
    end
    
    local mtio = mt.__index
    mt.__index = newcclosure(function(Self, Index)
        
        if not Parent[Index] then
            if type(Self[Index]) == "table" then
                Parent[Index] = {}
                studyProtectedMetatable(Self[Index], Parent[Index])
            elseif type(Self[Index]) == "function" and HookFunctionInputs then
                Parent[Index] = {["Input Keys"] = {}}
                studyFunctionInputs(Self[Index], Parent[Index])
            else
                table.insert(Parent, Index)
            end
            UpdateOutput()
        end
        
        return mtio(Self, Index)
    end)
    setreadonly(mt, true)
end

studyProtectedMetatable(Lib, ProtectedLibrary)
