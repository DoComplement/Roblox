## Removed Methods
```  
function queryServerSearch:copyExecutionFormat(Query, Type, Quantity)
    	local Header = "print(pcall(queryServerSearch.testTeleport, " 
    
	if queryServerSearch.Operation[Query] then
		Query = '\"'..Query.."\", "
	else
		Query = "\"Query\", "
		print("Query is invalid, setting to normalized value: \"Query\"")
	end
    
    	if queryServerSearch.optimizeQuery[Type] then
		Type = '\"'..Type.."\", "
	else
        	Type = "\"Type\", "
        	print("Type is invalid, setting to normalized value: \"Type\"")
    	end
    
	if type(Quantity) ~= "number" or math.round(Quantity) - Quantity ~= 0 or Quantity < 2 or Quantity > 100 then
		Quantity = "\"Quantity\""
		print("Quantity is invalid, setting to normalized value: \"Quantity\"")
	end 	Quantity = Quantity.."))"
    
	setclipboard(Header..Query..Type..Quantity)
	print(Header..Query..Type..Quantity, "\t\thas been set on the clipboard")
end
```  
```  
function queryServerSearch:getUsage()
	local CallFormats = {
		["Query"] = {	
			"Lowest", 	--> searches for the lowest of chosen \"Type\"
			"Highest",	
			"Equal" 	--> Haven\'t tested, but I don\'t see why it wouldn\'t work
		},
		["Type"] = {
			"ping",
			"playing",
			"fps",
			"id"
		},
		["Quantity"] = {
			[1] = 2,
			[2] = 3,
			[3] = "integers between 3 and 99",
			[4] = 99,
			[5] = 100
		}
	}
	
	--[[ Include other methods in here (for understanding and human usage) ]]
	print("\nThis module was created for Gui application -> human input can cause error,boof >:`-()")
	print("Any incorrect input will return an error, printed to the output via the pcall\n")
	print(getgenv().table2String(queryServerSearch, "queryServerSearch"))
	print(getgenv().table2String(CallFormats, "CallFormats"))
	print("execute: print(pcall(queryServerSearch.testTeleport, Query, Type, Quantity))")
	print("to get call format, execute: copyExecutionFormat(Query, Type, Quantity) ")
end
```  
