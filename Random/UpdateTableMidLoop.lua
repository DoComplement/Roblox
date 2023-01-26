-- this script shows that the list loops can be updated mid-for-loop to loop over the added values

local test = {1, 2, 3, 4, 5};
local COMMENCE = false;
task.defer(function()
    for i,v in ipairs(test) do
        COMMENCE = true;
        print(i,v)
        task.wait(1);
    end;
end);

repeat task.wait() until COMMENCE; -- waits until loop has started
for i = 6, 15 do -- update the table
	table.insert(test, i);
end;

-- printing table values
print("\n{");
for i,v in ipairs(test) do 
	print("\t["..i.."] = "..v..',');
end;
print("}\n");
