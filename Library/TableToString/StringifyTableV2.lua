if Game:IsLoaded() == false then Game.Loaded:Wait(); end;

if getgenv().t2s ~= nil then getfenv(getgenv().t2s).script:Destroy() end;
getgenv().t2s = function(Table, MainTitle, Sort)
	assert(type(Table) == "table", "ERROR! Input table is not a valid table.");
    
	local function GetIndices(Table)
        local Indices = {};
        for Index,Value in next, Table do 
        	table.insert(Indices, Index);
		end;
        
		if Sort ~= nil then
			if Sort then
				table.sort(Indices, function(A,B) return A < B end); -- Ascending
			else
				table.sort(Indices, function(A,B) return B < A end); -- Descending
			end;
		end;
        
		return Indices,Table[Indices[table.getn(Indices)]]; -- Array and Last Element
	end;
    
	local Tables = {};
	local function formatTable(Entity, Index, Tab, notLast)	
		
		local _,Model = xpcall(function() return type(Entity) == "string" and '\"'..Entity..'\"' or tostring(Entity) end, tostring, Entity);
		Index = Index and (type(Index) == "string" and Tab.."[\""..Index.."\"] = " or Tab..'['..tostring(Index).."] = ") or '';
		
		if type(Entity) == "table" then
			local Indices,Last = GetIndices(Entity);
			if table.find(Tables, Entity) == nil then -- checking for repeat-nested tables
                table.insert(Tables, Entity);
				local StringTable = {};
				if table.getn(Indices) ~= 0 then
					for _,Index in ipairs(Indices) do
						local Element = Entity[Index];
						table.insert(StringTable, formatTable(Element, Index, Tab..'\t', Last ~= Element));
					end;
					return Index.."{ \t-- "..Model..'\n'..table.concat(StringTable)..Tab..(notLast and "},\n" or "}\n");
				else 
					return Index..(notLast and "{},\n" or "{}\n");
				end;
			else
				return Index.."\"Repeated Table\",\t-- "..Model..'\n';
			end;
		else
			return Index..Model..(notLast and ",\n" or '\n');
		end;
	end;
	
	return (MainTitle and "local ".. MainTitle.." = " or '')..formatTable(Table, nil, '');
end;
print("<string> getgenv().t2s(<tuple> Table, <string> Title, <boolean> Sort)");
