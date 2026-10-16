-- HussHub Key System - PREMIUM EDITION
-- Made by @avongg6

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- ⚠️ CONFIGURATION
local VALID_KEY = "duh64bdh637"
local DISCORD_LINK = "https://discord.gg/fRymbb9g"
local PASTEBIN_URL = "https://pastebin.com/raw/m3eQXab5"

-- Delete old GUI
if CoreGui:FindFirstChild("HussHub_KeySystem") then
    CoreGui.HussHub_KeySystem:Destroy()
end

-- ============ PREMIUM KEY SYSTEM UI ============
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "HussHub_KeySystem"
keyGui.ResetOnSpawn = false
keyGui.IgnoreGuiInset = true
keyGui.DisplayOrder = 99999
keyGui.Parent = CoreGui

-- Dark blur background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BackgroundTransparency = 0.4
bg.BorderSizePixel = 0
bg.Parent = keyGui

-- Main window
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.fromOffset(540, 340)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = bg
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 20)

-- Animated glow stroke
local glowStroke = Instance.new("UIStroke", mainFrame)
glowStroke.Color = Color3.fromRGB(100, 120, 255)
glowStroke.Thickness = 2
glowStroke.Transparency = 0.4

task.spawn(function()
    while mainFrame.Parent do
        for i = 0, 1, 0.05 do
            glowStroke.Transparency = 0.4 + (i * 0.35)
            task.wait(0.04)
        end
        for i = 0, 1, 0.05 do
            glowStroke.Transparency = 0.75 - (i * 0.35)
            task.wait(0.04)
        end
    end
end)

-- ============ HEADER ============
local headerFrame = Instance.new("Frame")
headerFrame.Size = UDim2.new(1, -40, 0, 55)
headerFrame.Position = UDim2.new(0, 20, 0, 22)
headerFrame.BackgroundTransparency = 1
headerFrame.Parent = mainFrame

-- Icon background
local iconBg = Instance.new("Frame")
iconBg.Size = UDim2.fromOffset(40, 40)
iconBg.Position = UDim2.new(0, 0, 0, 7)
iconBg.BackgroundColor3 = Color3.fromRGB(100, 120, 255)
iconBg.BorderSizePixel = 0
iconBg.Parent = headerFrame
Instance.new("UICorner", iconBg).CornerRadius = UDim.new(0, 12)

local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(1, 0, 1, 0)
icon.BackgroundTransparency = 1
icon.Text = "🏛"
icon.TextSize = 22
icon.Font = Enum.Font.GothamBold
icon.TextColor3 = Color3.fromRGB(255, 255, 255)
icon.Parent = iconBg

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -55, 0, 30)
titleLabel.Position = UDim2.new(0, 55, 0, 2)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "HussHub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 26
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = headerFrame

-- Subtitle (in header)
local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, -55, 0, 20)
subtitleLabel.Position = UDim2.new(0, 55, 0, 30)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Premium Script Hub"
subtitleLabel.TextColor3 = Color3.fromRGB(120, 120, 140)
subtitleLabel.TextSize = 12
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = headerFrame

-- ============ DIVIDER ============
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -40, 0, 1)
divider.Position = UDim2.new(0, 20, 0, 92)
divider.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
divider.BorderSizePixel = 0
divider.Parent = mainFrame

-- ============ GREETING ============
local greetingLabel = Instance.new("TextLabel")
greetingLabel.Size = UDim2.new(1, -40, 0, 20)
greetingLabel.Position = UDim2.new(0, 20, 0, 105)
greetingLabel.BackgroundTransparency = 1
greetingLabel.Text = "Hi, welcome to HussHub!"
greetingLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
greetingLabel.TextSize = 13
greetingLabel.Font = Enum.Font.Gotham
greetingLabel.TextXAlignment = Enum.TextXAlignment.Left
greetingLabel.Parent = mainFrame

-- ============ KEY INPUT ============
local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(1, -40, 0, 52)
inputFrame.Position = UDim2.new(0, 20, 0, 135)
inputFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
inputFrame.BorderSizePixel = 0
inputFrame.Parent = mainFrame
Instance.new("UICorner", inputFrame).CornerRadius = UDim.new(0, 12)

local inputStroke = Instance.new("UIStroke", inputFrame)
inputStroke.Color = Color3.fromRGB(50, 50, 58)
inputStroke.Thickness = 1

