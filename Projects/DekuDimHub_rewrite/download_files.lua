
do
	local f = io.open("url_list.lua");
	if(not f)then
		os.execute("curl https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.G-Hub-Games-List > url_list.lua");
		require("format_games_list");			-- formats the data, stores data in "games.lua"
	else
		f:close();
	end;
end;

local function find(key)
	for idx,val in ipairs(rewritten_files)do
		if(val==key)then return(true)end;
	end;
	return false;
end;

local function isfile(string)
	local f = io.open(string);
	if(not f)then return(false)end;
	return f:close();
end;

local chars = (function(tbl, idx)
	for c in string.gmatch("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!()?[]_`~;:@#$%^&*+=-.", '.')do
		tbl[idx],idx = c,idx + 1;
	end;
	return tbl;
end)({}, 1);

local function randomStr(len)
	local str = {chars[math.random(82)]};
	for idx = 2,len do
		str[idx] = chars[math.random(84)];
	end;
	return table.concat(str);
end;

local fmtStr = nil;
do
	local header = [[
	-- %s

	if(not game:IsLoaded())then game.Loaded:Wait()end;
	if(game.PlaceId~=%s or nil~=getgenv()["%s"])then return end;
	getgenv()["%s"] = true;

	]];
	fmtStr = function(url, pid, randKey)
		return string.format(header, url, pid, randKey, randKey);
	end;
end;

local tick,count = os.clock(),0;
local dir,pid = '',true;
for line in io.lines("games.lua")do
	if(#line<=21 or not line:match("V%.G%-Hub"))then 
		if("getgenv"==line:sub(1,7))then
			dir = "hub_files/"..line:match("%.(%w+)")..'/';
			pid = "Games"==dir:match("Games");
		end;
		goto NEXT;
	end;
	
	local url = line:match("%b\"\"");
	local name = (line:match("%b/,$"):sub(2,-3):gsub("%%20", '_'))..".lua";
	
	if(not isfile(dir..name))then
		count = count + 1;
		if(pid)then
			io.open(dir..name, 'w'):write(fmtStr(url, line:match("%d+"), randomStr(32))):close();
		else
			io.open(dir..name, 'w'):write("\n-- "..url.."\n\n"):close();
		end;
		print("\ndownloading ", url, "to", dir..name);
		os.execute("curl "..url.." >> "..dir..name);
	end;
	
	::NEXT::
end;

print("\ndownloaded", count, "files in", os.clock() - tick, "seconds");
print("making filename lists", require("make_filename_lists"));

