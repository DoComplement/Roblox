if Game:IsLoaded() == false then Game.Loaded:Wait() end
local Username = Game:GetService("Players").LocalPlayer.Name
local OldNamecall

OldNamecall = hookmetamethod(Game, "__namecall", function(Self, ...)
    if checkcaller() and getmetamethod() == "GetFullName" then
        local Filter = OldNamecall(Self, ...):gsub(Username, "LocalPlayer") -- removes username from string
        return Filter
    end
    
    return OldNamecall(Self, ...)
end
