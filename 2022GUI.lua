-- SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- GUI SETUP
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MobileGui"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0.8, 0, 0.7, 0)
mainFrame.Position = UDim2.new(0.1, 0, 0.15, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.Active = true
mainFrame.Draggable = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, -45, 0, 30)
title.Position = UDim2.new(0, 10, 0, 5)
title.Text = "<2022GUI>"
title.TextColor3 = Color3.fromRGB(255, 170, 0)
title.Font = Enum.Font.FredokaOne
title.TextScaled = true
title.BackgroundTransparency = 1

local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0, 40, 0, 30)
closeBtn.Position = UDim2.new(1, -45, 0, 5)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.FredokaOne
closeBtn.TextScaled = true
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

local miniBtn = Instance.new("TextButton", gui)
miniBtn.Size = UDim2.new(0, 40, 0, 40)
miniBtn.Position = UDim2.new(0, 10, 0.5, -20)
miniBtn.Text = "▶"
miniBtn.TextColor3 = Color3.fromRGB(255, 170, 0)
miniBtn.Font = Enum.Font.FredokaOne
miniBtn.TextScaled = true
miniBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
miniBtn.Visible = false
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(1, 0)

-- TABS BAR
local tabBar = Instance.new("Frame", mainFrame)
tabBar.Size = UDim2.new(1, -20, 0, 30)
tabBar.Position = UDim2.new(0, 10, 0, 40)
tabBar.BackgroundTransparency = 1

local tabLayout = Instance.new("UIListLayout", tabBar)
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0, 10)

-- Tab Buttons
local infoTabBtn = Instance.new("TextButton", tabBar)
infoTabBtn.Size = UDim2.new(0, 100, 1, 0)
infoTabBtn.Text = "Info"
infoTabBtn.Font = Enum.Font.FredokaOne
infoTabBtn.TextScaled = true
infoTabBtn.TextColor3 = Color3.new(0, 0, 0)
infoTabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", infoTabBtn).CornerRadius = UDim.new(0, 6)

local infoServerTabBtn = Instance.new("TextButton", tabBar)
infoServerTabBtn.Size = UDim2.new(0, 120, 1, 0)
infoServerTabBtn.Text = "InfoServer"
infoServerTabBtn.Font = Enum.Font.FredokaOne
infoServerTabBtn.TextScaled = true
infoServerTabBtn.TextColor3 = Color3.new(0, 0, 0)
infoServerTabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", infoServerTabBtn).CornerRadius = UDim.new(0, 6)

local scriptTabBtn = Instance.new("TextButton", tabBar)
scriptTabBtn.Size = UDim2.new(0, 100, 1, 0)
scriptTabBtn.Text = "Script"
scriptTabBtn.Font = Enum.Font.FredokaOne
scriptTabBtn.TextScaled = true
scriptTabBtn.TextColor3 = Color3.new(0, 0, 0)
scriptTabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", scriptTabBtn).CornerRadius = UDim.new(0, 6)

local playerTabBtn = Instance.new("TextButton", tabBar)
playerTabBtn.Size = UDim2.new(0, 100, 1, 0)
playerTabBtn.Text = "Player"
playerTabBtn.Font = Enum.Font.FredokaOne
playerTabBtn.TextScaled = true
playerTabBtn.TextColor3 = Color3.new(0, 0, 0)
playerTabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", playerTabBtn).CornerRadius = UDim.new(0, 6)

local friendsTabBtn = Instance.new("TextButton", tabBar)
friendsTabBtn.Size = UDim2.new(0, 120, 1, 0)
friendsTabBtn.Text = "YouFriend"
friendsTabBtn.Font = Enum.Font.FredokaOne
friendsTabBtn.TextScaled = true
friendsTabBtn.TextColor3 = Color3.new(0, 0, 0)
friendsTabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", friendsTabBtn).CornerRadius = UDim.new(0, 6)

-- CONTENT HOLDER
local contentFrame = Instance.new("Frame", mainFrame)
contentFrame.Size = UDim2.new(1, -20, 1, -80)
contentFrame.Position = UDim2.new(0, 10, 0, 75)
contentFrame.BackgroundTransparency = 1

-- Script Tab
local scriptTab = Instance.new("Frame", contentFrame)
scriptTab.Size = UDim2.new(1, 0, 1, 0)
scriptTab.BackgroundTransparency = 1
scriptTab.Visible = false

