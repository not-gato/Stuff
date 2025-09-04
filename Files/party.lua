local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")

local function getMurderer()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            for _, tool in ipairs(char:GetChildren()) do
                if tool:IsA("Tool") and tool.Name:lower():find("knife") then
                    return player
                end
            end
            if player:FindFirstChild("Backpack") then
                for _, tool in ipairs(player.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool.Name:lower():find("knife") then
                        return player
                    end
                end
            end
        end
    end
    return nil
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 200, 0, 50)
Button.Position = UDim2.new(0.5, -100, 0.9, -25)
Button.Text = "Shoot Murderer"
Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Parent = ScreenGui

local dragging, dragInput, dragStart, startPos
Button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Button.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Button.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

Button.MouseButton1Click:Connect(function()
    local murderer = getMurderer()
    if murderer and murderer.Character then
        local torso = murderer.Character:FindFirstChild("HumanoidRootPart") or murderer.Character:FindFirstChild("UpperTorso")
        if torso then
            local originalCFrame = Camera.CFrame
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, torso.Position)

            local gun = LocalPlayer.Backpack:FindFirstChild("Gun") or LocalPlayer.Character:FindFirstChild("Gun")
            if gun then
                gun.Parent = LocalPlayer.Character
                task.spawn(function()
                    local args = {0, torso.Position, "AH2"}
                    if gun:FindFirstChild("KnifeLocal") and gun.KnifeLocal:FindFirstChild("CreateBeam") and gun.KnifeLocal.CreateBeam:FindFirstChild("RemoteFunction") then
                        gun.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(unpack(args))
                    end
                end)
            end

            task.delay(0.2, function()
                Camera.CFrame = originalCFrame
            end)
        end
    end
end)
