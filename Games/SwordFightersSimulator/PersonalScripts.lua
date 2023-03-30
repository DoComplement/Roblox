
-- TO DO: Determine how to use Pathfinding service (should be very simple, see what "Path" instances are made of)

if(game.PlaceId~=11040063484 or getgenv()["7WDV9RYURctW?2W+EB5R"]~=nil)then return end;
getgenv()["7WDV9RYURctW?2W+EB5R"] = true;
if(not game:IsLoaded())then game.Loaded:Wait()end;

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Players = game:GetService("Players");

local LocalPlayer = Players.LocalPlayer;
local Character = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait());

if(not Character.PrimaryPart)then
	Character:GetPropertyChangedSignal("PrimaryPart"):Wait();
end;

local rootPart = Character.PrimaryPart;
local Humanoid = Character.Humanoid;

LocalPlayer.CharacterAdded:Connect(function(character)
	character:GetPropertyChangedSignal("PrimaryPart"):Wait();
	Character = character;
	rootPart = character.PrimaryPart;
	Humanoid = character.Humanoid;	
end);

local function CreateInstance(class,props)
	local inst = Instance.new(class);
	for prop,val in next,props do
		inst[prop] = val;
	end;
	return inst;
end;

local getChildren = game.GetChildren;
local wait,Data = task.wait,nil;
local Client = Workspace.Live.NPCs.Client;
local Knit = require(ReplicatedStorage.Packages.Knit);

do	-- Set WalkSpeed
	getgenv().WalkSpeed = 80;
	
	local wsSig = nil;
	wsSig = Humanoid.Changed:Connect(function(c)
		if(c=="WalkSpeed"and Humanoid[c]~=WalkSpeed)then
			Humanoid[c] = WalkSpeed;
		end;
	end);
end;

do	-- Infinite Jumps
	local jmpSig = nil;
	jmpSig = game:GetService("UserInputService").InputBegan:Connect(function(inp)
		if(inp.KeyCode.Value==32)then Humanoid:ChangeState("Jumping")end;
	end);
end

do	-- Walk on Water (Remove Water Teleport on Touched)
	local h2oConnections = {};

	for i,v in ipairs(getChildren(Workspace.Map.WATER))do
		h2oConnections[i] = getconnections(v.Touched)[1];
	end;

	local function enableH2O()
		for _,con in ipairs(h2oConnections)do
			con:Enable();
		end;
	end;

	local function disableH2O()
		for _,con in ipairs(h2oConnections)do
			con:Disable();
		end;
	end;
end;

do	-- Set JumpHeight
	getgenv().JumpHeight = 50;
	local constant = Humanoid.JumpHeight;
	
	local oldIdx,oldNIdx = nil,nil;
	oldIdx = hookmetamethod(game,"__index",newcclosure(function(self,idx)
		if(not checkcaller()and idx=="JumpHeight")then
			return(constant);
		end;
		return oldIdx(self,idx);
	end));
	oldNIdx = hookmetamthod(game,"__newindex",newcclosure(function(self,idx,val)
		if(JumpHeight~=nil and not checkcaller()and idx=="JumpHeight")then
			constant = val;
			return oldNIdx(self,idx,JumpHeight);
		end;
		return oldNIdx(self,idx,val);
	end));
end;

do	-- Auto SpinWheel
	local SpinLabel = LocalPlayer.PlayerGui.Wheel.Background.Spin.TextLabel;
	local SpinWheel = getconnections(SpinLabel.Parent.Button.MouseButton1Click)[1].Function;
	Data = getupvalue(SpinWheel,1).CachedData.PlayerData[LocalPlayer.UserId]; -- Player Data
	
	if(SpinLabel.Text=="Spin")then SpinWheel()end;
	SpinLabel:GetPropertyChangedSignal("Text"):Connect(function()
		if(SpinLabel.Text=="Spin")then SpinWheel()end;
	end);
end;

do	-- Kill Aura
	getgenv().TARGET = "Demon";
	local Click = ReplicatedStorage.Packages.Knit.Services.ClickService.RF.Click;
	local InvokeServer = Click.InvokeServer;

	local HitDetector = CreateInstance("Part",{
		Parent = Workspace;
		Name = "yolked";
		Shape = "Ball";
		Size = Vector3.new(100,100,100);
		Transparency = 1;
		CanCollide = false;
		Anchored = false;
		Locked = false;
	});
	
	game:GetService("RunService").RenderStepped:Connect(function()
		HitDetector.CFrame = rootPart.CFrame;
	end);

	HitDetector.Touched:Connect(function(hit)
		if(hit.Name=="HumanoidRootPart"and hit.Parent.Parent==Client and hit.NPCTag.NameLabel.Text==TARGET)then
			InvokeServer(Click,hit.Parent.Name); -- remote-invoke is preferred for speed
		end;
	end);
end;