local inputBox = Instance.new("TextBox", scriptTab)
inputBox.Size = UDim2.new(1, -130, 1, -50)
inputBox.Position = UDim2.new(0, 0, 0, 0)
inputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
inputBox.TextColor3 = Color3.new(1, 1, 1)
inputBox.PlaceholderText = "-- use you script in here"
inputBox.Font = Enum.Font.Code
inputBox.TextSize = 18
inputBox.TextXAlignment = Enum.TextXAlignment.Left
inputBox.TextYAlignment = Enum.TextYAlignment.Top
inputBox.TextWrapped = true
inputBox.ClearTextOnFocus = false
inputBox.MultiLine = true
Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 6)

local runBtn = Instance.new("TextButton",scriptTab)
runBtn.Size = UDim2.new(0, 90, 0, 35)
runBtn.Position = UDim2.new(1, -100, 1, -40)
runBtn.Text = "Run"
runBtn.Font = Enum.Font.FredokaOne
runBtn.TextScaled = true
runBtn.TextColor3 = Color3.new(1, 1, 1)
runBtn.BackgroundColor3 = Color3.fromRGB(70, 200, 70)
Instance.new("UICorner", runBtn).CornerRadius = UDim.new(0, 6)

local clearBtn = Instance.new("TextButton", scriptTab)
clearBtn.Size = UDim2.new(0, 90, 0, 35)
clearBtn.Position = UDim2.new(1, -200, 1, -40)
clearBtn.Text = "delete"
clearBtn.Font = Enum.Font.FredokaOne
clearBtn.TextScaled = true
clearBtn.TextColor3 = Color3.new(1, 1, 1)
clearBtn.BackgroundColor3 = Color3.fromRGB(200, 70, 70)
Instance.new("UICorner", clearBtn).CornerRadius = UDim.new(0, 6)

-- Info Tab
local infoTab = Instance.new("Frame", contentFrame)
infoTab.Size = UDim2.new(1, 0, 1, 0)
infoTab.BackgroundTransparency = 1
infoTab.Visible = true

local infoText = Instance.new("TextLabel", infoTab)
infoText.Size = UDim2.new(1, -20, 1, -20)
infoText.Position = UDim2.new(0, 10, 0, 10)
infoText.TextWrapped = true
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.Font = Enum.Font.FredokaOne
infoText.TextColor3 = Color3.new(1, 1, 1)
infoText.TextScaled = false
infoText.TextSize = 16
infoText.Text = "Script by???\n\n- Tab Script:???\n- Tab Player:???\n- Tab Info:???\n- Tab YouFriend:???(beta)\n\nthx for use my gui!"
infoText.BackgroundTransparency = 1

-- InfoServer Tab
local infoServerTab = Instance.new("Frame", contentFrame)
infoServerTab.Size = UDim2.new(1, 0, 1, 0)
infoServerTab.BackgroundTransparency = 1
infoServerTab.Visible = false

local infoServerText = Instance.new("TextLabel", infoServerTab)
infoServerText.Size = UDim2.new(1, -20, 1, -20)
infoServerText.Position = UDim2.new(0, 10, 0, 10)
infoServerText.TextWrapped = true
infoServerText.TextYAlignment = Enum.TextYAlignment.Top
infoServerText.Font = Enum.Font.FredokaOne
infoServerText.TextColor3 = Color3.new(1, 1, 1)
infoServerText.TextScaled = false
infoServerText.TextSize = 16
infoServerText.Text = "🔍 wait info server..."
infoServerText.BackgroundTransparency = 1

-- Player Tab
local playerTab = Instance.new("Frame", contentFrame)
playerTab.Size = UDim2.new(1, 0, 1, 0)
playerTab.BackgroundTransparency = 1
playerTab.Visible = false

local espBtn = Instance.new("TextButton", playerTab)
espBtn.Size = UDim2.new(0, 100, 0, 35)
espBtn.Position = UDim2.new(0, 0, 0, 0)
espBtn.Text = "ESP"
espBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
espBtn.Font = Enum.Font.FredokaOne
espBtn.TextScaled = true
espBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", espBtn).CornerRadius = UDim.new(0, 6)

local flyBtn = Instance.new("TextButton", playerTab)
flyBtn.Size = UDim2.new(0, 100, 0, 35)
flyBtn.Position = UDim2.new(0, 0, 0, 45)
flyBtn.Text = "Fly"
flyBtn.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
flyBtn.Font = Enum.Font.FredokaOne
flyBtn.TextScaled = true
flyBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0, 6)

