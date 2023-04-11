-- simple create instance function for code consolidation

local function createInst(class,props)
	local inst = Instance.new(class);
	for prop,val in next,props do
		inst[prop] = val;
	end;
	return inst;
end;
