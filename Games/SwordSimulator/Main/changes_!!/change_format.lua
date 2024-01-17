
local function rev(a,b)return b,a end;

local old_fmt = "..., ... %w+, (%S+), (.+)";
local new_fmt = "%s, %s";

local mt = {
	__index = function(self, idx)
		return rawset(self, idx, {})[idx];
	end;
}

local new = {
	Pets	= setmetatable({}, mt);
	Weapons = setmetatable({}, mt);
};

local function insert(tbl, ref, name)
	for item,list in next,tbl do
		for tag,fmt in next,list do
			ref[item][new_fmt:format(rev(fmt:match(old_fmt)))] = name;
		end;
	end;
end;

do
	local t = assert(require("QueueData_LEGIBLE"), "QueueData_LEGIBLE file not found. Please validate that change_format and QueueData_LEGIBLE are in the same directory");
	assert(select(2, next(t)).Slots, "error: data already formatted");
	for name,tbl in next,t do
		insert(tbl.Pets,	new.Pets,	 name);
		insert(tbl.Weapons, new.Weapons, name);
	end;
end;

require("t2s");

io.open("QueueData_LEGIBLE.lua", 'w'):write(t2s(new, nil, true)):close();
io.open("QueueData.json", 'w'):write(assert(require("json")).encode(new)):close();
