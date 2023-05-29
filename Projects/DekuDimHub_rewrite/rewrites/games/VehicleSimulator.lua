
-- https://raw.githubusercontent.com/1201for/V.G-Hub/main/VehicleSimulator

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=10320676839 or nil~=getgenv()["U]F`7a~FvR+-_@%UhSH_"])then return end;
getgenv()["U]F`7a~FvR+-_@%UhSH_"] = true;


local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local VirtualInputManager = game:GetService("VirtualInputManager");
local HttpService = game:GetService("HttpService");

local Player = Players.LocalPlayer;
local character = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait());
if(not character.PrimaryPart)then 
    character:GetPropertyChangedSignal("PrimaryPart"):Wait();  
end;
local rootPart,humanoid = character.PrimaryPart,character.Humanoid;         -- can error here

LocalPlayer.CharacterAdded:Connect(function(Char)
    Char:GetPropertyChangedSignal("PrimaryPart"):Wait();
    character,rootPart,humanoid = Char,Char.PrimaryPart,Char.Humanoid;      -- can error here when fetching humanoid
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

hookfunction(Player.Kick,function()end);		-- anti kick i guess

getgenv().Settings = {}
local function SpawnCar()
    local Target = nil;
    for _,car in ipairs(Workspace.Vehicles:GetChildren())do
        if(car:FindFirstChild("owner",true)and car.owner.Value==Player.Name)then
			car.PrimaryPart,Target = car.Chassis.VehicleSeat,car;
		end;
    end;
    return Target;
end 

local Window = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/im-retarded-3")),"error loading V.G library")():CreateWindow(Config, game:GetService("CoreGui")); -- same lubrary, different url for whatever reason

local Tab1 = Window:CreateTab("Vehicle Simulator")
local Section1 = Tab1:CreateSection("AutoFarms")
local Section2 = Tab1:CreateSection("Misc")

local Tab2 = Window:CreateTab("UI Settings")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background");

local InvokeServer = Instance.new("RemoteFunction").InvokeServer;

do
	local join_mode = ReplicatedStorage["Game Modes V2"].Shared.Remotes.RemoteFunctions.join_mode;
	Section1:CreateToggle("AutoFarm", Settings.Hoe, function(State)
		Settings.Hoe = State
		while(wait(2)and Settings.Hoe)do
			InvokeServer(join_mode,14);
			wait(10);
			
			local Gravity = Workspace.Gravity;
			Workspace.Gravity = 0;
			repeat wait()
				for _,child in ipairs(Workspace.CurrentCamera:GetChildren())do
					if(child:IsA("BasePart")and nil~=child.Name:match("Checkpoint"))then 
						SpawnCar():SetPrimaryPartCFrame(CFrame.new(v.CFrame.p + Vector3.new(0, 10, 0)));
					end;
				end;
			until not Workspace.CurrentCamera:FindFirstChildWhichIsA("BasePart");
			
			Workspace.Gravity = Gravity;
			local Gui = Player.PlayerGui:FindFirstChild("Endrace_results");
			if(nil~=Gui)then Gui:Destroy()end;
		end;
	end);
end;

do
	local bitch1 = false;
	local function f1()
		while(wait()and bitch1)do
			VirtualInputManager:SendKeyEvent(true, "W", false, uwu);
		end;
	end;
Section1:CreateToggle("MilesFarm", bitch1, function(State)
	bitch1 = State;
	if(not State)then return end;
	local Target = SpawnCar();
	Target.Handling.MaxSpeed.Value = 1000;
	Target.Handling.Torque.Value = 50000;
	Target.Handling.SteeringRadiusConstant.Value = 15000;
	Target.Handling.FrictionRoad.Value = 250;
	Target.Handling.Nitro.NitroSpeed.Value = 5000;
	Target.Handling.Nitro.NitroForce.Value = 10000;
	Target.Handling.TurboJump.TurboJumpHeight.Value = 250;
	task.defer(f1);
	while(bitch1)do
		Workspace.Gravity = 500;
		Target:SetPrimaryPartCFrame(CFrame.new(3106.53198, 235.20755, -335.314545));
		wait(1);
	end;
	Workspace.Gravity = 196.2;
end);

do
	local con = nil;
	local function here()
		humanoid:ChangeState(11);
	end;
	local function search2(tbl)
		for _,child in ipairs(tbl)do
			if(child.ClassName=="MeshPart"and nil~=child:FindFirstChild("Smoke"))then
				rootPart.CFrame = child.CFrame;
				wait();
				rootPart.CFrame = child.CFrame;
				wait(4);
			end;
		end;
	end;
	local function search(tbl,level)
		for _,child in ipairs(tbl)do
			if(child.ClassName~="Model")then continue;
			elseif(level==2)then
				search2(child:GetChildren());
			else
				search(child:GetChildren(), level + 1);
			end;
		end;
	end;
	Section1:CreateToggle("AutoFarm Crates", nil, function(State)
		jjsploit = State;
		if(State)then
			con = RunService.Stepped:Connect(here);
			humanoid:ChangeState("Jumping");
			while(wait(0.5)and jjsploit)do
				search(Workspace:GetChildren());
			end
		else
			con:Disconnect();
		end;
	end);
end;

Section1:CreateTextBox("MaxSpeed", "Only numbers", true, function(Value)SpawnCar().Handling.MaxSpeed.Value = Value end);
Section1:CreateTextBox("Torque", "Only numbers", true, function(Value)SpawnCar().Handling.Torque.Value = Value end)
Section1:CreateTextBox("SteeringRadiusConstant", "Only numbers", true, function(Value)SpawnCar().Handling.SteeringRadiusConstant.Value = Value end);
Section1:CreateTextBox("FrictionRoad", "Only numbers", true, function(Value)SpawnCar().Handling.FrictionRoad.Value = Value end);
Section1:CreateTextBox("NitroSpeed", "Only numbers", true, function(Value)SpawnCar().Handling.Nitro.NitroSpeed.Value = Value end);
Section1:CreateTextBox("NitroForce", "Only numbers", true, function(Value)SpawnCar().Handling.Nitro.NitroForce.Value = Value end);
Section1:CreateTextBox("TurboJumpHeight","Only numbers", true, function(Value)SpawnCar().Handling.TurboJump.TurboJumpHeight.Value  = Value end);
Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)humanoid.WalkSpeed = Value end);
Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)humanoid.JumpPower = Value end);

