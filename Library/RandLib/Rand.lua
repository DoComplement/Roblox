local remove,concat = table.remove,table.concat;
local split,random = string.split,math.random;

local function Linear(sz)
	local tbl={};
	for i=1,sz do tbl[i]=i end;
	return tbl;
end;

local function Sequence(sz)
	local ref = Linear(sz);
	local seq = {};
	for i=1,sz do
		seq[i] = remove(ref, random(#ref));
	end;
	return seq;
end;

-- must be string or array
local function Randomize(ent,conc)
	if(type(ent)=="string")then ent = split(ent,'')end;
	local tbl={};
	for idx,randIdx in ipairs(Sequence(#ent))do
		tbl[idx] = ent[randIdx];
	end;
	if(conc)then
		return concat(tbl);
	end;
	return tbl;
end;

local AlphaBET = Randomize("AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789_ ");

local function getAlphabet(conc,rand)
	if(rand)then
		return Randomize(AlphaBET,conc); -- will not randomize the local alphabet
	end;
	if(conc)then
		return concat(AlphaBET);
	end;
	return AlphaBET;
end;

local function randStr(sz)
	assert(sz>0,"Invalid string size, must be greater than 0.");
	AlphaBET = Randomize(AlphaBET);
	local str = {};
	for i=1,sz do str[i] = AlphaBET[random(64)] end;
	return concat(str);
end;

return {
	linear = Linear;
	sequence = Sequence;
	randomize = Randomie;
	randStr = randStr;
	Alphabet = getAlphabet;
};
