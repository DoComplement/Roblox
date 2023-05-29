
-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/MM2"

if(not game:IsLoaded())then game.Loaded:Wait()end;
if(game.PlaceId~=142823291 or nil~=getgenv()["miX_K=owC!N-iL[*iC:n"])then return end;
getgenv()["miX_K=owC!N-iL[*iC:n"] = true;

local Config = {
    WindowName = "V.G Hub",
    Color = Color3.fromRGB(255, 128, 64),
    Keybind = Enum.KeyCode.RightControl;
};

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local FireServer = Instance.new("RemoteEvent").FireServer;
local InvokeServer = Instance.new("RemoteFunction").InvokeServer;

local FindFirstChild = game.FindFirstChild;
local WorldToScreenPoint =  Workspace.CurrentCamera.WorldToScreenPoint;

local Player = Players.LocalPlayer;
local Mouse = Player:GetMouse();

local character = (Localcharacter or LocalcharacterAdded:Wait());
if(not character.PrimaryPart)then 
    character:GetPropertyChangedSignal("PrimaryPart"):Wait();  
end;
local rootPart,humanoid = character.PrimaryPart,character.Humanoid;         -- can error here

LocalcharacterAdded:Connect(function(Char)
    Char:GetPropertyChangedSignal("PrimaryPart"):Wait();
    character,rootPart,humanoid = Char,Char.PrimaryPart,Char.Humanoid;      -- can error here when fetching humanoid
end);

local CashBag = nil;
if(not FindFirstChild(Player.PlayerGui, "MainGUI"))then
	local con = nil;
	local B = Instance.new("BindableEvent");
	
	con = Player.PlayerGui.ChildAdded:Connect(function(child)
		if(child.Name=="MainGUI")then
            CashBag = child.Game.CashBag;
			con = con:Disconnect();
			B:Fire();
		end;
	end)
	B.Event:Wait();
end;

if(nil~=getconnections)then
	for _,con in ipairs(getconnections(Player.Idled))do
		con:Disable();
	end;
else
	Player.Idled:Connect(function()
		task.wait(math.random(15,33));
		VirtualUser:CaptureController();
        VirtualUser:ClickButton2(Vector2.new())
    end)
end;

local Name = "V.G Hub//mm2.json"
local Des = {}
if(nil~=makefolder and not isfolder("V.G Hub"))then
    makefolder("V.G Hub");
end;

if(not isfile(Name))then
    writefile(Name, HttpService:JSONEncode(Des));
end;

local Settings = HttpService:JSONDecode(readfile(Name))
local function Save()
    writefile(Name, HttpService:JSONEncode(Settings));
end;

for _,child in ipairs(Workspace:GetChildren())do
    if(child:IsA("BasePart")and Child.Name~="Part")then
        child.CanCollide = false;
    end;
end;

task.defer(function()
	local GetPlayerData = ReplicatedStorage.Remotes.Extras.GetPlayerData;
	RunService.Stepped:Connect(function()
		for idk,som in next,InvokeServer(GetPlayerData)do
			if(som.Role == "Murderer"or"Sheriff"==som.Role)then
				Settings[som.Role] = idk;
			end;
		end
	end);
end);

local function KillAll(pp,Knife)
	Knife = Knife or(FindFirstChild(character,"Knife")or FindFirstChild(Player.Backpack,"Knife"));
	if(not Knife)then return end;
    
	-- if the user is a murderer, CONFIRMED!!!!!
	FireServer(Knife.Throw, pp.CFrame, pp.Position - Vector3.new(0, 1, 0));
end;

