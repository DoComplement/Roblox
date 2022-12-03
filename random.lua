
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
	local strTable = table.create(#String, '')
	String = String:split('')
	for idx,randIdx in next, rand.randSequence(#String) do
		strTable[idx] = String[randIdx]
	end
	return table.concat(strTable)
end

rand.AlphaBET = rand.randomizeString("AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789_ ")
rand.tableAlphaBET = rand.AlphaBET:split('')
rand.lengthAlphaBET = #rand.AlphaBET

rand.randString = function(Length)
	local String = table.concat(table.create(Length, ''))
	return String:gsub('.', function() return rand.tableAlphaBET[math.random(1, rand.lengthAlphaBET)] end)
end

rand.updateAlphabet = function()
	rand.AlphaBET = rand.randomizeString(AlphaBET)
	rand.tableAlphaBET = AlphaBET:split('')
end

return rand
