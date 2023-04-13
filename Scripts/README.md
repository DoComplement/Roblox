# Stuff

## AbbreviateNum
- Abbreviates a number into a cut-off decimal-size format: (depending on the format provided)
  - 1.01e+7 -> 10.01M
  - 1e+9 -> 1B
  - etc;

## Check Server Type
- returns a boolean value to indicate whether the server connected to the active roblox game of the executed script is private

## ClearDevConsole
- clears all the messages currently in the dev console upon execution
- messages after each clear will reappear every time the dev console is re-opened
- the function can be bound to a keybind to clear the console on some command as well as setting the command to F9 so the console always opens cleared

## EventSpy  
- simple event spy TEMPLATE (!!!) without any special print-formatting


## Hookfunction Solution (credit goes to 0866 on v3rmillion)
- hooks functions with upvalue errors upon normal hookfunction attempts (arg#2, too many upvalues error)
- doesn't update the original function
  -> allows for repeated, unique hooking and unhooking (hooking with nil)
  ```
  -- this, here, method only works with functions that can be indexed via a table or instance (or whatever else)
  local func = table.func_name;
  table.func_name = function(...) --[[ new function goes here ]] end;
  ```

## StudyProtectedTable  (because I don't know a better way to get the indices)          
- Finds the hidden indices of the a protected table whose indices return nil from a forced call    
  - will format the found indeces into a table and store the output in a file    
  - prints each found index and table to the standard output    
  - may break some (hopefully) inconsequential in-game functions while actively spying  
  - (To do) Implement a function input & corresponding output hook for found functions in the table (fix the hookfunction solution)
  - Other stuff   

## SimulateJump
- simulates a single jump upon execution

### To do
- Add spy methods for all metamethods for a metatable with easy configuration
  - make the spy into a gui cuz yolo
   
  ![loverboy](https://github.com/DoComplement/Images/blob/fd316b4c24280d1a1a3aab909c0d891e5563e81f/foxy.png)
