
-- https://raw.githubusercontent.com/1201for/dragonadventures/main/Esp-Test

--Settings--
local ESP = {
    Enabled = false,
    Boxes = true,
    BoxShift = CFrame.new(0,-1.5,0),
	BoxSize = Vector3.new(4,6,0),
    Color = Color3.fromRGB(255, 170, 0),
    FaceCamera = false,
    Names = false,
    TeamColor = true,
    Thickness = 2,
    AttachShift = 1,
    TeamMates = true,
    Players = false,
    
    Objects = setmetatable({}, {__mode="kv"}),				-- weak keys and weak values, allows the collection of both keys and values, if either the key or the value is collected, the whole pair is removed from the table
    Overrides = {}
}

--Declarations--
local Players = game:GetService("Players");
local Player = Players.LocalPlayer;
local CurrentCamera = Workspace.CurrentCamera;

local WorldToViewportPoint = CurrentCamera.WorldToViewportPoint

--Functions--
local function Draw(A, props)
	local new = Drawing.new(A)
	
	props = props or {}
	for i,v in pairs(props) do
		new[i] = v
	end
	return new
end

function ESP:GetTeam(p)
	local ov = self.Overrides.GetTeam
	if ov then
		return ov(p)
	end
	
	return p and p.Team
end

function ESP:IsTeamMate(p)
    local ov = self.Overrides.IsTeamMate
	if ov then
		return ov(p)
    end
    
    return self:GetTeam(p) == self:GetTeam(Player)
end

function ESP:GetColor(A)
	local ov = self.Overrides.GetColor
	if ov then
		return ov(A)
    end
    local p = self:GetPlayerFromChar(A)
	return p and self.TeamColor and p.Team and p.Team.TeamColor.Color or self.Color
end

function ESP:GetPlayerFromChar(char)
	local ov = self.Overrides.GetPlayerFromChar
	if ov then
		return ov(char)
	end
	
	return Players:GetPlayerFromCharacter(char)
end

function ESP:Toggle(bool)
    self.Enabled = bool
    if not bool then
        for i,v in pairs(self.Objects) do
            if v.Type == "Box" then --fov circle etc
                if v.Temporary then
                    v:Destroy()
                else
                    for i,v in pairs(v.Components) do
                        v.Visible = false
                    end
                end
            end
        end
    end
end

function ESP:GetBox(A)
    return self.Objects[A]
end

function ESP:AddObjectListener(parent, options)
    local function NewListener(c)
        if type(options.Type) == "string" and c:IsA(options.Type) or options.Type == nil then
            if type(options.Name) == "string" and c.Name == options.Name or options.Name == nil then
                if not options.Validator or options.Validator(c) then
                    local box = ESP:Add(c, {
                        PrimaryPart = type(options.PrimaryPart) == "string" and c:WaitForChild(options.PrimaryPart) or type(options.PrimaryPart) == "function" and options.PrimaryPart(c),
                        Color = type(options.Color) == "function" and options.Color(c) or options.Color,
                        ColorDynamic = options.ColorDynamic,
                        Name = type(options.CustomName) == "function" and options.CustomName(c) or options.CustomName,
                        IsEnabled = options.IsEnabled,
                        RenderInNil = options.RenderInNil
                    })
                    --TODO: add a better way of passing options
                    if options.OnAdded then
                        coroutine.wrap(options.OnAdded)(box)
                    end
                end
            end
        end
    end

    if options.Recursive then
        parent.DescendantAdded:Connect(NewListener)
        for i,v in pairs(parent:GetDescendants()) do
            coroutine.wrap(NewListener)(v)
        end
    else
        parent.ChildAdded:Connect(NewListener)
        for i,v in pairs(parent:GetChildren()) do
            coroutine.wrap(NewListener)(v)
        end
    end
end

local boxBase = setmetatable({}, {__index = self});				-- same as doing: local boxBase = {};

