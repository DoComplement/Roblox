# Scripts

## EventSpy  
`loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Scripts/EventSpy.lua"))()`  
- Prints the invoked RemoteEvents and fired RemoteFunctions to the standard output with 

<div align="center">**Included**</div>
  - Calling Instance with call type (InvokeServer, FireServer)   
  - Path of Calling Instance   
  - Path of Calling Script (for spoofing)    

<div align="center">**To Do**</div>    
  - Ideas   
  - Stuff  

## StudyProtectedTable  (because I don't know a better way to get the indices)    
`loadstring(game:httpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Scripts/StudyProtectedTable.lua"))()`   
- Finds the hidden indices of the a protected table whose indices return nil from a forced call    

<div align="center">**Included**</div>
  - will format the found indeces into a table and store the output in a file    
  - prints each found index and table to the standard output    
  - may break some (hopefully) inconsequential in-game functions while actively spying   

<div aligh="center">**To do**</div>
  - Implement a function input & corresponding output hook for found functions in the table
  - Other stuff

  ![loverboy](https://github.com/DoComplement/Images/blob/fd316b4c24280d1a1a3aab909c0d891e5563e81f/foxy.png)
