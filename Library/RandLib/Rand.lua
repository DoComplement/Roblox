local rand = {};

local remove,concat = table.remove,table.concat;
local split,random = string.split,math.random;

function rand:Linear(sz)
	local tbl={};
	for i=1,sz do tbl[i]=i end;
	return tbl;
end;

function rand:Sequence(sz)
	local ref = rand:Linear(sz);
	local seq = {};
	for i=1,sz do
		seq[i] = remove(ref, random(#ref));
	end;
	return seq;
end;

-- must be string or array
function rand:Randomize(ent, trunc)
	if(type(ent)=="string")then ent=split(ent,'') end;
	local tbl={};
	for idx,randIdx in ipairs(rand:Sequence(#ent)) do
		tbl[idx] = ent[randIdx];
	end;
	if trunc then
		return concat(tbl);
	end;
	return tbl;
end;

local AlphaBET = rand:Randomize("AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789_ ");

function rand:randString(sz)
	assert(sz>0,"Invalid string size, must be greater than 0.");
	AlphaBET = rand:Randomize(AlphaBET);
	local str = {};
	for i=1,sz do str[i]=AlphaBET[random(64)]; end;
	return concat(str);
end;

return rand;
