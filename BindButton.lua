-- BindModule.lua
local M = {}
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- Main GUI container
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

-- Continuously spin a UIGradient
local function spinGradient(gradient)
    task.spawn(function()
        local direction = 1
        while gradient and gradient.Parent do
            local goal = {Rotation = gradient.Rotation + (180 * direction)}
            local tween = TweenService:Create(gradient, TweenInfo.new(3, Enum.EasingStyle.Linear), goal)
            tween:Play()
            tween.Completed:Wait()
            direction = -direction
        end
    end)
end

-- Ripple/wave effect for a button at an absolute click position
local function playRipple(button, absClickPos)
    -- Calculate local coords inside button
    local absPos = button.AbsolutePosition
    local absSize = button.AbsoluteSize
    local localX = absClickPos.X - absPos.X
    local localY = absClickPos.Y - absPos.Y

    local ripple = Instance.new("Frame")
    ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    ripple.Position = UDim2.new(0, localX, 0, localY)
    ripple.Size = UDim2.new(0, 0, 0, 0)
    ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ripple.BackgroundTransparency = 0.65
    ripple.BorderSizePixel = 0
    ripple.ZIndex = button.ZIndex + 5
    ripple.Parent = button

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0) -- circular
    corner.Parent = ripple

    -- Calculate target diameter (large enough to cover button)
    local diameter = math.max(absSize.X, absSize.Y) * 2.2
    local sizeGoal = UDim2.new(0, diameter, 0, diameter)

    local tween1 = TweenService:Create(ripple, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = sizeGoal, BackgroundTransparency = 0.85})
    local tween2 = TweenService:Create(ripple, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {BackgroundTransparency = 1})

    tween1:Play()
    tween1.Completed:Wait()
    tween2:Play()
    tween2.Completed:Wait()

    ripple:Destroy()
end

-- Helper to create a floating clone used while dragging so the original stays in the layout
local function createFloatingClone(original)
    local clone = original:Clone()
    clone.Parent = screenGui
    -- ensure clone does not get managed by layout
    if clone:FindFirstChildOfClass("UIGridLayout") then
        -- won't happen for a button, just safe-guard
    end
    -- anchor center for easier positioning while dragging
    clone.AnchorPoint = Vector2.new(0.5, 0.5)
    -- make clone not participate in automatic layout
    clone.LayoutOrder = 0
    -- ensure visible
    clone.Visible = true
    return clone
end

