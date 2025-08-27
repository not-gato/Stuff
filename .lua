-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local ItemsFolder = workspace:WaitForChild("Items")

-- ESP storage
local ESPs = {}
local SelectedItems = {}

-- Dominant color
local function GetDominantColor(model)
    local colorCount = {}
    for _, part in ipairs(model:GetDescendants()) do
        if part:IsA("BasePart") then
            local key = tostring(part.Color)
            colorCount[key] = (colorCount[key] or 0) + 1
        end
    end
    local dominantColor = Color3.new(1,1,1)
    local maxCount = 0
    for colorKey, count in pairs(colorCount) do
        if count > maxCount then
            maxCount = count
            local r,g,b = colorKey:match("(%d+%.?%d*), (%d+%.?%d*), (%d+%.?%d*)")
            dominantColor = Color3.new(tonumber(r), tonumber(g), tonumber(b))
        end
    end
    return dominantColor
end

-- ESP functions
local function AddESPForModel(model)
    if ESPs[model] then return end
    if not model.Parent then return end
    local part = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
    if not part then return end

    local color = GetDominantColor(model)
    local text = Drawing.new("Text")
    text.Text = model.Name
    text.Size = 18
    text.Color = color
    text.Center = true
    text.Outline = true
    text.OutlineColor = Color3.new(0,0,0)

    local line = Drawing.new("Line")
    line.Color = color
    line.Thickness = 2

    ESPs[model] = {Text=text, Line=line}

    -- Remove ESP automatically if model is deleted
    model.AncestryChanged:Connect(function(_, parent)
        if not parent then
            if ESPs[model] then
                ESPs[model].Text:Remove()
                ESPs[model].Line:Remove()
                ESPs[model] = nil
            end
        end
    end)
end

local function RemoveESPForModel(model)
    if ESPs[model] then
        ESPs[model].Text:Remove()
        ESPs[model].Line:Remove()
        ESPs[model] = nil
    end
end

local function AddESPForName(name)
    for _, model in ipairs(ItemsFolder:GetChildren()) do
        if model:IsA("Model") and model.Name == name then
            AddESPForModel(model)
        end
    end
end

local function RemoveESPForName(name)
    for _, model in ipairs(ItemsFolder:GetChildren()) do
        if model:IsA("Model") and model.Name == name then
            RemoveESPForModel(model)
        end
    end
end

-- GUI
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
ScreenGui.IgnoreGuiInset = true

-- Main frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 280, 0, 360)
Frame.Position = UDim2.new(0, 20, 0, 50)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,40)
Title.Position = UDim2.new(0,0,0,0)
Title.BackgroundColor3 = Color3.fromRGB(50,50,50)
Title.Text = "Select Items"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22

-- Collapse button
local CollapseBtn = Instance.new("TextButton", Frame)
CollapseBtn.Size = UDim2.new(0,30,0,30)
CollapseBtn.Position = UDim2.new(1,-35,0,5)
CollapseBtn.Text = "-"
CollapseBtn.TextColor3 = Color3.new(1,1,1)
CollapseBtn.Font = Enum.Font.GothamBold
CollapseBtn.TextSize = 24
CollapseBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
CollapseBtn.BorderSizePixel = 0

local collapsed = false
CollapseBtn.MouseButton1Click:Connect(function()
    collapsed = not collapsed
    local targetSize = collapsed and UDim2.new(0, 280, 0, 45) or UDim2.new(0, 280, 0, 360)
    TweenService:Create(Frame, TweenInfo.new(0.25), {Size = targetSize}):Play()
end)

-- Dropdown button
local DropBtn = Instance.new("TextButton", Frame)
DropBtn.Size = UDim2.new(1,0,0,40)
DropBtn.Position = UDim2.new(0,0,0,40)
DropBtn.Text = "▼ Tap to select"
DropBtn.TextColor3 = Color3.new(1,1,1)
DropBtn.Font = Enum.Font.Gotham
DropBtn.TextSize = 20
DropBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
DropBtn.BorderSizePixel = 0

