# Scripts

## EventSpy  
`loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Scripts/EventSpy.lua"))()`  
- Prints the invoked RemoteEvents and fired RemoteFunctions to the standard output with 
  - Calling Instance with call type (InvokeServer, FireServer)   
  - Path of Calling Instance   
  - Path of Calling Script (for spoofing)      
  - Other stuff later on    

## StudyProtectedTable  (because I don't know a better way to get the indices)    
`loadstring(game:httpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Scripts/StudyProtectedTable.lua"))()`   
- Finds the hidden indices of the a protected table whose indices return nil from a forced call    
  - will format the found indeces into a table and store the output in a file    
  - prints each found index and table to the standard output    
  - may break some (hopefully) inconsequential in-game functions while actively spying  
  - (To do) Implement a function input & corresponding output hook for found functions in the table
  - Other stuff   
### To do
- Add spy methods for all metamethods for a metatable with easy configuration
  - make the spy into a gui cuz yolo
   
  ![loverboy](https://github.com/DoComplement/Images/blob/fd316b4c24280d1a1a3aab909c0d891e5563e81f/foxy.png)
