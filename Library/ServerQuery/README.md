# Information
- Stuff goes here

## Methods
- ...

## Example Usage
```   
-- queryServerSearch.getUsage()    -- script has direct access
-- getgenv().queryServerSearch.copyExecutionFormat("Lowest", "ping", 25)
-- print(pcall(queryServerSearch.testTeleport, "Lowest", "ping", 25)) --> print(queryServerSearch.testTeleport("Lowest", "ping", 25))
```   

## General Url Format
- Format options for a url search of a roblox game's server information
```   
Query_Format = {
	["serverType"] = {
		["Public"] = 0,     -- using either 1 or 2 will return nil
		["Private, Active"] = 1,
		["Private, Available"] = 2
	},
	["sortOrder"] = {   -- orders by number of players per server
		["Ascending"] = 1,   
		["Descending"] = 2    
	},
	["excludeFullGames"] = {
		[1] = true,
		[2] = false
	},
	["limit"]= {	-- Servers per page per request
		[1] = 10,
		[2] = 25,
		[3] = 50,
		[4] = 100
	},
	["cursor"] = '' --> string corresponding to the next page of the search (max quantity of servers per page is defined by limit, max 100)
}   
```   
- serverType=0, sortOrder=1, excludeFullGames=true, limit=100 
```   
Url = "https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/0?sortOrder=1&excludeFullGames=true&limit=100&cursor" -- needs to have https secure 
```   

## To Do
- Convert (& consolidate some) Linked Lists to Arrays by converting the input "Query" and search "Type" arguments to integers
```   
local Conversion = {
	[1] = {		-- "Query" Type 
		["Highest"] = 1,
		["Lowest"] = 2,
		["Equal"] = 3,
	},
	[2] = {		-- "Search" Type
		["ping"] = 1,
		["playing"] = 2,
		["fps"] = 3,
		["id"] = 4
	}
}
```   
