local M = {}
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Bind"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player:WaitForChild("PlayerGui")

local bindArea = Instance.new("Frame")
bindArea.Name = "BindArea"
bindArea.BorderSizePixel = 0
bindArea.BackgroundTransparency = 1
bindArea.Size = UDim2.new(0.4, 0, 0.36, 0)
bindArea.Position = UDim2.new(0.58879, 0, 0.02086, 0)
bindArea.Parent = screenGui

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 10)
padding.PaddingBottom = UDim.new(0, 10)
padding.PaddingLeft = UDim.new(0, 10)
padding.PaddingRight = UDim.new(0, 10)
padding.Parent = bindArea

local layout = Instance.new("UIGridLayout")
layout.CellSize = UDim2.new(0, 35, 0, 35) -- smaller buttons
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.CellPadding = UDim2.new(0, 12, 0, 12) -- more spacing
layout.Parent = bindArea

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

function M:CreateBindable(name, callback)
    local button = Instance.new("TextButton")
    button.Name = name or "Unknown"
    button.Text = name or "Bindable Button"
    button.TextWrapped = true
    button.TextScaled = true
    button.TextSize = 14
    button.TextColor3 = Color3.fromRGB(255,255,255)
    button.BackgroundColor3 = Color3.fromRGB(0,0,0)
    button.BackgroundTransparency = 0.7
    button.BorderSizePixel = 0
    button.Size = UDim2.new(0, 35, 0, 35)
    button.Parent = bindArea

    local uicorner = Instance.new("UICorner", button)
    uicorner.CornerRadius = UDim.new(0.5, 0)

    local uistroke = Instance.new("UIStroke", button)
    uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uistroke.Color = Color3.fromRGB(255, 255, 255)

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

    if callback then
        button.MouseButton1Click:Connect(function()
            clickSound:Play()
            callback()
        end)
    else
        button.MouseButton1Click:Connect(function()
            clickSound:Play()
        end)
    end

    return button
end

M.ScreenGui = screenGui
return M