-- ScrollFrame for dropdown
local DropFrame = Instance.new("ScrollingFrame", Frame)
DropFrame.Position = UDim2.new(0,0,0,80)
DropFrame.Size = UDim2.new(1,0,0,0) -- starts closed
DropFrame.CanvasSize = UDim2.new(0,0,0,0)
DropFrame.ScrollBarThickness = 12
DropFrame.BackgroundColor3 = Color3.fromRGB(45,45,45)
DropFrame.BorderSizePixel = 0
DropFrame.ClipsDescendants = true

local UIListLayout = Instance.new("UIListLayout", DropFrame)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0,4)

-- Toggle dropdown
local open = false
DropBtn.MouseButton1Click:Connect(function()
    open = not open
    local targetSize = open and UDim2.new(1,0,0,200) or UDim2.new(1,0,0,0)
    TweenService:Create(DropFrame, TweenInfo.new(0.25), {Size = targetSize}):Play()
end)

-- Teleport button
local TeleportBtn = Instance.new("TextButton", Frame)
TeleportBtn.Size = UDim2.new(1,0,0,40)
TeleportBtn.Position = UDim2.new(0,0,0,280)
TeleportBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
TeleportBtn.TextColor3 = Color3.new(1,1,1)
TeleportBtn.Font = Enum.Font.GothamBold
TeleportBtn.TextSize = 20
TeleportBtn.Text = "Teleport to random selected item"
TeleportBtn.BorderSizePixel = 0

TeleportBtn.MouseButton1Click:Connect(function()
    local selectedModels = {}
    for name,_ in pairs(SelectedItems) do
        for _, model in ipairs(ItemsFolder:GetChildren()) do
            if model:IsA("Model") and model.Name == name then
                table.insert(selectedModels, model)
            end
        end
    end
    if #selectedModels > 0 and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local randModel = selectedModels[math.random(1,#selectedModels)]
        local targetPart = randModel.PrimaryPart or randModel:FindFirstChildWhichIsA("BasePart")
        if targetPart then
            LocalPlayer.Character.HumanoidRootPart.CFrame = targetPart.CFrame + Vector3.new(0,3,0)
        end
    end
end)

-- Refresh dropdown items every 1s
local function RefreshDropdown()
    local existingSelections = {}
    for name,_ in pairs(SelectedItems) do
        existingSelections[name] = true
    end

    -- Clear old buttons
    for _, child in ipairs(DropFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    -- Add unique items
    local UniqueNames = {}
    for _, model in ipairs(ItemsFolder:GetChildren()) do
        if model:IsA("Model") and not UniqueNames[model.Name] then
            UniqueNames[model.Name] = true

            local btn = Instance.new("TextButton", DropFrame)
            btn.Size = UDim2.new(1,0,0,35)
            btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
            btn.TextColor3 = Color3.new(1,1,1)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 18
            btn.Text = model.Name
            btn.AutoButtonColor = false

            local check = Instance.new("TextLabel", btn)
            check.Size = UDim2.new(0,25,0,25)
            check.Position = UDim2.new(1,-30,0,5)
            check.BackgroundTransparency = 1
            check.TextColor3 = Color3.fromRGB(0,255,0)
            check.Text = existingSelections[model.Name] and "✓" or ""
            check.Font = Enum.Font.GothamBold
            check.TextSize = 24

            local selected = existingSelections[model.Name] or false
            btn.MouseButton1Click:Connect(function()
                selected = not selected
                if selected then
                    check.Text = "✓"
                    SelectedItems[model.Name] = true
                    AddESPForName(model.Name)
                else
                    check.Text = ""
                    SelectedItems[model.Name] = nil
                    RemoveESPForName(model.Name)
                end
            end)
        end
    end

    DropFrame.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y)
end

spawn(function()
    while true do
        RefreshDropdown()
        wait(1)
    end
end)

-- Update ESP
RunService.RenderStepped:Connect(function()
    for model, visuals in pairs(ESPs) do
        local part = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
        if part then
            local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local distance = hrp and (hrp.Position - part.Position).Magnitude or 0
            visuals.Text.Text = model.Name.." | "..math.floor(distance)

            if onScreen then
                visuals.Text.Position = Vector2.new(screenPos.X, screenPos.Y-20)
                visuals.Text.Visible = true
                visuals.Line.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                visuals.Line.To = Vector2.new(screenPos.X, screenPos.Y)
                visuals.Line.Visible = true
            else
                visuals.Text.Visible = false
                visuals.Line.Visible = false
            end
        end
    end
end)
