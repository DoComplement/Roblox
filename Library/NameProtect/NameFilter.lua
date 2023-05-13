if Game:IsLoaded() == false then Game.Loaded:Wait() end

local rand = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Library/RandLib/Rand.lua"))();
local Main = {
    Scroller = Game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Chat").Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller,
    ClassTypes = {["TextLabel"]=true, ["TextButton"]=true, ["TextBox"]=true}, 
    Names = {},
    Connections = {}, -- newChatEvent, bubbleChatEvent, newPlayerEvent, 
    SpaceOffset = '',
    hideStats = true,
    Enabled = false
};

-- idk a better way to get the textOffet for the space character
-- game:GetService("TextService"):GetTextSize(...) was not working 100% of the time
local Label = Main.Scroller.Frame.TextLabel;
local Offset = Label.TextBounds.X; -- get current x-bounds
Label.Text ..= ' ';	-- update x-bounds with a single space
while Label.TextBounds.X == Offset do task.wait() end;	-- wait until x-bounds are updated
Main.SpaceOffset = table.concat(table.create(2*(Label.TextBounds.X - Offset),' ')); -- can probably be calculated easier from text size and font
Offset,Label = nil; -- deallocate

Main.AddPlayer = function(Player)
	if Main.Names[Player.Name:lower()] ~= nil then return; end;

	local lName = Player.Name:lower();
	local Name = rand:randString(math.random(10, 15));
	local lDisplayName = Player.DisplayName:lower();
	local DisplayName = rand:randString(math.random(10, 15));
		
	Main.Names[lName] = {[1] = Name, [2] = Name:len() - lName:len()};
	Main.Names[lDisplayName] = {[1] = DisplayName, [2] = DisplayName:len() - lDisplayName:len()};
	
	-- change all active text with username
end;

-- Not a brilliant method for filtering a string
-- benefit: will filter any uppercase/lowercase string properly with the casing of the original string maintained after filtering.
-- drawback: will not filter sub-portions of usernames (billy from xx_billy_xx will not get filtered)
function Main:Filter(Text)
	local LowerText = Text:lower();
	local Indices,changed,i1,i2,offset = {},nil;
	for Username,Filter in next,Main.Names do
		offset = 0; -- reset offset
		i1,i2 = LowerText:find(Username); -- get start and end indices of found username
		changed = (i1~=nil); 
		while(i1~=nil)do
			Indices[#Indices + 1] = {i1 + offset - 1, i2 + offset + 1, Filter[1]}; -- see use below (for _,Table in ipairs(Indices) do ...)
			offset += Filter[2]; -- update offset
			i1,i2 = LowerText:find(Username, i2); -- update indices
		end;
		
		-- must update lowertext if multiple usernames are found in the same string
		if(changed)then LowerText = (LowerText:gsub(Username, Filter[1]))end; 
	end;
	
	for _,Table in ipairs(Indices) do
		Text = Text:sub(1, Table[1]) .. Table[3] .. Text:sub(Table[2]);	
	end
	
	return Text;
end;

function Main:Update(TextLabel, Text)
    local Offset,Spaces = 0,Main.SpaceOffset;
    for _,Label in ipairs(TextLabel:GetChildren())do
		Offset += Label.TextBounds.X;
    end;
	
    return Spaces..string.rep(' ',Offset)..Main:Filter(Text);
end

function Main:Enable()
	if Main.Enabled then return; end;
    
    -- Initialize Name Tables
    for _,Player in ipairs(Game:GetService("Players"):GetPlayers()) do Main.AddPlayer(Player); end;
    
    -- update Name Tables on new player added
	table.insert(Main.Connections, Game:GetService("Players").PlayerAdded:Connect(Main.AddPlayer));
    
    -- [[ filter all active chat messages ]]
	local TextButton = nil;
    for Index,Frame in ipairs(Main.Scroller:GetChildren()) do
		if Index == 1 then continue; end;
        TextButton = Frame:FindFirstChild("TextButton", true);
        if TextButton ~= nil then
            TextButton.Text = Main:Filter(TextButton.Text);
            Frame.TextLabel.Text = Main:Update(Frame.TextLabel, Frame.TextLabel.Text:match("(%S+.+)"));
        else
            Frame.TextLabel.Text = Main:Filter(Frame.TextLabel.Text)
        end
    end
    
    -- disable server messages and filter player messages
    table.insert(Main.Connections, Main.Scroller.ChildAdded:Connect(function(Frame)
		if Frame:FindFirstChild("TextButton", true) ~= nil then
			for _,Child in ipairs(Frame.TextLabel:GetChildren()) do
				if Child.ClassName == "TextButton" then
					Child.Text = Main:Filter(Child.Text);
				end;
			end;
        else
            Frame.TextLabel.Text = Main:Filter(Frame.TextLabel.Text);
        end;
    end));
    
    
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

Main:Enable();

local OldNewIndex
OldNewIndex = hookmetamethod(game, "__newindex", function(Self, Index, Value)
    if Main.Enabled then
        if Self.Parent ~= nil and Self.Parent.Parent == Main.Scroller and Index == "Text" then
            return OldNewIndex(Self, Index, Main:Update(Self, Value:match("(%S+.+)")));	-- remove all leading space 
        end;
    end;
    
    return OldNewIndex(Self, Index, Value);
end);
print("CALLED ALL")

