
--[[ NOT COMPLETE, CURRENTLY BEING DESIGNED TO NOT BE UNIVERSAL (to reduce bloat) ]]

--[[ Current Problems:

- doesnt have a wide, "Universal" applicability
- problem with the playernames in the table (look at the removePlayer loop in the enable function)
- problem with maintaining the character integrity of each string with the filterGeneral function (not isChatButton)

]]

--[[ Potential Improvements:

- Include a formatsTable -> chatFilterMain.formatsTable
	- will include a list of format types with formatted string that are expected to occur frequently (server messages, gui prompts, etc.)
	- should include a isFormatted argument in the chatFilterMain.generalFormat function (can potentially replace the isChatButton argument)

]]


local Players,Workspace = game:GetService("Players"), game:GetService("Workspace")

local rand = loadstring(game:HttpGet("https://raw.githubusercontent.com/DoComplement/Roblox/main/Classes/random.lua"))()
local chatFilterMain = {
    Scroller = Players.LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller,
    ClassTypes = {["TextLabel"]=true, ["TextButton"]=true, ["TextBox"]=true}, 
--    Players = {},
    Names = {},
    lowerNames = {},
    Connections = {}, -- newChatEvent, bubbleChatEvent, newPlayerEvent, and removePlayerEvent
    textOffset = 0,
    removeNilPlayers = false, -- will remove players who have left or are leaving the game
    hideStats = true,
    Enabled = true
}

-- idk a better way to get the textOffet for the space character
-- game:GetService("TextService"):GetTextSize(...) was not working 100% of the time
local randomLabel = chatFilterMain.Scroller.Frame.TextLabel
chatFilterMain.textOffset = randomLabel.TextBounds.X
randomLabel.Text = randomLabel.Text..' '
while randomLabel.TextBounds.X == chatFilterMain.textOffset do wait() end
chatFilterMain.textOffset = randomLabel.TextBounds.X - chatFilterMain.textOffset
randomLabel = nil

chatFilterMain.addPlayer = function(Player)
	if not chatFilterMain.Names[Player.Name] then
		chatFilterMain.Names[Player.Name] = rand.randString(math.random(10, 15))
		chatFilterMain.Names[Player.DisplayName] = rand.randString(math.random(10, 15))
		chatFilterMain.lowerNames[Player.Name:lower()] = Player.Name
		chatFilterMain.lowerNames[Player.DisplayName:lower()] = Player.DisplayName
		
		Player.Name = chatFilterMain.Names[Player.Name]
		Player.DisplayName = chatFilterMain.Names[Player.DisplayName]
	end
end

chatFilterMain.removePlayer = function(tempName1, tempName2)
    if chatFilterMain.Names[tempName1] then -- called with unfiltered name
        chatFilterMain.Names[tempName1] = nil
		chatFilterMain.Names[tempName2] = nil
		chatFilterMain.lowerNames[tempName1:lower()] = nil
		chatFilterMain.lowerNames[tempName2:lower()] = nil
    else
        for Username,Filter in pairs(chatFilterMain.Names) do
            if tempName1 == Filter or tempName2 == Filter then
                chatFilterMain.Names[Username] = nil
                chatFilterMain.lowerNames[Username:lower()] = nil
            end
        end
    end
end