local speedBtn = Instance.new("TextButton", playerTab)
speedBtn.Size = UDim2.new(0, 100, 0, 35)
speedBtn.Position = UDim2.new(0, 0, 0, 90)
speedBtn.Text = "Speed"
speedBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 100)
speedBtn.Font = Enum.Font.FredokaOne
speedBtn.TextScaled = true
speedBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", speedBtn).CornerRadius = UDim.new(0, 6)

local noclipBtn = Instance.new("TextButton", playerTab)
noclipBtn.Size = UDim2.new(0, 100, 0, 35)
noclipBtn.Position = UDim2.new(0, 0, 0, 135)
noclipBtn.Text = "Noclip"
noclipBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
noclipBtn.Font = Enum.Font.FredokaOne
noclipBtn.TextScaled = true
noclipBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", noclipBtn).CornerRadius = UDim.new(0, 6)

local fullbrightBtn = Instance.new("TextButton", playerTab)
fullbrightBtn.Size = UDim2.new(0, 100, 0, 35)
fullbrightBtn.Position = UDim2.new(0, 0, 0, 180)
fullbrightBtn.Text = "FullBright"
fullbrightBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fullbrightBtn.Font = Enum.Font.FredokaOne
fullbrightBtn.TextScaled = true
fullbrightBtn.TextColor3 = Color3.fromRGB(0,0,0)
Instance.new("UICorner", fullbrightBtn).CornerRadius = UDim.new(0, 6)

-- Friends Tab (YouFriend)
local friendsTab = Instance.new("Frame", contentFrame)
friendsTab.Size = UDim2.new(1,0,1,0)
friendsTab.BackgroundTransparency = 1
friendsTab.Visible = false

local friendsScroll = Instance.new("ScrollingFrame", friendsTab)
friendsScroll.Size = UDim2.new(1,-20,1,-20)
friendsScroll.Position = UDim2.new(0,10,0,10)
friendsScroll.BackgroundTransparency = 0.9
friendsScroll.ScrollBarThickness = 10
Instance.new("UICorner", friendsScroll).CornerRadius = UDim.new(0,6)

local friendsLayout = Instance.new("UIListLayout", friendsScroll)
friendsLayout.SortOrder = Enum.SortOrder.LayoutOrder
friendsLayout.Padding = UDim.new(0,5)

local function addFriendLabel(name)
    local label = Instance.new("TextLabel", friendsScroll)
    label.Size = UDim2.new(1,-10,0,30)
    label.Text = "❌ "..name.." Beta not real!"
    label.Font = Enum.Font.FredokaOne
    label.TextScaled = true
    label.TextColor3 = Color3.fromRGB(255,100,100)
    label.BackgroundTransparency = 0.8
    Instance.new("UICorner", label).CornerRadius = UDim.new(0,6)
    friendsScroll.CanvasSize = UDim2.new(0,0,0,friendsLayout.AbsoluteContentSize.Y + 10)
end

-- TAB SWITCHING
local function showTab(tab)
    scriptTab.Visible = (tab == "Script")
    infoTab.Visible = (tab == "Info")
    infoServerTab.Visible = (tab == "InfoServer")
    playerTab.Visible = (tab == "Player")
    friendsTab.Visible = (tab == "YouFriend")
end

scriptTabBtn.MouseButton1Click:Connect(function() showTab("Script") end)
infoTabBtn.MouseButton1Click:Connect(function() showTab("Info") end)
infoServerTabBtn.MouseButton1Click:Connect(function() showTab("InfoServer") end)
playerTabBtn.MouseButton1Click:Connect(function() showTab("Player") end)
friendsTabBtn.MouseButton1Click:Connect(function() showTab("YouFriend") end)

-- MINI / CLOSE
closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    miniBtn.Visible = true
end)
miniBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    miniBtn.Visible = false
end)

-- RUN / CLEAR SCRIPT
runBtn.MouseButton1Click:Connect(function()
    local code = inputBox.Text
    local func, err = loadstring(code)
    if func then pcall(func)
    else warn("Lỗi: "..tostring(err)) end
end)
clearBtn.MouseButton1Click:Connect(function() inputBox.Text = "" end)

-- ESP
local espEnabled = false
local espBoxes = {}
local function createEspBox(char)
    local box = Instance.new("BoxHandleAdornment")
    box.Adornee = char:WaitForChild("HumanoidRootPart")
    box.Size = Vector3.new(4,6,4)
    box.Color3 = Color3.fromRGB(255,0,0)
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Transparency = 0.5
    box.Parent = camera
    return box
end
local function removeEsp()
    for _,b in pairs(espBoxes) do b:Destroy() end
    espBoxes = {}
end
local function updateEsp()
    removeEsp()
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(espBoxes, createEspBox(p.Character))
        end
    end
