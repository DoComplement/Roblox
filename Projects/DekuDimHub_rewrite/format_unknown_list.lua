
-- grab url
return function(filename)
	local pids = {};
	local url = nil;

	for line in io.lines(filename)do
		if(nil~=line:match("loadstring"))then
			if(not url)then
				url = '\"'..line:match("game:HttpGet%(.(%g+).%)%)").."\"\n";
			end;
		else
			pids[#pids + 1] = line:match("%d+");
		end;
	end;

	io.open("url_list.lua",'w'):write("\t{"..table.concat(pids,", ").."} = "..url):close();
end;
