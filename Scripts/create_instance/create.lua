local function setVals(class, props, parent)
    local inst = Instance.new(class,parent);
    for prop,val in next,props do
        inst[prop] = val;
    end;
    return inst;
end;
