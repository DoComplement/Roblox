-- simple, but not visually pleasing. only use for learning purposes

assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/t2s_v2.lua")))();

local Services = {};
local Types = {"FireServer","Fire","InvokeServer","Invoke"};
local Username = game:GetService("Players").LocalPlayer.Name;

-- Note: service-substitution is only used to indicate the event directory stems from a service (and can be removed via bias)

-- get table of services for substitution
for _,inst in ipairs(game:GetChildren()) do
    if(inst.ClassName~='')then  -- not fully operational
        Services[inst.Name] = "game:GetService(\""..inst.ClassName.."\")";
    end;
end;

local function FormatPath(Path)
    return Path:gsub(Username, "LocalPlayer"):gsub("^(%a+)", Services);
end;

local onc = nil;onc = hookmetamethod(game, "__namecall", function(self, ...)
    if(table.find(Types, getnamecallmethod())~=nil)then -- if namecall indicates a remote 
        print(self.ClassName..":\t", self);
        print("Reference:\t", FormatPath(self:GetFullName())..':'..getnamecallmethod().."(...)");
        print("Calling Script:\t", FormatPath((getcallingscript() or script):GetFullName())..'');
        print(t2s({...}, "Arguments"));
    end;

    return onc(self, ...);
end);

do
    local functions = {
        Instance.new("RemoteEvent").FireServer;
        Instance.new("BindableEvent").Fire;
        Instance.new("RemoteFunction").InvokeServer;
        Instance.new("BindableFunction").Invoke;
    };
    
    for _,func in ipairs(functions)do
        local hook = nil;hook = hookfunction(func, newcclosure(function(remote, ...)
              -- format data      
        end));
    end;
end;
