local filename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."_ReplicatedStorage Modules.txt"
writefile(filename, "")

for i,v in next, game:GetService("ReplicatedStorage"):GetDescendants() do if v.ClassName == "ModuleScript" then
    appendfile(filename, i..", "..v.Name.."\t\t"..v:GetFullName().."\n")
    pcall(function() for x, c in next, require(v) do appendfile(filename, x.."\t\t"..c.."\n") end appendfile(filename, "\n\n") end)
    appendfile(filename, "\n")
end end
