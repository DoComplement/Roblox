do	-- server hop
    local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/0?limit=100&excludeFullGames=true"
	local function getServers()
		local succ,servers = pcall(game.HttpGetAsync, game, url);
		while(not(succ)and task.wait(5))do
			succ,servers = pcall(game.HttpGetAsync, game, url);
		end;

		return game:GetService("HttpService"):JSONDecode(servers).data;
	end;

	local servers = nil;
	repeat servers = getServers();
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(#servers)].id);					-- game may crash here occasionally
	until not task.wait(1);
end;
