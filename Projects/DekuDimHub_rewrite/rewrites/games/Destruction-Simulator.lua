-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/Destruction-Simulator"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=2248408710 or nil~=getgenv()["0~DlTiT?WW`!4VeI7uL~Fy3Z^dIEqaYp"])then return end;
getgenv()["0~DlTiT?WW`!4VeI7uL~Fy3Z^dIEqaYp"] = true;

local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}

local RunService = game:GetService("RunService");
local Players = game:GetService("Players");

local Player = Players.LocalPlayer;
local Mouse = Player:GetMouse();

local character = (Player.Character or Player.CharacterAdded:Wait());
if(not character.PrimaryPart)then 
    character:GetPropertyChangedSignal("PrimaryPart"):Wait();  
end;
local rootPart,humanoid = character.PrimaryPart,character:WaitForChild("Humanoid");

Player.CharacterAdded:Connect(function(Char)
    Char:GetPropertyChangedSignal("PrimaryPart"):Wait();
    character,rootPart,humanoid = Char,Char.PrimaryPart,Char:WaitForChild("Humanoid");
end);

if(nil~=getconnections)then
    for _,con in ipairs(getconnections(LocalPlayer.Idled))do
        con:Disable();
    end;
else
	local VirtualUser = game:GetService("VirtualUser");
    Player.Idled:Connect(function()
        task.wait(math.random(15,33));
        VirtualUser:CaptureController();
        VirtualUser:ClickButton2(Vector2.new(Mouse.X,Mouse.Y),Workspace.Camera);
    end);
end;

local Window = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/im-retarded-3")), "failed to load V.G Library")():CreateWindow(Config, game:GetService("CoreGui"));

local Tab1 = Window:CreateTab("Destruction-Simulator");
local Section1 = Tab1:CreateSection("");
local Section2 = Tab1:CreateSection("");
local SectionA = Tab1:CreateSection("");

local Tab2 = Window:CreateTab("UI Settings");
local Section3 = Tab2:CreateSection("Menu");
local Section4 = Tab2:CreateSection("Background");
local wait = task.wait;

local generateBoost = game:GetService("ReplicatedStorage").Remotes.generateBoost;
local FireServer = generateBoost.FireServer;

do
    local t = false;
    Section1:CreateToggle("AutoFarm", nil, function(State)
        t = State;
        while(wait()and t)do FireServer(generateBoost, "Coins", 480, 10)end;
    end);
end;

-- Script generated by SimpleSpy - credits to exx#9394
task.defer(function()
    local Bomb = character:FindFirstChild("Bomb");
    if(not Bomb)then
        humanoid:EquipTool(Player.Backpack:WaitForChild("Bomb"));
        Bomb = character.Bomb;
    end;
    
    
    local explodeBomb = Remotes.explodeBomb;
    for idx,plr in ipairs(Players:GetPlayers())do
        if(idx==1 or not(plr.Character and plr.Character.PrimaryPart))then continue end;
        FireServer(explodeBomb, 9e9, Bomb.Stats, plr.Character.PrimaryPart.Position);
    end;
end);

do
    local t = 1;
    task.defer(function()
        while(wait())do
            for idx,tool in ipairs(Player.Backpack:GetDescendants())do
                if(tool:IsA("Tool"))then
                    require(tool.Stats).Cooldown = t;
                end;
            end;
        end;
    end);
    
    Section1:CreateToggle("No Cooldown", nil, function(State)
        if(State)then
            t = 0;
        else
            t = 1;
        end;
    end);
end;

do
    local sellBricks,t = Remotes.sellBricks,false;
    Section1:CreateToggle("Auto Sell", nil, function(State)
        t = State;
        while(wait()and t)do FireServer(sellBricks)end;
    end);
end;

do
    local rankUp,t = Remotes.rankUp,false;
    Section1:CreateToggle("Auto Rank", nil, function(State)
        t = State;
        while(wait()and t)do FireServer(rankUp)end;
    end);
end;

do
    local t = false;
    local function f(child)
        if(child.Name=="Explosion")then
            child:Destroy();                    -- or child.Parent = nil;
        end;
    end;
    
    Section1:CreateToggle("Anti Explosion", nil, function(State)
        t = State;
        if(State)then
            con = RunService.Stepped:Connect(f);
            for _,part in ipairs(Workspace:GetChildren())do f(part)end;
        else
            con:Disconnect();
        end;
    end);
end;

do
    local t = false;
    Section1:CreateToggle("Infinite Coins", nil, function(State)
        t = State;
        while(wait(1)and t)do FireServer(generateBoost, "Coins", 480, 99999999);
    end);
