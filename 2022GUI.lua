-- Update has beta playlist
-- SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- REMOVE OLD GUI TO AVOID DUPLICATES
local existing = player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("MobileGui")
if existing then existing:Destroy() end

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

-- Tab Buttons (Info, InfoServer, Script, Player, Music)
local function makeTabBtn(text, width)
    local w = width or 100
    local btn = Instance.new("TextButton", tabBar)
    btn.Size = UDim2.new(0, w, 1, 0)
    btn.Text = text
    btn.Font = Enum.Font.FredokaOne
    btn.TextScaled = true
    btn.TextColor3 = Color3.new(0,0,0)
    btn.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
    return btn
end

local infoTabBtn = makeTabBtn("Info", 100)
local infoServerTabBtn = makeTabBtn("InfoServer", 120)
local scriptTabBtn = makeTabBtn("Script", 100)
local playerTabBtn = makeTabBtn("Player", 100)
local musicTabBtn = makeTabBtn("Music", 100)

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
inputBox.PlaceholderText = "-- use your script here"
inputBox.Font = Enum.Font.Code
inputBox.TextSize = 18
inputBox.TextXAlignment = Enum.TextXAlignment.Left
inputBox.TextYAlignment = Enum.TextYAlignment.Top
inputBox.TextWrapped = true
inputBox.ClearTextOnFocus = false
inputBox.MultiLine = true
Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 6)

local runBtn = Instance.new("TextButton", scriptTab)
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
clearBtn.Text = "Delete"
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
infoText.Text = "Script by 2022VCOOL\n\n- tiktok 2022Vcool\n- Script beta\n- ⚠️script not have bypass anticheat\n\nThx for using my GUI"
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
infoServerText.Text = "🔍 Wait info server..."
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

-- MUSIC TAB (client-only)
local musicTab = Instance.new("Frame", contentFrame)
musicTab.Size = UDim2.new(1,0,1,0)
musicTab.BackgroundTransparency = 1
musicTab.Visible = false

local musicNameBox = Instance.new("TextBox", musicTab)
musicNameBox.Size = UDim2.new(0.7,0,0,40)
musicNameBox.Position = UDim2.new(0,0,0,0)
musicNameBox.PlaceholderText = "Nhập ID nhạc (số)"
musicNameBox.TextColor3 = Color3.new(1,1,1)
musicNameBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
musicNameBox.Font = Enum.Font.Code
musicNameBox.TextSize = 18
Instance.new("UICorner", musicNameBox).CornerRadius = UDim.new(0,6)

local musicToggleBtn = Instance.new("TextButton", musicTab)
musicToggleBtn.Size = UDim2.new(0.25,0,0,40)
musicToggleBtn.Position = UDim2.new(0.72,0,0,0)
musicToggleBtn.Text = "OFF"
musicToggleBtn.Font = Enum.Font.FredokaOne
musicToggleBtn.TextScaled = true
musicToggleBtn.TextColor3 = Color3.new(1,1,1)
musicToggleBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
Instance.new("UICorner", musicToggleBtn).CornerRadius = UDim.new(0,6)

local sound = Instance.new("Sound", player:WaitForChild("PlayerGui"))
sound.Looped = true
sound.Volume = 1

-- SAFETY: validate numeric ID input
local function validId(text)
    local n = tonumber(text)
    if n and n > 0 then return tostring(math.floor(n)) end
    return nil
end

local musicEnabled = false
musicToggleBtn.MouseButton1Click:Connect(function()
    musicEnabled = not musicEnabled
    if musicEnabled then
        local idStr = validId(musicNameBox.Text)
        if idStr then
            sound.SoundId = "rbxassetid://"..idStr
            pcall(function() sound:Play() end)
            musicToggleBtn.Text = "ON"
            musicToggleBtn.BackgroundColor3 = Color3.fromRGB(50,200,50)
        else
            -- invalid id: disable and notify briefly
            musicEnabled = false
            musicToggleBtn.Text = "OFF"
            musicToggleBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
            -- small feedback: change placeholder
            musicNameBox.Text = ""
            musicNameBox.PlaceholderText = "ID không hợp lệ"
        end
    else
        pcall(function() sound:Stop() end)
        musicToggleBtn.Text = "OFF"
        musicToggleBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
    end
end)

