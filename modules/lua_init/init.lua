
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