-- pretty bs function, would suggest either fixing or not using
local GodModeFunc = nil;
do
    local c1,c2,c3 = nil,nil,nil;
    local L = {};
    local Tag = Instance.new("BoolValue");
    Tag.Name = "GodMode";
    Tag.Value = false;
    Tag.Parent = character;
    
    local DIED,JUMPING = false,false;
    local function f1()DIED = true end;
    local function f2(inp,proc)
        if(not(proc and DIED))then
            JUMPING = false;
            repeat task.wait();
            until not(JUMPING)or DIED;
        else
            repeat task.wait();
            until not(JUMPING);
        end
    end);
    local function f3(inp,proc)
        if(not(proc and DIED))then
            JUMPING = false;
        end;
    end);
    
    GodModeFunc = function()
        Tag.Value = not Tag.Value;
        
        if(Tag.Value)then
            for _,accessory in ipairs(humanoid:GetAccessories())do
                L[#L + 1] = accessory:Clone();
            end
            humanoid.Name = "1";
            
            local l = character["1"]:Clone();
            l.Name = "Humanoid";
            l.Parent = character;
            
            wait(0.1);
            character["1"]:Destroy();
            Workspace.CurrentCamera.CameraSubject = humanoid;
            
            for _,accessory in ipairs(L)do
                humanoid:AddAccessory(accessory);
            end;
            
            character.Animate.Disabled = true;
            wait(0.1);
            character.Animate.Disabled = false;
            
            c1 = character.Humanoid.Died:Connect(f1);
            c2 = UserInputService.InputBegan:Connect(f2);
            c3 = UserInputService.InputEnded:Connect(f3);
        else
            c1:Disconnect();
            c2:Disconnect();
            c3:Disconnect();
        end;
    end;
end;

function GetClosestCoin()
    local TargetDistance,Terget = 100,nil;
    for _,child in ipairs(Workspace:GetChildren())do
        if(not(child:IsA("Model")or FindFirstChild(child,"CoinContainer")))then continue end;
        for _,coin in ipairs(child.CoinContainer:GetChildren())do
            if(coin.Name ~= "Coin_Server")then continue end;
            local mag = (rootPart.Position - v.Position).magnitude;
            if(mag < TargetDistance)then
                TargetDistance,CoinTarget = mag,coin;
            end;
        end;
    end;
end;

task.defer(function()
    local function SOMETHING()
        rootPart.CFrame = CFrame.new(CoinTarget.Position);
        wait()
        firetouchinterest(rootPart, CoinTarget, 0);
        firetouchinterest(rootPart, CoinTarget, 1);
    end;
    
    while wait()do
        if(Settings.Coin and CashBag.Visible and not CashBag.Full.Visible)then
            AutoFarming = true;
            if(Settings.GodMode and not FindFirstChild(character,"GodMode"))then
                GodModeFunc();
            end;
            
            GetClosestCoin();
            if(CoinTarget ~= nil)then
                task.defer(SOMETHING);
            end;
            
            local Knife = (FindFirstChild(character,"Knife")or FindFirstChild(Player.Backpack,"Knife"));
            if(Knife~=nil)then
                for idx,plr in ipairs(Players:GetPlayers())do
                    if(idx~=1)then
                        KillAll(plr.PrimaryPart,Knife)
                    end;
                end;
            end;
            wait(2);
            CoinTarget = nil;
            AutoFarming = false;
        end;
    end;
end);


RunService.Stepped:Connect(function()
    if(Settings.Coin)then
        humanoid:ChangeState(11);
    end;
end);


local Library = assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test")),"error loading V.G library")();
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Mm2");
local Section1 = Tab1:CreateSection("");
local Section2 = Tab1:CreateSection("");

local Tab2 = Window:CreateTab("UI Settings");
local Section3 = Tab2:CreateSection("Menu");
local Section4 = Tab2:CreateSection("Background");

local function ClosestPlayerToCurser()
    local MaxDistance, Closest = math.huge
    for idx,plr in ipairs(Players:GetPlayers())do
        if(idx==1 or not(plr.Character and plr.Character.PrimaryPart))then continue end;
        local Pos,Vis = WorldToScreenPoint(Workspace.CurrentCamera,plr.Character.PrimaryPart.Position);
        if(not Vis)then continue end;
        local Dist = math.sqrt((Mouse.X - Pos.X)^2 + (Mouse.Y - Pos.Y)^2);
        if Dist < MaxDistance and Dist <= math.huge then
            MaxDistance,Closest = Dist,plr.Character.PrimaryPart.Position;
        end
    end;
    return Closest;
end

local OldNameCall = getrawmetatable(game).__namecall;
local function filterRay(self,...)
    if(not checkcaller()and(Settings.SilentAim or Settings.SilentAim1)and"FindPartOnRayWithIgnoreList"==getnamecallmethod())then
        local GivemeHead = ClosestPlayerToCurser();
        if(nil~=GivemeHead)then
            local POS = Workspace.CurrentCamera.CFrame.Position;
            return OldNameCall(self, Ray.new(POS, (GivemeHead - POS).Unit * 1000), select(2, ...));
        end
    end
    return OldNameCall(self, ...)
end;

Section1:CreateToggle("Murder Silent Aim", Settings.SilentAim, function(State)
    Settings.SilentAim = State;
    if(Settings.SilentAim1)then return end;
    if(State)then
        hookmetamethod(game, "__namecall", filterRay);
    else
        hookmetamethod(game, "__namecall", OldNameCall);
    end;
end)

local Toggle1 = Section1:CreateToggle("Sheriff Silent Aim", Settings.SilentAim1, function(State)
    Settings.SilentAim1 = State;
    if(Setting.SilentAim)then return end;
    if(State)then
        hookmetamethod(game, "__namecall", filterRay);
    else
        hookmetamethod(game, "__namecall", OldNameCall);
    end;
end);

Section1:CreateToggle("AutoFarm", Settings.Coin, function(State)Settings.Coin = State end);
Section1:CreateToggle("GodMode AutoFarm", Settings.GodMode, function(State)Settings.GodMode,Settings.Coin = State,State end);

Section1:CreateToggle("KillAll", Settings.KillAll, function(State)
    Settings.KillAll = State;
    local Knife = nil;
    while(wait()and Settings.KillAll)do
        Knife = (FindFirstChild(character,"Knife")or FindFirstChild(Player.Backpack,"Knife"))
        if(not Knife)then continue end;
        for idx,plr in ipairs(Players:GetPlayers())do
            if(idx~=1)then
                KillAll(plr.PrimaryPart,Knife);
            end;
        end;
    end;
end);

do
    local con,savepos = nil,nil;
    
    local function cloneRoot(CHR)
        local Clone = CHR.LowerTorso.Root:Clone();
        CHR.LowerTorso.Root:Destroy();
        Clone.Parent = CHR.LowerTorso;
    end;
    
    local function init_invis(CHARACTER)
        CHARACTER:GetPropertyChangedSignal("PrimaryPart"):Wait();
        local pp = CHARACTER.PrimaryPart;
        savepos = pp.CFrame
        
        if(Settings.Hentai)then
            pp.CFrame = CFrame.new(-85.1800766, 137.657455, -58.091156)
            wait(0.5);
            cloneRoot(CHARACTER);
            wait(0.5);

            pp.CFrame = savepos;
        end;
    end;

    local Toggle1 = Section1:CreateToggle("Auto Invis", Settings.Hentai, function(State)
        Settings.Hentai = State;
        if(State)then
            local savepos = rootPart.CFrame;
            rootPart.CFrame = CFrame.new(-85.1800766, 137.657455, -58.091156);
            wait(0.5);
            cloneRoot(character);
            wait(0.5);
            con = characterAdded:Connect(init_invis);
        
        else
            con:Disconnect();
        end;
    end);
end;

do
    local Equip = ReplicatedStorage.Remotes.Inventory.Equip;
    Section1:CreateToggle("Lag Server", Settings.Hi, function(State)
        Settings.Hi = State;
        while(wait()and Settings.Hi)do
            FireServer(Equip, "DefaultKnife", "Weapons");
            FireServer(Equip, "Xbox", "Weapons");
        end;
    end);
end;

Section1:CreateButton("GodMode", GodModeFunc);

do
    local PlayEmote = ReplicatedStorage.Remotes.Misc.PlayEmote;
    local Fire = PlayEmote.Fire;
    
    Section2:CreateButton("Floss", function()Fire(PlayEmote,"floss")end);
    Section2:CreateButton("Zen", function()Fire(PlayEmote,"zen")end);
    Section2:CreateButton("Sit", function()Fire(PlayEmote,"sit")end);
    Section2:CreateButton("Dab", function()Fire(PlayEmote,"dab")end);
end;

do
    local CON = nil;
    local ws_jp_func = function()
        humanoid.WalkSpeed = Settings.WalkSpeed;
        humanoid.JumpPower = Settings.JumpPower;
        if(not UserInputService.WindowFocusReleased)then
            setfpscap(Settings.Fps);
        end;    
    end;
    
    if(Settings.Go)then CON = RunService.Stepped:Connect(ws_jp_func);
    Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
        Settings.Go = State;
        if(State)then
            CON = RunService.Stepped:Connect(ws_jp_func);
        else
            CON:Disconnect();
        end;
    end);