-- TAB SWITCHING (single function, safe)
local function showTab(tab)
    scriptTab.Visible = (tab == "Script")
    infoTab.Visible = (tab == "Info")
    infoServerTab.Visible = (tab == "InfoServer")
    playerTab.Visible = (tab == "Player")
    musicTab.Visible = (tab == "Music")
end

scriptTabBtn.MouseButton1Click:Connect(function() showTab("Script") end)
infoTabBtn.MouseButton1Click:Connect(function() showTab("Info") end)
infoServerTabBtn.MouseButton1Click:Connect(function() showTab("InfoServer") end)
playerTabBtn.MouseButton1Click:Connect(function() showTab("Player") end)
musicTabBtn.MouseButton1Click:Connect(function() showTab("Music") end)

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
    if func then
        local ok, e = pcall(func)
        if not ok then warn("Runtime error: "..tostring(e)) end
    else
        warn("Compile error: "..tostring(err))
    end
end)
clearBtn.MouseButton1Click:Connect(function() inputBox.Text = "" end)

-- ESP implementation
local espEnabled = false
local espBoxes = {}
local function createEspBox(char)
    if not (char and char:FindFirstChild("HumanoidRootPart")) then return end
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ESP_BOX"
    box.Adornee = char:FindFirstChild("HumanoidRootPart")
    box.Size = Vector3.new(4,6,4)
    box.Color3 = Color3.fromRGB(255,0,0)
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Transparency = 0.5
    box.Parent = camera
    return box
end
local function removeEsp()
    for _,b in pairs(espBoxes) do
        if b and b.Parent then pcall(function() b:Destroy() end) end
    end
    espBoxes = {}
end
local function updateEspAll()
    removeEsp()
    for _,p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local b = createEspBox(p.Character)
            if b then table.insert(espBoxes, b) end
        end
    end
end

espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        updateEspAll()
        espBtn.BackgroundColor3 = Color3.fromRGB(150,150,255)
    else
        removeEsp()
        espBtn.BackgroundColor3 = Color3.fromRGB(100,100,255)
    end
end)

-- FLY implementation (safe bind/unbind names)
local flyEnabled = false
local function enableFly()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local bv = hrp:FindFirstChild("FlyVelocity") or Instance.new("BodyVelocity", hrp)
    bv.Name = "FlyVelocity"
    bv.MaxForce = Vector3.new(1e5,1e5,1e5)
    bv.Velocity = Vector3.zero
    RunService:BindToRenderStep("CustomFly", Enum.RenderPriority.Character.Value+1, function()
        if not flyEnabled or not hrp then return end
        local mv = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then mv += workspace.CurrentCamera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then mv -= workspace.CurrentCamera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then mv -= workspace.CurrentCamera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then mv += workspace.CurrentCamera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then mv += Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then mv -= Vector3.new(0,1,0) end
        bv.Velocity = (mv.Magnitude>0) and mv.Unit * 50 or Vector3.zero
    end)
end
local function disableFly()
    RunService:UnbindFromRenderStep("CustomFly")
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local bv = hrp:FindFirstChild("FlyVelocity")
        if bv then pcall(function() bv:Destroy() end) end
    end
end

flyBtn.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    if flyEnabled then enableFly() flyBtn.BackgroundColor3 = Color3.fromRGB(150,255,150)
    else disableFly() flyBtn.BackgroundColor3 = Color3.fromRGB(100,255,100) end
end)

