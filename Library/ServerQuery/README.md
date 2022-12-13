# Information
- Stuff goes here
- Search speed is somewhat dependant on your ping speed.
- Use AverageSearch and DeepFetch methods with fps and ping queries because the averages best represent the actual values.


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


## Removed Methods
```  
function queryServerSearch:copyExecutionFormat(Query, Type, Quantity)
    	local Header = "print(pcall(queryServerSearch.testTeleport, " 
    
	if queryServerSearch.Operation[Query] then
		Query = '\"'..Query.."\", "
	else
		Query = "\"Query\", "
		print("Query is invalid, setting to normalized value: \"Query\"")
	end
    
    	if queryServerSearch.optimizeQuery[Type] then
		Type = '\"'..Type.."\", "
	else
        	Type = "\"Type\", "
        	print("Type is invalid, setting to normalized value: \"Type\"")
    	end
    
	if type(Quantity) ~= "number" or math.round(Quantity) - Quantity ~= 0 or Quantity < 2 or Quantity > 100 then
		Quantity = "\"Quantity\""
		print("Quantity is invalid, setting to normalized value: \"Quantity\"")
	end 	Quantity = Quantity.."))"
    
	setclipboard(Header..Query..Type..Quantity)
	print(Header..Query..Type..Quantity, "\t\thas been set on the clipboard")
end
```  
```  
function queryServerSearch:getUsage()
	local CallFormats = {
		["Query"] = {	
			"Lowest", 	--> searches for the lowest of chosen \"Type\"
			"Highest",	
			"Equal" 	--> Haven\'t tested, but I don\'t see why it wouldn\'t work
		},
		["Type"] = {
			"ping",
			"playing",
			"fps",
			"id"
		},
		["Quantity"] = {
			[1] = 2,
			[2] = 3,
			[3] = "integers between 3 and 99",
			[4] = 99,
			[5] = 100
		}
	}
	
	--[[ Include other methods in here (for understanding and human usage) ]]
	print("\nThis module was created for Gui application -> human input can cause error,boof >:`-()")
	print("Any incorrect input will return an error, printed to the output via the pcall\n")
	print(getgenv().table2String(queryServerSearch, "queryServerSearch"))
	print(getgenv().table2String(CallFormats, "CallFormats"))
	print("execute: print(pcall(queryServerSearch.testTeleport, Query, Type, Quantity))")
	print("to get call format, execute: copyExecutionFormat(Query, Type, Quantity) ")
end
```  
