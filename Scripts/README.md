# Scripts

## EventSpy  
```     
loadstring(Game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Scripts/EventSpy.lua"))()
```     
- Prints the invoked RemoteEvents and fired RemoteFunctions to the standard output with 
  - Calling Instance with call type (InvokeServer, FireServer)   
  - Path of Calling Instance   
  - Path of Calling Script (for spoofing)      
  - Other stuff later on    

## StudyProtectedTable  (because I don't know a better way to get the indices)    
```     
local StudyTable = loadstring(Game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Scripts/StudyProtectedTable.lua"))()
```       
- Finds the hidden indices of the a protected table whose indices return nil from a forced call    
  - will format the found indeces into a table and store the output in a file    
  - prints each found index and table to the standard output    
  - may break some (hopefully) inconsequential in-game functions while actively spying  
  - (To do) Implement a function input & corresponding output hook for found functions in the table (fix the hookfunction solution)
  - Other stuff   

## Hookfunction Solution (credit goes to 0866 on v3rmillion)
```    
local createHook = loadstring(Game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Scripts/HookSolution.lua"))()
```        
- hooks functions with upvalue errors upon normal hookfunction attempts (arg#2, too many upvalues error)
- doesn't update the original function
  -> allows for repeated, unique hooking and unhooking (hooking with nil)
  
## ClearDevConsole
```   
local ClearDevConsole = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Scripts/ClearDevConsole.lua"))()
```   
- clears all the messages currently in the dev console upon execution
- messages after each clear will reappear every time the dev console is re-opened
- the function can be bound to a keybind to clear the console on some command as well as setting the command to F9 so the console always opens cleared

## SimulateJump
```   
local Jump = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Scripts/SimulateJump.lua"))()
```   
- simulates a single jump upon execution

### To do
- Add spy methods for all metamethods for a metatable with easy configuration
  - make the spy into a gui cuz yolo
   
  ![loverboy](https://github.com/DoComplement/Images/blob/fd316b4c24280d1a1a3aab909c0d891e5563e81f/foxy.png)
