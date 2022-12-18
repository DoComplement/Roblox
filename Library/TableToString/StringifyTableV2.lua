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
		
		local Index = Title and (type(Title) == "string" and Tab.."[\""..Title.."\"] = " or Tab..'['..tostring(Title).."] = ") or ''
		
		if type(UpperEntity) == "table" then
			Indices,Last = GetIndices(UpperEntity)
            if table.find(Tables, UpperEntity) == nil then -- checking for repeat-nested tables
                table.insert(Tables, UpperEntity)
				local StringTable = {}
				if table.getn(Indices) ~= 0 then
					for _,Index in ipairs(Indices) do
						local Entity = UpperEntity[Index]
						table.insert(StringTable, formatTable(Entity, Index, Tab..'\t', Last ~= Index))
					end
					return Index.."{ \t-- "..tostring(UpperEntity)..'\n'..table.concat(StringTable)..Tab..(notLast and "},\n" or "}\n")
				else 
					return Index..(notLast and "{},\n" or "{}\n") 
				end
			else
				return Index.."\"Repeated Table\""..(notLast and ',' or '').."\t-- "..tostring(UpperEntity)..'\n'
			end
		else
			return Index..tostring(UpperEntity)..(notLast and ",\n" or '\n')
		end
	end	
	
	return (MainTitle and "local ".. MainTitle.." = " or '')..formatTable(Table, nil, '')
end
