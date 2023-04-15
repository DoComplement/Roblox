-- is ok, not ideal
local function setVals(inst,props)
    for prop,val in next,props do
        inst[prop] = val;
    end;
    return inst;
end;

-- also alright, ig, still not ideal
local function createInst(class,props,protect)
	local inst = Instance.new(class);
	if(protect)then --[[ call respective protect-gui function ]] end;
	for prop,val in next,props do
		inst[prop] = val;
	end;
	return inst;
end;

-- ideal, use this (can add the protect function)
local function setVals(class, props, parent)
    local inst = Instance.new(class);
    for prop,val in next,props do
        inst[prop] = val;
    end;
    inst.Parent = parent; -- set parent after other properties so roblox game-datamodel-listeners doesn't mess with the properties during assignment
    return inst;
end;
