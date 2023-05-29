-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/Jailbreak"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=606849621 or nil~=getgenv()["H2F0@K37F[=ufLSK&Mv(qgfXEu]D7wgz"])then return end;
getgenv()["H2F0@K37F[=ufLSK&Mv(qgfXEu]D7wgz"] = true;


local Players             = game:GetService("Players");
local Lighting            = game:GetService("Lighting");
local StarterGui          = game:GetService("StarterGui");
local RunService          = game:GetService("RunService");
local HttpService         = game:GetService("HttpService");
local TeleportService     = game:GetService("TeleportService");
local UserInputService    = game:GetService("UserInputService");
local ReplicatedStorage   = game:GetService("ReplicatedStorage");
local VirtualInputManager = game:GetService("VirtualInputManager");

local Player = Players.LocalPlayer;
local Mouse  = Player:GetMouse();

local character = (Player.Character or Player.CharacterAdded:Wait());
if(not character.PrimaryPart)then 
    character:GetPropertyChangedSignal("PrimaryPart"):Wait();  
end;
local rootPart,humanoid = character.PrimaryPart,character.Humanoid;         -- can error here

Player.CharacterAdded:Connect(function(Char)
    Char:GetPropertyChangedSignal("PrimaryPart"):Wait();
    character,rootPart,humanoid = Char,Char.PrimaryPart,Char.Humanoid;      -- can error here when fetching humanoid
end);

local Name = "V.G Hub//Jailbreak.json";
local Config = {
    WindowName = "V.G Hub",
    Color = Color3.fromRGB(107, 72, 55),
    Keybind = Enum.KeyCode.RightControl
}

Des = {}
if(nil~=makefolder not isfolder("V.G Hub"))then
    makefolder("V.G Hub");
end;

if(not isfile(Name))then
    writefile(Name, HttpService:JSONEncode(Des));
end;

local Settings = HttpService:JSONDecode(readfile(Name));
local function Save()
    writefile(Name, HttpService:JSONEncode(Settings));
end;

local OldNameCall = nil;
OldNameCall = hookmetamethod(game,"__index", function(self, idx)
    if(checkcaller()or(B~="WalkSpeed"and"JumpPower"~=idx)then
        return OldNameCall(self, idx);
    end;
end;

local Kick = nil;
do
    local LocalScript = Player.PlayerScripts.LocalScript;
    for _,val in ipairs(getgc()) do 
        if(type(val)~="function"or getfenv(val).script~=LocalScript or not table.find(debug.getconstants(val)or {}, "FailedPcall"))then
            continue;
        end;
        Kick = val;
    end;
end;

local Hook = hookfunction(Kick, function(A)
    if(A~="JumpPower")then
        return Hook(A);
    end;
end);

local LeftShift = Enum.KeyCode.LeftShift;
UserInputService.InputBegan:Connect(function(inp,proc)
    if(not(proc)and inp.KeyCode==LeftShift)then
        humanoid.WalkSpeed = 25;
    end;
end);
UserInputService.InputEnded:Connect(function(inp,proc)
    if(not(proc)and inp.KeyCode==LeftShift)then
        humanoid.WalkSpeed = 16;
    end;
end);


local Window = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test")),"error loading V.G library")():CreateWindow(Config, game:GetService("CoreGui"));

local Tab1 = Window:CreateTab("Jailbreak");
local Section1 = Tab1:CreateSection("");
local Section2 = Tab1:CreateSection("");

local Tab2 = Window:CreateTab("UI Settings");
local Section3 = Tab2:CreateSection("Menu");
local Section4 = Tab2:CreateSection("Background");

do
    local UI = require(ReplicatedStorage.Module:WaitForChild("UI"));
Section1:CreateToggle("No E Wait", Settings.Ants, function(State)
    Settings.Ants = State;
    while(task.wait()and Settings.Ants)do
        for _,spec in next,UI.CircleAction.Specs do
            spec.Duration = 1;
            spec.Timed = true;
        end;
    end;
end);

Section1:CreateToggle("GunMods", Settings.Ants1, function(State)
    Settings.Ants1 = State;
    while(task.wait()and Settings.Ants1)do
        for _,item in ipairs(ReplicatedStorage.Game.ItemConfig:GetChildren())do
            item = require(item);
            item.MagSize = math.huge;
            item.CamShakeMagnitude = 0;
            item.FireAuto = true;
            item.FireFreq = 1000;
            item.BulletsSpread = -10;
            item.BulletsPerShot = 15;
        end
    end;
end);

do
    local tbl = {};
    local function emac()return task.wait(math.huge)end;
    Section1:CreateToggle("Anti RagDoll", Settings.Anti, function(State)
        Settings.Anti = State;
        if(State)then
            for _,val in ipairs(getgc(true))do
                if(type(val)=="table"and nil~=(rawget(val, "Ragdoll")and rawget(val, "Unragdoll")))then
                    tbl[val] = val.Ragdoll;
                    val.Ragdoll = newcclosure(emac);
                end
            end
        else
            for ref,func in next,tbl do
                ref.RagDoll,tbl[ref] = func,nil;
            end;
        end;
    end);
end;

do
    local c1 = nil;
    local function f()
        sethiddenproperty(humanoid, "WalkSpeed", Settings.WalkSpeed);
        sethiddenproperty(humanoid, "JumpPower", Settings.JumpPower);
        if(not UserInputService.WindowFocusReleased)then
            setfpscap(Settings.Fps);
        end;
    end;
    Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
        Settings.Go = State;
        if(State)then
            c1 = RunService.Stepped:Connect(f);
        else
            c1:Disconnect();
        end;
    end);
end;

Section2:CreateTextBox("Fps Cap", "Only numbers", true, function(Value)Settings.Fps = Value end);
Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)Settings.WalkSpeed = Value end);
Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)Settings.JumpPower = Value end);

