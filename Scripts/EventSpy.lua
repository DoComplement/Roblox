assert(pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/t2s_v2.lua"))));
local Services = {};
local Types = {[1] = "FireServer";[2] = "InvokeServer";};
local Username = game:GetService("Players").LocalPlayer.Name;

-- Note: service-substitution is only used to indicate the event directory stems from a service (and can be removed via bias)

-- get table of services for substitution
for _,Instance in ipairs(game:GetChildren()) do
    if Instance.ClassName == '' then continue; end;-- not tamper proof
    Services[Instance.Name] = "game:GetService(\""..Instance.ClassName.."\")";
end;

local function FormatPath(Path)
    return Path:gsub(Username, "LocalPlayer"):gsub("^(%a+)", Services);
end;

local OldNamecall = nil; -- doesnt provide return value
OldNamecall = hookmetamethod(game, "__namecall", function(Self, ...)
    if table.find(Types, getnamecallmethod()) == nil then -- if namecall doesn't indicate a remote
        return OldNamecall(Self, ...)    
    end;
    
    print(Self.ClassName..":\t", Self);
    print("Reference:\t", FormatPath(Self:GetFullName())..':'..getnamecallmethod().."(...)");
    print("Calling Script:\t", FormatPath((getcallingscript() or script):GetFullName())..'');
    print(getgenv().t2s({...}, "Arguments"));

    return OldNamecall(Self, ...)
end)