end
espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        updateEsp()
        espBtn.BackgroundColor3 = Color3.fromRGB(150,150,255)
    else
        removeEsp()
        espBtn.BackgroundColor3 = Color3.fromRGB(100,100,255)
    end
end)

-- FLY
local flyEnabled = false
local flyConnection
flyBtn.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if flyEnabled then
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlyVelocity"
        bv.MaxForce = Vector3.new(1e5,1e5,1e5)
        bv.Velocity = Vector3.zero
        bv.Parent = root
        flyConnection = RunService.Heartbeat:Connect(function()
            if not flyEnabled then
                if flyConnection then flyConnection:Disconnect() flyConnection=nil end
                if bv then bv:Destroy() end
                return
            end
            local move = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move += camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move -= camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move -= camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move += camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space)
then move += Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move -= Vector3.new(0,1,0) end
            bv.Velocity = move.Magnitude>0 and move.Unit*50 or Vector3.zero
        end)
    else
        if flyConnection then flyConnection:Disconnect() flyConnection=nil end
        local bv = root:FindFirstChild("FlyVelocity")
        if bv then bv:Destroy() end
    end
    flyBtn.BackgroundColor3 = flyEnabled and Color3.fromRGB(150,255,150) or Color3.fromRGB(100,255,100)
end)

-- SPEED
local speedEnabled = false
local speedValue = 100
local speedConnection
local function startSpeed()
    if speedConnection then return end
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return end
    speedConnection = RunService.Heartbeat:Connect(function()
        if humanoid and speedEnabled then humanoid.WalkSpeed = speedValue end
    end)
end
local function stopSpeed()
    speedEnabled = false
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then humanoid.WalkSpeed = 16 end
    if speedConnection then speedConnection:Disconnect() speedConnection=nil end
end
speedBtn.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    if speedEnabled then startSpeed() speedBtn.BackgroundColor3=Color3.fromRGB(255,255,100)
    else stopSpeed() speedBtn.BackgroundColor3=Color3.fromRGB(255,200,100) end
end)

local noclipEnabled = false
local noclipConnection
noclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if noclipEnabled then
        noclipConnection = RunService.Stepped:Connect(function()
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
        noclipBtn.BackgroundColor3 = Color3.fromRGB(255,150,150)
    else
        if noclipConnection then noclipConnection:Disconnect() noclipConnection=nil end
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        noclipBtn.BackgroundColor3 = Color3.fromRGB(255,100,100)
    end
end)

local fullbrightEnabled = false
local originalLighting = {
    Brightness = game.Lighting.Brightness,
    ClockTime = game.Lighting.ClockTime,
    FogEnd = game.Lighting.FogEnd,
    Ambient = game.Lighting.Ambient
}

fullbrightBtn.MouseButton1Click:Connect(function()
    fullbrightEnabled = not fullbrightEnabled
    if fullbrightEnabled then
        game.Lighting.Brightness = 2
        game.Lighting.ClockTime = 14
        game.Lighting.FogEnd = 100000
        game.Lighting.Ambient = Color3.new(1,1,1)
        fullbrightBtn.BackgroundColor3 = Color3.fromRGB(200,200,200)
    else
        game.Lighting.Brightness = originalLighting.Brightness
        game.Lighting.ClockTime = originalLighting.ClockTime
        game.Lighting.FogEnd = originalLighting.FogEnd
        game.Lighting.Ambient = originalLighting.Ambient
        fullbrightBtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
    end
end)
-- YouFriend Auto Update (ví dụ kiểm tra bạn bè unfriend)
local trackedFriends = {} -- danh sách tên bạn đã theo dõi
spawn(function()
    while wait(5) do
        local currentFriends = {} -- giả lập get friends (thay bằng API thật nếu có)
        for _,p in pairs(Players:GetPlayers()) do
            currentFriends[p.Name] = true
        end
        -- kiểm tra ai unfriend
        for name,_ in pairs(trackedFriends) do
            if not currentFriends[name] then
                addFriendLabel(name)
                trackedFriends[name] = nil
            end
        end
    end
end)

-- InfoServer Auto Update
spawn(function()
    while wait(3) do
        if infoServerTab.Visible then
            infoServerText.Text = "🌐 Server: "..tostring(game.PlaceId).."\nPlayers: "..#Players:GetPlayers()
        end
    end
end)

-- Khởi tạo trackedFriends ví dụ
for _,p in pairs(Players:GetPlayers()) do
    if p ~= player then trackedFriends[p.Name] = true end
end