-- namecall inherits self, boxBase, as first argument -> self
function boxBase:Destroy()
    ESP.Objects[self.Object] = nil;
    for i,v in pairs(self.Components) do
        v.Visible = false
        v:Destroy()
        self.Components[i] = nil
    end
end

function boxBase:Update()
    if not self.PrimaryPart then
        --warn("not supposed to print", self.Object)
        return self:Destroy()
    end

    local color
    if ESP.Highlighted == self.Object then
       color = ESP.HighlightColor
    else
        color = self.Color or self.ColorDynamic and self:ColorDynamic() or ESP:GetColor(self.Object) or ESP.Color
    end

    local allow = true;
    if ESP.Overrides.UpdateAllow and not ESP.Overrides.UpdateAllow(self) then
        allow = false
    end
    if self.Player and not ESP.TeamMates and ESP:IsTeamMate(self.Player) then
        allow = false
    end
    if self.Player and not ESP.Players then
        allow = false
    end
    if(type(self.IsEnabled) == "string" and not ESP[self.IsEnabled] or type(self.IsEnabled) == "function" and not self:IsEnabled()) then
        allow = false
    end
    if not Workspace:IsAncestorOf(self.PrimaryPart) and not self.RenderInNil then
        allow = false
    end

    if not allow then
        for i,v in pairs(self.Components) do
            v.Visible = false
        end
        return
    end

    if ESP.Highlighted == self.Object then
        color = ESP.HighlightColor
    end

    --calculations--
    local cf = self.PrimaryPart.CFrame
    if ESP.FaceCamera then
        cf = CFrame.new(cf.p, CurrentCamera.CFrame.p)
    end
    local size = self.Size
    local locs = {
        TopLeft = cf * ESP.BoxShift * CFrame.new(size.X/2,size.Y/2,0),
        TopRight = cf * ESP.BoxShift * CFrame.new(-size.X/2,size.Y/2,0),
        BottomLeft = cf * ESP.BoxShift * CFrame.new(size.X/2,-size.Y/2,0),
        BottomRight = cf * ESP.BoxShift * CFrame.new(-size.X/2,-size.Y/2,0),
        TagPos = cf * ESP.BoxShift * CFrame.new(0,size.Y/2,0),
        Torso = cf * ESP.BoxShift
    }

    if ESP.Boxes then
        local TopLeft, Vis1 = WorldToViewportPoint(CurrentCamera, locs.TopLeft.p)
        local TopRight, Vis2 = WorldToViewportPoint(CurrentCamera, locs.TopRight.p)
        local BottomLeft, Vis3 = WorldToViewportPoint(CurrentCamera, locs.BottomLeft.p)
        local BottomRight, Vis4 = WorldToViewportPoint(CurrentCamera, locs.BottomRight.p)

        if self.Components.Quad then
            if Vis1 or Vis2 or Vis3 or Vis4 then
                self.Components.Quad.Visible = true
                self.Components.Quad.PointA = Vector2.new(TopRight.X, TopRight.Y)
                self.Components.Quad.PointB = Vector2.new(TopLeft.X, TopLeft.Y)
                self.Components.Quad.PointC = Vector2.new(BottomLeft.X, BottomLeft.Y)
                self.Components.Quad.PointD = Vector2.new(BottomRight.X, BottomRight.Y)
                self.Components.Quad.Color = color
            else
                self.Components.Quad.Visible = false
            end
        end
    else
        self.Components.Quad.Visible = false
    end

    if ESP.Names then
        local TagPos, Vis5 = WorldToViewportPoint(CurrentCamera, locs.TagPos.p)
        
        if Vis5 then
            self.Components.Name.Visible = true
            self.Components.Name.Position = Vector2.new(TagPos.X, TagPos.Y)
            self.Components.Name.Text = self.Name
            self.Components.Name.Color = color
            
            self.Components.Distance.Visible = true
            self.Components.Distance.Position = Vector2.new(TagPos.X, TagPos.Y + 14)
            self.Components.Distance.Text = math.floor((CurrentCamera.CFrame.p - cf.p).magnitude) .."m away"
            self.Components.Distance.Color = color
        else
            self.Components.Name.Visible = false
            self.Components.Distance.Visible = false
        end
    else
        self.Components.Name.Visible = false
        self.Components.Distance.Visible = false
    end
    
    if ESP.Tracers then
        local TorsoPos, Vis6 = WorldToViewportPoint(CurrentCamera, locs.Torso.p)

        if Vis6 then
            self.Components.Tracer.Visible = true
            self.Components.Tracer.From = Vector2.new(TorsoPos.X, TorsoPos.Y)
            self.Components.Tracer.To = Vector2.new(CurrentCamera.ViewportSize.X/2,CurrentCamera.ViewportSize.Y/ESP.AttachShift)
            self.Components.Tracer.Color = color
        else
            self.Components.Tracer.Visible = false
        end
    else
        self.Components.Tracer.Visible = false
    end
