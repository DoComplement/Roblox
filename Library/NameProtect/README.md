# Information
- Stuff goes here

## To Fix
- The space offset is incorrect with each filter in the Update function is incorrect

## To do
- Add a BubbleChat Toggle
- Perhaps, separate the chat module and the other path module
- add a _Humanoid.DisplayChange_ snippet in the _chatFilterMain.addPlayer_ function and also a .Changed signal or metatable to all Humanoid DisplayName properties (check if the DisplayName is even used in the game before proceeding)
``` 
__index = hookmetamethod(game, "__index", newcclosure(function(Self, Index)  
    if tostring(Self) == "Humanoid" and Index == "DisplayName" then -- or something like such
        return (Self, Filter) -- or something like such
    end
    return __index(Self, Index)
end 
```
- Ignore Friends (with toggle)
- Add these types of filtering
  - [Empty] => Filters names with an empty character
  - [Player #] => Filters names with Player followed by the player's respective index
