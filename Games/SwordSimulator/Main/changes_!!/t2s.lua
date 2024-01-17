if(t2s)then return end;

local Tables,Sort,logID = nil,nil,nil;

local newcclosure = coroutine.wrap(function(f)
	while(true)do
		while(debug.getinfo(f).what == 'C')do
			f = coroutine.yield(f);
		end;
		local c = f;
		f = coroutine.yield(coroutine.wrap(function(...)
			local args = {...};
			while(true)do
				args = {coroutine.yield(c(table.unpack(args)))};
			end;
		end));
	end;
end);


local ARG_ERR = "%s expected at arg%d, got %s";

table.find = newcclosure(function(tbl, _val)
	assert(type(tbl) == "table", ARG_ERR:format("table", 1, type(tbl) or "nil"));
	assert(_val, ARG_ERR:format("literally anything", 2, "nil"));
	
	for idx,val in next,tbl do
		if(val == _val)then
			return idx;
		end;
	end;
	
end);

local GetIndices = nil;
do
    local function Descending(A, B) return B < A end;
    GetIndices = function(tbl)
    	local indices = {}
    	for idx in next,tbl do 
    		indices[#indices + 1] = idx;
    	end
    	
    	if(not Sort)then
    		if(Sort==nil)then return(indices)end;
    		table.sort(indices, Descending); -- Descending
    	else
    		table.sort(indices); -- Ascending
    	end;
    	
    	return indices;
    end
end

local fmt1 = "\"%s\"";													-- Entity
local fmt2 = "%s[\"%s\"] = ";											-- Tab, Index
local fmt3 = "%s[%s] = ";												-- Tab, tostring(Index)
local fmt4 = "%s%s;\n";													-- Index, Model
local fmt5 = "%s\"Repeated Table\",\t-- %s\n";							-- Index, Model
local fmt6 = "%s{};\n";													-- Index
local fmt7 = "%s{ \t-- %s\n%s%s};\n";									-- Index, Model, table.concat(strTbl), Tab
local fmt8 = "%s{\n%s%s};\n"; 											-- Index, table.concat(strTbl), Tab

local function formatTable(Entity, Tab, Index)
	local Model,T = pcall(type, Entity);
	if T == "string" then
		Model = fmt1:format(Entity);
	else
		Model = tostring(Entity);
	end;
	
	if type(Index) == "string" then 
		Index = fmt2:format(Tab, Index);
	elseif Index ~= nil then
		Index = fmt3:format(Tab, tostring(Index));
	else
		Index = '';
	end;
	
	if type(Entity) ~= "table" then 
		return fmt4:format(Index, Model); 
	end;
	
	if(table.find(Tables, Entity)~=nil)then -- checking for repeat-nested tables
		return fmt5:format(Index, Model);
	end;
	Tables[#Tables + 1] = Entity;
	
	local Indices = GetIndices(Entity);
	if(#Indices==0)then
		return fmt6:format(Index);
	end;
	
	local strTbl = {}
	for _,idx in ipairs(Indices)do
		strTbl[#strTbl + 1] = formatTable(Entity[idx], Tab .. '\t', idx);
	end;
	if(_logID)then
		return fmt7:format(Index, Model, table.concat(strTbl), Tab);
	end;
	return fmt8:format(Index, table.concat(strTbl), Tab);
end;

_ENV.t2s = newcclosure(function(Table, Title, _Sort, _logID)
	assert(type(Table) == "table", ARG_ERR:format("table", 1, type(Table) or "nil"));
	Tables,Sort,logID = {},_Sort,_logID;	-- naive reset
	return (Title or "return ")..formatTable(Table, '');
end);
