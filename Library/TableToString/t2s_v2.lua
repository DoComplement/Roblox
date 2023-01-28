if Game:IsLoaded() == false then Game.Loaded:Wait() end

getgenv().t2s = nil;
getgenv().t2s = function(Table, Title, Sort)
	assert(type(Table) == "table", "ERROR! Input table is not a valid table.")
    
	local function GetIndices(Table)
		local Indices = {}
        for Index,Value in next, Table do 
        	table.insert(Indices, Index)
		end
        
		if Sort == nil then return Indices; end;
		if Sort then
			table.sort(Indices, function(A,B) return A < B end) -- Ascending
		else
			table.sort(Indices, function(A,B) return B < A end) -- Descending
		end
        
		return Indices -- Array and Last Element
	end
    
	local Tables = {}
	local function formatTable(Entity, Index, Tab)
		local _,Model = xpcall(function() return type(Entity) == "string" and '\"'..Entity..'\"' or tostring(Entity) end, tostring, Entity);
		if Index == nil then 
			Index = ''; 
		elseif type(Index) == "string" then 
			Index = Tab.."[\""..Index.."\"] = ";
		else
			Index = Tab..'['..tostring(Index).."] = ";
		end;
		
		if type(Entity) ~= "table" then 
			return Index..Model..";\n"; 
		end;
		
		local Indices = GetIndices(Entity)
		if table.find(Tables, Entity) ~= nil then -- checking for repeat-nested tables
			return Index.."\"Repeated Table\",\t-- "..Model..'\n';
		end;
			
		table.insert(Tables, Entity)
		if table.getn(Indices) == 0 then
			return Index.."{};\n";
		end;
		
		local StringTable = {}
		for _,Index in ipairs(Indices) do
			table.insert(StringTable, formatTable(Entity[Index], Index, Tab..'\t'));
		end;
		return Index.."{ \t-- "..Model..'\n'..table.concat(StringTable)..Tab.."};\n";
	end;
	
	return (Title and "local ".. Title.." = " or "return ")..formatTable(Table, nil, '')
end
print("<string> getgenv().t2s(<tuple> Table, <string> Title, <boolean> Sort)")
