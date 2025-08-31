local M = {}
local Players = game:GetService("Players")
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
padding.PaddingTop = UDim.new(0, 5)
padding.PaddingBottom = UDim.new(0, 5)
padding.PaddingLeft = UDim.new(0, 5)
padding.PaddingRight = UDim.new(0, 5)
padding.Parent = bindArea

local layout = Instance.new("UIGridLayout")
layout.CellSize = UDim2.new(0, 60, 0, 60) -- each button still a circle
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.CellPadding = UDim2.new(0, 5, 0, 5)
layout.Parent = bindArea

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
    button.Size = UDim2.new(0, 60, 0, 60)
    button.Parent = bindArea

    local uicorner = Instance.new("UICorner", button)
    uicorner.CornerRadius = UDim.new(0.5, 0)

    local uistroke = Instance.new("UIStroke", button)
    uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uistroke.Color = Color3.fromRGB(255, 255, 255)

    local uigradient = Instance.new("UIGradient")
    uigradient.Rotation = 45
    uigradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,107,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))
    }
    uigradient.Parent = uistroke

    if callback then
        button.MouseButton1Click:Connect(callback)
    end

    return button
end

M.ScreenGui = screenGui
return M
