-- method 1
local function isPrivateServer()
    local data = assert(game:HttpGetAsync("https://httpbin.org/get"),"error obtaining data");
    data = game:GetService("HttpService"):JSONdecode(data);
    local serverType = assert(game:GetService("HttpService"):JSONDecode(data.headers["Roblox-Session-Id"]), "session id not found");
    return serverType.JoinType=="Specific_PrivateServer";
end;

-- method 2
local function isPrivateServer()
    return assert(game:HttpGetAsync("https://httpbin.org/get"),"error obtaining data"):match([[\"JoinType\":\"(%w+)]])=="Specific";
end;
