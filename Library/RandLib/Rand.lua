print("execute rand.getMethods() for all methods and their usage")
local rand = {}

function rand:createLinearTable(Length)
	local Table = table.create(Length, 1)
	for i = 2, Length do Table[i] = i end
	return Table
end

function rand:randSequence(Length)
	local Sequence = table.create(Length, '\0')
	local referenceTable = rand:createLinearTable(Length)
	for i=1,Length do
		Sequence[i] = table.remove(referenceTable, Random.new():NextInteger(1, table.getn(referenceTable)))
	end
	return Sequence
end

function rand:randomizeString(String)
	local strTable = table.create(#String, '\0')
	String = String:split('')
	for Idx,randIdx in next, rand:randSequence(table.getn(strTable)) do
		strTable[Idx] = String[randIdx]
	end
	return table.concat(strTable)
end

rand.AlphaBET = rand:randomizeString("AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789_ "):split('')

function rand:randString(Length)
	local String = table.concat(table.create(Length, '\0'))
	return String:gsub('.', function() return rand.AlphaBET[Random.new():NextInteger(1, 64)] end)
end

function rand:updateAlphabet()
	rand.AlphaBET = rand:randomizeString(table.concat(rand.AlphaBET)):split('')
end

function rand:getMethods()
	print("<return type> directory (<argument type> argument)")
	print("<table> rand.AlphaBET --> return table (tuple) of 64 characters corresponding to the system's alphabet")
	print("<table> rand:createLinearTable(<unsigned integer> Length) --> returns linear array of \"Length\" where each the value at index i is equal to i")
	print("<table> rand:randSequence(<unsigned integer> Length) --> returns a one-dimensional array with the indexes linear and the values random")
	print("<string> rand:randomizeString(<string> String) --> returns the input \"String\" with characters randomized")
	print("<string> rand:randString(<unsigned integer> Length) --> returns a random string of \"Length\"")
	print("<void> rand:updateAlphabet(<void>) --> randomizes the internal alphanumerical Alphabet which is used to generate random strings")
	print("<void> rand:getMethods(<void>) --> returns each module and their calling method")
end

return rand