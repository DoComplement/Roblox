# Information
- Stuff goes here

## Methods
- ...

## General Url Format
- Format options for a url search of a roblox game's server information
```   
local QUERY_FORMAT = {
	["serverType"] = {
		["Public"] = 0,     -- others will throw an error
		["Private Active"] = 1,
		["Private Available"] = 2
	},
	["sortOrder"] = {   -- orders by number or players per server
		[1] = 1,    -- Ascending
		[2] = 2     -- Descending
	},
	["excludeFullGames"] = {
		[1] = true,
		[2] = false
	},
	["limit"]= {
		[1] = 10,
		[2] = 25,
		[3] = 50,
		[4] = 100
	},
	["cursor"] = "..." --> string corresponding to the next page of the search (max quantity of servers per page is defined by limit, max 100)
}   
```   
- serverType=0, sortOrder=1, excludeFullGames=true, limit=100 
```   
local Url = "https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/0?sortOrder=1&excludeFullGames=true&limit=100&cursor" -- needs to have https secure 
```   
