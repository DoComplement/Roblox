
-- local LocalPlayer = game:GetService("Players").LocalPlayer;
-- local Main = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer]

do -- Auto ClaimRandomReward
	local Path = game:GetService("Players").LocalPlayer.PlayerGui.UI.RandomReward;
	local Function = getconnections(Path.Claim.MouseButton1Click)[1].Function;
	
	if(Path.Visible)then Function()end;
	Path:GetPropertyChangedSignal("Visible"):Connect(function()
		if(Path.Visible)then Function()end;
	end);
end;

-- Upgrade
-- game:GetService("ReplicatedStorage").Events.Upgrade:FireServer(FRAME_NAME);
do
	local Path = game:GetService("Players").LocalPlayer.PlayerGui.UI.Upgrades.ScrollingFrame:GetChildren();
	for idx=4,#Path do
		idx = Path[idx];
		idx.Visible = true;
		--[[
		compare localplayer gems with idx.Container.Amount.Text
		Upgrade with -> getconnections(idx.UpgradeButton.Hitbox.Activated)[1].Function();
		]]
	end;
end;

do -- Collect All Keys
	local Keys = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer].data.secretCaveKeys;
	local Path = Workspace.Keys;
	
	local function checkKey(Key)
		if table.find(Keys,Key)==nil then
			getconnections(Key.Touched)[1].Function();
		end;
	end;
	
	for _,Key in ipairs(Path:GetChildren())do checkKey(Key)end;
	Path.ChildAdded:Connect(checkKey);
end;

do -- Auto Collect Stars
	local Path = Workspace.Shiny; -- Stars spawn in here over time
	
end;

do -- Auto Portal Purchase
	local portals = ;
	local main = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer]
	local unlockPortal = data.unlockPortal; 

	-- unlockPortal(data,portal_name,false);
end;

do -- Auto Hatch Eggs
	local a = {}; -- passes
	local b = "85M Egg"; -- egg name
	local c = 1; -- 1/0-> auto disabled,enabled
	
	local data = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer];
	local hatchEgg = data.hatchEgg;
	getgenv().AUTO = true;
	local w = task.wait;
	
	while w(0.85)and AUTO do
		hatchEgg(data,a,b,c);
	end;
end;