-- Key icon
local keyIcon = Instance.new("TextLabel")
keyIcon.Size = UDim2.fromOffset(30, 30)
keyIcon.Position = UDim2.new(0, 14, 0.5, -15)
keyIcon.BackgroundTransparency = 1
keyIcon.Text = "🔑"
keyIcon.TextSize = 18
keyIcon.Parent = inputFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -65, 1, 0)
keyInput.Position = UDim2.new(0, 50, 0, 0)
keyInput.BackgroundTransparency = 1
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.PlaceholderText = "Enter Key"
keyInput.PlaceholderColor3 = Color3.fromRGB(90, 90, 100)
keyInput.Text = ""
keyInput.TextSize = 15
keyInput.Font = Enum.Font.Gotham
keyInput.ClearTextOnFocus = false
keyInput.TextXAlignment = Enum.TextXAlignment.Left
keyInput.Parent = inputFrame

-- ============ BUTTONS ============
-- Exit
local exitBtn = Instance.new("TextButton")
exitBtn.Size = UDim2.fromOffset(115, 52)
exitBtn.Position = UDim2.new(0, 20, 0, 200)
exitBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
exitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
exitBtn.Text = "→  Exit"
exitBtn.TextSize = 14
exitBtn.Font = Enum.Font.GothamBold
exitBtn.BorderSizePixel = 0
exitBtn.Parent = mainFrame
Instance.new("UICorner", exitBtn).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", exitBtn).Color = Color3.fromRGB(50, 50, 58)

-- Get Key
local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.fromOffset(170, 52)
getKeyBtn.Position = UDim2.new(0, 145, 0, 200)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.Text = "🔑  Get Key"
getKeyBtn.TextSize = 14
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Parent = mainFrame
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", getKeyBtn).Color = Color3.fromRGB(50, 50, 58)

-- Submit
local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.fromOffset(180, 52)
submitBtn.Position = UDim2.new(1, -200, 0, 200)
submitBtn.BackgroundColor3 = Color3.fromRGB(100, 120, 255)
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.Text = "→  Submit"
submitBtn.TextSize = 14
submitBtn.Font = Enum.Font.GothamBold
submitBtn.BorderSizePixel = 0
submitBtn.Parent = mainFrame
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0, 12)

-- Hover effect
submitBtn.MouseEnter:Connect(function()
    TweenService:Create(submitBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(120, 140, 255)}):Play()
end)
submitBtn.MouseLeave:Connect(function()
    TweenService:Create(submitBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(100, 120, 255)}):Play()
end)

exitBtn.MouseEnter:Connect(function()
    TweenService:Create(exitBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(28, 28, 34)}):Play()
end)
exitBtn.MouseLeave:Connect(function()
    TweenService:Create(exitBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(18, 18, 22)}):Play()
end)

getKeyBtn.MouseEnter:Connect(function()
    TweenService:Create(getKeyBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(28, 28, 34)}):Play()
end)
getKeyBtn.MouseLeave:Connect(function()
    TweenService:Create(getKeyBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(18, 18, 22)}):Play()
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

-- ============ FOOTER ============
local footerLabel = Instance.new("TextLabel")
footerLabel.Size = UDim2.new(1, -40, 0, 20)
footerLabel.Position = UDim2.new(0, 20, 1, -18)
footerLabel.BackgroundTransparency = 1
footerLabel.Text = "Made by @avongg6  •  discord.gg/fRymbb9g"
footerLabel.TextColor3 = Color3.fromRGB(80, 80, 90)
footerLabel.TextSize = 11
footerLabel.Font = Enum.Font.Gotham
footerLabel.TextXAlignment = Enum.TextXAlignment.Center
footerLabel.Parent = mainFrame

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

-- ============ FUNCTIONS ============
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
    setStatus("✅ Discord link copied!", Color3.fromRGB(100, 255, 100))
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
        setStatus("❌ Please enter a key first!", Color3.fromRGB(255, 100, 100))
        return
    end
    
    if userKey == VALID_KEY then
        setStatus("✅ Valid key! Loading...", Color3.fromRGB(100, 255, 100))
        submitBtn.Text = "✅ Loading..."
        task.wait(0.4)
        keyGui:Destroy()
        
        local ok, err = pcall(function()
            loadstring(game:HttpGet(PASTEBIN_URL))()
        end)
        
        if not ok then
            warn("[HussHub] Error: " .. tostring(err))
        end
    else
        setStatus("❌ Invalid key! Try again.", Color3.fromRGB(255, 100, 100))
        -- Shake animation
        local originalPos = mainFrame.Position
        for i = 1, 3 do
            mainFrame.Position = originalPos + UDim2.fromOffset(12, 0)
            task.wait(0.04)
            mainFrame.Position = originalPos - UDim2.fromOffset(12, 0)
            task.wait(0.04)
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
        Text = "Enter your key to continue",
        Duration = 3,
    })
end)
