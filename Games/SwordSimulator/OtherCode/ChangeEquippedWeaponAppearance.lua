local LP = game:GetService("Players").LocalPlayer;
local Character = LP.Character or LP.CharacterAdded:Wait();

local Primary = Character:FindFirstChildOfClass("Tool");
local pBlade,pHandle = nil,nil;
if Primary~=nil then
	pBlade,pHandle = Primary.Blade,Primary.Handle;
end;

--[[
local Secondary,sBlade,sHandle = nil,nil,nil;
if game:GetService("MarketplaceService"):UserOwnsGamepassAsync(LP.UserId,45644681) then
	Secondary=Character:FindFirstChild("WeaponToolVisual");
	if Secondary~=nil then
		sBlade,sHandle = Secondary.Blade,Secondary.Handle;
	end;
end;

LP.ChildAdded:Connect(function(child)
	if child:IsA("Tool") then -- Primary
		Primary=child;
		pBlade,pHandle = child:WaitForChild("Blade"),child:WaitForChild("Handle");
	elseif Secondary~=nil and child.Name == "WeaponToolVisual" then -- Secondary
		Secondary=child;
		sBlade,sHandle = child:WaitForChild("Blade"),child:WaitForChild("Handle");
	end;
end);
]]

local function CreateInstance(datatype,properties)
	local i = Instance.new(datatype);
	for attribute,value in next,properties do
		i[attribute]=value;
	end;
	return i;
end;

local Weapons = game.ReplicatedStorage.Storage.Weapons;
local function EquipPrimary(Sword,Temp)
	Sword = Weapons:FindFirstChild("Sword");
	if Sword==nil or Sword.Parent~=Weapons then return end;
	
	-- Change Primary Blade Appearance
	pBlade.BrickColor = Sword.Blade.BrickColor;
	pBlade.Material = Sword.Blade.Material;
	pBlade.MeshId = Sword.Blade.MeshId;
	
	-- Change Primary Handle Appearance
	pHandle.BrickColor = Sword.Handle.BrickColor;
	pHandle.Material = Sword.Handle.Material;
	pHandle.MeshId = Sword.Handle.MeshId;
	
	-- Clear Current Meshes
	for _,Part in ipairs(Primary:GetChildren()) do
		if Part~=pBlade and Part~=pHandle then
			Part:Destroy();
		end;
	end;
	
	-- Clear Current Welds
	for _,Weld in ipairs(pHandle:GetChildren()) do
		if Weld.Part1~=pBlade then
			Weld:Destroy();
		end;
	end;
	
	-- Create New Welds 
	for _,Part in ipairs(Sword:GetChildren()) do
		if Part.Name~="Blade" and Part.Name~="Handle" then
			Temp = Part:Clone();
			Temp.Parent = Primary;
			CreateInstance("WeldConstraint",{Parent=pHandle,Part0=pHandle,Part1=Temp});
		end;
	end;
end;

local function EquipSecondary(Sword,Temp)

end;