do
    local con = nil;
    local function f()humanoid:ChangeState("Jumping")end;
    Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
        Settings.InfiniteJump = State
        if(State)then
            con = UserInputService.JumpRequest:Connect(f);
        else
            con:Disconnect();
        end;
    end);
end;

local ESP = assert(loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp")),"error loading Karrot-Esp")();

Section1:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State;
    ESP:Toggle(Settings.Esp);
end);

-- Section2:CreateButton("Press For Hentai", function()
    -- StarterGui:SetCore("SendNotification",{
        -- Title = "BAHAHAHAHA",
        -- Text = "DuMbAsS rEtArD"
    -- });
-- end);

Section1:CreateToggle("PLayer Esp", Settings.PlayerEsp, function(State)Settings.PlayerEsp,ESP.Players = State,State end);
Section1:CreateToggle("Tracers Esp", Settings.Tracers, function(State)Settings.Tracers,ESP.Tracers = State,State end);
Section1:CreateToggle("Name Esp", Settings.EspNames, function(State)ESP.Names,Settings.EspNames = State,State end);
Section1:CreateToggle("Boxes Esp", Settings.Boxes, function(State)Settings.Boxes,ESP.Boxes = State,State end);

do
    local ref = {
        Color =  Color3.new(255, 154, 0),
        Type = "Model",
        PrimaryPart = function(part)
            if(part.Name~="Drop")then return end;
            local H = part:FindFirstChildWhichIsA("BasePart");
            while(not H)do 
                part.ChildAdded:Wait();
                H = part:FindFirstChildWhichIsA("BasePart");
            end;
            return H;
        end,
        Validator = function(part)return part.Name=="Drop"and not Players:FindFirstChild(part.Name)end,
        CustomName = function(part)return(part.Name)end,
        IsEnabled = "Orange",
    };
    Section1:CreateToggle("AirDrop Esp", Settings.Orange, function(State)
        Settings.Orange,ESP.Orange = State,State;
        while(task.wait(3)and Settings.Orange)do
            ESP:AddObjectListener(Workspace, ref);
        end;
    end);
end;

local BoopWrong,BoopCorrect = nil,nil;
do
    local t1 = {Title = "Warning",Text = "You have Booped the protogen the wrong way in this case justice will poor down on your soul"};
    local t2 = {Title = "Warning", Text = "your sentence is death eternal prison. farewell old friend.."};
    local t3 = {Title = "OwO",Text = "hai chu have booped me cowwectwy fur that i sha'ww nyot end ur wife and wet chu wive i wuv chu good bai"};
    
    BoopWrong = function()
        StarterGui:SetCore("SendNotification", t1);
        pcall(Player.Destroy, Player);
        StarterGui:SetCore("SendNotification", t2);
    end;
    
    BoopCorrect = function()
        StarterGui:SetCore("SendNotification", t2);
    end;
end;

Section2:CreateButton("Reset", function()
    if(nil~=character:FindFirstChild("Head"))then
        character.Head:Destroy();
    end;
end);

Section2:CreateButton("Boop protogen UwU", function()({BoopWrong, BoopCorrect})[math.random(2)]()end);
Section2:CreateToggle("Invisicam", Settings.Sorry, function(State)
    Settings.Sorry = State;
    if(State)then
        Player.DevCameraOcclusionMode = "Invisicam";
    else
        Player.DevCameraOcclusionMode = "Zoom";
    end;
end);

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
    
    Section2:CreateToggle("H Fly", false, function(State)
        Sex2 = State;
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

Section3:CreateLabel("Credits DekuDimz#7960")
Section3:CreateLabel("Credits AlexR32#3232 Ui")
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

repeat Save()until not task.wait(5);    
