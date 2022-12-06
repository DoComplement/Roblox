print("Not nearly complete. execute textEffectsLib.getMethods() to see textEffect methods")

--[[ see to storing all methods in a table for simpler accessing ]]

local rand = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Classes/random.lua"))()
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
textEffectsLib.Methods = {
	["Pop"] = function(Instance, String)
		local spaceString = table.create(#String, ' ')
		String = String:split('')

		for _,randIndex in ipairs(rand.randSequence(#String)) do
			spaceString[randIndex] = String[randIndex]
			Instance.Text = table.concat(spaceString) 
			task.wait(0.05)
		end
	end,
	["Sum"] = function(Instance, String, Delay)
		local spaceString = {}
		String = String:split('')

		for _,randIndex in ipairs(rand.randSequence(#String)) do
			spaceString[randIndex] = String[randIndex]
			Instance.Text = textEffectsLib.specialConcat(spaceString) 
			if Delay then task.wait(Delay) end
		end
	end,
	["Sweep"] = function(Instance, String, Type) --[[ doStuff ]] end,
	
	--[[ Types: Base, , Random, Sweep (in, out, left, right) ]]
	--[[
	    The current module is rather pleasing, but there are a few things i would like to add:
	    1) add extra characters to the randString and delete them accordingly to the end of the sequence
	    2) make the encrypted characters rotate other random characters until they are fixed (could be a separate mode or toggle)
	]]
	["Decrypt"] = function(Instance, String, Type)
		local Size = #String
		local randString, refereceIndex = rand.randString(Size):split('')
		String = String:split('')

		--[[ current procedure is so-so ]]
		local referenceTable = rand.randSequence(Size)
		for Index = 1, Size do 
			for count = 1,math.random(10, 50) do
				randString[referenceTable[math.random(1, #referenceTable)]] = rand.AlphaBET[math.random(1, 64)]
				Instance.Text = table.concat(randString)
			end
			referenceIndex = table.remove(referenceTable, math.random(1, #referenceTable))
			randString[referenceIndex] = String[referenceIndex]
			Instance.Text = table.concat(randString)
			task.wait(0.05 + math.exp(Index - Size - 1))
		end 
	end
}

textEffectsLib.testMethod = function(Instance, String, Method)
	print("Not Currently Defined")
	Method = textEffectsLib.Methods[Method]
	if Method then Method(Instance, String) end
end

textEffectLibs.spawnTestFrame = function(CopyDirectoryToClipboard)
	if not game:GetService("Players").LocalPlayer.PlayerGui.TestGui then
		local ScreenGui = Instance.new("ScreenGui")
		local Frame = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")

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
	end
	if CopyDirectoryToClipboard then
		setclipboard("game:GetService(\"Players\").LocalPlayer.PlayerGui.TestGui.Frame.TextLabel")
		print("Directory Copied: game:GetService(\"Players\").LocalPlayer.PlayerGui.TestGui.Frame.TextLabel")
	else
		print("Directory: game:GetService(\"Players\").LocalPlayer.PlayerGui.TestGui.Frame.TextLabel")
	end
end

textEffectsLib.getMethods = function()
	print("Test each method on a random Text Instance (TextBox, TextLabel, TextButton) to see how they look")
	print("<void> textEffectsLib.spawnTestFrame(<bool> CopyDirectoryToClipboard) -- spawns a TextLabel on the screen for the user to test methods on.")
	print("<void> textEffectsLib.Methods["Pop"](<Instance> Instance, <string> String)")
	print("<void> textEffectsLib.Methods["Sum"](<Instance> Instance, <string> String)")
	print("<void> textEffectsLib.Methods["Decrypt"](<Instance> Instance, <string> String)")
	print("<void> textEffectsLib.testMethod(<Instance> Instance, <string> String, <string> Method)")
end

return textEffectsLib

