-- somewhat more consolidative "create instance" function
-- setVals(Instance.new("Part", parent), { (properties) });

local function setVals(inst,props)
    for prop,val in next,props do
        inst[prop] = val;
    end;
    return inst;
end;
