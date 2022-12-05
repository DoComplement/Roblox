
local rand = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Classes/main/random.lua"))()
local stringToEffect = "This is a random String! WOW!"

local textEffectLib = {}

textEffectsLib.specialConcat = function(Table)
    local Concatenation = table.create(#Table)
    for _,v in pairs(Table) do
        table.insert(Concatenation, v)
    end
    return table.concat(Concatenation)
end

--[[ popEffect and sumEffect can be consolidated ]]
textEffectsLib.popEffect = function(Instance, String, Delay)
    Instance.Text = ''
    local spaceString = table.create(#String, ' ')
    String = String:split('')
    
    for _,randIndex in ipairs(rand.randSequence(#String)) do
        spaceString[randIndex] = String[randIndex]
        Instance.Text = table.concat(spaceString) 
        if Delay then task.wait(Delay) end
    end
end

textEffectsLib.sumEffect = function(Instance, String, Delay)
    Instance.Text = ''
    local spaceString = {}
    String = String:split('')
    
    for _,randIndex in ipairs(rand.randSequence(#String)) do
        spaceString[randIndex] = String[randIndex]
        Instance.Text = specialConcat(spaceString) 
        if Delay then task.wait(Delay) end
    end
end

textEffectsLib.sweepEffect = function(Instance, String, inOut, Delay)
	
end

--[[ Types: Base, , Random, Sweep (in, out, left, right) ]]
--[[
    The current module is rather pleasing, but there are a few things i would like to add:
    1) add extra characters to the randString and delete them accordingly to the end of the sequence
    2) make the encrypted characters rotate other random characters until they are fixed (could be a separate mode or toggle)

]]
textEffectsLib.decryptionEffect = function(Instance, String, Delay)
    local Size = #String
    Instance.Text = rand.randString(Size)
    local randString, refereceIndex = Instance.Text:split('')
    local referenceTable = rand.randSequence(Size)
    String = String:split('')
    
    for Index = 1, Size do -- Type = Random
		for count = 1,math.random(10, 50) do
			randString[referenceTable[math.random(1, #referenceTable)]] = rand.AlphaBET[math.random(1, 64)]
			Instance.Text = table.concat(randString)
		end
		referenceIndex = math.random(1, #referenceTable)
		randString[referenceTable[referenceIndex]] = String[table.remove(referenceTable, referenceIndex)]
		Instance.Text = table.concat(randString)
        task.wait(0.05 + math.exp(Index - Size - 1))
    end 
end



--[[

    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    
    --Properties:
    
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Name = "TestGui"
    
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
    Frame.BackgroundTransparency = 0.500
    Frame.Position = UDim2.new(0.61585784, 0, 0.107231915, 0)
    Frame.Size = UDim2.new(0, 403, 0, 73)
    
    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.Position = UDim2.new(0.024813896, 0, 0.150684938, 0)
    TextLabel.Size = UDim2.new(0, 382, 0, 50)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextSize = 14.000

    textEffectsLib.decryptionEffect(TextLabel, stringToEffect)

]]
