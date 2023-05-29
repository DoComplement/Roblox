
local order = {};
local games = {};
local other = {};

table.find = function(ref, idx)
	for key,val in ipairs(ref)do
		if(val==idx)then return true end;
	end;
	return false;
end;

local function append_url(list, line, idx)
	if(not idx)then return end;
	if(not table.find(order,idx))then
		order[#order + 1] = idx;
	end;
	if(not list[idx])then
		list[idx] = {line};
	else
		table.insert(list[idx], line);
	end;
end;

for line in io.lines("url_list.lua")do
	if(not line:match("%[%d+"))then
		append_url(other, line, line:match("1201for/(.+)/main"));
	else
		if(line:sub(-1)~=',')then line = line..','end;
		append_url(games, line, line:match("1201for/(.+)/main"));
	end;
end;

do	-- sort each game w.r.t gameId
	local function sort(a,b)
		return(tonumber(a:match("%d+")) < tonumber(b:match("%d+")));		-- tonumber is significant here
	end;
	
	for idx,tbl in next,games do
		table.sort(tbl, sort);
		games[idx] = table.concat(tbl, '\n');
	end;
	
	for idx,tbl in next,other do
		table.sort(tbl);
		other[idx] = table.concat(tbl, '\n');
	end;
end;

local fmt1,fmt2 = '','';
for idx,key in ipairs(order)do
	fmt1 = fmt1..games[key]..'\n';
	fmt2 = fmt2..other[key]..'\n';
end;

io.open("games.lua",'w'):write("getgenv().Games   = {\n"..fmt1.."}\n\ngetgenv().Unknown = {\n"..fmt2.."};"):close();
