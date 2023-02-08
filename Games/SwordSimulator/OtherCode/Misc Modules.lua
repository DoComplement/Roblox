
local LocalPlayer = game:GetService("Players").LocalPlayer)
local TeleportService = game:GetService("TeleportService")

-- Teleport to other server of the current game

local Teleporting = false
-- TeleportOther.MouseButton1Down:Connect(function()
	if not Teleporting then
		Teleporting = true
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
		delay(10, function() 
			TeleportService:TeleportCancel()
			Teleporting = false 
		end)
	end
-- end)


-- Teleport to same server

-- TeleportCurrent.MouseButton1Down:Connect(function()
	if not Teleporting then
		Teleporting = true
		TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
		delay(10, function() 
			TeleportService:TeleportCancel()
			Teleporting = false 
		end)
	end
-- end)


-- Teleport to main game / Trade World

--[[ Create TextButton Instance with name: TeleportBack ]]

local TeleportBackID = nil
TeleportBack.Text = nil

if game.PlaceId == 11127874647 then 
	TeleportBack.Text == "Teleport to Main Game"
	TeleportBackID = 7026949294
else
	TeleportBack.Text == "Teleport to Trade World"
	TeleportBackID = 11127874647
end

TeleportBack.MouseButton1Down:Connect(function()
	if not Teleporting then
		Teleporting = true
		TeleportService:Teleport(TeleportBackID, LocalPlayer)
		delay(10, function() 
			TeleportService:TeleportCancel()
			Teleporting = false 
		end)
	end
end


-- update radius of cylinder based on sword
-- [[ MAY NOT BE NECESSARY ]]

local Player = workspace[game.Players.LocalPlayer.Name]
local function updateHitRadius(RADIUS)
	if workspace["Cylinder"] and RADIUS >= 12 then
		radius = RADIUS + 3
		workspace["Cylinder"].Size = Vector3.new(radius, radius, radius)
		print(radius)
	end
end

Player.ChildAdded:Connect(function(child)
	if child.ClassName == "Tool" then 
		updateHitRadius(2*math.round(child:WaitForChild("Blade").Size.Magnitude))
	else
		if child.Name == "WeaponToolVisual" then
			local tempRadius = 2*math.round(child:WaitForChild("Blade").Size.Magnitude)
			if tempRadius > radius then updateHitRadius(tempRadius) end
		end
	end
end)

Player.ChildRemoved:Connect(function()
	delay(1, function()
		local tool, r1 = Player:FindFirstChildOfClass("Tool")
		local secondary, r2 = Player:FindFirstChild("WeaponToolVisual")
		if tool then
			r1 = 2*math.round(tool.Blade.Size.Magnitude)
			if secondary then
				r2 = 2*math.round(secondary.Blade.Size.Magnitude)
				if r1 ~= radius and r2 ~= radius then
					if r1 < r2 then
						updateHitRadius(r2)
					else 
						updateHitRadius(r1)
					end
				end
			end
			if r1 ~= radius then
				updateHitRadius(r1)
			end
		end
	end)
end)
