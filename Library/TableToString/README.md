# Information
- Upon execution, the `Stringify.lua` file will add the ConvertTable function to the game environment (genv)

## Usage
- The code can be placed in the autoexec folder, but you can either execute the updating loadstring or copy the raw code and do so as you please
```loadstring(Game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/TableToString/StringifyTable.lua"))()``` 

## Improvements
- Indexes through scope-level-defined dictionaries via ipairs (fastest way, no gapple)  
    - A new set of Indices (literally the name of the variable) is defined for each table  
- Includes the (not obvious) type next to each value in the table
```  
{ 
    ["imgonna"] = "blueberry", 
    ["sugondese"] = yumberry_pomegranate  --> function   
}
```  

## To do
- When an input is _invalid_, include an output statement regarding what went wrong.
