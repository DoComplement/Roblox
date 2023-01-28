local CreateInstance;
CreateInstance = hookfunction(Instance.new, function(ObjectType, Properties)
	if checkcaller() == false or type(Properties) ~= "table" then
		return CreateInstance(ObjectType, Properties);
	end;
	local Instance = CreateInstance(ObjectType);
	for Attribute, Value in next, Properties do
		Instance[Attribute] = Value;
	end;
	return Instance;
end);