do -- Auto Fuse Pets (going to be so much more complicated without a simpler design)
	
	local LocalPlayer = game:GetService("Players").LocalPlayer;
	local removeList = {}; -- fix auto remove pets for fast egg hatching
	for _,gui in ipairs(LocalPlayer.PlayerGui.Billboards.EggShops:GetChildren()) do
		for idx,pet in ipairs(gui.EggShop.Content.Content:GetChildren()) do
			if(idx==1)then continue end;
			local name = pet.Contents.ViewportFrame:FindFirstChildOfClass("Model");
			if(name==nil)then
				for _,obj in ipairs(pet.Contents:GetChildren())do
					if(obj.ClassName=="ImageLabel"and obj.ScaleType.Value==3)then
						name = obj;
						break;
					end;
				end;
			end
			name = name.Name;
			local del = pet.Contents.Delete;
			if del.AbsoluteSize.X>1 then 
				removeList[name]=true 
			else
				del.Visible = false;
			end;
			pet.Contents.Hitbox.MouseButton1Click:Connect(function()
				del.Visible = not del.Visible;
				if del.Visible then
					removeList[name]=true;
				else
					removeList[name]=nil;
				end;
			end);
		end;
	end;
	
	local fuseList = { -- Data Format
		["85M Blue Jay"] = {
			[1] = {[1]=true,[2]=-1,[3]={'','','',''}}; -- isShiny
			[2] = {[1]=true,[2]=-1,[3]={'','','',''}}; -- isRainbow
			[3] = {[1]=true,[2]=-1,[3]={'','','','','',''}}; -- Forge
		};
		["85M Duck"] = {
			[1] = {[1]=true,[2]=-1,[3]={'','','',''}};
			[2] = {[1]=true,[2]=-1,[3]={'','','',''}};
			[3] = {[1]=true,[2]=-1,[3]={'','','','','',''}};
		};
		["85M Toucan"] = {
			[1] = {[1]=true,[2]=-1,[3]={'','','',''}};
			[2] = {[1]=true,[2]=-1,[3]={'','','',''}};
			[3] = {[1]=true,[2]=-1,[3]={'','','','','',''}};
		};
		["85M Axolotl Dominus"] = {
			[1] = {[1]=true,[2]=-1,[3]={'','','',''}};
			[2] = {[1]=true,[2]=-1,[3]={'','','',''}};
			[3] = {[1]=true,[2]=-1,[3]={'','','','','',''}};
		};
		["85M Pheonix Axolotl"] = {
			[1] = {[1]=true,[2]=-1,[3]={'','','',''}}; -- isShiny
			[2] = {[1]=false,[2]=-1,[3]={'','','',''}}; -- isRainbow
			[3] = {[1]=false,[2]=-1,[3]={'','','','','',''}}; -- Forge
		};
	};
	
	local IgnoreEquipped,IgnoreEnchanted = true,true;
	local main = require(game:GetService("ReplicatedStorage").Classes.Player).players[LocalPlayer];
	local startForge,completeForge,upgradePet,removePet = main.startForge,main.completeForge,main.upgradePet,main.removePet;
	
	local function ResetList()
		for _,Pet in next,fuseList do
			Pet[1][2],Pet[2][2],Pet[3][2] = -1,-1,-1;
		end;
	end;
	
	local function CheckPet(id,list,count,up,changed)
		if(#list==count)then
			if(up=="isVoid")then
				startForge(main,id,list,up);
				completeForge(main,id,false);
			else
				upgradePet(main,id,list,up);
			end;
			return true,-1;
		end;
		list[count+1]=id;
		return changed,count;
	end;
	
	local pets = main.data.pets;
	local function UpgradePetSearch(changed,temp)
		for _,pet in ipairs(pets) do
			if(removeList[pet.name])then -- slows down the process,but watevs
				removePet(main,pet.id);
				continue;
			elseif(pet.isVoid)or(IgnoreEquipped and pet.isEquipped)or(IgnoreEnchanted and pet.enchantment~=nil)then continue end;
			
			temp = fuseList[pet.name];
			if(temp==nil)then 
				continue
			elseif(pet.isRainbow)then if(temp[3][1])then
					temp=temp[3];
					changed,temp[2] = CheckPet(pet.id,temp[3],temp[2]+1,"isVoid",changed); -- pets will be removed upon game rejoin if you haven't unlocked void enchanting
				end;
			elseif(pet.isShiny)then if(temp[2][1])then
					temp=temp[2];
					changed,temp[2] = CheckPet(pet.id,temp[3],temp[2]+1,"isRainbow",changed);
				end;
			elseif(temp[1][1])then
				temp=temp[1];
				changed,temp[2] = CheckPet(pet.id,temp[3],temp[2]+1,"isShiny",changed);
			end;
		end;
		
		ResetList();
		return changed;
	end;
	
	local sigCount,w = 0,task.wait;	
	local function CallSearch()
		sigCount+=1;
		if(sigCount==1)then
			while UpgradePetSearch(false,nil)do w()end;
		end;
		sigCount-=1;
	end;
	
	task.defer(CallSearch);
	LocalPlayer.PlayerGui.UI.Inventory.ScrollingContainer.MaxSpace.Contents:GetPropertyChangedSignal("Text"):Connect(CallSearch);
end;

-- Auto Rebirth
do -- Fast AutoRebirth, remote function is preferred for speed
	local LocalPlayer,C = game:GetService("Players").LocalPlayer,Color3.fromRGB(88,125,159);
	local t = LocalPlayer.PlayerGui.UI.Rebirth.ScrollingContainer.ScrollingFrame;
	local i = #require(game:GetService("ReplicatedStorage").Classes.Player).players[LocalPlayer].data.rebirthButtons
	
	local R = game:GetService("ReplicatedStorage").Events.Rebirth;
	local F = R.FireServer;

	for i,v in ipairs(t:GetChildren()) do
		if i>2 and v.Rebirth.Text == "500K Rebirths" then
			if v.Background.BackgroundColor3==C then
				getconnections(v.Activated)[1].Function();
			else
				v.Background:GetPropertyChangedSignal("BackgroundColor3"):Once(getconnections(v.Activated)[1].Function);
			end;
		end;
	end;

	local c = 0;
	t.ChildAdded:Connect(function(child)
		c += 1;
		if(c==i)then
			if(child.Background.BackgroundColor3==C)then
				child.Background:GetPropertyChangedSignal("BackgroundColor3"):Wait();
			end;
			child.Background:GetPropertyChangedSignal("BackgroundColor3"):Wait();
			F(R,1e+6);
			c = 0;
		end;
	end);
	
	local QR = LocalPlayer.PlayerGui.UI.QuickRebirth.CurrentRebirth;
	local T = QR.Amount;
	local wait = task.wait;
	local f = getconnections(QR.Hitbox.Activated)[1].Function;

	
	local clr = Color3.fromRGB(85,255,127);
	local content = LocalPlayer.PlayerGui.UI.Settings.ScrollingContainer.ScrollingFrame["Quick Rebirths"].Content;
	local connection = getconnections(content.Button.Activated)[1];

	if(content.BackgroundColor3~=clr)then connection.Function()end;
	connection:Disable();
	
	while(wait()and QR.IsNotOccluded and T.Text=="1M")do f()end;
	QR:GetPropertyChangedSignal("IsNotOccluded"):Connect(function()
		while(wait()and QR.IsNotOccluded and T.Text=="1M")do f()end;
	end);
end;

do -- inefficient, but fastest AutoRebirth
	local w = task.wait;
	local R = game:GetService("ReplicatedStorage").Events.Rebirth;
	local F = R.FireServer;
	while(w())do F(R,1e+6)end;
end;

-- AutoTap
task.defer(function() -- remote event is preferred over in-game function
	local R = game:GetService("ReplicatedStorage").Events.Tap;
	local F = R.FireServer;
	local wait = task.wait;

	while(wait())do F(R,"Main")end;
end);

do -- AutoDaily rewards
	local Frame = game:GetService("Players").LocalPlayer.PlayerGui.UI.Store.Frame.ScrollingFrame.DailySpin.Frame.Open;
	local main = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer];
	local openDailyReward = main.openDailyReward;

	if(Frame.Visible)then openDailyReward(main)end;
	Frame:GetPropertyChangedSignal("Visible"):Connect(function()
		if(Frame.Visible)then openDailyReward(main)end;
	end);
