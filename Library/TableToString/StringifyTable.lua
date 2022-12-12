if getgenv().ConvertTable then getfenv(getgenv().ConvertTable).script:Destroy() end
getgenv().ConvertTable = function(Table, Title, Sort)
    if not Table or type(Table) ~= "table" then return Table end
    
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
        
        if Indices[1] then -- if Table is non-empty
            return Indices,Table[Indices[table.getn(Indices)]] -- Array and Last Element
        end
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
        local TypeFormat = Types[EntityType] or " -->\t"..EntityType..'\n'
        local Indices,Last
        
        if EntityType == "table" then 
            Indices,Last = GetIndices(UpperEntity) 
        end
		
	if #Tab > 0 then
		if type(Title) == "string" then 
			Title = "[\""..Title.."\"]" 
		else
			Title = '['..tostring(Title)..']'
		end
	end
        
        if EntityType == "table" then
		table.insert(StringTable, Tab..Title.." = {\n")
            	for _,Index in ipairs(Indices) do
                	local Entity = UpperEntity[Index]
                	table.insert(StringTable, formatTable(Entity, Index, table.concat(table.create(#Tab + 1, '\t')), Entity ~= Last))
            	end
            	table.insert(StringTable, Tab.."}")
        else
            	if EntityType == "string" then UpperEntity = "\""..UpperEntity.."\"" end
            	table.insert(StringTable, Tab..Title.." = "..tostring(UpperEntity))
        end
      
        if notLast then table.insert(StringTable, ',') end 
	if #Tab > 0 then table.insert(StringTable, TypeFormat) end
        return concatTable(StringTable)
    end

    return formatTable(Table, Title or "ConvertedTable", table.concat(table.create(0, '\t')), false)
end

print("<string> getgenv().ConvertTable(<table> Table, <string> nil or Table_Name, <boolean> Sort | true -> Ascending, false -> Descending, nil -> no sort)")
