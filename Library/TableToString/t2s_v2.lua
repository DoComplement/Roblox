if(t2s~=nil)then return(nil)end;

local function GetIndices(dict,sort)
	local idxs = {}
	for idx in next,dict do 
		idxs[#idxs + 1] = idx;
	end;
	
	if(sort==nil)then return(idxs)end;
	if(sort)then
		table.sort(idxs); 									-- Ascending
	else
		table.sort(idxs,function(A,B)return(B<A)end); 		-- Descending
	end;

	return idxs; 											-- Array
end;

getgenv().t2s = function(Table, Title, Sort, logID)
	assert(type(Table) == "table", "ERROR! Input table is not a valid table.");
	
	local tbls = {};
	local function formatTable(Entity, Index, Tab)
		local Model,T = pcall(typeof, Entity);
		if(T=="string")then
			Model = '\"'..Entity..'\"';
		else
			Model = tostring(Entity);
		end;
		
		if type(Index) == "string" then 
			Index = Tab.."[\""..Index.."\"] = ";
		elseif Index ~= nil then
			Index = Tab..'['..tostring(Index).."] = ";
		else
			Index = '';
		end;
		
		if(type(Entity)~="table")then 
			return Index..Model..";\n"; 
		end;
		
		if(table.find(tbls, Entity)~=nil)then 							-- checking for repeat-nested tables
			return Index.."\"Repeated Table\",\t-- "..Model..'\n';
		end;
		tbls[#tbls + 1] = Entity;
		
		local idxs = GetIndices(Entity)
		if(#idxs==0)then return Index.."{};\n"end;
		
		local strtbl = {}
		for _,idx in ipairs(idxs)do
			strtbl[#strtbl + 1] = formatTable(Entity[idx], idx, Tab..'\t');
		end;
		if(logID)then
			return Index.."{ \t-- "..Model..'\n'..table.concat(strtbl)..Tab.."};\n";
		end;
		return Index.."{\n"..table.concat(strtbl)..Tab.."};\n";
	end;
	
	return(Title and "local ".. Title.." = " or "return ")..formatTable(Table, nil, '')
end
print("t2s(Table : table, Title : string?, Sort : boolean?, logID : boolean?) : string")
