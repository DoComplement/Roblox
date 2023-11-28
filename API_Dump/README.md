# info
get a json-encoded dump of the current full roblox api

## minimal
```
writefile("rbx_api.dat",game:HttpGetAsync(string.format("http://setup.roblox.com/%s-API-Dump.json", game:HttpGet("http://setup.roblox.com/versionQTStudio"))));
```

## legible
```
local Version = game:HttpGetAsync("http://setup.roblox.com/versionQTStudio");
local Dump = "http://setup.roblox.com/%s-API-Dump.json";

writefile("rbx_api.dat",game:HttpGetAsync(string.format(Dump, Version)));
```

## c++
```
local function readfile(name)
	local f = assert(io.open(name), "no such file: " .. name);
	return f:read('a'), f:close();
end;

local fmt = "http://setup.roblox.com/%s-API-Dump.json";

os.execute("curl http://setup.roblox.com/versionQTStudio > version.txt");
os.execute("curl " .. fmt:format(readfile("version.txt")) .. " > api.dat");
```
