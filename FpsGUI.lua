--// AntiLag V1

local g = game
local lp = g.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- wait Character load
if not lp.Character then lp.CharacterAdded:Wait() end
wait(1) -- optional,

------------------------------------------------------
-- FUNCTION clean MAP + PLAYERS
------------------------------------------------------
local function OneTimeClean()
     for _, plr in ipairs(g.Players:GetPlayers()) do
        if plr ~= lp and plr.Character then
            for _, v in ipairs(plr.Character:GetDescendants()) do
                if v then
                    if v:IsA("Decal") or v:IsA("Texture") or v:IsA("SurfaceAppearance") then
                        v:Destroy()
                    end
                    if v:IsA("Accessory") then
                        v:Destroy()
                    end
                end
            end
        end
    end

    -- clean map
    for _, v in pairs(g:GetDescendants()) do
        if v then
            if v:IsA("Texture") or v:IsA("Decal") or v:IsA("SurfaceAppearance") then v:Destroy() end
            if v:IsA("MeshPart") then
                v.TextureID = ""
                v.Material = Enum.Material.Plastic
                v.CastShadow = false
            end
            if v:IsA("BasePart") then
                v.Material = Enum.Material.Plastic
                v.CastShadow = false
                v.Reflectance = 0
            end
            if v.Name:lower():find("grass") or v.Name:lower():find("tree") or v.Name:lower():find("leaf") or v.Name:lower():find("bush") then
                v:Destroy()
            end
            if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") then
                v:Destroy()
            end
        end
    end

    -- clear light 
    local Lighting = g:GetService("Lighting")
    Lighting.GlobalShadows = false
    for _, L in pairs(Lighting:GetChildren()) do
        if L and (L:IsA("SunRaysEffect") or L:IsA("BloomEffect") or L:IsA("ColorCorrectionEffect") or L:IsA("DepthOfFieldEffect") or L:IsA("BlurEffect")) then
           L:Destroy()
        end
    end
end

-- run 1time load script
OneTimeClean()
print("✓ AntiLag V1 Loaded")

------------------------------------------------------
-- GUI
------------------------------------------------------
local scr = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
scr.ResetOnSpawn = false
scr.Name = "AntiLagV1GUI"

local frame = Instance.new("Frame", scr)
frame.Size = UDim2.new(0, 160, 0, 35) -- thu gọn
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.3
frame.Active = true
frame.Draggable = true

-- FPS Label
local fpsLabel = Instance.new("TextLabel", frame)
fpsLabel.Size = UDim2.new(1, -50, 0, 20)
fpsLabel.Position = UDim2.new(0, 5, 0, 5)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextSize = 16
fpsLabel.TextColor3 = Color3.fromRGB(255,255,255)
fpsLabel.Text = "FPS: ..."

-- bt X (detele GUI)
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(1, -22, 0, 6)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.MouseButton1Click:Connect(function()
    scr:Destroy()
end)

-- bt open ↓ / ↑
local expandBtn = Instance.new("TextButton", frame)
expandBtn.Size = UDim2.new(0, 22, 0, 22)
expandBtn.Position = UDim2.new(1, -45, 0, 6)
expandBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
expandBtn.Text = "↓"
expandBtn.TextColor3 = Color3.new(1,1,1)
expandBtn.TextSize = 18
expandBtn.Font = Enum.Font.SourceSansBold

-- bt Clean (Clean click)
local cleanBtn = Instance.new("TextButton", frame)
cleanBtn.Size = UDim2.new(0, 70, 0, 22)
cleanBtn.Position = UDim2.new(0, 5, 0, 35)
cleanBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
cleanBtn.Text = "Clean"
cleanBtn.TextColor3 = Color3.new(1,1,1)
cleanBtn.TextSize = 16
cleanBtn.Font = Enum.Font.SourceSansBold
cleanBtn.Visible = false -- mặc định ẩn

cleanBtn.MouseButton1Click:Connect(function()
    OneTimeClean()
    print("✓ Cleaned Again")
end)

-- Logic extend 
local expanded = false
expandBtn.MouseButton1Click:Connect(function()
    expanded = not expanded
    if expanded then
        frame.Size = UDim2.new(0, 160, 0, 70)
        cleanBtn.Visible = true
        expandBtn.Text = "↑"
    else
        frame.Size = UDim2.new(0, 160, 0, 35)
        cleanBtn.Visible = false
        expandBtn.Text = "↓"
    end
end)

------------------------------------------------------
-- FPS Color + Rainbow
------------------------------------------------------
local last = tick()
local fps = 0
local rainbowHue = 0

RunService.RenderStepped:Connect(function()
    fps += 1

    if tick() - last >= 1 then
        local F = fps
        fpsLabel.Text = "FPS: "..F

        if F < 20 then
            fpsLabel.TextColor3 = Color3.fromRGB(255, 40, 40)
        elseif F < 35 then
            fpsLabel.TextColor3 = Color3.fromRGB(255, 220, 40)
        elseif F < 120 then
            fpsLabel.TextColor3 = Color3.fromRGB(40, 255, 40)
        else
            rainbowHue += 0.03
            if rainbowHue >= 1 then rainbowHue = 0 end
            fpsLabel.TextColor3 = Color3.fromHSV(rainbowHue, 1, 1)
        end

        last = tick()
        fps = 0
    end
end)
