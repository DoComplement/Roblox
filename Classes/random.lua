print("print rand.getMethods() for all methods and their usage")
local rand = {}

rand.createLinearTable = function(Length)
	local Table = table.create(Length, 0)
	for i = 1, Length do Table[i] = i end
	return Table
end

rand.randSequence = function(Length)
	local Sequence = table.create(Length, 0)
	local referenceTable = rand.createLinearTable(Length)
	for i=1,Length do
		Sequence[i] = table.remove(referenceTable, math.random(1, #referenceTable))
	end
	return Sequence
end

rand.randomizeString = function(String)
	local strTable = table.create(#String, ' ')
	String = String:split('')
	for idx,randIdx in next, rand.randSequence(#String) do
		strTable[idx] = String[randIdx]
	end
	return table.concat(strTable)
end

rand.AlphaBET = rand.randomizeString("AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789_ "):split('')

rand.randString = function(Length)
	local String = table.concat(table.create(Length, ' '))
	return String:gsub('.', function() return rand.AlphaBET[math.random(1, 64)] end)
end

rand.updateAlphabet = function()
	rand.AlphaBET = rand.randomizeString(table.concat(rand.AlphaBET)):split('')
end

rand.getMethods = function()
	print("<return type> directory (<argument type> argument)")
	print("<table> rand.AlphaBET --> return table (tuple) of 64 characters corresponding to the system's alphabet")
	print("<table> rand.createLinearTable(<unsigned integer> Length) --> returns linear array of \"Length\" where each the value at index i is equal to i")
	print("<table> rand.randSequence(<unsigned integer> Length) --> returns a one-dimensional array with the indexes linear and the values random")
	print("<string> rand.randomizeString(<string> String) --> returns the input \"String\" with characters randomized")
	print("<string> rand.randString = function(<unsigned integer> Length) --> returns a random string of \"Length\"")
	print("<void> rand.updateAlphabet = function(<void>) --> randomizes the internal alphanumerical Alphabet which is used to generate random strings")
	print("<void> rand.getMethods = function(<void>) --> returns each module and their calling method")
end

return rand
