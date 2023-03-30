```
writefile("rbx_api.dat",game:HttpGet(string.format("http://setup.roblox.com/%s-API-Dump.json", game:HttpGet("http://setup.roblox.com/versionQTStudio"))));
```

```
local Version = game:HttpGet("http://setup.roblox.com/versionQTStudio");
local Dump = "http://setup.roblox.com/%s-API-Dump.json";

writefile("rbx_api.dat",game:HttpGet(string.format(Dump, Version)));
```