do
    local CON = nil;
    if(Settings.InfiniteJump)then
        CON = UserInputService.JumpRequest:Connect(function()
            humanoid:ChangeState("Jumping");
        end);
    end;
    Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
        Settings.InfiniteJump = State
        if(State)then
            CON = UserInputService.JumpRequest:Connect(function()
                humanoid:ChangeState("Jumping");
            end);
        else
            CON:Disconnect();
        end;
    end);
end;do
    local c1,c2 = nil,nil;
    local noclip = false;
    local f1 = function()
        if(noclip)then
            humanoid:ChangeState(11);
        end;
    end;
    local f2 = function(key)
        if(Settings.Sex and'g'==key:lower())then
            noclip = not noclip;
            humanoid:ChangeState(11);
        end;
    end;;
    
    if(Settings.Sex)then
        c1,c2 = RunService.Stepped:Connect(f1),Mouse.KeyDown:Connect(f2);
    end;
    
    Section2:CreateToggle("G Noclip", Settings.Sex, function(State)
        Settings.Sex = State;
        noclip = false;
        if(State)then
            c1,c2 = RunService.Stepped:Connect(f1),Mouse.KeyDown:Connect(f2);
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
	local url = "https://games.roblox.com/v1/games/189707/servers/Public?sortOrder=Asc&limit=100";
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


Section2:CreateButton("Rejoin", function()game:GetService("TeleportService"):Teleport(game.PlaceId,game.JobId)end);
Section2:CreateButton("Save Settings",Save);

Section3:CreateToggle("UI Toggle", nil, function(State)Window:Toggle(State)end);
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)Config.Keybind = Enum.KeyCode[Key]end);
Toggle3:SetState(true);
Section3:CreateLabel("Credits DekuDimz#7960");
Section3:CreateLabel("Credits AlexR32#3232 Ui");
Section3:CreateLabel("Credits The3Bakers")

Section3:CreateColorpicker("UI Color", function(Color)Window:ChangeColor(Color)end):UpdateColor(Config.Color);

-- credits to jan for patterns
do
    local patterns = {
        Default = "2151741365";
        Hearts = "6073763717";
        Hexagon = "6073628839";
        Circles = "6071579801";
        ["Lace With Flowers"] = "6071575925";
        Floral = "5553946656";
    };

    Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)Window:SetBackground(patterns[Name])end):SetOption("Default");
end;

Section4:CreateColorpicker("Color", function(Color)Window:SetBackgroundColor(Color)end):UpdateColor(Color3.new(1,1,1));
Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)Window:SetBackgroundTransparency(Value)end):SetValue(0);
Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)Window:SetTileScale(Value)end);
Slider4:SetValue(0.5);