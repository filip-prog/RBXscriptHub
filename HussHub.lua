-- HussHub Key System
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")

local VALID_KEY = "a73@fdb64€&"
local DISCORD_LINK = "https://discord.gg/fRymbb9g"
local PASTEBIN_URL = "https://pastebin.com/raw/m3eQXab5"

if CoreGui:FindFirstChild("HussHub_KeySystem") then
    CoreGui.HussHub_KeySystem:Destroy()
end

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "HussHub_KeySystem"
keyGui.ResetOnSpawn = false
keyGui.IgnoreGuiInset = true
keyGui.DisplayOrder = 99999
keyGui.Parent = CoreGui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BorderSizePixel = 0
bg.Parent = keyGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.fromOffset(420, 420)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = bg
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", mainFrame)
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 1

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0, 20)
title.BackgroundTransparency = 1
title.Text = "HussHub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 42
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 25)
subtitle.Position = UDim2.new(0, 0, 0, 75)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Key System"
subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
subtitle.TextSize = 16
subtitle.Font = Enum.Font.Gotham
subtitle.Parent = mainFrame

local instructions = Instance.new("TextLabel")
instructions.Size = UDim2.new(1, -40, 0, 70)
instructions.Position = UDim2.new(0, 20, 0, 110)
instructions.BackgroundTransparency = 1
instructions.Text = "1. Apasă butonul de mai jos\n2. Intră pe Discord\n3. Găsește key-ul în #keys\n4. Lipește-l mai jos și apasă Submit"
instructions.TextColor3 = Color3.fromRGB(200, 200, 200)
instructions.TextSize = 13
instructions.Font = Enum.Font.Gotham
instructions.TextWrapped = true
instructions.TextXAlignment = Enum.TextXAlignment.Left
instructions.TextYAlignment = Enum.TextYAlignment.Top
instructions.Parent = mainFrame

local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.new(1, -40, 0, 45)
getKeyBtn.Position = UDim2.new(0, 20, 0, 190)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.Text = "📋 Copy Discord Link"
getKeyBtn.TextSize = 15
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Parent = mainFrame
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 8)

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -40, 0, 45)
keyInput.Position = UDim2.new(0, 20, 0, 250)
keyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.PlaceholderText = "Paste your key here..."
keyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
keyInput.Text = ""
keyInput.TextSize = 14
keyInput.Font = Enum.Font.Gotham
keyInput.BorderSizePixel = 0
keyInput.ClearTextOnFocus = false
keyInput.Parent = mainFrame
Instance.new("UICorner", keyInput).CornerRadius = UDim.new(0, 8)

local inputStroke = Instance.new("UIStroke", keyInput)
inputStroke.Color = Color3.fromRGB(60, 60, 60)
inputStroke.Thickness = 1

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(1, -40, 0, 45)
submitBtn.Position = UDim2.new(0, 20, 0, 310)
submitBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 80)
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.Text = "✅ Submit Key"
submitBtn.TextSize = 15
submitBtn.Font = Enum.Font.GothamBold
submitBtn.BorderSizePixel = 0
submitBtn.Parent = mainFrame
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0, 8)

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -40, 0, 30)
statusLabel.Position = UDim2.new(0, 20, 0, 370)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
statusLabel.TextSize = 13
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = mainFrame

local function setStatus(text, color)
    statusLabel.Text = text
    statusLabel.TextColor3 = color or Color3.fromRGB(255, 100, 100)
end

getKeyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(DISCORD_LINK)
    end)
    setStatus("✅ Discord link copiat!", Color3.fromRGB(100, 255, 100))
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "HussHub Key",
            Text = "Discord link copiat!",
            Duration = 5,
        })
    end)
end)

submitBtn.MouseButton1Click:Connect(function()
    local userKey = keyInput.Text
    
    if not userKey or userKey == "" then
        setStatus("❌ Introdu un key mai întâi!", Color3.fromRGB(255, 100, 100))
        return
    end
    
    if userKey == VALID_KEY then
        setStatus("✅ Key valid! Se încarcă HussHub...", Color3.fromRGB(100, 255, 100))
        task.wait(0.5)
        keyGui:Destroy()
        
        local ok, err = pcall(function()
            loadstring(game:HttpGet(PASTEBIN_URL))()
        end)
        
        if not ok then
            warn("[HussHub] Eroare: " .. tostring(err))
        end
    else
        setStatus("❌ Key invalid! Încearcă din nou.", Color3.fromRGB(255, 100, 100))
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
