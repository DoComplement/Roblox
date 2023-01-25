
warn("BEGIN")  -- just here during testing

-- Declaration of paths to be used
local PlayerBin = game:GetService("Players")
local chr = PlayerBin.LocalPlayer.Character     -- for teleporting the player
local tCFR = chr.HumanoidRootPart.CFrame.p      -- for teleporting the player to their original place
local Shadows = game.Workspace:WaitForChild("Shadows")
local crates = game:GetService("Players").LocalPlayer.Crates:GetChildren()
local Initials = {}

-- setting the initial value of the user's crates
for _,crate in ipairs(crates) do
    table.insert(Initials, crate.value);
end;


-- Creating an instance to control activation of the While Loop
if PlayerBin.LocalPlayer:FindFirstChild("LOOP_CONSTRAINT") == nil then
    
    g_ = Instance.new("TextBox")
    g_.Name = "LOOP_CONSTRAINT"
    g_.Parent = PlayerBin.LocalPlayer
    g_.Transparency = 1
    g_.Text = "90"
    
    print("Loop constraint created successfully")
    
else
        
    PlayerBin.LocalPlayer:FindFirstChild("LOOP_CONSTRAINT").Transparency = 1    
    
end


-- iter => counts the iteration (for testing i guess)
local iter = 0


-- function to count the number of crates/boxes spawned in the workspace
local function count(location)
    
    local val = 0
    
    for i,v in ipairs(location:GetChildren()) do
        if v:FindFirstChild("TouchInterest") ~= nil and v:FindFirstChild("Open") ~= nil then val += 1; end; 
    end;
    
    return val
    
end

local function change(r)
    
    local step = 0
    
    if r == 0 then
        
        return 0
        
    else
        for i,crate in ipairs(crates) do
            
            step += (crate.value - Initials[i])
            
        end
    end
    
    return step
    
end



local function caseTeleport(Location)
    
    if count(Location) > 0 then

         for i,v in ipairs(Location:GetChildren()) do
                
            -- checks if there are any crates/any other objects of interest spawned in the workspace
            if v:FindFirstChild("TouchInterest") and v:FindFirstChild("Open") then
                
                -- determines the location of the thing
                cfPass = v.CFrame.p
                -- print(cfPass)
                    
                -- teleports the player to the object until the object has been picked up
                chr:SetPrimaryPartCFrame(CFrame.new(cfPass.x, cfPass.y + 1, cfPass.z))
                wait(0.25)
                    
            end
                
        end
        
        chr:SetPrimaryPartCFrame(CFrame.new(tCFRi.x, tCFRi.y + 1, tCFRi.z))
        
    end
end

while wait(tonumber(PlayerBin.LocalPlayer:FindFirstChild("LOOP_CONSTRAINT").Text)) do
    
    tCFRi = chr.HumanoidRootPart.CFrame.p
    
    -- checks if the user has indicated they want to have the loop active
    if PlayerBin.LocalPlayer:FindFirstChild("LOOP_CONSTRAINT").Transparency == 1 then 
        
        -- counts and prints the iteration value and indicates the loop is active
        iter = iter + 1
        warn("Looping is Active")
        print("Iteration: ", iter)
        
        print(count(Game.Workspace) + count(Shadows), "Objects")
        
        caseTeleport(Game.Workspace)
        
        caseTeleport(Shadows)
    
    -- fires true when the user indicates they want to cease the looping ( or terminate the script )
    else
        
        if PlayerBin.LocalPlayer:FindFirstChild("LOOP_CONSTRAINT").Transparency == 0 and iter ~= 0 then
            
            -- resets the iteration value so this branch doesn't repeatedly fire true
            -- teleports the user to the location when they initiated the loop
            iter = 0
            chr:SetPrimaryPartCFrame(CFrame.new(tCFR.x, tCFR.y + 1, tCFR.z))
            
             warn("Loop ceased, waiting indefinitely until indication to restart looping...")
             print("Total crates thus far:", change(1))
        
        end    
        
        -- ends the loop if indicated by the user
        -- add a while wait(10) or whatever timer for restarting the loop
        if PlayerBin.LocalPlayer:FindFirstChild("LOOP_CONSTRAINT").Transparency == 0.5 then 
            
            warn("LOOP TERMINATED")
            print("Total crates:", change(1))
            break end
        
    end
end


