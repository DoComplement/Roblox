game.Loaded:Wait()
local Username = game:GetService("Players").LocalPlayer.Name
local OldNamecall

OldNamecall = hookmetamethod(game, "__namecall", function(Self, ...)
    if checkcaller() and getmetamethod() == "GetFullName" then
        local Filter = OldNamecall(Self, ...):gsub(Username, "LocalPlayer") -- removes username from string
        return Filter
    end
    
    return OldNamecall(Self, ...)
end
