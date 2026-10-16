-- HussHub Key System - PREMIUM
-- Made by @avongg6

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- ⚠️ CONFIGURARE
-- Key-ul e stocat ca byte array pentru a evita problemele cu caractere speciale
local KEY_BYTES = {97, 55, 51, 64, 102, 100, 98, 54, 52, 226, 130, 172, 38}  -- a73@fdb64€&
local DISCORD_LINK = "https://discord.gg/fRymbb9g"
local PASTEBIN_URL = "https://pastebin.com/raw/m3eQXab5"

-- Funcție de verificare key
local function isValidKey(input)
    if type(input) ~= "string" then return false end
    if #input ~= #KEY_BYTES then return false end
    
    local bytes = {string.byte(input, 1, -1)}
    for i = 1, #KEY_BYTES do
        if bytes[i] ~= KEY_BYTES[i] then
            return false
        end
    end
    return true
end

-- Șterge GUI vechi
if CoreGui:FindFirstChild("HussHub_KeySystem") then
    CoreGui.HussHub_KeySystem:Destroy()
end

-- ============ KEY SYSTEM UI - PREMIUM ============
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "HussHub_KeySystem"
keyGui.ResetOnSpawn = false
keyGui.IgnoreGuiInset = true
keyGui.DisplayOrder = 99999
keyGui.Parent = CoreGui

-- Fundal negru blur
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BackgroundTransparency = 0.4
bg.BorderSizePixel = 0
bg.Parent = keyGui

-- Fereastra principală
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.fromOffset(520, 320)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = bg
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 18)

-- Glow animation
local glowStroke = Instance.new("UIStroke", mainFrame)
glowStroke.Color = Color3.fromRGB(88, 101, 242)
glowStroke.Thickness = 2
glowStroke.Transparency = 0.5

-- Animație glow
task.spawn(function()
    while mainFrame.Parent do
        for i = 0, 1, 0.05 do
            glowStroke.Transparency = 0.5 + (i * 0.3)
            task.wait(0.03)
        end
        for i = 0, 1, 0.05 do
            glowStroke.Transparency = 0.8 - (i * 0.3)
            task.wait(0.03)
        end
    end
end)

-- ============ HEADER ============
local headerFrame = Instance.new("Frame")
headerFrame.Size = UDim2.new(1, -40, 0, 50)
headerFrame.Position = UDim2.new(0, 20, 0, 20)
headerFrame.BackgroundTransparency = 1
headerFrame.Parent = mainFrame

-- Iconiță
local iconBg = Instance.new("Frame")
iconBg.Size = UDim2.fromOffset(36, 36)
iconBg.Position = UDim2.new(0, 0, 0, 7)
iconBg.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
iconBg.BorderSizePixel = 0
iconBg.Parent = headerFrame
Instance.new("UICorner", iconBg).CornerRadius = UDim.new(0, 10)

local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(1, 0, 1, 0)
icon.BackgroundTransparency = 1
icon.Text = "🏛"
icon.TextSize = 20
icon.Font = Enum.Font.GothamBold
icon.TextColor3 = Color3.fromRGB(255, 255, 255)
icon.Parent = iconBg

-- Titlu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -50, 1, 0)
titleLabel.Position = UDim2.new(0, 50, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "HussHub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = headerFrame

-- ============ SUBTITLU ============
local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, -40, 0, 20)
subtitleLabel.Position = UDim2.new(0, 20, 0, 75)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Made by @avongg6"
subtitleLabel.TextColor3 = Color3.fromRGB(130, 130, 140)
subtitleLabel.TextSize = 14
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = mainFrame

-- ============ INPUT KEY ============
local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(1, -40, 0, 50)
inputFrame.Position = UDim2.new(0, 20, 0, 110)
inputFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
inputFrame.BorderSizePixel = 0
inputFrame.Parent = mainFrame
Instance.new("UICorner", inputFrame).CornerRadius = UDim.new(0, 12)

local inputStroke = Instance.new("UIStroke", inputFrame)
inputStroke.Color = Color3.fromRGB(45, 45, 50)
inputStroke.Thickness = 1

