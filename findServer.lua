
-- each button will send a method to the function queryServerSearch.teleportTest(mathod, type)
--[[
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
		}
	}
]]

if not getgenv().table2String then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Classes/main/table2String.lua"))()	
end

local ignoreFull,deepFetch,waitOnFull,averageFetch,showStatus = true,false,true,false -- these values will reflect toggles
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

queryServerSearch.Operation = {
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

queryServerSearch.fetchServerList = function(Method, Query, Cursor)
    local tempURL,Format = "https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/0?sortOrderexcludeFullGameslimitcursor"
    if Cursor then Format = queryServerSearch.Floormats[1](Cursor) else Format = queryServerSearch.Floormats[2](Method, Query) end
    for Type,Value in next, Format do tempURL = tempURL:gsub(Type, Value) end
    return pcall(function() return game:GetService("HttpService"):JSONDecode(game:HttpGet(tempURL)) end)
end

queryServerSearch.Status = ''
queryServerSearch.subStatus = ''
queryServerSearch.updateStatus = {
    ["Idle"] = function() delay(5, function() queryServerSearch.Status, queryServerSearch.subStatus = "Idle...",'' end) end,
    ["countdown"] = function() queryServerSearch.Status = "Waiting until new fetch..." for count = 10,1,-1 do queryServerSearch.subStatus = count .. " seconds left..." end end,
	["custom"] = function(Status, subStatus) queryServerSearch.Status, queryServerSearch.subStatus = Status or queryServerSearch.Status, subStatus or queryServerSearch.subStatus end
}

queryServerSearch.fetchServer = function(Server_List, Method, QueryType, tempValue, tempServer)
	if not (tempServer and tempServer[QueryType]) then -- sometimes the querytype is not received
        local count = 1
        tempServer = Server_List["data"][1]
        while not tempServer[QueryType] and count < 101 do 
	        tempServer = Server_List["data"][count]
            count = count + 1
	    end
	end
	
	local IdentificationTag
	for ID,Server in pairs(Server_List["data"]) do -- ipairs doesnt allow tables from fetchAverage
		if Server[QueryType] and queryServerSearch.Operation[Method](Server[QueryType],tempValue or tempServer[QueryType]) then
			IdentificationTag,tempServer = ID,Server
			if Method == "Equal" or (Method == "Highest" and QueryType == "playing" and 
			   (tempServer.playing == tempServer.maxPlayers - 1 or (not ignoreFull and tempServer.playing == tempServer.maxPlayers))) then 
			   break 
			end
		end
	end

	return tempServer,IdentificationTag
end

queryServerSearch.deepFetchServer = function(Server_List, Method, QueryType, tempValue, tempServer)
	local tempSuccess = true
	while tempSuccess and Server_List["nextPageCursor"] do
		tempSuccess,Server_List = queryServerSearch.fetchServerList(Method, QueryType, Server_List["nextPageCursor"])
		if tempSuccess then 
			tempServer = queryServerSearch.fetchServer(Server_List, Method, QueryType, tempValue, tempServer)
		else
			queryServerSearch.updateStatus["custom"](Server_List, "Error fetching servers, going idle...")
			queryServerSearch.updateStatus["Idle"]()
			return 
		end
	end  
	
	return tempServer
end

queryServerSearch.fetchAverage = function(Method, QueryType, Quantity)
	if Quantity < 2 or Quantity > 100 then
		queryServerSearch.updateStatus["custom"]("Input Quantity, "..Quantity..", out of range: [2, 100]!", "Error fetching servers, going idle...")
		return false
	end
	
	local serverValues,Success,Server_List = {["data"] = {}},queryServerSearch.fetchServerList(Method, QueryType) 
	queryServerSearch.updateStatus["custom"]("Fetching Average "..QueryType, "Servers fetched: 0")
	local function getServerValues(serverList, Count)
		if Count ~= 1 then
			for _,Server in ipairs(serverList["data"]) do
			    if Server[QueryType] and serverValues["data"][Server.id] then
				    serverValues["data"][Server.id][QueryType] = serverValues["data"][Server.id][QueryType] + Server[QueryType]
				end
			end
		else
			for _,Server in ipairs(serverList["data"]) do
			    if Server[QueryType] then
				    serverValues["data"][Server.id] = {[QueryType] = Server[QueryType]}
				end
			end
		end
	end

	for Count = 1, Quantity do
	    print(Count)
		queryServerSearch.updateStatus["custom"](nil, "Servers fetched: "..Count)
		Success, Server_List = queryServerSearch.fetchServerList(Method, QueryType) 
		if Success then
			getServerValues(Server_List, Count)
		else
			queryServerSearch.updateStatus["custom"](Server_List, "Error fetching servers, going idle...")
			return false
		end
		
		if deepFetch then
			while Server_List["nextPageCursor"] do
				Success,Server_List = queryServerSearch.fetchServerList(Method, QueryType, Server_List["nextPageCursor"])
				if Success then
					getServerValues(Server_List, Count)
				else
					queryServerSearch.updateStatus["custom"](Server_List, "Error fetching servers, going idle...")
					return false
				end
			end
		end
	end
	
	-- the index to the first table is not known, so a for loop must be used 
	for ID,Table in next, serverValues["data"] do -- will only iterate once
		return queryServerSearch.fetchServer(serverValues, Method, QueryType, nil, Table)
	end
end

queryServerSearch.testTeleport = function(Method, Query, Quantity)
	local accessTick = tick()

	queryServerSearch.updateStatus["custom"]("Executing Server Query...", "Fetching server data...")
	local Success, Server_List = queryServerSearch.fetchServerList(Method, Query)

	if not Success then 
		queryServerSearch.updateStatus["custom"](Server_List, "Error fetching servers, going idle...")
			queryServerSearch.updateStatus["Idle"]()
		return
	end
	
	local currentServer = queryServerSearch.fetchServer(Server_List, "Equal", "id", game.JobId)
	local desiredServer,desiredServerID

	if currentServer.id ~= game.JobId then 
		currentServer = queryServerSearch.deepFetchServer(Server_List, "Equal", "id", game.JobId, currentServer)
	end

	if averageFetch then
		if not Quantity then
			queryServerSearch.updateStatus["custom"]("ERROR! Quantity for Average fetch has not been defined!", "going idle...")
			return
		end
		-- deepFetch is not called after fetchAverage because all servers are inserted into one table
		-- (Max 100 servers can be called per iteration, so multiple iterations are needed, otherwise, if deepFetch is indicated)
		_,desiredServerID = queryServerSearch.fetchAverage(Method, Query, Quantity)
    		desiredServer = queryServerSearch.fetchServer(Server_List, "Equal", "id", desiredServerID)
    	
    		if desiredServer.id ~= desiredServerID then 
    			desiredServer = queryServerSearch.deepFetchServer(Server_List, "Equal", "id", desiredServerID, desiredServer)
    		end
	else
		desiredServer = queryServerSearch.fetchServer(Server_List, Method, Query)
		if deepFetch then 
			desiredServer = queryServerSearch.deepFetchServer(Server_List, Method, Query, desiredServer) 
		end
	end
	
	if desiredServer[Query] ~= currentServer[Query] --[[and not rejoining]] then
		if waitOnFull and desiredServer.playing == desiredServer.maxPlayers then
			queryServerSearch.updateStatus["custom"]("Waiting for slot to open in desired server...", "Fetching new server data...") 
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
					queryServerSearch.updateStatus["custom"](Server_List, "Error fetching servers, going idle...")
					queryServerSearch.updateStatus["Idle"]()
					return
				end
				if waitOnFull then 
				    queryServerSearch.updateStatus["countdown"]() 
				else
					if newServer.playing == newServer.maxPlayers then
						queryServerSearch.updateStatus["custom"]("Server is full...", "Error fetching servers, going idle...")
						queryServerSearch.updateStatus["Idle"]()
						return
					end
				end
			end
		end
		queryServerSearch.updateStatus["custom"]("Teleporting to desired server...", "Desired server has an open slot!")
		local TEMP
		if Query == "playing" then TEMP = "player count" end
		print("The server with the", string.lower(Method), TEMP or Query, "has been found in", tick() - accessTick, "seconds!")
		print(getgenv().table2String(currentServer, "Current Server Stats"))
		print(getgenv().table2String(desiredServer, "New Server Stats"))
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, desiredServer.id)
	else
		queryServerSearch.updateStatus["custom"]("Current server already matches query...", "Error fetching servers, going idle...")
		queryServerSearch.updateStatus["Idle"]()
	end
end

--[[
	Methods: 
	
		Function call: queryServerSearch.testTeleport("Lowest", "ping")
	
		1st Argument: "Lowest" or "Highest"
		2nd Argument: "ping", "playing", "fps"
		3rd Argument: Integer in range: [2, 100] --> finds best server over multiple iterations by best average query value
		(Any other input argument will fail)
]]

pcall(queryServerSearch.testTeleport, "Lowest", "ping", 25) --> queryServerSearch.testTeleport("Lowest", "ping", 25)
