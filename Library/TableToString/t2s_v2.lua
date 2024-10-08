
if(t2s)then return end;

local function GetIndices(dict, sort)
	local idxs = {}
	for idx in next,dict do 
		idxs[#idxs + 1] = idx;
	end;
	
	if(sort == nil)then return(idxs)end;
	if(sort)then
		table.sort(idxs); 									    -- Ascending
	else
		table.sort(idxs, function(A, B) return(B < A)end); 		-- Descending
	end;

	return idxs; 											-- Array
end;

local function formatTable(entity, index, tab, tables, sort, logID)
	local name,_type = pcall(type, entity);
	if(_type == "string")then
		name = '\"' .. entity .. '\"';
	else
		name = tostring(entity);
	end;
	
	if type(index) == "string" then 
		index = tab .. "[\"" .. index .. "\"] = ";
	elseif index ~= nil then
		index = tab .. '[' .. tostring(index) .. "] = ";
	else
		index = '';
	end;
	
	if(type(entity)~="table")then 
		return index .. name .. ";\n"; 
	end;
	
	if(table.find(tables, entity))then 							-- checking for repeat-nested tables
		return index .. "\"Repeated Table\",\t-- " .. name .. '\n';
	end;
	tables[#tables + 1] = entity;
	
	local idxs = GetIndices(entity, sort)
	if(#idxs == 0)then return(index .. "{};\n")end;
	
	local strtbl = {};
	for x,idx in ipairs(idxs)do
		strtbl[x] = formatTable(entity[idx], idx, tab .. '\t', tables, sort, logID);
	end;
	if(logID)then
		return index .. "{ \t-- " .. name .. '\n' .. table.concat(strtbl) .. tab .. "};\n";
	end;
	return index .. "{\n" .. table.concat(strtbl) .. tab .. "};\n";
end;

_ENV.t2s = function(list, title, sort, logID)
	assert(type(list) == "table", "ERROR! Input table is not a valid table.");
	
	if(title)then
		return "local " .. title .. " = " .. formatTable(list, nil, '', {}, sort, logID);
	end;
	return "return " .. formatTable(list, nil, '', {}, sort, logID);
end;
