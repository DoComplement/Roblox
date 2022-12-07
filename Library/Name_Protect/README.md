# Information
- Stuff goes here

## To do
- create filter function to not lower the string capitalization
- alleviate filtering usernames outside the server (not necessary)
  - only feasible method is through format-filtering (using gsub, but gsub unfortunately acts as gmatch, see next point)
- determine method to use gsub with a format
  - `gsub("[SYSTEM] (.+) .@(.+). has done something...")` -> [SYSTEM] filtered_name (@filtered_name) has done something...
- add .Changed signal or metatable to all Humanoid DisplayName properties (check if the DisplayName is even used in the game before proceeding)
  - `__index = hookmetamethod(game, "__index", newcclosure(function(Self, Index) if tostring(Self) == "Humanoid" and tostring(Index) == "DisplayName" ... _then_do_stuff_`