do	-- for farming	
	getgenv().FARM = true;

	local function getClosestTarget()
		local dist,target = nil,nil;
		local mag = nil;
		
		for _,npc in ipairs(getChildren(Client))do
			if(not(npc.PrimaryPart)or not(npc.PrimaryPart:FindFirstChild("NPCTag"))or npc.PrimaryPart.NPCTag.NameLabel.Text~=TARGET)then
				continue;
			else
				mag = (npc.PrimaryPart.Position - rootPart.Position).Magnitude;
				if(not dist or mag<dist)then
					dist = mag;
					target = npc;
				end;
			end;
		end;
		
		return target;
	end;

	local goober = nil;
	while(FARM and task.wait())do
		goober = getClosestTarget().PrimaryPart;
		Humanoid:MoveTo(goober.Position,goober);
		goober.Parent.AncestryChanged:Wait();
	end;
end;

do	-- Auto Collect Coins
	local function collectCoin(coin)
		repeat coin.CFrame = rootPart.CFrame;
		until(wait()and not(coin.Parent));
	end;

	Workspace.Live.Pickups.ChildAdded:Connect(collectCoin);
	for _,coin in ipairs(getChildren(Workspace.Live.Pickups))do
		collectCoin(coin);
	end;
end;

do	-- Auto Ascend
	local ReadyLabel = LocalPlayer.PlayerGui.LeftSidebar.Background.Frame.BottomButtons.Ascend.ReadyLabel;
	local AscendService = Knit.GetService("AscendService");
	local Ascend = AscendService.Ascend;
	
	if(ReadyLabel.Visible)then Ascend(AscendService)end;
	ReadyLabel:GetPropertyChangedSignal("Visible"):Connect(function()
		if(ReadyLabel.Visible)then Ascend(AscendService)end;
	end);
end;