-- SPEED toggle (safe restore)
local speedActive = false
local defaultWalk = 16
speedBtn.MouseButton1Click:Connect(function()
    speedActive = not speedActive
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        if speedActive then
            hum.WalkSpeed = 125
            speedBtn.BackgroundColor3 = Color3.fromRGB(255,255,100)
        else
            hum.WalkSpeed = defaultWalk
            speedBtn.BackgroundColor3 = Color3.fromRGB(255,200,100)
        end
    end
end)

-- NOCLIP toggle (Bind/Unbind safe)
local noclipActive = false
noclipBtn.MouseButton1Click:Connect(function()
    noclipActive = not noclipActive
    if noclipActive then
        RunService:BindToRenderStep("CustomNoclip", Enum.RenderPriority.Character.Value+2, function()
            if player.Character then
                for _,part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        noclipBtn.BackgroundColor3 = Color3.fromRGB(255,150,150)
    else
        RunService:UnbindFromRenderStep("CustomNoclip")
        if player.Character then
            for _,part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
        noclipBtn.BackgroundColor3 = Color3.fromRGB(255,100,100)
    end
end)

-- FULLBRIGHT toggle (store/restore)
local fullbrightActive = false
local backupLighting = {
    Brightness = game:GetService("Lighting").Brightness,
    ClockTime = game:GetService("Lighting").ClockTime,
    FogEnd = game:GetService("Lighting").FogEnd,
    Ambient = game:GetService("Lighting").Ambient
}
fullbrightBtn.MouseButton1Click:Connect(function()
    fullbrightActive = not fullbrightActive
    local L = game:GetService("Lighting")
    if fullbrightActive then
        L.Brightness = 2
        L.ClockTime = 14
        L.FogEnd = 100000
        L.Ambient = Color3.new(1,1,1)
        fullbrightBtn.BackgroundColor3 = Color3.fromRGB(200,200,200)
    else
        L.Brightness = backupLighting.Brightness
        L.ClockTime = backupLighting.ClockTime
        L.FogEnd = backupLighting.FogEnd
        L.Ambient = backupLighting.Ambient
        fullbrightBtn.BackgroundColor3 = Color3.fromRGB(255,255,255)
    end
end)

-- RESPOND TO NEW PLAYERS / CHARACTERS FOR ESP
Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(char)
        if espEnabled and plr ~= player and char:FindFirstChild("HumanoidRootPart") then
            local b = createEspBox(char)
            if b then table.insert(espBoxes, b) end
        end
    end)
end)

local menuButton = Instance.new("TextButton", musicTab)
menuButton.Size = UDim2.new(0,40,0,40)
menuButton.Position = UDim2.new(0,10,1,-50)
menuButton.Text = "☰"
menuButton.TextScaled = true
menuButton.Font = Enum.Font.SourceSansBold
menuButton.TextColor3 = Color3.new(1,1,1)
menuButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", menuButton).CornerRadius = UDim.new(0,6)

menuButton.MouseButton1Click:Connect(function()
    local url = "https://raw.githubusercontent.com/DuongVN711/2022VGUI/main/2022GUI.lua"
    
    local success, err = pcall(function()
        local scriptContent = game:HttpGet(url)
        loadstring(scriptContent)()
    end)
    
    if not success then
        warn("auto update error: "..tostring(err))
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "❌error",
            Text = "report to fix",
            Duration = 4,
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "✅ Success",
            Text = "now you can get music id:P",
            Duration = 3,
        })
    end
end)

player.CharacterAdded:Connect(function(char)
    wait(0.5)
    if espEnabled then updateEspAll() end
end)

-- INFO SERVER AUTO UPDATE (safe)
spawn(function()
    while true do
        wait(1)
        if infoServerTab and infoServerTab.Parent and infoServerTab.Visible then
            infoServerText.Text = "🌐 Server: "..tostring(game.PlaceId).."\nPlayers: "..tostring(#Players:GetPlayers())
        end
    end
end)

print("GUI loaded successfully ✅")
