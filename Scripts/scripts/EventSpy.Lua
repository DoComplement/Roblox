if game:IsLoaded() == false then game.Loaded:Wait() end;

local Services = {};
local Username = game:GetService("Players").LocalPlayer.Name;
getgenv().Events = {};

-- Note: service-substitution is only used to indicate the event directory stems from a service (and can be removed via bias)

-- get table of services for substitution
for _,Instance in ipairs(game:GetChildren()) do
    if Instance.ClassName == '' then continue; end;-- not tamper proof
    Services[Instance.Name] = "game:GetService(\""..Instance.ClassName.."\")";
end;

local function FormatPath(Path)
    return Path:gsub(Username, "LocalPlayer"):gsub("^(%a+)", Services);
end;

local function gfn(inst)
    local c = inst.Name;
    while inst.Parent ~= nil do
        c = inst.Parent.Name..'.'..c;
        inst = inst.Parent;
    end;
    return FormatPath(c);
end;

local OldNamecall = nil; -- doesnt provide return value
OldNamecall = hookmetamethod(game, "__namecall", function(Self, ...)
    local m,e = getnamecallmethod(),Events[Self.Name];
    if (m == "FireServer" or m == "InvokeServer") and e == nil or e then
        if e == nil then
            Events[Self.Name] = true;
        end;
        print(Self.ClassName..":\t", Self);
        print("Reference:\t", gfn(Self)..':'..m.."(...)");
        print("Calling Script:\t", gfn(getcallingscript() or script)..'');
        print(t2s({...}, "Arguments"));
    end;
    return OldNamecall(Self, ...);
end)