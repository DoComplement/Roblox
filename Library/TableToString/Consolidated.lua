-- pcall(printTable, '', Table to print, '')

local found = {}
local function printTable(Index, Table, Tab)
    if type(Table) == "table" then
        pcall(print, Tab..'[', tostring(Index),"] = {", "\t-->", Table)
        for i,v in next, Table do
            if type(v) == "table" and not table.find(found, v) then
                table.insert(found, v)
                printTable(i, v, Tab..'\t')
            else
                pcall(print, Tab.."\t[", tostring(i), "] = ", v) 
            end
        end
        pcall(print, Tab..'}')
    else
        print(Tab..'[',Index,"] = ",Table, "\t-->", type(Table))
    end
end

return printTable
