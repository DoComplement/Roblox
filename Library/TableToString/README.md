# Information
- Upon execution, the `Stringify.lua` file will add the StringifyTable function to the game environment (genv)
- The function will return a string-format of the input table, also influenced by the other arguments.

```   
loadstring(Game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/StringifyTable.lua"))()
``` 

## Usage
- The code can be placed in the autoexec folder, but you can copy the auto-updating loadstring or copy the raw code 
- Input Parameters
    1) <tuple> Table	 --> The table to be converted to string
    2) <string> MainName --> Name of MAIN table (input not required, see 1st example)
    3) <boolean> Sort 	 --> Output table will be sorted. (true => Ascending, false => Descending, nil => Do not sort)

## Examples
```  
local Table = {1, 3, 2, 5, 4}
print(getgenv().StringifyTable(Table, nil, true)) --> Sort Ascending
--[[ Output
{
	[1] = 1,
    	[2] = 2,
	[3] = 3,
	[4] = 4,
	[5] = 5
}
]]   
```
```
local Table = {['O'] = 3, ['A'] = 1, ["and Sometimes"] = 'Y', ['I'] = 2, ['E'] = "Good", ['U'] = 4}
setclipboard(getgenv().StringifyTable(Table, "Vowels", true))
--[[ Output
local Vowels = {
	["A"] = 1,
	["E"] = "Good",
	["I"] = 2,
	["O"] = 3,
	["U"] = 4,
	["and Sometimes"] = "Y"
}
]]
```

## Improvements
- Allows for sorting 
- Indexes through scope-level-defined dictionaries via ipairs (fastest way, no gapple)  
    - A new set of Indices (literally the name of the variable) is defined for each table  
- Includes the (not obvious) type next to each value in the table
```  
{ 
    ["imgonna"] = "blueberry", 
    ["sugondese"] = yumberry_pomegranate  --> function...   
}
```  

## To do
- When an input is _invalid_, include an output statement regarding what went wrong.