end;


do -- AutoGroup rewards
	local LP = game:GetService("Players").LocalPlayer
	local Frame = LP.PlayerGui.UI.Store.Frame.ScrollingFrame.GroupRewards;
	local main = require(game:GetService("ReplicatedStorage").Classes.Player).players[LP];
	local claimGroupRewards = main.claimGroupRewards;
	
	while(not LP:IsInGroup(14728016))do task.wait(1)end;

	if(Frame.Visible)then claimGroupRewards(main)end;
	Frame:GetPropertyChangedSignal("Visible"):Connect(function()
		if(Frame.Visible)then claimGroupRewards(main)end;
	end);
end;


do -- Claim All Codes
	local knowncodes = require(game:GetService("ReplicatedStorage").Data.Codes);knowncodes["secretfreepetcode"] = true;
	local main = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer];
	local claimCode = main.claimCode;

	for code in next,knowncodes do claimCode(main,code)end;
end;

do -- Auto Claim Rank Rewards
	local UI = game:GetService("Players").LocalPlayer.PlayerGui.UI;
	for _,child in ipairs(UI:GetChildren()) do
		if child:IsA("ScreenGui") and child.Name=="ClaimScreen" then
			getconnections(child.Frame.Information.Equip.MouseButton1Down)[1].Function();
		end;
	end;
	UI.ChildAdded:Connect(function(child)
		if child.Name=="ClaimScreen" then
			task.wait(); -- wait for the connection
			getconnections(child.Frame.Information.Equip.MouseButton1Down)[1].Function()
		end;
	end);
	
	local ClaimLabel = UI.Achievements.Content.ScrollingFrame.TappingRank.Bottom.Claim.TextLabel;
	local main = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer];
	local claimRankReward = main.claimRankReward;
	
	if(ClaimLabel.Text=="Claim")then claimRankReward(main,true)end;
	ClaimLabel:GetPropertyChangedSignal("Text"):Connect(function()
		if(ClaimLabel.Text=="Claim")then claimRankReward(main,true)end;
	end);