end;

do
    local t = false;
    Section1:CreateToggle("infinite Levels", nil, function(State)
        t = State;
        while(wait()and t)do FireServer(generateBoost, "Levels", 480, 1);
    end);
end;

Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)humanoid.WalkSpeed = Value end);
Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)humanoid.JumpPower = Value end);

do
    local con = nil;
    local function f()humanoid:ChangeState("Jumping")end;
    Section2:CreateToggle("Infinite Jump", nil, function(State)
        if(State)then
            con = game:GetService("UserInputService").JumpRequest:Connect(f);
        else
            con:Disconnect();
        end;
    end);
end;


do
    local noclip,c1,c2 = false,nil,nil;
    local function f1()
        if(noclip)then
            humanoid:ChangeState(11);
        end;
    end;
    local function f2(key)
        if(key=='g')then
            noclip = not noclip;
        end;
    end;
    
    Section2:CreateToggle("G PlatFormNoclip", false, function(State)
        noclip = false;
        if(State)then
            c1 = RunService.Stepped:Connect(f1);
            c2 = Mouse.KeyDown:Connect(f2);
        else
            c1:Disconnect();
            c2:Disconnect();
        end;
    end);
end;

do
    local noclip,c1,c2 = false,nil,nil;
    local function f1()
        if(not noclip)then return end;
        for _,desc in ipairs(character:GetDescendants())do
            if(desc:IsA("BasePart"))then
                desc.CanCollide = false;
            end;
        end;
    end;
    local function f2(key)
        if(key=='n')then
            noclip = not noclip;
        end;
    end;
    Section2:CreateToggle("N NonePlatFormNoclip", false, function(State)
        noclip = false;
        if(State)then
            c1 = RunService.Stepped:Connect(f1);
            c2 = Mouse.KeyDown:Connect(f2);
        else
            c1:Disconnect();
            c2:Disconnect();
        end;
    end);
end;


do  -- fly function. will stop working if the user resets mid usage
    local con = nil;
    local c1,c2 = nil,nil;
    
    local S  = {F = 0, B = 0, L = 0, R = 0};
    -- local S2 = {F = 0, B = 0, L = 0, R = 0};
    
    local function f1(key)
        key = key:lower();
        if(key=='w')then
            S.F = 1;
        elseif(key=='s')then
            S.B = -1;
        elseif(key=='a')then
            S.L = -1;
        elseif(key=='d')then
            S.R = 1;
        end;
    end;
    local function f2(key)
        key = key:lower();
        if(key=='w')then
            S.F = 0;
        elseif(key=='s')then
            S.B = 0;
        elseif(key=='a')then
            S.L = 0;
        elseif(key=='d')then
            S.R = 0;
        end;
    end;
    
    local function reset()
        S.F,S.B,S.L,S.R = 0,0,0,0;
        -- S2.F,S2.B,S2.L,S2.R = 0,0,0,0;
    end;
    
    local v1,v2 = Vector3.new(9e9,9e9,9e9),Vector3.new(0,0.1,0);
    
    local function propagate(parent)
        c1 = Mouse.KeyDown:Connect(f1);
        c2 = Mouse.KeyUp:Connect(f2);
        
        local BodyGyro = Instance.new("BodyGyro");
        BodyGyro.P = 9e4;
        BodyGyro.maxTorque = v1;
        BodyGyro.cframe = parent.CFrame
        BodyGyro.Parent = parent;
        
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.velocity = v2;
        BodyVelocity.maxForce = v1;
        BodyVelocity.Parent = parent;
        
        repeat wait()
            humanoid.PlatformStand = true;
            local CF = Workspace.CurrentCamera.CoordinateFrame;
            if(S.L ~= -S.R or S.F ~= -S.B)then                                      -- speed set to 200
                BodyVelocity.velocity = (CF.lookVector*(S.F + S.B) + CF*CFrame.new(S.L + S.R, (S.F + S.B)*0.2, 0).p - CF.p)*200;
                -- S2 = {F = S.F, B = S.B, L = S.L, R = S.R};
            elseif(SPEED>0)then                                                     -- speed set to 0
                BodyVelocity.velocity = Vector3.new();
                -- BodyVelocity.velocity = (CF.lookVector*(S2.F + S2.B) + CF*CFrame.new(S2.L + S2.R, (S2.F + S2.B)*0.2, 0).p - CF.p)*SPEED;
            else
                BodyVelocity.velocity = v2;
            end
            BodyGyro.cframe = CF;
        until(not Fly);
        
        reset();
        BodyGyro:destroy();
        BodyVelocity:destroy();
        humanoid.PlatformStand = false;
    end;
    
    local R6,R15 = Enum.HumanoidRigType.R6,Enum.HumanoidRigType.R15;
    local function fly(key)
        if('h'~=key:lower())then return end;
        getgenv().Fly = not Fly;
        if(not Fly)then
            c1:Disconnect();
            c2:Disconnect();
            return;
        end;
        
        reset();
        if(humanoid.RigType==R6)then
            task.defer(propagate,rootPart);
        elseif(humanoid.RigType==R15)then
            task.defer(propagate,character:FindFirstChild("UpperTorso"));
        end;
    end;
    
    Section2:CreateToggle("H Fly", Settings.Sex2, function(State)
        Settings.Sex2 = State;
        if(State)then
            con = Mouse.KeyDown:Connect(fly);
        else
            getgenv().Fly = false;
            con:Disconnect();
        end;
    end);
