# Information
- Stuff goes here

## To do
- Perhaps, separate the chat module and the other path module
- create filter function to not lower the string capitalization
- alleviate filtering usernames outside the server (not necessary)
  - only feasible method is through format-filtering (using gsub, but gsub unfortunately acts as gmatch, see next point)
- determine method to use gsub with a format
  - `gsub("[SYSTEM] (.+) .@(.+). has done something...")` -> _[SYSTEM] filtered_name (@filtered_name) has done something..._
- add a _Humanoid.DisplayChange_ snippet in the _chatFilterMain.addPlayer_ function and also a .Changed signal or metatable to all Humanoid DisplayName properties (check if the DisplayName is even used in the game before proceeding)
``` 
__index = hookmetamethod(game, "__index", newcclosure(function(Self, Index)  
    if tostring(Self) == "Humanoid" and tostring(Index) == "DisplayName" then -- or something like such
        return (Self, nil) -- or something like such
    end
    return __index(Self, Index)
end 
```
- Ignore Friends (with toggle)
- Add these types of filtering
  - [Empty] => Filters names with an empty character
  - [Player #] => Filters names with Player followed by the player's respective index
