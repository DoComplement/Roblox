
local rand = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Classes/main/random.lua"))()
local stringToEffect = "This is a random String! WOW!"

local function specialConcat(Table)
    local Concatenation = table.create(#Table)
    for _,v in pairs(Table) do
        table.insert(Concatenation, v)
    end
    return table.concat(Concatenation)
end

--[[ popEffect and sumEffect can be consolidated ]]

local function popEffect(Instance, String, Delay)
    Instance.Text = ''
    local spaceString = table.create(#String, ' ')
    String = String:split('')
    
    for _,randIndex in ipairs(rand.randSequence(#String)) do
        spaceString[randIndex] = String[randIndex]
        Instance.Text = table.concat(spaceString) 
        task.wait(Delay)
    end
end

local function sumEffect(Instance, String, Delay)
    Instance.Text = ''
    local spaceString = {}
    String = String:split('')
    
    for _,randIndex in ipairs(rand.randSequence(#String)) do
        spaceString[randIndex] = String[randIndex]
        Instance.Text = specialConcat(spaceString) 
        task.wait(Delay)
    end
end

local function stringDecryptionEffect(Instance, String, Delay)
    local randString = rand.randString(#String):split('')
    local referenceTable = rand.randSequence(#String)
    String = String:split('')
    Instance.Text = table.concat(randString)
    
    for _,randIndex in ipairs(referenceTable) do 
        for count = 1,math.random(1, 10) do
            randString[referenceTable[math.random(1, #referenceTable)]] = rand.AlphaBET[math.random(1, 64)]
        end
        randString[randIndex] = table.remove(referenceTable, math.random(1, #referenceTable))
        Instance.Text = table.concat(randString)
        task.wait(Delay)
    end
end



--[[
    local TextLabel = game:GetService("Players").LocalPlayer.PlayerGui.TestGui.Frame.TextLabel
    sumEffect(TextLabel, stringToEffect, 0.1)
]]
