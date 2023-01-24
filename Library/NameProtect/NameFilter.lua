
--[[ NOT COMPLETE, CURRENTLY DESIGNED TO NOT BE UNIVERSAL (to reduce bloat) ]]

local rand = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/RandLib/Rand.lua"))();
local Main = {
    Scroller = Game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller,
    ClassTypes = {["TextLabel"]=true, ["TextButton"]=true, ["TextBox"]=true}, 
    Names = {},
    Connections = {}, -- newChatEvent, bubbleChatEvent, newPlayerEvent, and removePlayerEvent
    SpaceOffset = 0,
    hideStats = true,
    Enabled = true
};

-- idk a better way to get the textOffet for the space character
-- game:GetService("TextService"):GetTextSize(...) was not working 100% of the time
local Label = Main.Scroller.Frame.TextLabel
Main.SpaceOffset = Label.TextBounds.X	-- get current x-bounds
Label.Text = Label.Text..' '	-- update x-bounds with a single space
while Label.TextBounds.X == Main.SpaceOffset do task.wait() end	-- wait until x-bounds are updated
Main.SpaceOffset = Label.TextBounds.X - Main.SpaceOffset -- calculate single space bounds value (can probably be calculated easier from text size and font)
Label = nil -- deallocate

function Main:AddPlayer(Player)
	if Main.Names[Player.Name:lower()] == nil then
		local Name = rand:randString(math.random(10, 15));
		local DisplayName = rand:randString(math.random(10, 15));
		
		Main.Names[Player.Name:lower()] = {[1] = Name, [2] = Name:len() - Player.Name:len()};
		Main.Names[Player.DisplayName:lower()] = {[1] = DisplayName, [2] = DisplayName:len() - Player.DisplayName:len()};
		
		Player.Name = Main.Names[Player.Name:lower()];
		Player.DisplayName = Main.Names[Player.DisplayName:lower()];
	end;
end;

function Main:Filter(Text)
	local LowerText = Text:lower();
	local Indices,changed,i1,i2,offset = {},nil;
    for Username,Filter in next, Main.Lower do
		offset = 0;
		i1,i2 = LowerText:find(Username); -- get start and end indices of found username
		changed = (i1~=nil);
		while i1 ~= 0 do
			table.insert(Indices, {i1+offset-1, i2+offset+1, Filter[1]});
			offset = offset + Filter[2];
			i1,i2 = LowerText:find(Username, i2);
		end;
		
		if changed then
			LowerText = LowerText:gsub(Username, Filter[1]);
		end;
	end;
	
	for _,Table in ipairs(Indices) do
		Text = Text:sub(1, Table[1]) .. Table[3] .. Text:sub(Table[2]);	
	end
	
	return Text;
end;

local TextOffset,Spaces
function Main:Update(TextLabel, Text)
    local TextOffset,Spaces = 2*Main.SpaceOffset,'';
    for _,Label in ipairs(TextLabel:GetChildren()) do
        TextOffset = TextOffset + Label.TextBounds.X
    end
	
	for _=1, TextOffset do Spaces = Spaces .. ' ';
    return Spaces..Main:Filter(Text)
end

function Main:Enable()
	if Main.Enabled then return end;
    
    -- Initialize Name Tables
    for _,Player in ipairs(Game:GetService("Players"):GetPlayers()) do Main:AddPlayer(Player) end
    
    -- update Name Tables on new player added
	table.insert(Main.Connections, Game:GetService("Players").PlayerAdded:Connect(Main.AddPlayer));
    
    -- [[ filter all active chat messages ]]
	local TextButton = nil;
    for Index,Frame in ipairs(Main.Scroller:GetChildren()) do
		if Index == 1 then continue end;
        TextButton = Frame:FindFirstChild("TextButton", true);
        if TextButton ~= nil then
            TextButton.Text = Main:Filter(TextButton.Text);
            Frame.TextLabel.Text = Main:Update(Frame.TextLabel, Frame.TextLabel.Text:match("%s*(.+)"))
        else
            Frame.TextLabel.Text = Main:Filter(Frame.TextLabel.Text)
        end
    end
    
    -- disable server messages and filter player messages
    table.insert(Main.Connections, Main.Scroller.ChildAdded:Connect(function(Frame)
		if Frame:FindFirstChild("TextButton", true) ~= nil then
			for _,Child in ipairs(Frame.TextLabel:GetChildren()) do
				if Child.ClassName == "TextButton" then
					Child.Text = Main:Filter(Child.Text)
				end
			end
        else
            Frame.TextLabel.Text = Main:Filter(Frame.TextLabel.Text)
        end
    end)
    
    
    -- disable Bubble chat
    for _,bubbleGui in ipairs(game:GetService("CoreGui"):WaitForChild("BubbleChat"):GetChildren()) do
        bubbleGui:FindFirstChildOfClass("Frame").Visible = false
        bubbleGui:FindFirstChildOfClass("Frame").RobloxLocked = true
    end
    
    Main.Connections["bubbleChatEvent"] = game:GetService("CoreGui"):WaitForChild("BubbleChat").ChildAdded:Connect(function(bubbleGui)
        bubbleGui:FindFirstChildOfClass("Frame").Visible = false
        bubbleGui:FindFirstChildOfClass("Frame").RobloxLocked = true
    end)
    
    Main.Enabled = true
end

function Main:Disable()
    if Main.Enabled == false then return end;
    
    for _,Connection in ipairs(Main.Connections) do Connection:Disconnect() end table.clear(Main.Connections);	
    for _,Frame in ipairs(Main.Scroller:GetChildren()) do Frame.Visible = true end;
    for _,bubbleGui in ipairs(game:GetService("CoreGui").BubbleChat:GetChildren()) do
        bubbleGui:FindFirstChildOfClass("Frame").RobloxLocked = false;
        bubbleGui:FindFirstChildOfClass("Frame").Visible = true;
    end;
	
	-- reset all filtered text instnaces
	
	Main.Enabled = false;
end;

Main.Enable();

local OldNewIndex
OldNewIndex = hookmetamethod(game, "__newindex", function(Self, Index, Value)
    if Main.Enabled then
        if Self.Parent ~= nil and Self.Parent.Parent == Main.Scroller ~= nil and Index == "Text" then
            return OldNewIndex(Self, Index, Main:Update(Self, Value:match("%s*(.+)"))); -- removes all white spaces (can lead to erroneous errors)
        end;
    end;
    
    return OldNewIndex(Self, Index, Value);
end);
-- print("CALLED ALL")



