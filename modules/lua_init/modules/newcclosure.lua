
getgenv().newcclosure = newcclosure or coroutine.wrap(function(f)
	while(true)do
		local c = f;
		f = coroutine.yield(coroutine.wrap(function(...)
			local args = {...};
			while(true)do
				args = {coroutine.yield(c(table.unpack(args)))};
			end;
		end));
	end;
end);

-- or

if(not newcclosure)then
    local function newc(f)
        return coroutine.wrap(function(...)
            local args = {...};
            while(true)do
                args = {coroutine.yield(f(table.unpack(args)))};
            end;
        end);
    end;
    getgenv().newcclosure = coroutine.wrap(function(f)
        while(true)do
            f = coroutine.yield(newc(f));
        end;
    end);
end;
