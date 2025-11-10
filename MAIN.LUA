--// Intro GUI
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--===[ GUI INTRO ]===--
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "IntroGUI"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.3
frame.Parent = screenGui
frame.AnchorPoint = Vector2.new(0, 0)

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.6, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "wellcome to my gui:D!!!"
textLabel.TextColor3 = Color3.fromRGB(255,255,255)
textLabel.TextScaled = true
textLabel.Font = Enum.Font.FredokaOne
textLabel.Parent = frame

-- bar loading
local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0.8,0,0.1,0)
loadingFrame.Position = UDim2.new(0.1,0,0.75,0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(100,100,100)
loadingFrame.Parent = frame

local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0,0,1,0)
loadingBar.BackgroundColor3 = Color3.fromRGB(0,255,0)
loadingBar.Parent = loadingFrame

local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(1,0,1,0)
percentLabel.BackgroundTransparency = 1
percentLabel.TextColor3 = Color3.fromRGB(255,255,255)
percentLabel.TextScaled = true
percentLabel.Text = "0%"
percentLabel.Parent = loadingFrame

-- loading
local function runLoading(duration)
    local steps = 100
    for i = 1, steps do
        local progress = i / steps
        loadingBar.Size = UDim2.new(progress,0,1,0)
        percentLabel.Text = tostring(i).."%"
        wait(duration / steps)
    end
end

-- really loading
runLoading(3)
textLabel.Text = "Enjoy!"

-- Animation
local shrink = TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = UDim2.new(0,0,0,0),
    Position = UDim2.new(0.5,0,0.5,0),
    BackgroundTransparency = 1
})
shrink:Play()
shrink.Completed:Wait()

screenGui:Destroy()

--===[ AUTO UPDATE SCRIPT ]===--
local fileName = "2022VGUI.lua"
local url = "https://raw.githubusercontent.com/DuongVN711/2022VGUI/main/2022GUI.lua"

if not writefile or not readfile then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "⚠️ Error";
        Text = "Executor not support writefile/readfile!";
        Duration = 5;
    })
    return
end

-- Download or update file
if not isfile(fileName) then
    writefile(fileName, game:HttpGet(url))
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Download Script";
        Text = "Success in Workspace!";
        Duration = 4;
    })
else
    local newScript = game:HttpGet(url)
    local oldScript = readfile(fileName)
    if newScript ~= oldScript then
        writefile(fileName, newScript)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Auto Update";
            Text = "Script updated!";
            Duration = 4;
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "✅ Script new";
            Text = "No need update";
            Duration = 3;
        })
    end
end

-- run file over intro
loadstring(readfile(fileName))()
