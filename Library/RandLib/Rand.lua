local rand = {};

function rand:Linear(Length)
	local Table = table.create(Length, 1);
	for i = 2, Length do Table[i] = i end;
	return Table;
end;

function rand:Sequence(Length)
	local Sequence = table.create(Length, '');
	local referenceTable = rand:Linear(Length);
	for i=1,Length do
		Sequence[i] = table.remove(referenceTable, math.random(1, table.getn(referenceTable)));
	end;
	return Sequence;
end;

-- must be string or array (dictionary)
function rand:Randomize(Entity, Concat)
	if type(Entity) == "string" then Entity = Entity:split('') end;
	local Table = table.create(table.getn(Entity), '');
	for Idx, randIdx in ipairs(rand:Sequence(table.getn(Entity))) do
		Table[Idx] = Entity[randIdx];
	end;
	return (Concat and table.concat(Table)) or Table;
end;

rand.AlphaBET = rand:Randomize("AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789_ ");

function rand:randString(Length)
	assert(Length > 0);
	rand.AlphaBET = rand:Randomize(rand.AlphaBET);
	if Length >= 200 then
		return table.concat(table.create(Length, '')):gsub('.', rand.AlphaBET[math.random(1, 64)]);
	else
		local String = '';
		for _=1,Length do String ..= rand.AlphaBET[math.random(1, 64)] end;
		return String;
	end;
end;

return rand;