do	-- Auto Shiny/Celestial Crafting	TO IMPLEMENT
	local CraftingService = Knit.GetService("CraftingService");
	local Craft = CraftingService.Craft; -- Both shiny and celestial crafing uses the same function
	
	local toCraft = {
		["Rumblebee"] = {
			Basic = {true,0,{'','','','','','','','','',''}}; -- Shiny
			Shiny = {true,0,{'','','','',''}};
		};
	};
	
	-- for now
	local signal,checkPets = nil,nil;
	local port = LocalPlayer.PlayerGui.PetInv.Background.ImageFrame.Window.PetHolder.PetScrolling;
	getgenv().addPet = function(name,shiny,celestial)
		toCraft[name] = {
			Basic = {shiny or false,0,{'','','','','','','','','',''}}; --> Shiny
			Shiny = {celestial or false,0,{'','','','',''}}; --> Celestial
		};
		if(not signal)then
			signal = port.ChildAdded:Connect(checkPets);
		end;
	end;
	getgenv().setPet = function(name,shiny,celestial)
		if(toCraft[name]~=nil)then
			shiny = shiny or false;
			celestial = celestial or false;
			toCraft[name][1][1] = shiny;
			toCraft[name][2][1] = celestial;
		end;
	end;
	getgenv().removePet = function(name)
		toCraft[name] = nil;
		if(not next(toCraft))then
			signal = signal:Disconnect();
		end;
	end;
	
	local ignoreEquipped,ignoreEnchanted = false,false;
	local toggle = false;
	
	local function resetTables()
		for _,pet in next,toCraft do
			pet.Basic[2],pet.Shiny[2] = 0,0;
		end;
	end;
	
	local function checkPets()
		if(toggle)then return end;
		toggle = true;
		for id,pet in next,Data.PetInv do
			if(not toCraft[pet.name]or pet.locked or pet.tier=="Celestial"or(ignoreEquipped and pet.equipped)or(ignoreEnchanted and pet.enchants[1]~=nil))then continue end;
			
			pet = toCraft[pet.name][pet.tier];
			if(not pet[1])then continue end;
			
			pet[2] += 1;
			pet[3][pet[2]] = id;
			
			if(#pet[3]==pet[2])then
				Craft(CraftingService,pet[3]);
				pet[2] = 0;
			end;
		end;
		toggle = resetTables();
	end;
	
	-- when toggled or a pet is added: checkPets()
	port.ChildAdded:Connect(checkPets);
end;

do	-- Auto/Force Dismantle Pets
	local PetData = Knit.GetController("DatabaseController"):GetDatabase("Pets");
end;

do	-- Auto Weapon Crafting

end;

do	-- Auto Equip Best Weapon/Pet
	
end;

do	-- Auto Claim Pet Index		TO TEST & UPDATE
	local claimFrame = LocalPlayer.PlayerGui.Index.Background.ImageFrame.Window.PetReward.Claim;
	local indexService = Knit.GetService("IndexService");
	local claimIndex = IndexService.Claim;
	
	local claimIdx = 1;
	for _ in next,Data.PetIndexClaim do claimIdx += 1 end;
	
	while(claimFrame.Visible and wait())do 
		claimIndex(indexService,claimIdx);
		claimIdx += 1;
	end;
	claimFrame:GetPropertyChangedSignal("Visible"):Connect(function()
		if(claimFrame.Visible)then 
			claimIndex(indexService,claimIdx);
			claimIdx += 1;
		end;
	end);
end;

do	-- Auto Questing	TO DO
	local QuestService = Knit.GetService("QuestService");
	local ActionQuest = QuestService.ActionQuest;

	-- Quest Data --> Data.Quests;
	-- Unlocked Areas --> Data.Areas
	ActionQuest(QuestService,"Area XX"); -- Claim/Finish a quest in Area XX
	
	local Quests,Questlines = nil,nil;
	do	-- Retrieve Quests and Questlines
		local DataController = Knit.GetController("DatabaseController");
		Quests = DataController:GetDatabase("Quests");
		Questlines = DataController:GetDatabase("Questlines");
	end;

	--[[
		Study the Quests.lua and Questlines.lua files.
		Use the Quest Data to determine the current quest per zone (if any quest is available);
		Use that data and the Questlines to format total questline progress that current quest progress.
		The Questline data will be used to index Quests for their quantity w.r.t quest progress in Data.Quests[AREA].
		If all quests have been completed in a questline, either remove the area from the quests section, or label "All Quests Completed" by the questline.
		Multiple quests can be activated at the same time.
	]] 
end;

do	-- Auto (somewhat fast) Hatch Eggs
	do	-- Turn-off UI pop-ups
		getgenv().ign = true;
		local eggOpenController = require(ReplicatedStorage.ClientModules.Controllers.AfterLoad.EggOpenController);
		local openEgg = eggOpenController.OpenEgg;
		eggOpenController.OpenEgg = newcclosure(function(self,data)
			if(ign)then return(nil)end;
			return openEgg(self,data);
		end);
	end;
	
	local eggService = Knit.GetService("EggService");
	local buyEgg = eggService.BuyEgg;
	local template = {eggName = "Egg 13",auto = false,amount = 2};
	
	getgenv().HATCH = true;
	while(HATCH and wait(2))do buyEgg(eggService,template)end;
end;

do	-- Auto Collect Chests	TO DO
	local Chests = game:GetService("CollectionService"):GetTagged("Chest");
	local chestDatabase = Knit.GetController("DatabaseController"):GetDatabase("Chests");
	
	local chestService = Knit.GetService("ChestService");
	local claimChest = chestService.ClaimChest;
	
	claimChest(chestService,CHEST_NAME);
end;

do	-- Auto Dungeon		TO DO
	game:GetService("ReplicatedStorage").Packages.Knit.Services.DungeonService.RF.JoinDungeon:InvokeServer("47a3719a-d6a4-407f-847a-b72fc6830884");
	game:GetService("ReplicatedStorage").Packages.Knit.Services.DungeonService.RF.ContinueDungeon:InvokeServer("47a3719a-d6a4-407f-847a-b72fc6830884")
end;

do	-- Detect Admin
	local autoLeaveOnAdminJoin = true;
	local Admins,find = Knit.GetController("DatabaseController"):GetDatabase("Admins"),table.find;
	local StarterGui,Notify = game:GetService("StarterGui"),nil; 
	Notify = StarterGui.SetCore;
	
	local doSomething = Instance.new("BindableFunction");
	doSomething.OnInvoke = function(response)
		if(response=="Leave")then
			game:GetService("TeleportService"):Teleport(game.PlaceId);
		end;
	end;
	
	for _,plr in ipairs(Players:GetPlayers())do
		if(find(Admins,plr.UserId)~=nil)then
			if(autoLeaveOnAdminJoin)then
				warn("Admin in the server. Alias':",plr.Name,plr.DisplayName);
				game:GetService("TeleportService"):Teleport(game.PlaceId);
			end;
			Notify(StarterGui,"SendNotification",{
				Title = "An Admin is in the server.";
				Text = "Name: "..plr.Name.."\nDisplayName: "..plr.DisplayName;
				Duration = 864000;
				Callback = doSomething;
				Button1 = "Leave";
				Button2 = "Stay";
			});
		end;
	end;
	Players.PlayerAdded:Connect(function(plr)
		if(find(Admins,plr.UserId)~=nil)then
			if(autoLeaveOnAdminJoin)then
				warn("Admin has joined. Alias':",plr.Name,plr.DisplayName);
				game:GetService("TeleportService"):Teleport(game.PlaceId);
			end;
			Notify(StarterGui,"SendNotification",{
				Title = "An Admin has joined the server.";
				Text = "Name: "..plr.Name.."\nDisplayName: "..plr.DisplayName;
				Duration = 86400;
				Callback = doSomething;
				Button1 = "Leave";
				Button2 = "Stay";
			})
		end;
	end);
end;

do	-- Auto Claim/Ignore on-screen message

end;
