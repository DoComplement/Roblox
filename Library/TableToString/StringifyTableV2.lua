if getgenv().StringifyTable then getfenv(getgenv().StringifyTable).script:Destroy() end
getgenv().StringifyTable = function(Table, MainTitle, Sort)
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
    
	local Tables = {}
	local function formatTable(UpperEntity, Title, Tab, notLast)	
	
		if type(UpperEntity) == "table" then
            if table.find(Tables, UpperEntity) == nil then -- checking for repeat-nested tables
                table.insert(Tables, UpperEntity)
				local StringTable,Indices,Last = {}, GetIndices(UpperEntity)
				
				for _,Index in ipairs(Indices) do
					local Entity = UpperEntity[Index]
					table.insert(StringTable, formatTable(Entity, Index, Tab..'\t', Last ~= Index))
				end
				return table.concat(StringTable)
			else
				if type(Title) == "string" then
					return Tab.."[\""..Title.."\"] = "..tostring(UpperEntity)..(notLast and ",\n" or '\n')
				else
					return Tab..'['..tostring(Title).."] = "..tostring(UpperEntity)..(notLast and ",\n" or '\n') 
				end
			end
		else
			if type(Title) == "string" then
				return Tab.."[\""..Title.."\"] = "..tostring(UpperEntity)..(notLast and ",\n" or '\n')
			else
				return Tab..'['..tostring(Title).."] = "..tostring(UpperEntity)..(notLast and ",\n" or '\n')
			end
		end
	end	
	
	return (MainTitle and "local ".. MainTitle.." = " or '').."{\n"..formatTable(Table,nil, '')..'}'
end
