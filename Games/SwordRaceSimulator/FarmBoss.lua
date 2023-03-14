-- not working currently

local WepInv = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.UI.CenterMenu.WeaponInventory.Container.Right.List;
local WepFuse = game.ReplicatedStorage.Remotes.RE_WeaponFuse;

local Data = {};

do 
	local Changed=true;
	while Changed do
		Changed=false;
		for idx,Wep in ipairs(WepInv:GetChildren()) do
			if idx==1 or Wep.Info:FindFirstChild("Effect-Godly")~=nil then
				continue;
			elseif Data[Wep.Info.Power.Text]==nil then
				if Wep.Info:FindFirstChild("Effect-Divine")~=nil then
					Data[Wep.Info.Power.Text]={1,2};
				else
					Data[Wep.Info.Power.Text]={1,4};
				end;
			else
				idx=Data[Wep.Info.Power.Text];
			
				if idx[1]==idx[2] then
					Changed=true;
					WepFuse.FireServer(WepFuse,Wep.Name);
					idx[1]=0;
				else
					idx[1]+=1;
				end;
			end;
		end;
	end;
end;

for pet,reg in next,Data do
	if reg[1]==0 then Data[pet]=nil end;
end;