chatFilterMain.filterGeneral = function(Text, isChatButton)
    if isChatButton then
        return Text:gsub("(%b[])", function(stringMatch) 
            local filteredName = chatFilterMain.Names[stringMatch:sub(2, #stringMatch - 1)]
            if filteredName then
                return '['..filteredName..']'
            else
                return '['..rand.randString(math.random(10, 15))..']'
            end
        end)
    else
        
        -- [[ see to fixing this problem ]]
        -- method:
        --[[
            Create a lowercase variable for "Text" -> "lowerText".
            Scan "lowerText" with lowercase usernames and replace then
            string 
        ]]
        for lowerName,Username in pairs(chatFilterMain.lowerNames) do
            Text = Text:lower():gsub(lowerName, function() return chatFilterMain.Names[Username] end)
        end
        return Text
    end
end

local TextBoundsX
chatFilterMain.modifyChatText = function(TextLabel, Text)
    TextBoundsX = 2*chatFilterMain.textOffset 
    for _,Instance in ipairs(TextLabel:GetChildren()) do
        TextBoundsX = TextBoundsX + Instance.TextBounds.X
    end
    return table.concat(table.create(math.ceil(TextBoundsX/chatFilterMain.textOffset), ' '))..chatFilterMain.filterGeneral(Text)
end

chatFilterMain.Enable = function()
    
    -- Initialize Name Tables
    for _,Player in ipairs(Players:GetPlayers()) do
        chatFilterMain.addPlayer(Player)
    end
    
    -- [[ update Name Tables on new player added ]]
    chatFilterMain.Connections["newPlayerEvent"] = Players.PlayerAdded:Connect(chatFilterMain.addPlayer)
    
    -- [[ filter all active chat messages ]]
    for Index,Frame in ipairs(chatFilterMain.Scroller:GetChildren()) do
        if Index == 1 then continue end
        local TextButton = Frame:FindFirstChild("TextButton", true)
        if TextButton then
            TextButton.Text = chatFilterMain.filterGeneral(TextButton.Text, true)
            Frame.TextLabel.Text = chatFilterMain.modifyChatText(Frame.TextLabel, Frame.TextLabel.Text:match("%s*(.+)"))
        else
            Frame.TextLabel.Text = chatFilterMain.filterGeneral(Frame.TextLabel.Text)
        end
    end
    
    --[[
    if chatFilterMain.removeNilPlayers then
        local activePlayers = {}
        for _,Player in ipairs(Players:GetPlayers()) do
            activePlayers[Player.Name:lower()] = Player.DisplayName
            activePlayers[Player.DisplayName:lower()] = Player.Name
        end
        for lowerName, Name in pairs(chatFilterMain.lowerNames) do
            if activePlayers[lowerName] then
                chatFilterMain.removePlayer(nil, Name, )
            end
        end
        
        chatFilterMain.Connections["removePlayerEvent"] = Players.PlayerRemoving:Connect(chatFilterMain.removePlayer)
    end
    ]]
    
    -- [[ disable server messages and filter player messages ]]
    chatFilterMain.Connections["newChatEvent"] = chatFilterMain.Scroller.ChildAdded:Connect(function(Frame)
        local TextButton = Frame:FindFirstChild("TextButton", true)
        if TextButton then
            TextButton.Text = chatFilterMain.filterGeneral(TextButton.Text, true)
        else
            Frame.TextLabel.Text = chatFilterMain.filterGeneral(Frame.TextLabel.Text)
        end
    end)
    
    
    --[[ disable Bubble chat ]]
    for _,bubbleGui in ipairs(game:GetService("CoreGui").BubbleChat:GetChildren()) do
        bubbleGui:FindFirstChildOfClass("Frame").Visible = false
        bubbleGui:FindFirstChildOfClass("Frame").RobloxLocked = true
    end
    
    chatFilterMain.Connections["bubbleChatEvent"] = game:GetService("CoreGui").BubbleChat.ChildAdded:Connect(function(bubbleGui)
        bubbleGui:FindFirstChildOfClass("Frame").Visible = false
        bubbleGui:FindFirstChildOfClass("Frame").RobloxLocked = true
    end)
    
    chatFilterMain.Enabled = true
end

chatFilterMain.Disable = function()
    if not chatFilterMain.Enabled then return end
    
    for _,Connection in pairs(chatFilterMain.Connections) do
        Connection:Disconnect() 
    end
    
    for _,Frame in ipairs(chatFilterMain.Scroller:GetChildren()) do
        if Frame.Visible == false then Frame.Visible = true end 
    end
    
    for _,bubbleGui in ipairs(game:GetService("CoreGui").BubbleChat:GetChildren()) do
        bubbleGui:FindFirstChildOfClass("Frame").RobloxLocked = false
        bubbleGui:FindFirstChildOfClass("Frame").Visible = true
    end
    
    -- reset all filtered text instances
    
end

chatFilterMain.Enable()

local OldNewIndex
OldNewIndex = hookmetamethod(game, "__newindex", function(Self, Index, Value)
    if chatFilterMain.Enabled then
        if Self.Parent and Self.Parent.Parent == chatFilterMain.Scroller and Index == "Text" then
            return OldNewIndex(Self, Index, chatFilterMain.modifyChatText(Self, Value:match("%s*(.+)")))
        end
    end
    
    return OldNewIndex(Self, Index, Value)
end)
-- print("CALLED ALL")



