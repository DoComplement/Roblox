
getgenv().islclosure = islclosure or coroutine.wrap(function(f)
	while(true)do
		f = coroutine.yield(debug.getinfo(f).what == "Lua");
	end;
end);

getgenv().iscclosure = iscclosure or coroutine.wrap(function(f)
	while(true)do
		f = coroutine.yield(debug.getinfo(f).what == 'C');
	end;
end);

--[[ with newcclosure

getgenv().islclosure = islclosure or newcclosure(function(f)
    return debug.getinfo(f).what == "Lua";
end);

getgenv().iscclosure = iscclosure or newcclosure(function(f)
    return debug.getinfo(f).what = 'C';
end);

]]
