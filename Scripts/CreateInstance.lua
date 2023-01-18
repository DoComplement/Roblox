local CreateInstance
CreateInstance = hookfunction(Instance.new, function(ObjectType, Properties)
	if checkcaller() and type(Properties) == "table" then
		local Instance = CreateInstance(ObjectType)
		for Attribute, Value in next, Properties do
			Instance[Attribute] = Value
		end
		return Instance
	else
		return CreateInstance(ObjectType, Properties) 
	end
end)
