
if not getgenv().ConvertString then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/StringifyTable.lua"))()	
end

-- not really any significance in making the table a child of the game environment because the user will be removed regardless
local queryServerSearch = {}

--[[ have these values reflect toggles (I do not like to define too many unique local values) ]]
queryServerSearch.Locals = {
	ignoreThisServer = true, --[[ will not fetch the current server data (true -> much faster execution for games with many active servers) ]]
	ignoreFull = true,
	deepFetch = false,
	waitOnFull = false,
	averageFetch = false
}

--[[
queryServerSearch.Conversion = {
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
]]

-- can be consolidated somehow
queryServerSearch.optimizeQuery = {
	["playing"] = {
		["Lowest"] =  1,
		["Highest"] = 2,
		["Equal"] = 1
	},
	["fps"] = {
		["Lowest"] = 2,
		["Highest"] = 1,
		["Equal"] = 1
	},
	["ping"] = {
		["Lowest"] = 1,
		["Highest"] = 2,
		["Equal"] = 1
	},
	["id"] = { 
		["Lowest"] = 1,
		["Highest"] = 2,
		["Equal"] = 1
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
	[2] = function(Query, Type)
		return {
		    ["(sortOrder)"] = "sortOrder="..queryServerSearch.optimizeQuery[Type][Query],
		    ["(excludeFullGames)"] = "&excludeFullGames="..tostring(queryServerSearch.Locals.ignoreFull),
		    ["(limit)"] = "&limit=100",
		    ["(cursor)"] = ''
		}
	end
}

function queryServerSearch:fetchServerList(Query, Type, Cursor)
	local tempURL,Format = "https://games.roblox.com/v1/games/"..tostring(game.PlaceId).."/servers/0?sortOrderexcludeFullGameslimitcursor"
	if Cursor then Format = queryServerSearch.Floormats[1](Cursor) else Format = queryServerSearch.Floormats[2](Query, Type) end
	for Type,Value in next, Format do tempURL = tempURL:gsub(Type, Value) end
	return pcall(function() return game:GetService("HttpService"):JSONDecode(game:HttpGet(tempURL)) end)
end

--[[
queryServerSearch.updateStatus = {
	["Idle"] = function() delay(5, function() Status.Text, subStatus.Text = "Idle...",'' end) end,
	["countdown"] = function() Status.Text = "Waiting until new fetch..." for Count = 10,1,-1 do subStatus.Text = Count .. " seconds left..." end end,
	["custom"] = function(NewStatus, NewSubStatus) Status.Text, subStatus.Text = NewStatus or Status.Text, subStatus.Text or NewSubStatus end
}
]]

function queryServerSearch:fetchServer(Server_List, Query, Type, tempValue, tempServer)
	if not (tempServer and tempServer[Type]) then -- sometimes the querytype is not received
		local count = 1
		tempServer = Server_List["data"][1]
		while not tempServer[Type] and count < 101 do 
			tempServer = Server_List["data"][count]
		    count = count + 1
		end
	end
	
	local IdentificationTag
	for ID,Server in pairs(Server_List["data"]) do -- can't be ipairs because of average search, see if converting to ipairs would be faster
		if Server[Type] and queryServerSearch.Operation[Query](Server[Type],tempValue or tempServer[Type]) then
			IdentificationTag,tempServer = ID,Server
			if Query == "Equal" or (Query == "Highest" and Type == "playing" and 
			   (tempServer.playing == tempServer.maxPlayers - 1 or (not queryServerSearch.Locals.ignoreFull and tempServer.playing == tempServer.maxPlayers))) then 
			   break 
			end
		end
	end

	return tempServer,IdentificationTag
end

function queryServerSearch:deepFetchServer(Server_List, Query, Type, tempValue, tempServer)
	local tempSuccess = true
	while tempSuccess and Server_List["nextPageCursor"] do
		tempSuccess,Server_List = queryServerSearch:fetchServerList(Query, Type, Server_List["nextPageCursor"])
		if tempSuccess then 
			tempServer = queryServerSearch:fetchServer(Server_List, Query, Type, tempValue, tempServer)
		else
-- 			queryServerSearch.updateStatus["custom"](Server_List, "Error fetching servers, going idle...")
--			queryServerSearch.updateStatus["Idle"]()
			return 
		end
	end  
	
	return tempServer
end

function queryServerSearch:fetchAverage(Query, Type, Quantity)
	if Quantity < 2 or Quantity > 100 then
-- 		queryServerSearch.updateStatus["custom"]("Input Quantity, "..Quantity..", out of range: [2, 100]!", "Error fetching servers, going idle...")
		return false
	end
	
	local serverValues,Success,Server_List = {["data"] = {}},queryServerSearch:fetchServerList(Query, Type) 
-- 	queryServerSearch.updateStatus["custom"]("Fetching Average "..Type, "Servers fetched: 0")
	local function getServerValues(serverList, Count)
		if Count ~= 1 then
			for _,Server in ipairs(serverList["data"]) do
			    if Server[Type] and serverValues["data"][Server.id] then
				    serverValues["data"][Server.id][Type] = serverValues["data"][Server.id][Type] + Server[Type]
				end
			end
		else
			for _,Server in ipairs(serverList["data"]) do
			    if Server[Type] then
				    serverValues["data"][Server.id] = {[Type] = Server[Type]}
				end
			end
		end
	end

	for Count = 1, Quantity do
		print(Count)
-- 		queryServerSearch.updateStatus["custom"](nil, "Servers fetched: "..Count)
		Success, Server_List = queryServerSearch:fetchServerList(Query, Type) 
		if Success then
			getServerValues(Server_List, Count)
		else
-- 			queryServerSearch.updateStatus["custom"](Server_List, "Error fetching servers, going idle...")
			return false
		end
		
		if queryServerSearch.Locals.deepFetch then
			while Server_List["nextPageCursor"] do
				Success,Server_List = queryServerSearch:fetchServerList(Query, Type, Server_List["nextPageCursor"])
				if Success then
					getServerValues(Server_List, Count)
				else
-- 					queryServerSearch.updateStatus["custom"](Server_List, "Error fetching servers, going idle...")
					return false
				end
			end
		end
	end
	
	-- the index to the first table is not known, so a for loop must be used 
	for ID,Table in next, serverValues["data"] do -- will only iterate once
		return queryServerSearch:fetchServer(serverValues, Query, Type, nil, Table)
	end
end

queryServerSearch.testTeleport = function(Query, Type, Quantity)
	local AccessTick = tick()
--	local iQuery,iType = Conversion[1][Query], Conversion[2][Type]

-- 	queryServerSearch.updateStatus["custom"]("Executing Server Query...", "Fetching server data...")
	local Success, Server_List = queryServerSearch:fetchServerList(Query, Type)

	if not Success then 
-- 		queryServerSearch.updateStatus["custom"](Server_List, "Error fetching servers, going idle...")
-- 		queryServerSearch.updateStatus["Idle"]()
		return
	end
	
	local currentServer 
	if not queryServerSearch.Locals.ignoreThisServer then 
		currentServer = queryServerSearch:fetchServer(Server_List, "Equal", "id", game.JobId)
		if currentServer.id ~= game.JobId then 
			currentServer = queryServerSearch:deepFetchServer(Server_List, "Equal", "id", game.JobId, currentServer)
		end
	end

	local desiredServer,desiredServerID
	if queryServerSearch.Locals.averageFetch then
		if not Quantity then
-- 			queryServerSearch.updateStatus["custom"]("ERROR! Quantity for Average fetch has not been defined!", "going idle...")
			return
		end
		-- deepFetchServers is not called after fetchAverage because all servers are inserted into one table
		-- (Max 100 servers can be called per iteration, so multiple iterations are needed, otherwise, if deepFetch is indicated)
		_,desiredServerID = queryServerSearch:fetchAverage(Query, Type, Quantity)
    		desiredServer = queryServerSearch:fetchServer(Server_List, "Equal", "id", desiredServerID)
    	
    		if desiredServer.id ~= desiredServerID then 
    			desiredServer = queryServerSearch:deepFetchServer(Server_List, "Equal", "id", desiredServerID, desiredServer)
    		end
	else
		desiredServer = queryServerSearch:fetchServer(Server_List, Query, Type)
		if queryServerSearch.Locals.deepFetch then 
			desiredServer = queryServerSearch:deepFetchServer(Server_List, Query, Type, nil, desiredServer) 
		end
	end
	
	if desiredServer[Type] ~= currentServer[Type] --[[and not rejoining]] then
		if queryServerSearch.Locals.waitOnFull and desiredServer.playing == desiredServer.maxPlayers then
-- 			queryServerSearch.updateStatus["custom"]("Waiting for slot to open in desired server...", "Fetching new server data...") 
			local localWaitOnFull, newServer = true
			while localWaitOnFull and queryServerSearch.Locals.waitOnFull do -- will break if either value is false
				Success,Server_List = queryServerSearch:fetchServerList(Query, Type) -- update server list
				if Success then
					newServer = queryServerSearch:fetchServer(Server_List, "Equal", "id", desiredServer.id)
-- 					queryServerSearch.updateStatus["found"]()
					if newServer.playing ~= newServer.maxPlayers then
						localWaitOnFull = false -- will break the loop and not update the cache
					end
				else
-- 					queryServerSearch.updateStatus["custom"](Server_List, "Error fetching servers, going idle...")
-- 					queryServerSearch.updateStatus["Idle"]()
					return
				end
				if queryServerSearch.Locals.waitOnFull then 
-- 				    queryServerSearch.updateStatus["countdown"]() 
				else
					if newServer.playing == newServer.maxPlayers then
-- 						queryServerSearch.updateStatus["custom"]("Server is full...", "Error fetching servers, going idle...")
-- 						queryServerSearch.updateStatus["Idle"]()
						return
					end
				end
			end
		end
-- 		queryServerSearch.updateStatus["custom"]("Teleporting to desired server...", "Desired server has an open slot!")
		print("The server with the", Query:lower(), (Type == "playing" and "player count") or Type, "has been found in", tick() - AccessTick, "seconds!")
		print(getgenv().table2String(currentServer, "Current Server Stats"))
		print(getgenv().table2String(desiredServer, "New Server Stats"))
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, desiredServer.id)
	else
-- 		queryServerSearch.updateStatus["custom"]("Current server already matches query...", "Error fetching servers, going idle...")
-- 		queryServerSearch.updateStatus["Idle"]()
	end
end

--[[ {...} -> {ignoreFull, deepFetch, waitOnFull, averageFetch} ]]
queryServerSearch.setSearchSettings = function(...)
	for Index,Value in ipairs({...}) do
		if Value ~= nil then
			queryServerSearch.Locals[Index] = Value
		end
	end
end

return queryServerSearch