-- Core function to create bindable (draggable + ripple + spin + sound + callback)
function M:CreateBindable(name, callback)
    local button = Instance.new("TextButton")
    button.Name = name or "Unknown"
    button.Text = name or "Bindable"
    button.TextWrapped = true
    button.TextScaled = true
    button.TextSize = 14
    button.TextColor3 = Color3.fromRGB(255,255,255)
    button.BackgroundColor3 = Color3.fromRGB(0,0,0)
    button.BackgroundTransparency = 0.7
    button.BorderSizePixel = 0
    button.Size = UDim2.new(0, 35, 0, 35)
    button.Parent = bindArea
    button.ZIndex = 2
    button.AutoButtonColor = false -- keep visuals consistent

    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0.5, 0)
    uicorner.Parent = button

    local uistroke = Instance.new("UIStroke")
    uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uistroke.Color = Color3.fromRGB(255, 255, 255)
    uistroke.Parent = button

    -- Gradient applied to button (so it shows even with transparency)
    local uigradient = Instance.new("UIGradient")
    uigradient.Rotation = 0
    uigradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,107,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))
    }
    uigradient.Parent = button
    spinGradient(uigradient)

    local clickSound = Instance.new("Sound")
    clickSound.SoundId = "rbxassetid://3868133279"
    clickSound.Volume = 1
    clickSound.Parent = button

    -- Dragging logic (press+move -> clone follows cursor; small press without move = click)
    do
        local dragging = false
        local dragInput = nil
        local dragStart = nil
        local dragClone = nil
        local inputMoved = false
        local threshold = 6 -- pixels to move before starting drag
        local startMousePos = nil

        -- Keep a connection to update clone each frame when dragging (safe & smooth)
        local connRender = nil

        local function startDrag(mousePos)
            dragging = true
            inputMoved = true
            -- create a floating clone
            dragClone = createFloatingClone(button)
            -- try to set clone size in pixels to match visual; use AbsoluteSize if available
            -- anchor is center, place at mouse
            -- Wait a frame so AbsoluteSize is accurate
            RunService.Heartbeat:Wait()
            local halfW = dragClone.AbsoluteSize.X/2
            local halfH = dragClone.AbsoluteSize.Y/2
            dragClone.Position = UDim2.new(0, mousePos.X - halfW, 0, mousePos.Y - halfH)
            dragClone.ZIndex = button.ZIndex + 10
            -- hide original while dragging
            button.Visible = false

            -- update each frame to follow mouse smoothly
            connRender = RunService.RenderStepped:Connect(function()
                local mouse = UserInputService:GetMouseLocation()
                local x = mouse.X
                local y = mouse.Y
                local hw = dragClone.AbsoluteSize.X/2
                local hh = dragClone.AbsoluteSize.Y/2
                dragClone.Position = UDim2.new(0, x - hw, 0, y - hh)
            end)
        end

        local function endDrag()
            if connRender then
                connRender:Disconnect()
                connRender = nil
            end
            if dragClone then
                dragClone:Destroy()
                dragClone = nil
            end
            dragging = false
            dragInput = nil
            dragStart = nil
            inputMoved = false
            -- show original again
            button.Visible = true
        end

        button.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragInput = input
                startMousePos = input.Position
                dragStart = startMousePos
                inputMoved = false
                -- we'll decide whether it's a click or drag on InputChanged
            end
        end)

        -- InputChanged fires for MouseMovement while holding mouse
        UserInputService.InputChanged:Connect(function(input)
            if not dragInput then return end
            if input ~= dragInput and input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
            local current = input.Position
            if not current or not dragStart then return end
            local diff = (current - dragStart).magnitude
            if (not inputMoved) and diff >= threshold then
                -- start dragging
                startDrag(current)
            end
        end)

        -- If InputEnded for the recorded dragInput, decide whether click or drag end
        UserInputService.InputEnded:Connect(function(input)
            if not dragInput then return end
            if input ~= dragInput then return end

            local releasePos = input.Position or UserInputService:GetMouseLocation()
            if dragging then
                -- we were dragging -> stop and restore
                endDrag()
                dragInput = nil
                -- don't trigger click callback when finishing a drag
                return
            end

            -- Not dragging: this was a click (short press)
            -- Play click sound, ripple, and run callback
            clickSound:Play()
            -- Play ripple centered where user clicked
            if releasePos then
                playRipple(button, releasePos)
            else
                -- fallback: center
                playRipple(button, button.AbsolutePosition + button.AbsoluteSize/2)
            end

            -- Run callback safely
            if callback then
                -- protect in pcall just in case
                local ok, err = pcall(callback)
                if not ok then
                    warn(("Bind callback error for '%s': %s"):format(button.Name, tostring(err)))
                end
            end

            dragInput = nil
        end)
    end

    -- Also provide a MouseButton1Click fallback if the platform doesn't emit InputEnded reliably
    -- (this ensures simple clicks still work on touch or other edge-cases)
    button.MouseButton1Click:Connect(function()
        -- play sound & ripple and call callback (this will run in addition to InputEnded in some cases,
        -- but using InputEnded above is the primary click path; this helps on touch devices)
        clickSound:Play()
        -- place ripple at center as we may not have a precise position here
        playRipple(button, button.AbsolutePosition + button.AbsoluteSize/2)
        if callback then
            local ok, err = pcall(callback)
            if not ok then
                warn(("Bind callback error for '%s': %s"):format(button.Name, tostring(err)))
            end
        end
    end)

    return button
end

M.ScreenGui = screenGui
return M
