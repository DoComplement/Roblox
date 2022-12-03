

--[[
	local Url_Format = {
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
		}
	}
]]

local ignoreFull,deepFetch,waitOnFull,showStatus = true,false,true -- these values will reflect toggles
local queryServerSearch = {}

-- can be consolidated somehow
queryServerSearch.optimizeQuery = {
    ["playing"] = {
        ["Lowest"] =  1,
        ["Highest"] = 2
    },
    ["fps"] = {
        ["Lowest"] = 2,
        ["Highest"] = 1
    },
    ["ping"] = {
        ["Lowest"] = 1,
        ["Highest"] = 2
    },
	["id"] = { 
        ["Lowest"] = 1,
        ["Highest"] = 2
    }
}

queryServerSearch.Comparison = {
	["Lowest"] = function(left, right) return left < right end,
	["Highest"] = function(left, right) return left > right end,
	["Equal"] = function(left, right) return left == right end
}

queryServerSearch.Floormats = {
    [1] = function(Cursor)
        return {
            ["(sortOrder)"] = '',
            ["(excludeFullGames)"] = '',
            ["(limit)"] = '',
            ["(cursor)"] = "cursor="..Cursor
        }
    end,
    [2] = function(Method, Query)
        return {
            ["(sortOrder)"] = "sortOrder="..queryServerSearch.optimizeQuery[Query][Method],
            ["(excludeFullGames)"] = "&excludeFullGames="..tostring(ignoreFull),
            ["(limit)"] = "&limit=100",
            ["(cursor)"] = ''
        }
    end
}

queryServerSearch.units = {
    ["playing"] = " players.",
    ["ping"] = " ms.",
    ["fps"] = " fps."
}

queryServerSearch.fetchServerList = function(Method, Query, Cursor)
    local tempURL,Format = "https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/0?sortOrderexcludeFullGameslimitcursor"
    if Cursor then Format = queryServerSearch.Floormats[1](Cursor) else Format = queryServerSearch.Floormats[2](Method, Query) end
    for Type,Value in next, Format do tempURL = string.gsub(tempURL, Type, Value) end
    return pcall(function() return game:GetService("HttpService"):JSONDecode(game:HttpGet(tempURL)) end)
end

queryServerSearch.Status = ''
queryServerSearch.subStatus = ''
queryServerSearch.updateStatus = {
    ["Init"] = function() queryServerSearch.Status, queryServerSearch.subStatus = "Executing Server Query...", "Fetching server data..." end,
    ["ERROR"] = function(Error) queryServerSearch.Status, queryServerSearch.subStatus = Error, "Error fetching servers, going idle..." end,
    ["Idle"] = function() delay(5, function() queryServerSearch.Status, queryServerSearch.subStatus = "Idle...",'' end) end,
    ["waitSearch"] = function() queryServerSearch.Status, queryServerSearch.subStatus = "Waiting for slot to open in desired server...", "Fetching new server data..." end,
    ["newServer"] = function() queryServerSearch.subStatus = "Server found!" end,
    ["countdown"] = function() queryServerSearch.Status = "Waiting until new fetch..." for count = 10,1,-1 do queryServerSearch.subStatus = count .. " seconds left..." end end,
    ["success"] = function() queryServerSearch.Status, queryServerSearch.subStatus = "Teleporting to desired server...", "Desired server has an open slot!" end
}


queryServerSearch.deepFetchServer = function(Server_List, Type, QueryType, tempServer, tempValue)
	local tempSuccess = true
	while tempSuccess and Server_List["nextPageCursor"] do
		tempSuccess,Server_List = queryServerSearch.fetchServerList(Method, QueryType, Server_List["nextPageCursor"])
		if tempSuccess then 
			for _,Server in ipairs(Server_List["data"]) do
				if queryServerSearch.Comparison[Type](Server[QueryType],tempValue or tempServer[QueryType]) then
					tempServer = Server
					if Type == "Equal" then tempSuccess = false end
				end
			end
		else
			queryServerSearch.updateStatus["ERROR"](Server_List)queryServerSearch.updateStatus["Idle"]()
			return 
		end
	end  
	
	return tempServer
end
	

queryServerSearch.fetchServer = function(Server_List, Type, QueryType, tempValue) 
	local tempServer = Server_List["data"][1]
	for _,Server in ipairs(Server_List["data"]) do
		if queryServerSearch.Comparison[Type](Server[QueryType],tempValue or tempServer[QueryType]) then
			tempServer = Server
			if Type == "Equal" or (Type == "Highest" and QueryType == "playing" and 
			   (tempServer.playing == tempServer.maxPlayers - 1 or (not ignoreFull and tempServer.playing == tempServer.maxPlayers))) then 
			   break 
			end
		end
	end
	
	if deepFetch or (Type == "Equal" and not tempServer[QueryType]) then 
		return queryServerSearch.deepFetchServer(Server_List, Type, QueryType, tempServer, otherValue) 
	end
	return tempServer
end

queryServerSearch.testTeleport = function(Method, Query)
    local accessTick = tick()
	
    queryServerSearch.updateStatus["Init"]()
    local Success, Server_List = queryServerSearch.fetchServerList(Method, Query)
    
    if not Success then 
        queryServerSearch.updateStatus["ERROR"](Server_List)queryServerSearch.updateStatus["Idle"]()
        return
    end
	
	local currentServer = queryServerSearch.fetchServer(Server_List, "Equal", "id", game.JobId)
	local desiredServer = queryServerSearch.fetchServer(Server_List, Method, Query)
    
	if desiredServer[Query] ~= currentServer[Query] then
		if waitOnFull and desiredServer.playing == desiredServer.maxPlayers then
			queryServerSearch.updateStatus["waitSearch"]() 
			local newServer
			while waitOnFull do
				Success,Server_List = queryServerSearch.fetchServerList(Method, Query) -- update server list
				if Success then
					newServer = queryServerSearch.fetchServer(Server_List, "Equal", "id", desiredServer.id)
					queryServerSearch.updateStatus["found"]()
					if newServer.playing ~= newServer.maxPlayers then
						waitOnFull = false -- will break the loop and not update the cache
					end
				else
					queryServerSearch.updateStatus["ERROR"](Server_List)queryServerSearch.updateStatus["Idle"]()
					return
				end
				if waitOnFull then 
				    queryServerSearch.updateStatus["countdown"]() 
				else
					if newServer.playing == newServer.maxPlayers then
						queryServerSearch.updateStatus["ERROR"]("Server is full...")queryServerSearch.updateStatus["Idle"]()
						return
					end
				end
			end
		end
		queryServerSearch.updateStatus["success"]()
		local TEMP
		if Query == "playing" then TEMP = "player count" end
		print("The server with the", string.lower(Method), TEMP or Query, "has been found in", tick() - accessTick, "seconds!")
		print("Current server value:", currentServer[Query], queryServerSearch.units[Query])
		print("New server value:", desiredServer[Query], queryServerSearch.units[Query])
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, desiredServer.id)
	else
		queryServerSearch.updateStatus["ERROR"]("Current server already matches query...")queryServerSearch.updateStatus["Idle"]()
	end
end

--[[
	Methods: 
		Function call: queryServerSearch.testTeleport("Lowest", "ping")
	
		1st Argument: "Lowest" or "Highest"
		2nd Argument: "ping", "playing", "fps"
		(Any other input argument will fail)
]]

pcall(queryServerSearch.testTeleport, "Lowest", "ping") --> queryServerSearch.testTeleport("Lowest", "ping")
