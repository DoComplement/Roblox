
local mtb = {
    __index = function(self, idx)
        return rawset(self, idx, setmetatable({}, getmetatable(self)))[idx];
    end;
};

--[[    usage

local t = {};
t[1][2][3][4] = 1;        -- will not error

--> t = {{[2] = {[3] = {[4] = 1}}}};

]]
