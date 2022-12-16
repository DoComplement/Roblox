if getgenv().ConvertTable then getfenv(getgenv().ConvertTable).script:Destroy() end
getgenv().ConvertTable = function(Table, MainTitle, Sort)
	assert(type(Table) == "table", "ERROR! Input table is not a valid table.")
    
    	local function GetIndices(Table)
        	local Indices = {}
        	for Index,Value in next, Table do 
			table.insert(Indices, Index)
        	end
        
		if Sort ~= nil then
			if Sort then
				table.sort(Indices, function(A,B) return A < B end) -- Ascending
			else
				table.sort(Indices, function(A,B) return B < A end) -- Descending
			end
		end
        
		return Indices,Table[Indices[table.getn(Indices)]] -- Array and Last Element
	end
    
	local function concatTable(Table) -- table is created using table.insert
		for Index, Value in next, Table do -- thus, ipairs can be used
			Table[Index] = tostring(Value)
		end
		return table.concat(Table)
	end
    
	local Types = {
		["number"] = '\n',
		["string"] = '\n',
		["table"] = '\n'
	}
	
    	local function formatTable(UpperEntity, Title, Tab, notLast)	
		
		local StringTable,EntityType = {},type(UpperEntity)
		local Indices,Last
        
		if EntityType == "table" then
			Indices,Last = GetIndices(UpperEntity)
		end
                
		if #Tab ~= 0 then
			if type(Title) == "string" then 
				Title = "[\""..Title.."\"]" 
			else
				Title = '['..tostring(Title)..']'
			end
			if EntityType == "table" then
				table.insert(StringTable, Tab..Title.." = {\n")
			elseif EntityType == "string" then
				UpperEntity = "\""..UpperEntity.."\""
			end
		else
			if Title then
				table.insert(StringTable, "local "..Title.." = {\n")
			else
				table.insert(StringTable, "{\n")
			end
		end
        
        	if EntityType == "table" then
			for _,Index in ipairs(Indices) do
				local Entity = UpperEntity[Index]
				table.insert(StringTable, formatTable(Entity, Index, Tab..'\t', Entity ~= Last))
			end
			table.insert(StringTable, Tab.."}")
        	else
            		table.insert(StringTable, Tab..Title.." = "..tostring(UpperEntity))
        	end
      
        	if notLast then table.insert(StringTable, ',') end 
		if #Tab > 0 then table.insert(StringTable, Types[EntityType] or " -->\t"..EntityType..'\n') end
        	return table.concat(StringTable)
    	end
	
    	return formatTable(Table, MainTitle, '', false)
end

print("<string> getgenv().ConvertTable(<table> Table, <string> nil or Table_Name, <boolean> Sort | true -> Ascending, false -> Descending, nil -> no sort)")
