
local CurrentCamera = Workspace.CurrentCamera;
local Player = game:GetService("Players").LocalPlayer;
local Mouse = Player:GetMouse();

local character = (Player.Character or Player.CharacterAdded:Wait());
if(not character.PrimaryPart)then
	character:GetPropertyChangedSignal("PrimaryPart"):Wait();
end;

local rootPart,humanoid = character.PrimaryPart,character:WaitForChild("Humanoid");
Player.CharacterAdded:Connect(function(Char)
	Char:GetPropertyChangedSignal("PrimaryPart"):Wait();
	rootPart,humanoid = Char.PrimaryPart,Char:WaitForChild("Humanoid");
end);

local FOCUS = '';
if(humanoid.RigType==Enum.HumanoidRigType.R15)then
	FOCUS = "UpperTorso";
else
	FOCUS = "Torso";
end;

local OldNameCall = nil;
OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
	if(SilentAim and not checkcaller()and"FindPartOnRayWithIgnoreList"==getnamecallmethod())then
		local GivemeHead = ClosestPlayerToCurser();
		if(nil~=(GivemeHead and GivemeHead.Character and GivemeHead.Character:FindFirstChild(FOCUS)))then
			return OldNameCall(self, Ray.new(CurrentCamera.CFrame.Position, (GivemeHead.Character[FOCUS].Position - CurrentCamera.CFrame.Position).Unit * 1000), select(2, ...));
		end;
	end;
	return OldNameCall(self, ...);
end);

if game.PlaceId == 734159876 then
	local OldNameCall = nil
	OldNameCall = hookmetamethod(game, "__namecall", function(self,...)
		local Args = {...}
		if getnamecallmethod() == "FindPartOnRayWithIgnoreList" and not checkcaller() and  getgenv().SilentAim  then
			local GivemeHead = GetClosestFromCursor()
			if GivemeHead and GivemeHead.Body then
				Args[1] = Ray.new(workspace.CurrentCamera.CFrame.Position, (GivemeHead.Body.Position - workspace.CurrentCamera.CFrame.Position).Unit * 1000)
				return OldNameCall(self, unpack(Args))
			end
		end
		return OldNameCall(self, ...)
	end)
elseif game.PlaceId == 3233893879  then
	local OldNameCall = nil
	OldNameCall = hookmetamethod(game, "__namecall", function(self,...)
		local Args = {...}
		if tostring(self) == "Projectiles" and getnamecallmethod() == "FireServer" and getClosestPlayerToCursor()  and getgenv().SilentAim then
		pcall(function()        
			Args[3] = getClosestPlayerToCursor().Hitbox.Chest
			Args[4] = getClosestPlayerToCursor().Hitbox.Chest.Position
			end)
			return self.FireServer(self, unpack(Args))
		end
		return OldNameCall(self, ...)
	end)
end;