-- simple create instance function for code consolidation

local function createInst(class,props,protect)
	local inst = Instance.new(class);
	if(protect)then --[[ call respective protect-gui function ]] end;
	for prop,val in next,props do
		inst[prop] = val;
	end;
	return inst;
end;
