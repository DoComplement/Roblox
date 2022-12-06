local size = game.Players.LocalPlayer.PlayerGui.ScreenGui.AbsoluteSize
local sx = 1920 - size.X; local sy = 973 - size.Y
local LP = game:GetService("Players").LocalPlayer
local o_X1 = 1695 - sx; local o_Y1 = 541 - sy; local o_X2 = 1438 - sx; local o_Y2 = 206 - sy
local p_F
 
    local function getp1_F()
    	if LP.PlayerGui.ScreenGui:FindFirstChild("PetsFrame") then LP.PlayerGui.ScreenGui:FindFirstChild("PetsFrame").Parent = nil end
    	local m_B = LP.PlayerGui.ScreenGui.MainButtons
    	local m_UIL = m_B.UIListLayout
    
    	m_UIL.Parent = LP.PlayerGui; if not m_B.Visible then m_B.Visible = true end
    	for i,v in pairs(m_B:GetChildren()) do if v:IsA("ImageButton") and v.Name ~= "Pets" then v.Visible = false end end
    
    	game:GetService("StarterGui"):SetCore("SendNotification", {
    		Title = "Waiting for PetsFrame...",
    		Text = "Please open your PetsFrame to initialize the potion quantities",
    		Duration = 5
    	})
    
        if (o_X1 == nil and o_Y1 == nil) then 
            m_B.Pets.Position = UDim2.fromScale(0, 0) 
            repeat wait(); o_X1 = LP:GetMouse().X; o_Y1 = LP:GetMouse().Y 
            until LP.PlayerGui.ScreenGui:FindFirstChild("PetsFrame")
    	else 
    	    repeat wait(); m_B.Pets.Position = UDim2.fromOffset(LP:GetMouse().X - o_X1, LP:GetMouse().Y - o_Y1) 
    	    until LP.PlayerGui.ScreenGui:FindFirstChild("PetsFrame")
        end
        print("PetsFrame: x-offset:", o_X1, " | y-offset:", o_Y1)
    
        p_F = LP.PlayerGui.ScreenGui:FindFirstChild("PetsFrame")
    	m_B.Visible = false
    	m_UIL.Parent = m_B
    end
    
    -- function to count the total number of cumulative and unique potions the user contains
    local function getp2_F(vis)
    	local p_UIL = p_F.Tabs.UIListLayout
    
    	for i, v in pairs(p_F.Tabs:GetChildren()) do if v:IsA("ImageButton") then v.Visible = false end end
    	p_F.Main.Visible = false; p_F.Stats.Visible = false; p_UIL.Parent = LP.PlayerGui
    	p_F.Main.Pages.Potions.List.Grid.UIGridLayout.CellSize = UDim2.fromOffset(10, 10)
    
    	game:GetService("StarterGui"):SetCore("SendNotification", {
    		Title = "PetsFrame found...",
    		Text = "Please open your Potions tab to initialize the potion quantities",
    		Duration = 5
    	}) 
    
    	wait(1)
        p_F.Tabs.Potions.Visible = true
        if (o_X2 == nil and o_Y2 == nil) then 
            p_F.Tabs.Potions.Position = UDim2.fromScale(0, 0)
            repeat wait(); o_X2 = LP:GetMouse().X; o_Y2 = LP:GetMouse().Y
            until p_F.Main.Title.Text == "My Potions"
        else
            repeat wait(); p_F.Tabs.Potions.Position = UDim2.fromOffset(LP:GetMouse().X - o_X2, LP:GetMouse().Y - o_Y2)
            until p_F.Main.Title.Text == "My Potions"
        end
        print("PotionsFrame: x-offset:", o_X2, " | y-offset:", o_Y2)
        p_F.Tabs.Potions.Visible = false
        p_UIL.Parent = p_F.Tabs
        
        p_Max = tonumber(string.sub(p_F.Main.Counters.Stored.Amount.Text, string.find(p_F.Main.Counters.Stored.Amount.Text, "/") + 1, string.len(p_F.Main.Counters.Stored.Amount.Text))) 
    	game:GetService("StarterGui"):SetCore("SendNotification", {
    		Title = "Potions tab found...",
    		Text = "Processing potion quantities...",
    		Duration = 5
    	}) 
    
    	wait(3) -- data may take a few seconds to load
       	for i,v in pairs(p_F.Main.Pages.Potions.List.Grid:GetChildren()) do
       		if v:FindFirstChild("Detail") then p_Q[getPotion(v.Detail.Inner.PotionName.Text)] = p_Q[getPotion(v.Detail.Inner.PotionName.Text)] + 1; sum = sum + 1 end
       	end
       
        p_F.Main.Pages.Potions.List.Grid.UIGridLayout.CellSize = UDim2.fromOffset(115, 115)
    	LP.PlayerGui.ScreenGui.MainButtons.Pets.Position = UDim2.fromScale(0, 0)
    	p_F.Tabs.Potions.Position = UDim2.new(1, 5, 0, 0)
    	p_F.Main.Visible = true; p_F.Stats.Visible = true
    	closeFrames(vis)
    	for i, v in pairs(p_F.Tabs:GetChildren()) do if v:IsA("ImageButton") then v.Visible = true end end
    	for i, v in pairs(LP.PlayerGui.ScreenGui.MainButtons:GetChildren()) do if v:IsA("ImageButton") then v.Visible = true end end
    end
    
getp1_F(); wait(2); getp2_F(false)

--[[
ScreenGui Size: 1920, 973
PetsFrame: x-offset: 1695 | y-offset: 541
PotionsFrame x-offset: 1438 | y-offset: 206
]]
