-- the main solution is not setting the hook to a local variable, this will not work in every instance though

--[[ example
In the script below, "script" is the library, and loadstring is hooked to get the function that makes the ui_lib table.
The purpose of the hook is to get the table that some script would be using, so the function of interest is the result of the loadstring call with the script (line 18).
This function has 0 upvalues, so we can't traditionally use a local variable when defining the hookfunction (local h=nil;h=hookfunction(...));
The library conains a key system inside its' "Create" function, so that function will be hooked for its' arguments.
The hook for loadstring function is created on line 18 and hooked on line 20. The library is obtained on that same line, (20), and the "Create" function is hooked on
the next line, with the key being printed when that function is called;
]]

local script = game:HttpGet("https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua");

local nf,h = true,nil;
h=hookfunction(loadstring,function(str)
    if nf and str==script then
        nf=false;
        local f = h(str);
        
        c=hookfunction(f,function()
            local t=c();
            p=hookfunction(t.Create,function(s,t)
                print(t.Key);
                return p(s,t);
            end);
            
            return t;
        end);
        return f;
    end;
    return h(...);
end);

-- The below script is a method to avoiding any hookfunction call altogether, with the same outcome of the above script
-- NOTE: this method will only work for functions inside arrays or dictionaries
local nf,ldstr,script = true,loadstring,game:HttpGet("https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua");
getgenv().loadstring = function(str)
    if nf and str==script then
        nf=false;
        local f = ldstr(str);
        
        return function()
            local lib = f();
            local create = lib.Create;
            
            lib.Create = function(self,config)
                print(config.Key);
                return create(self,config);
            end;
            return lib;
        end;
    end;
end;
