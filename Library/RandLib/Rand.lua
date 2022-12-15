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
		Sequence[i] = table.remove(referenceTable, math.random(1, table.getn(referenceTable)))
	end
	return Sequence
end

-- must be string or array
function rand:Randomize(Entity)
	local Table = table.create(#Entity, '\0')
	if type(Entity) == "string" then Entity = Entity:split('') end
	for Idx, randIdx in ipairs(rand:randSequence(table.getn(Table))) do
		Table[Idx] = Entity[randIdx]
	end
	return (type(Entity) == "string" and table.concat(Table)) or Table
end

rand.AlphaBET = rand:randomizeString("AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789_ "):split('')

function rand:randString(Length)
	if Length >= 200 then
		return table.concat(table.create(Length, '\0')):gsub('.', function() return rand.AlphaBET[math.random(1, 64)] end)
	else
		local String = ''
		for i = 1, Length do String = String .. AlphaBET[math.random(1, 64)] end
		return String
	end
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
