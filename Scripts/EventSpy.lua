loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/StringifyTableV2.lua"))();
local Services = {[Game:GetService("Players").LocalPlayer.Name] = "LocalPlayer"};
local Types = {["InvokeServer"]=true, ["FireServer"]=true};
local Classes = {["RemoteEvent"]=true, ["RemoteFunction"]=true};

-- Get Services
local Success, Service;
for _,Instance in ipairs(game:GetChildren()) do
    if Instance.ClassName ~= '' then -- not tamper proof
        Services[Instance.Name] = "Game:GetService(\""..Instance.ClassName.."\")";
    end;
end;
Success,Service = nil,nil;   -- deallocate cuz not used after here

local function getPath(Instance)
    if Instance == Game or Instance.Parent == nil or Instance.Parent == Game then 
        return (Services[Instance.Name] or Instance.Name);
    end;
    
    local iName = (Services[Instance.Name] or Instance.Name);
    local iParent = Instance.Parent;
    
    while iParent ~= game do
        iName = (Services[iParent.Name] or iParent.Name)..'.'..iName;
        iParent = iParent.Parent;
    end;
    
    return iName;
end;

local OldNamecall; -- doesnt provide return value
OldNamecall = hookmetamethod(Game, "__namecall", function(Self, ...)
    
    local Args = {...};
    local Method = getnamecallmethod();
    local Script = getcallingscript() or script;
    
    if Types[Method] then
        print(Self.ClassName..":\t", Self);
        print("Reference:\t", table.concat({[1]=getPath(Self), [2]=':', [3]=Method, [4]="(...)"}));
        print("Calling Script:\t", getPath(Script));
        
        if table.getn(Args) ~= 0 then
            print(getgenv().t2s(Args, "Arguments")); --> will not work if table2String is not enabled
        else
            print("Arguments: nil\n");
        end;
    end;

    return OldNamecall(Self, ...);
end);
