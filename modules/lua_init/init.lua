
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

getgenv().islclosure = islclosure or newcclosure(function(f)
	return debug.getinfo(f).what == "Lua";
end);

getgenv().iscclosure = iscclosure or newcclosure(function(f)
	return debug.getinfo(f).what == 'C';
end);
