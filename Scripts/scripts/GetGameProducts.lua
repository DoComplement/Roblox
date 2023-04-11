local developerProducts = game:GetService("MarketplaceService"):GetDeveloperProductsAsync():GetCurrentPage()

local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."_Products.txt"

print("Filename:", gameName)

writefile(gameName, "")
 
for _, developerProduct in pairs(developerProducts) do
    for field, value in pairs(developerProduct) do
        appendfile(gameName, field .. ": " .. value.."\n")
    end
    appendfile(gameName, "\n")
end