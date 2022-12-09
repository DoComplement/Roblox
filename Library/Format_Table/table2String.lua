if getgenv().table2String then getfenv(getgenv().table2String).script:Destroy() end
getgenv().table2String = function(Table, Title)
    if not Table or type(Table) ~= "table" then print("ERROR! Invalid table input!") return end
    
	local function getLength(Table) 
		local count,last = 1
		if type(Table) == "table" then
			count = 0
			for i,v in next, Table do 
				count = count + 1 
				last = v
			end
		end
		return count,last
	end

	local function Concat(Table) -- table is created using table.insert
		for Index, Value in ipairs(Table) do -- thus, ipairs can be used
			Table[Index] = tostring(Value)
		end
		return table.concat(Table)
	end
    
	local simpleTypes = {
		["number"] = '\n',
		["string"] = '\n',
		["table"] = '\n'
	}
	
	local function formatTable(entity, title, tab, notLast)
        
		local tableString = {}
		local size,last = getLength(entity)
		local Type = simpleTypes[type(entity)] or " -->\t"..type(entity)..'\n'
		
		if #tab > 0 then
			if type(title) == "string" then 
				title = "[\""..title.."\"]" 
			else
				title = '['..tostring(title)..']'
			end
		end
        
        	if type(entity) == "table" then
            		if size > 0 then
                		table.insert(tableString, tab..title.." = {\n")
                		for idx,ent in next, entity do
                    			table.insert(tableString, formatTable(ent, idx, table.concat(table.create(#tab + 1, '\t')), ent ~= last))
                		end
                		table.insert(tableString, tab.."}")
            		else
                		table.insert(tableString, tab..title.." = {}")
            		end
        	else
            		if type(entity) == "string" then entity = "\""..entity.."\"" end
            		table.insert(tableString, tab..title.." = "..tostring(entity))
        	end
      
        	if notLast then table.insert(tableString, ',') end 
		if #tab > 0 then table.insert(tableString, Type) end
        	return Concat(tableString)
    	end
	return formatTable(Table, Title or "ConvertedTable", table.concat(table.create(0, '\t')), false)
end

print("<string> getgenv().table2String(<table> Table, <string> nil or Table_Name)")

--[[ Examples
    local table2String = getgenv().table2String

    local Servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. tostring(game.PlaceId) .. "/servers/Public?limit=100"))
    print(table2String(Servers, "Servers"))
    writefile("Servers.txt", table2String(Servers, "Servers"))
    etc.
]]
