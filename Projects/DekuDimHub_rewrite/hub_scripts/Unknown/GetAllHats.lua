
-- "https://raw.githubusercontent.com/1201for/V.G-Hub/main/GetAllHats"

pcall(function()
if game.PlaceId == 4201429814 or 2546610365 or 1871632192 or 3204381131 then
    game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson1")
    game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson2")
    game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson3")
    game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson4")
    game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson5")
    game:GetService("ReplicatedStorage").Events.FinishQuiz:InvokeServer("Lesson6")
end
end)

if game.PlaceId == 6205205961 then
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.GemsStageTeleporter.Gate.Teleporter.Tele.CFrame
elseif Workspace:FindFirstChild("Coin", true) and game.PlaceId == 1328106297 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Workspace:FindFirstChild("Coin", true).CFrame
end 


if game.PlaceId == 5306359293 then

    game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("StrikeAPose")

    game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("SettingTheStage")

    game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("DIY")

    game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("GetMoving")

    game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("VictoryLap")
end
if game.PlaceId == 6901029464 then
    game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("Boardwalk")
    game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("FXArtist")
    game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("ParticleWizard")
    game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("ThingsGoBoom")
end

if game.PlaceId == 6985028626 then
    game:GetService("ReplicatedStorage").TasksList.RemoteEvents.AwardBadge:FireServer()
end

if game.PlaceId == 7541759836 then
while wait() do
for _,v in pairs(game:GetService("Workspace").obby.Badge:GetDescendants()) do
if v:IsA("TouchTransmitter") then
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0) --0 is touch
wait()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1) -- 1 is untouch
end
end
for i=1,4 do
    game:GetService("ReplicatedStorage").Project.RemoteEvent.ControlMessageEvent:FireServer(2,{2,i})
end
end
end
if game.PlaceId == 7277488595 then
while wait() do    
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObstacleCourse.ObstacleEntries.Part.CFrame 
wait(3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").ObstacleCourse.ObstacleEnd.Part.CFrame
wait(1)
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("PurchaseWithCoins","clothing1")
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("PurchaseWithCoins","accessory12")
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("PurchaseWithCoins","accessory14")
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("PurchaseWithCoins","accessory13")

end
end
if game.PlaceId == 7234162497 then
remote = game:GetService("ReplicatedStorage").RemoteEvent
for i=1,10 do
    remote:FireServer("Claim", i)
end
    remote:FireServer("ClaimFreeRewards")
end

if game.PlaceId == 5450795073 then
Player = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
Clues =  game:GetService("Workspace").Clues
Remote = game:GetService("ReplicatedStorage").RobloxDialogue.Remotes
for Found,Clue in pairs(Clues:GetChildren() ) do
if Clue.ClassName == "Model" then
for Found1,Clue1 in pairs(Clue:GetDescendants() ) do
if Clue1.Name  == "RobloxDialogue" then
Talk = Clue1
elseif Clue1.ClassName=="Part" then
Teleportto = Clue1
end
end

Player.CFrame = Teleportto.CFrame
wait(1)
Remote.DialogueRequested:FireServer(Talk)
wait()
Remote.DialogueResponseChosen:FireServer(1)
wait()
end
end
end

if game.PlaceId == 7232621271 then
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,game:GetService("Workspace").nezha.NezhaTouch,0)
end

if game.PlaceId == 5853107391 then
repeat wait() until game:IsLoaded() 
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new()) --anti afk cuz why not
end)
while wait() do
game:GetService("ReplicatedStorage").ShootingGallery.RemoteEvents.RequestGalleryStart:FireServer()
wait(1)
game:GetService("ReplicatedStorage").ShootingGallery.RemoteEvents.Statistics.TargetHit:FireServer({["TargetName"] = "Your Mom",["score"] = 99999,["position"] = Vector3.new(0,0,0)})
wait(1)
game:GetService("ReplicatedStorage").ShootingGallery.RemoteEvents.FinalBeatCleared:FireServer({[1] = true})
wait(1)
firesignal(game:GetService("Players").LocalPlayer.PlayerGui.MainPlace.PopUps.ShootingGalleryStatistics.OkButton.MouseButton1Click)
firesignal(game:GetService("Players").LocalPlayer.PlayerGui.MainPlace.PopUps.ShootingGalleryStatistics.OkButton.MouseButton1Down)
game:GetService("Players").LocalPlayer.PlayerGui.MainPlace.PopUps.ShootingGalleryStatistics.Visible = false
game:GetService("Players").LocalPlayer.PlayerGui.MainPlace.PopUps.BackgroundEffect.Visible = false
game:GetService("ReplicatedStorage").Store.Remote.PurchaseRequest:FireServer("hawkings_backpack",false)
game:GetService("ReplicatedStorage").Store.Remote.PurchaseRequest:FireServer("sc_badge",false)
game:GetService("ReplicatedStorage").Store.Remote.PurchaseRequest:FireServer("vest",false)
game:GetService("ReplicatedStorage").Store.Remote.PurchaseRequest:FireServer("headgear",false)
game:GetService("ReplicatedStorage").Store.Remote.PurchaseRequest:FireServer("robin_costume",false)
game:GetService("ReplicatedStorage").Store.Remote.PurchaseRequest:FireServer("eleven_costume",false)
game:GetService("ReplicatedStorage").Store.Remote.PurchaseRequest:FireServer("demogorgon_costume",false)
game:GetService("ReplicatedStorage").Store.Remote.PurchaseRequest:FireServer("hazmat_costume",false)
game:GetService("ReplicatedStorage").Store.Remote.PurchaseRequest:FireServer("steven_costume",false)
game:GetService("ReplicatedStorage").Store.Remote.PurchaseRequest:FireServer("will_costume",false)
end end 

if game.PlaceId == 7619937171 then
game:GetService("ReplicatedStorage").RemoteEvent:FireServer("CollectItem","Shady Circle Glasses")
game:GetService("ReplicatedStorage").RemoteEvent:FireServer("CollectItem","Sunshine Backpack")
game:GetService("ReplicatedStorage").RemoteEvent:FireServer("CollectItem","Tie-Dye Visor")
end

if game.PlaceId == 7462526249 then

game:GetService("ReplicatedStorage").TGSButtonCallbacks_ServerInvoke:FireServer("ClaimFreeItems")
end