end;

Section2:CreateButton("Anti Lag", function()
    local material = Enum.Material.SmoothPlastic
    for _,child in ipairs(Workspace:GetDescendants())do
        if(child:IsA("Texture"))then
            child:Destroy();
        elseif(child:IsA("BasePart")and not child.Parent:FindFirstChild("Humanoid"))then
            child.Material = material;
        end;
    end;
end);

Section2:CreateButton("Teleport to RandomPlayer", function()
    local plrs = Players:GetPlayers();
    local randPlr = plrs[math.random(2,#plrs)];
    if(not randPlr)then return end;
    rootPart.CFrame = randPlr.PrimaryPart.CFrame;
end);

do
    local bitch = settings();
    local ACTIVE = false;
    local con,ass = nil,nil;
    
    local function f(i,p)
        if(not(p)and i.KeyCode == F3)then
            ass = not ass;
            if(ass)then
                bitch.Network.IncomingReplicationLag = 10;
            else
                bitch.Network.IncomingReplicationLag = 0;
            end;
        end;
    end;

    Section2:CreateButton("Lag Switch F3", function()
        if(ACTIVE)then
            con:Disconnect();
        else
            ass = false;
            con = UserInputService.InputEnded:Connect(f);
        end;
    end);
end;


do
	local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100";
	local AllIDs = {};
	local foundAnything = nil;
	local actualHour = os.date("!*t").hour;
	local Deleted = false;
	
	if(isfile("NotSameServers.json"))then
		AllIDs = HttpService.JSONDecode(HttpService, readfile("NotSameServers.json"));
	else
		AllIDs[#AllIDs + 1] = actualHour;
		writefile("NotSameServers.json", HttpService:JSONEncode(AllIDs));
	end;

	local function TPReturner()
		local Site,ID = nil,nil;
		if(not foundAnything)then
			Site = HttpService:JSONDecode(game:HttpGetAsync(url))
		else
			Site = HttpService:JSONDecode(game:HttpGetAsync(url.."&cursor="..foundAnything));
		end
		if(Site.nextPageCursor~="null")then
			foundAnything = Site.nextPageCursor;
		end;
		
		for _,server in ipairs(Site.data)do
			local Possible = true;
			if(server.maxPlayers>server.playing)then
				for idx,Existing in ipairs(AllIDs)do
					if(idx>0)then
						if(ID==Existing)then
							Possible = false
						end
					else
						if(actualHour~=Existing)then
							if(isfile("NotSameServers.json"))then delfile("NotSameServers.json")end;
							table.clear(AllIDs);
							AllIDs[1] = actualHour;
						end;
					end;
				end
				if(Possible)then
					AllIDs[#AllIDs + 1] = ID;
					writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs));
					game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID);
					wait(4);		-- if the above teleport attempt fails
				end;
			end;
		end;
	end;

	-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
	Section2:CreateButton("ServerHop", function()
		while wait()do
			TPReturner()
			if(nil~=foundAnything)then
				TPReturner();
			end;
		end;
	end);
end;

Section2:CreateButton("Rejoin", function()TeleportService:Teleport(game.PlaceId,game.JobId)end);

do
	local Toggle3 Section3:CreateToggle("UI Toggle", nil, function(State)Window:Toggle(State)end);
	Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)Config.Keybind = Enum.KeyCode[Key]end);
	Toggle3:SetState(true);
end;

Section3:CreateLabel("Credits DekuDimz#7960");
Section3:CreateLabel("Credits AlexR32#3232 Ui");
Section3:CreateLabel("Credits Sensei Joshy#1060");
Section3:CreateColorpicker("UI Color", function(Color)Window:ChangeColor(Color)end):UpdateColor(Config.Color);