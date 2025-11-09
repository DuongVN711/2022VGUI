local player = game.Players.LocalPlayer

-- playlist 
local songList = {
    {name = "NCS - Fade", id = "306184291"},
    {name = "Alan Walker - Spectre", id = "198356746"},
    {name = "Marshmello - Alone", id = "639750143"},
    {name = "TheFatRat - Unity", id = "130777688"},
    {name = "K-391 - Earth", id = "139377708"}
}

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "MusicGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 260, 0, 220)
mainFrame.Position = UDim2.new(0.5, -130, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- name GUI
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 28)
title.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
title.Text = "Music list by 2022VCOOL"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = mainFrame

-- delete GUI
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -28, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 18
closeBtn.Parent = mainFrame

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- ScrollingFrame
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, 0, 1, -28)
scroll.Position = UDim2.new(0, 0, 0, 28)
scroll.CanvasSize = UDim2.new(0, 0, 0, #songList * 40)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1
scroll.Parent = mainFrame

-- copy id:P
local function copyToClipboard(text)
    --copy
    setclipboard = setclipboard or function() end
    if setclipboard then
        setclipboard(text)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "copy ID!",
            Text = text,
            Duration = 2
        })
    else
        print("Copy:", text)
    end
end

for i, song in ipairs(songList) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Position = UDim2.new(0, 5, 0, (i - 1) * 40)
    btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 16
    btn.Text = song.name .. " (" .. song.id .. ")"
    btn.Parent = scroll

    btn.MouseButton1Click:Connect(function()
        copyToClipboard(song.id)
    end)
    
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)
end