end

function ESP:Add(obj, options)
    if not obj.Parent and not options.RenderInNil then
        return warn(obj, "has no parent")
    end

    local box = setmetatable({
        Name = options.Name or obj.Name,
        Type = "Box",
        Color = options.Color --[[or self:GetColor(obj)]],
        Size = options.Size or self.BoxSize,
        Object = obj,
        Player = options.Player or Players[obj.Name],
        PrimaryPart = options.PrimaryPart or obj.ClassName == "Model"and(obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart"))or obj:IsA("BasePart")and obj,
        Components = {},
        IsEnabled = options.IsEnabled,
        Temporary = options.Temporary,
        ColorDynamic = options.ColorDynamic,
        RenderInNil = options.RenderInNil
    }, boxBase)

    if(nil~=self.Objects[obj]))then self.Objects[obj]:Destroy()end;				-- remove box if not already nil

    box.Components["Quad"] = Draw("Quad", {
        Thickness = self.Thickness,
        Color = color,
        Transparency = 1,
        Filled = false,
        Visible = self.Enabled and self.Boxes
    })
    box.Components["Name"] = Draw("Text", {
		Text = box.Name,
		Color = box.Color,
		Center = true,
		Outline = true,
        Size = 19,
        Visible = self.Enabled and self.Names
	})
	box.Components["Distance"] = Draw("Text", {
		Color = box.Color,
		Center = true,
		Outline = true,
        Size = 19,
        Visible = self.Enabled and self.Names
	})
	
	box.Components["Tracer"] = Draw("Line", {
		Thickness = ESP.Thickness,
		Color = box.Color,
        Transparency = 1,
        Visible = self.Enabled and self.Tracers
    })
    self.Objects[obj] = box
    
    obj.AncestryChanged:Connect(function(old, new)
        if(not(new)and ESP.AutoRemove)then box:Destroy()end;
    end)

    local hum = obj.Humanoid;
	if hum then
        hum.Died:Connect(function()
            if ESP.AutoRemove ~= false then
                box:Destroy()
            end
		end)
    end

    return box
end

local function CharAdded(character)
    local player = Players[character.Name];
    if(not character.PrimaryPart)then
		character:GetPropertyChangedSignal("PrimaryPart"):Wait();
	end;
	ESP:Add(character, {
		Name = player.Name .. " " .. character:WaitForChild("Humanoid").Health .. " Health";
		Player = player;
		PrimaryPart = character.PrimaryPart;
	});
end;

local function PlayerAdded(player)
    player.CharacterAdded:Connect(CharAdded);
    if(nil~=player.Character)then
        CharAdded(player.Character);
    end;
end;

Players.PlayerAdded:Connect(PlayerAdded);
for idx,plr in ipairs(Players:GetPlayers())do
	if(idx~=1)then PlayerAdded(plr)end;
end;

game:GetService("RunService").RenderStepped:Connect(function()
    for _,object in next,ESP.Objects do
        if(object.Update)then
            local succ,err = pcall(object.Update, object);
            if(not succ)then warn("[EU]", err, object.Object:GetFullName())end;
        end
    end
end)

return ESP