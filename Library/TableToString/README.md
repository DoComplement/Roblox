# Information
- Upon execution, the `Stringify.lua` file will add the ConvertTable function to the game environment (genv)

```   
loadstring(Game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/StringifyTable.lua"))()
``` 

## Usage
- The code can be placed in the autoexec folder, but you can either save the auto-updating loadstring or copy and save the raw code 
- Input Parameters
    1) <tuple> Table --> The table to be converted to string
    2) <string> Name --> Name of MAIN table
    3) <boolean> Sort --> Output table will be sorted. (true => Ascending, false => Descending, nil => Do not sort)
<div align="center">Examples<\div>
```  
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
