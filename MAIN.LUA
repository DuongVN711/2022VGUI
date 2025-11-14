--// Intro GUI
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--===[ GUI INTRO ]===--
local introGui = Instance.new("ScreenGui")
introGui.Name = "IntroGUI"
introGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.3
frame.Parent = introGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1,0,0.6,0)
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

--===[ AUTO UPDATE VARIABLES ]===--
local fileName = "2022VGUI.lua"
local url = "https://raw.githubusercontent.com/DuongVN711/2022VGUI/main/2022GUI.lua"

if not writefile or not readfile then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "⚠️ Error",
        Text = "Executor not support writefile/readfile!",
        Duration = 5,
    })
    return
end

local function safeGet(link)
    local ok, data = pcall(function()
        return game:HttpGet(link.."?"..tostring(tick()))
    end)
    return ok, data
end

local oldScript
if isfile(fileName) then
    oldScript = readfile(fileName)
end

-- Lần đầu tải nếu chưa có file
if not oldScript then
    local ok, newScript = safeGet(url)
    if ok then
        writefile(fileName, newScript)
        oldScript = newScript
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "⚠️ Error",
            Text = "Không tải được script lần đầu!",
            Duration = 5,
        })
        return
    end
end

local finalScript = oldScript
local needUpdate = false
local newScriptData = nil

--===[ LOADING + CHECK UPDATE 50% ]===--
local steps = 100
for i = 1, steps do
    local progress = i / steps
    loadingBar.Size = UDim2.new(progress,0,1,0)
    percentLabel.Text = tostring(i).."%"

    if i == 50 then
        local ok, data = safeGet(url)
        if ok and data ~= oldScript then
            needUpdate = true
            newScriptData = data

            --=== HIỆN POPUP YES/NO ===--
            local popupGui = Instance.new("ScreenGui", playerGui)
            popupGui.Name = "UpdateGUI"

            local box = Instance.new("Frame", popupGui)
            box.Size = UDim2.new(0,260,0,140)
            box.Position = UDim2.new(0.5,-130,0.5,-70)
            box.BackgroundColor3 = Color3.fromRGB(25,25,25)

            local label = Instance.new("TextLabel", box)
            label.Size = UDim2.new(1,0,0.4,0)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.fromRGB(255,255,255)
            label.TextScaled = true
            label.Text = "Có bản update mới!"

            local yes = Instance.new("TextButton", box)
            yes.Size = UDim2.new(0.45,0,0.35,0)
            yes.Position = UDim2.new(0.05,0,0.55,0)
            yes.Text = "YES"

            local no = Instance.new("TextButton", box)
            no.Size = UDim2.new(0.45,0,0.35,0)
            no.Position = UDim2.new(0.5,0,0.55,0)
            no.Text = "NO"

            local choiceMade = false
            yes.MouseButton1Click:Connect(function()
                writefile(fileName, newScriptData)
                finalScript = newScriptData
                popupGui:Destroy()
                choiceMade = true
            end)

            no.MouseButton1Click:Connect(function()
                popupGui:Destroy()
                choiceMade = true
            end)

            -- Dừng vòng loading chờ user bấm YES/NO
            repeat task.wait() until choiceMade
        end
    end

    task.wait(3/steps)
end

textLabel.Text = "Enjoy!"

-- Animation shrink intro
local shrink = TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = UDim2.new(0,0,0,0),
    Position = UDim2.new(0.5,0,0.5,0),
    BackgroundTransparency = 1
})
shrink:Play()
shrink.Completed:Wait()

introGui:Destroy()

--===[ CHẠY SCRIPT CHÍNH ]===--
loadstring(finalScript)()
