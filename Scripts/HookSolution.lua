-- this method is directly influenced from 0866 on v3rmillion

_G.hooks = _G.hooks or {}; --  must be global

local function createhook(fn)
    local function proxy(...)
        local hook = _G.hooks[debug.info(1, 'f')];  -- table corresponding to _G.hooks[fn]
        return (hook.replacement or hook.original)(...);    -- crux
    end;
    
    local hook = { original = hookfunction(fn, proxy) };
    _G.hooks[fn] = hook;
    
    return function(replacement)
        hook.replacement = replacement;
    end;
end;

-- Examples
--[[
local tobehooked = function(...)
    print(...);
end;

local a,b = 1,2; -- upvalues
local tohook = function(...)
    print(a,b,...);
end;

-- Hooking methods
local hook = createhook(tobehooked);
hook(tohook);   -- hooking tobehooked with tohook
tobehooked(3, 4, 5); -- 1, 2, 3, 4, 5

hook(nil);  -- unhook
tobehooked(1, 2, 3); -- 1, 2, 3

-- if unhooking is not significant
hook(tobehooked)(tohook);
tobehooked(3, 4, 5); -- 1, 2, 3, 4, 5
]]