end;

Section2:CreateTextBox("Fps Cap", "Only numbers", true, function(Value)Settings.Fps = Value end);
Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)Settings.WalkSpeed = Value end);
Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)Settings.JumpPower = Value end);

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
end;

local ESP = assert(loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp")),"error loading Karrot-Esp")();
ESP.Overrides.GetColor = function(role)
    if(role == Workspace[Settings.Murderer])then return Color3.fromRGB(255,0,0)end 		-- red
    if(role ==  Workspace[Settings.Sheriff])then return Color3.fromRGB(0,0,255)end		-- blue
    return Color3.fromRGB(0, 255, 0)
end

Section1:CreateToggle("PLayer Esp", Settings.PlayerEsp, function(State)Settings.PlayerEsp,ESP.Players = State,State end);
Section1:CreateToggle("Tracers Esp", Settings.Tracers, function(State)Settings.Tracers,ESP.Tracers = State,State end);
Section1:CreateToggle("Name Esp", Settings.EspNames, function(State)Settings.EspNames,ESP.Names = State,State end)
Section1:CreateToggle("Boxes Esp", Settings.Boxes, function(State)Settings.Boxes,ESP.Boxes = State,State end)

Section2:CreateToggle("Invisicam", Settings.Sorry, function(State)
    Settings.Sorry = State;
    if(Settings.Sorry)then
        LocalPlayer.DevCameraOcclusionMode = "Invisicam";
    else
        LocalPlayer.DevCameraOcclusionMode = "Zoom";
    end;
end);

do
    local c1,c2 = nil,nil;
    local noclips = false;
    
    local f1 = function(key)
        if(Settings.Sex1 and'n'==key:lower())then
            noclips = not noclips;
            for i, v in ipairs(character:GetChildren())do
                if(v:IsA("BasePart"))then
                    v.CanCollide = false;
                end;
            end;
        end;
    end;
    local f2 = function()
        if(noclips)then
            for i, v in ipairs(character:GetChildren())do
                if v:IsA("BasePart") then
                    v.CanCollide = false;
                end;
            end;
        end;
    end;
    
    if(Settings.Sex1)then
        c1,c2 = Mouse.KeyDown:Connect(f1),RunService.Stepped:Connect(f2);
    end;
    
    Section2:CreateToggle("N Noclip", Settings.Sex1, function(State)
        noclips = false;
        Settings.Sex1 = State;
        if(State)then
            c1,c2 = Mouse.KeyDown:Connect(f1),RunService.Stepped:Connect(f2);
        else
            c1:Disconnect();
            c2:Disconnect();
        end;
    end);
end;

do
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


Section2:CreateButton("Rejoin", function()TeleportService:Teleport(game.PlaceId,game.JobId)end);
Section2:CreateButton("Save Settings",Save);
Section3:CreateToggle("UI Toggle", nil, function(State)Window:Toggle(State)end);
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)Config.Keybind = Enum.KeyCode[Key]end);
Toggle3:SetState(true);
Section3:CreateLabel("Credits DekuDimz#7960")
Section3:CreateLabel("Credits AlexR32#3232 Ui")
Section3:CreateLabel("Credits Doggo")
Section3:CreateLabel("Credits Fliex")
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

repeat(Save())until not(wait(10));