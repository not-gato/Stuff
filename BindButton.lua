-- if ur gonna use my bindable button please credit! >:(

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local M = {}

local screenGui = player:WaitForChild("PlayerGui"):FindFirstChild("Bind")
if not screenGui then
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "Bind"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = game.CoreGui
end

local bindArea = screenGui:FindFirstChild("BindArea")
if not bindArea then
    bindArea = Instance.new("Frame")
    bindArea.Name = "BindArea"
    bindArea.Size = UDim2.new(0.4,0,0.36,0)
    bindArea.Position = UDim2.new(0.58879,0,0.02086,0)
    bindArea.BackgroundTransparency = 1
    bindArea.BorderSizePixel = 0
    bindArea.Parent = screenGui

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0,10)
    padding.PaddingBottom = UDim.new(0,10)
    padding.PaddingLeft = UDim.new(0,10)
    padding.PaddingRight = UDim.new(0,10)
    padding.Parent = bindArea

    local layout = Instance.new("UIGridLayout")
    layout.CellSize = UDim2.new(0,35,0,35)
    layout.CellPadding = UDim2.new(0,12,0,12)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = bindArea
end

local btlFolder = screenGui:FindFirstChild("BTLButtons")
if not btlFolder then
    btlFolder = Instance.new("Folder")
    btlFolder.Name = "BTLButtons"
    btlFolder.Parent = screenGui
end

local function spinGradient(gradient)
    task.spawn(function()
        local direction = 1
        while gradient.Parent do
            local goal = {Rotation = gradient.Rotation + (180 * direction)}
            local tween = TweenService:Create(gradient, TweenInfo.new(3, Enum.EasingStyle.Linear), goal)
            tween:Play()
            tween.Completed:Wait()
            direction = -direction
        end
    end)
end

function M:CreateBTL(name)
    if not name then return end
    local existing = btlFolder:FindFirstChild(name)
    if existing then existing:Destroy() end

    local button = Instance.new("TextButton")
    button.Name = name
    button.Text = name
    button.TextWrapped = true
    button.TextScaled = false
    button.TextSize = 14
    button.TextColor3 = Color3.fromRGB(255,255,255)
    button.BackgroundColor3 = Color3.fromRGB(0,0,0)
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Size = UDim2.new(0,35,0,35)
    button.FontFace = Font.fromId(12187375422)
    button.Parent = btlFolder
    button.TextTransparency = 1

    local uicorner = Instance.new("UICorner", button)
    uicorner.CornerRadius = UDim.new(0.5,0)

    local uistroke = Instance.new("UIStroke", button)
    uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uistroke.Color = Color3.fromRGB(255,255,255)

    local uigradient = Instance.new("UIGradient")
    uigradient.Rotation = 0
    uigradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,107,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))
    }
    uigradient.Parent = uistroke
    spinGradient(uigradient)

    local clickSound = Instance.new("Sound", button)
    clickSound.SoundId = "rbxassetid://3868133279"
    clickSound.Volume = 1

    local isToggled = false
    local toggledColor = Color3.fromRGB(0,255,0)
    local normalColor = Color3.fromRGB(255,255,255)

    local function updateToggle()
        uistroke.Color = isToggled and toggledColor or normalColor
    end

    button.MouseButton1Click:Connect(function()
        clickSound:Play()
        isToggled = not isToggled
        updateToggle()
    end)

    TweenService:Create(button, TweenInfo.new(0.5), {TextTransparency = 0}):Play()

    return button, function() return isToggled end
end

function M:RemoveBTL(name)
    if not name then return false end
    local button = btlFolder:FindFirstChild(name)
    if button then
        button:Destroy()
        return true
    end
    return false
end

function M:CreateBindable(name, callback)
    if not name then return end
    local existingButton = bindArea:FindFirstChild(name)
    if existingButton then existingButton:Destroy() end

    local button = Instance.new("TextButton")
    button.Name = name
    button.Text = name
    button.TextWrapped = true
    button.TextScaled = false
    button.TextSize = 14
    button.TextColor3 = Color3.fromRGB(255,255,255)
    button.BackgroundColor3 = Color3.fromRGB(0,0,0)
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Size = UDim2.new(0,35,0,35)
    button.FontFace = Font.fromId(12187375422)
    button.Parent = bindArea

    local uicorner = Instance.new("UICorner", button)
    uicorner.CornerRadius = UDim.new(0.5,0)

    local uistroke = Instance.new("UIStroke", button)
    uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uistroke.Color = Color3.fromRGB(255,255,255)

    local uigradient = Instance.new("UIGradient")
    uigradient.Rotation = 0
    uigradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,107,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))
    }
    uigradient.Parent = uistroke
    spinGradient(uigradient)

    local clickSound = Instance.new("Sound", button)
    clickSound.SoundId = "rbxassetid://3868133279"
    clickSound.Volume = 1

    local isToggled = false
    local toggledColor = Color3.fromRGB(0,255,0)
    local normalColor = Color3.fromRGB(255,255,255)

    local function updateToggle()
        uistroke.Color = isToggled and toggledColor or normalColor
    end

    button.MouseButton1Click:Connect(function()
        clickSound:Play()
        isToggled = not isToggled
        updateToggle()
        if callback then callback(isToggled) end
    end)

    return button, function() return isToggled end
end

function M:RemoveBind(name)
    if not name then return false end
    local button = bindArea:FindFirstChild(name)
    if button then
        button:Destroy()
        return true
    end
    return false
end

M.ScreenGui = screenGui
return M
