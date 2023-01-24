
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
	if Main.Names[Player.Name] == nil then
		Main.Names[Player.Name] = rand:randString(math.random(10, 15));
		Main.Names[Player.DisplayName] = rand:randString(math.random(10, 15));
		
		Player.Name = Main.Names[Player.Name];
		Player.DisplayName = Main.Names[Player.DisplayName];
	end;
end;

function Main:Check(Text)
	local LowerText = Text:lower();
    for Username,Filter in next, Main.Lower do
		LowerText = LowerText:gsub(Username:lower(), Filter);
	end;
	
	-- connect the changes between LowerText and Text:lower()
	
	return Text;
end;

local TextOffset,Spaces
function Main:Filter(TextLabel, Text)
    local TextOffset,Spaces = 2*Main.SpaceOffset,'';
    for _,Label in ipairs(TextLabel:GetChildren()) do
        TextOffset = TextOffset + Label.TextBounds.X
    end
	
	for _=1, TextOffset do Spaces = Spaces .. ' ';
    return Spaces..Main:Check(Text)
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
            TextButton.Text = Main:Check(TextButton.Text);
            Frame.TextLabel.Text = Main:Filter(Frame.TextLabel, Frame.TextLabel.Text:match("%s*(.+)"))
        else
            Frame.TextLabel.Text = Main:Check(Frame.TextLabel.Text)
        end
    end
    
    -- disable server messages and filter player messages
    table.insert(Main.Connections, Main.Scroller.ChildAdded:Connect(function(Frame)
		if Frame:FindFirstChild("TextButton", true) ~= nil then
			for _,Child in ipairs(Frame.TextLabel:GetChildren()) do
				if Child.ClassName == "TextButton" then
					Child.Text = Main:Check(Child.Text)
				end
			end
        else
            Frame.TextLabel.Text = Main:Check(Frame.TextLabel.Text)
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
            return OldNewIndex(Self, Index, Main:Filter(Self, Value:match("%s*(.+)"))); -- removes all white spaces (can lead to erroneous errors)
        end;
    end;
    
    return OldNewIndex(Self, Index, Value);
end);
-- print("CALLED ALL")



