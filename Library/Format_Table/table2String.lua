if getgenv().table2String then getfenv(getgenv().table2String).script:Destroy() end
getgenv().table2String = function(Table, Title)
    if not Table or type(Table) ~= "table" then print("ERROR! Invalid table input!") return end
    
    local function getLength(Table) 
        local count,last = 1
        if type(Table) == "table" then
            count = 0
            for i,v in next, Table do 
                count = count + 1 
                last = v
            end
        end
        return count,last
    end
    
    local function formatTable(entity, title, scope_level, isLast)
        scope_level = scope_level or 0
        
        local tab,tableString = table.concat(table.create(scope_level, '\t')),{}
        local size,last = getLength(entity)
    
        if scope_level ~= 0 then
            if type(title) == "string" then 
                title = "[\""..title.."\"]" 
            else
                title = '['..title..']'
            end
        else
            if string.match(title, "%S+") ~= "local" then
                title = "local "..title
            end
        end
        
        if type(entity) == "table" then
            if size > 0 then
                table.insert(tableString, tab..title.." = {\n")
                for idx,ent in next, entity do
                    table.insert(tableString, formatTable(ent, idx, scope_level + 1, ent == last))
                end
                table.insert(tableString, tab.."}")
            else
                table.insert(tableString, tab..title.." = {}")
            end
        else
            if type(entity) == "string" then entity = "\""..entity.."\"" end
            table.insert(tableString, tab..title.." = "..tostring(entity))
        end
      
        if isLast == false then table.insert(tableString, ',') end
        table.insert(tableString, '\n')
        return table.concat(tableString)
    end
    
    return formatTable(Table, Title or "ConvertedTable")
end

print("<string> getgenv().table2String(<table> Table, <string> nil or Table_Name)")

--[[ Examples
    local table2String = getgenv().table2String

    local Servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. tostring(game.PlaceId) .. "/servers/Public?limit=100"))
    print(table2String(Servers, "Servers"))
    writefile("Servers.txt", table2String(Servers, "Servers"))
    etc.
]]

