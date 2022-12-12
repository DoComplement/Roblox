# Information  
- This section contains properties for grabbing Roblox Instance properties (that aren't immediately known to everyday human knowledge)

## Calling
- Json
```   
local PropertyTable = Game:GetService("HttpService"):JSONDecode(Game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/API_Dump/Dump.json"))
```
- Lua
```
local PropertyTable = loadstring(Game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/API_Dump/Dump.lua"))()
```

## Usage


## To Do
- Perhaps create comprehensible modules for relative API Usage