-- Iconiță cheie
local keyIcon = Instance.new("TextLabel")
keyIcon.Size = UDim2.fromOffset(30, 30)
keyIcon.Position = UDim2.new(0, 12, 0.5, -15)
keyIcon.BackgroundTransparency = 1
keyIcon.Text = "🔑"
keyIcon.TextSize = 18
keyIcon.Parent = inputFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -60, 1, 0)
keyInput.Position = UDim2.new(0, 50, 0, 0)
keyInput.BackgroundTransparency = 1
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.PlaceholderText = "Enter Key"
keyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
keyInput.Text = ""
keyInput.TextSize = 15
keyInput.Font = Enum.Font.Gotham
keyInput.ClearTextOnFocus = false
keyInput.TextXAlignment = Enum.TextXAlignment.Left
keyInput.Parent = inputFrame

-- ============ BUTOANE ============
-- Exit
local exitBtn = Instance.new("TextButton")
exitBtn.Size = UDim2.fromOffset(110, 50)
exitBtn.Position = UDim2.new(0, 20, 0, 185)
exitBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
exitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
exitBtn.Text = "→  Exit"
exitBtn.TextSize = 14
exitBtn.Font = Enum.Font.GothamBold
exitBtn.BorderSizePixel = 0
exitBtn.Parent = mainFrame
Instance.new("UICorner", exitBtn).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", exitBtn).Color = Color3.fromRGB(45, 45, 50)

-- Get Key
local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.fromOffset(160, 50)
getKeyBtn.Position = UDim2.new(0, 140, 0, 185)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.Text = "🔑  Get Key"
getKeyBtn.TextSize = 14
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Parent = mainFrame
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", getKeyBtn).Color = Color3.fromRGB(45, 45, 50)

-- Submit
local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.fromOffset(170, 50)
submitBtn.Position = UDim2.new(1, -190, 0, 185)
submitBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.Text = "→  Submit"
submitBtn.TextSize = 14
submitBtn.Font = Enum.Font.GothamBold
submitBtn.BorderSizePixel = 0
submitBtn.Parent = mainFrame
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0, 12)

-- Hover effect pe Submit
submitBtn.MouseEnter:Connect(function()
    TweenService:Create(submitBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(108, 121, 255)}):Play()
end)
submitBtn.MouseLeave:Connect(function()
    TweenService:Create(submitBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(88, 101, 242)}):Play()
end)

-- ============ STATUS ============
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -40, 0, 25)
statusLabel.Position = UDim2.new(0, 20, 1, -35)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
statusLabel.TextSize = 12
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = mainFrame

-- ============ DRAGGING ============
local dragging = false
local dragStart, startPos

headerFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

headerFrame.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

headerFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- ============ FUNCȚII ============
local function setStatus(text, color)
    statusLabel.Text = text
    statusLabel.TextColor3 = color or Color3.fromRGB(255, 100, 100)
end

exitBtn.MouseButton1Click:Connect(function()
    keyGui:Destroy()
end)

getKeyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(DISCORD_LINK)
    end)
    setStatus("✅ Discord link copiat! Intră pe server.", Color3.fromRGB(100, 255, 100))
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "HussHub",
            Text = "Discord: discord.gg/fRymbb9g",
            Duration = 4,
        })
    end)
end)

submitBtn.MouseButton1Click:Connect(function()
    local userKey = keyInput.Text
    
    if not userKey or userKey == "" then
        setStatus("❌ Introdu un key mai întâi!", Color3.fromRGB(255, 100, 100))
        return
    end
    
    if isValidKey(userKey) then
        setStatus("✅ Key valid! Se încarcă...", Color3.fromRGB(100, 255, 100))
        submitBtn.Text = "✅ Loading..."
        task.wait(0.4)
        keyGui:Destroy()
        
        local ok, err = pcall(function()
            loadstring(game:HttpGet(PASTEBIN_URL))()
        end)
        
        if not ok then
            warn("[HussHub] Eroare: " .. tostring(err))
        end
    else
        setStatus("❌ Key invalid! Încearcă din nou.", Color3.fromRGB(255, 100, 100))
        -- Shake animation
        local originalPos = mainFrame.Position
        for i = 1, 3 do
            mainFrame.Position = originalPos + UDim2.fromOffset(10, 0)
            task.wait(0.05)
            mainFrame.Position = originalPos - UDim2.fromOffset(10, 0)
            task.wait(0.05)
        end
        mainFrame.Position = originalPos
    end
end)

keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        submitBtn:Activate()
    end
end)

pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "HussHub",
        Text = "Introdu key-ul pentru a continua",
        Duration = 3,
    })
end)
