# Information
- Stuff goes here
- Search speed is somewhat dependant on your ping speed.
- Use AverageSearch and DeepFetch methods with fps and ping queries because the averages best represent the actual values.


## Methods
- ...


## Example Usage
- Find server with the average, lowest ping among 25 searches (will automatically teleport if server is found and not the same server, unless regardless teleport is specified)
``` 
print(pcall(queryServerSearch.testTeleport, "Lowest", "ping", 25)) -- will print success value and any encountered error
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
- See to modifying the code to use ipairs in fetchServer function (& test if it is faster than next)
- Add all methods in "Usage" section of README, and add info to the Information section
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