end;

do -- Claim On-Screen ClaimScreen
	local UI = game:GetService("Players").LocalPlayer.PlayerGui.UI;
	for _,child in ipairs(UI:GetChildren())do
		if(child:IsA("ScreenGui") and child.Name=="ClaimScreen")then
			getconnections(child.Frame.Information.Equip.MouseButton1Down)[1].Function();
		end;
	end;
	
	UI.ChildAdded:Connect(function(child)
		if(child.Name=="ClaimScreen" and task.wait())then -- check and wait for the connection
			getconnections(child.Frame.Information.Equip.MouseButton1Down)[1].Function();
		end;
	end);
end;


do -- Equip Best Pets
	local main = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer];
	local equipPet,unequipPet,getPetMultiplier = main.equipPet,main.unequipPet,main.getPetMultiplier;
	
	for id in next,main.equippedPets do unequipPet(main,id)end;

	local list = {};
	for idx,pet in ipairs(main.data.pets)do
		list[idx] = {getPetMultiplier(pet),pet.id};
	end;

	table.sort(list,function(a,b)return a[1]>b[1]end);
	for idx=1,main.data.maxEquips do equip(main,list[idx][2])end;
end;

do -- Auto Claim Santa Gift
	local main = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer];
	local claimSantaGift = main.claimSantaGift;
	
	local CanClaim = game:GetService("Players").LocalPlayer.PlayerGui.UI.SantasGifts.CanClaim;
	
	if(CanClaim.Text=="CLAIMABLE!")then claimSantaGift(main)end;
	CanClaim:GetPropertyChangedSignal("Text"):Connect(function()
		if(CanClaim.Text=="CLAIMABLE!")then claimSantaGift(main)end;
	end);
end;

do -- Auto Increase Discovery Levels
	local main = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer];
	local increaseDiscoveryLevel = main.increaseDiscoveryLevel;
	
	local progress = game:GetService("Players").LocalPlayer.PlayerGui.UI.PetIndex.Content.Tier.Progress.Value;
	local unit = UDim2.new(1,0,1,0);
	
	if(progress.Size==unit)then increaseDiscoveryLevel(data)end;
	progress:GetPropertyChangedSignal("Size"):Connect(function()
		if(progress.Size==unit)then increaseDiscoveryLevel(data)end;
	end);
end;

do -- Infinite Jumps
	local main = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer];
	local data = getupvalue(main.save,5).players[game.Players.LocalPlayer].data;
	local normalValue = data.jumps;
	
	data.jumps = 0xFFFFFFFF; -- set this value to whatever you want the quantity to be (number above is used to reset)
end;


do -- Auto Rebirth Shop
	local PurchaseRebirthShop = game:GetService("ReplicatedStorage").Events.PurchaseRebirthShop; -- calling script: game:GetService("Players").LocalPlayer.PlayerScripts.Launcher.Handlers.RebirthShop
	local BuyRebirthButton = PurchaseRebirthShop.Parent.BuyRebirthButton; -- calling script: game:GetService("Players").LocalPlayer.PlayerScripts.Launcher.Handlers.RebirthShop
	local FireServer = PurchaseRebirthShop.FireServer;
	
	FireServer(PurchaseRebirthShop,"Autotap"); -- one example
	FireServer(BuyRebirthButton,2000000); -- one example
end;

do -- Super/.../Ultra Rebirth
	local main = require(game:GetService("ReplicatedStorage").Classes.Player).players[game:GetService("Players").LocalPlayer];
	local superRebirth = main.superRebirth;
	local ultraRebirth = main.ultraRebirth;
	
	-- superRebirth(main);
	ultraRebirth(main);
end;
