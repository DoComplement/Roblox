
-- https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Anti-Cheat

if(nil~=getgenv()["?d!ca19lJG*E&bX_UH``"])then return end;
getgenv()["?d!ca19lJG*E&bX_UH``"] = true;
if(not game:IsLoaded())then game.Loaded:Wait()end;

local genv = getgenv();
genv.Get = setmetatable({}, {__index = function(self, B) return game:GetService(B) end})

-- gets all services, some are not valid services though
for _,child in ipairs(game.GetChildren(game))do
    genv[child.ClassName] = child;
end

genv.Player = Players.LocalPlayer;
genv.wait = task.wait;
genv.Heartbeat = RunService.Heartbeat;
genv.Stepped = RunService.Stepped;
genv.RenderStepped = RunService.RenderStepped;
genv.Error = ScriptContext.Error;
genv.MessageOut = LogService.MessageOut;
genv.Kick = Player.Kick;
genv.Idled = Player.Idled;
genv.VirtualInputManager = Get.VirtualInputManager;
genv.VirtualUser = Get.VirtualUser;

local Name = "V.G Hub//"..game.PlaceId..".json";
local Des = {};
if(nil~=makefolder and not isfile("V.G Hub"))then
    makefolder("V.G Hub");
end;

genv.Settings = {};
pcall(function()
    if(isfile(Name))then
        readfile(Name);
    else
        writefile(Name, HttpService:JSONEncode(Des));
    end;
end);

if(isfile(Name)and readfile(Name))then
    Settings = HttpService:JSONDecode(readfile(Name));
end;

task.defer(function()
    local Nos = {
        "PreloadAsync";
        "xpcall";
        "gcinfo";
        "collectgarbage";
        "FindService";
    };

    local Yes = {
        "Kick";
        "kick";
    };

    local OldNameCall = nil;
    OldNameCall = hookmetamethod(game, "__namecall", function(self,...)
        if((self==Player and nil~=table.find(Yes, getnamecallmethod()))or(nil~=table.find(Nos, getnamecallmethod())))then
            return(nil);
        end;
        return OldNameCall(self,...);
    end);
end);


if(nil~=setfflag)then
    setfflag("HumanoidParallelRemoveNoPhysics", "False");
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False");
end;
(setfpscap or function()end)(100);

genv.GetFunction = function(name)
    for idx,val in ipairs(getgc())do
        if(type(val)=="function"and islclosure(val)and getinfo(val).name==name)then
            return val;
        end;
    end;
end;

genv.Teleport = function(A, B, Toggle)
    if(Toggle and A and B)then
        A.CFrame = B;
    end;
    return A, B, Toggle;
end;

genv.DisableConnection = function(signal)
    for _,con in ipairs(getconnections(signal))do 
        con:Disable();
    end;
    return signal;
end;


genv.Tween = function(A, B, C)
    if A and B then
        local Time = (B.Position - A.Position).Magnitude / C 
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = TweenService:Create(A, Info, {CFrame = CFrame.new(B.Position)})
        Tween:Play()
        if not Tween.Completed then
            Tween.Completed:Wait()
        end
    end
    return A, B, C
end

genv.Save = function()
    assert(writefile,"writefile is not supported")(Name, HttpService:JSONEncode(Settings));
end;

genv.ServerHop = function()
    defer(function()
        local url = "https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100";
        local succ,data = pcall(game.HttpGet,game,url);
        while(not(succ)and wait(5))do
            succ,data = pcall(game.HttpGet,game,url);
        end;
        
        for idx,server in ipairs(HttpService:JSONDecode(data).data)do
            if(server.playing < server.maxPlayers)then
                TeleportService:TeleportToPlaceInstance(game.PlaceId,v.id);
                break;
            end;
        end;
    end);
end

genv.Rejoin = function()
    return TeleportService:TeleportToPlaceInstance(game.PlaceId,game.JobId);
end

genv.NoClip = function(A)
    return A:ChangeState(11);
end;

genv.NoClip2 = function(part)
    for idx,child in ipairs(part:GetChildren())do
        if(child:IsA("BasePart"))then
            child.CanCollide = false;
        end;
    end;
end;

genv.SendNotification = function(Title, Text, Icon, Duration)
    return StarterGui:SetCore("SendNotification", {
        Title = Title; 
        Text = Text;
        Icon = Icon;
        Duration = Duration;
    });
end;

genv.Mag = function(A, B)
    return (A.Position - B.Position).Magnitude;
end;

task.defer(function()
    local Disables = {
        Error;
        MessageOut;
        Idled;
    };

    for i,v in next, Disables do 
        for i,v in next, getconnections(v) do
            v:Disable()
        end
    end
end);

for idx,val in ipairs(getgc())do
    if(type(val)=="function"and islclosure(val))then
        local Table = getconstants(v);
        if(nil~=(table.find(Table, "Detected")and table.find(Table, "crash")))then
            hookfunction(v, function()end);
        end;
    end;
end;