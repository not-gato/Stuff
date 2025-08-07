-- before you start saying anything; yes, this is AI Generated

local HbYr4DimTR = game:GetService("Players")
local KjXp8FnqWS = game:GetService("ReplicatedStorage")
local MvZt2GkrYU = game:GetService("UserInputService")
local PwAq6JlsZV = game:GetService("RunService")
local RxBn9MptAW = game:GetService("TweenService")
local TyCo3NquBX = game:GetService("Lighting")
local VzDp7OrvCY = game:GetService("CoreGui")
local XaEq1PswDZ = game:GetService("SoundService")

local BbFr5EtxEA = HbYr4DimTR.LocalPlayer

local DcGs8HuyFB = workspace:WaitForChild("Map"):WaitForChild("Assets")
local FeHt2IvzGC = "Super Cool Bookshelf With Hint Book"

local GfIu6JwAHD = {}
local HgJv9KxBIE = nil
local IhKw3LyCJF = 1
local JiLx7MzDKG = {}
local KjMy1NaELH = nil
local LkNz5ObFMI = 16
local MlOa9PcGNJ = false
local NmPb3QdHOK = false

local OnQc7ReIPL = {
    Brightness = TyCo3NquBX.Brightness,
    Ambient = TyCo3NquBX.Ambient,
    ColorShift_Bottom = TyCo3NquBX.ColorShift_Bottom,
    ColorShift_Top = TyCo3NquBX.ColorShift_Top,
    OutdoorAmbient = TyCo3NquBX.OutdoorAmbient,
    ShadowSoftness = TyCo3NquBX.ShadowSoftness
}

local PoRd1SfJQM = nil

local ButtonPressTween = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local ButtonReleaseTween = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local UIAppearTween = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local ElasticTween = TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
local PageTransitionTween = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

local UtWi1XkOVR = {
    CFrame.new(
        -53.4432106, 14.2561035, 40.7111435,
        0.856820285, 7.64594255e-09, -0.515615106,
        -7.48528883e-09, 1, 2.39014608e-09,
        0.515615106, 1.81160231e-09, 0.856820285
    ),
    CFrame.new(
        54.5029144, 14.2513294, 43.7026443,
        0.940911651, 1.41327362e-07, -0.338652134,
        -1.34159876e-07, 1, 4.45730777e-08,
        0.338652134, 3.49420026e-09, 0.940911651
    )
}

local VuXj5YlPWS = Instance.new("ScreenGui")
VuXj5YlPWS.Name = "NotificationGui"
VuXj5YlPWS.ResetOnSpawn = false
VuXj5YlPWS.Parent = VzDp7OrvCY

local function WvYk9ZmQXT(XwZl3AnRYU)
    local YxAm7BoSZV = Instance.new("Sound")
    YxAm7BoSZV.SoundId = "rbxassetid://" .. XwZl3AnRYU
    YxAm7BoSZV.Volume = 0.5
    YxAm7BoSZV.Parent = XaEq1PswDZ
    YxAm7BoSZV:Play()
    
    YxAm7BoSZV.Ended:Connect(function()
        YxAm7BoSZV:Destroy()
    end)
end

local function ZyBn1CpTAW(AzCo5DqUBX, BaDp9ErVCY)
    WvYk9ZmQXT("17582299860")
    
    local CbEq3FsWDZ = Instance.new("Frame")
    CbEq3FsWDZ.Size = UDim2.new(0, 300, 0, 60)
    CbEq3FsWDZ.Position = UDim2.new(1, 10, 0, 10 + (#JiLx7MzDKG * 70))
    CbEq3FsWDZ.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    CbEq3FsWDZ.BorderSizePixel = 0
    CbEq3FsWDZ.BackgroundTransparency = 1
    CbEq3FsWDZ.Parent = VuXj5YlPWS
    
    RxBn9MptAW:Create(CbEq3FsWDZ, UIAppearTween, {
        BackgroundTransparency = 0
    }):Play()
    
    local DcFr7GtXEA = Instance.new("UICorner")
    DcFr7GtXEA.CornerRadius = UDim.new(0, 10)
    DcFr7GtXEA.Parent = CbEq3FsWDZ
    
    local EdGs1HuYFB = Instance.new("UIStroke")
    EdGs1HuYFB.Color = Color3.fromRGB(138, 43, 226)
    EdGs1HuYFB.Thickness = 2
    EdGs1HuYFB.Parent = CbEq3FsWDZ
    
    local FeHt5IvZGC = Instance.new("TextLabel")
    FeHt5IvZGC.Size = UDim2.new(0, 40, 1, 0)
    FeHt5IvZGC.Position = UDim2.new(0, 0, 0, 0)
    FeHt5IvZGC.BackgroundTransparency = 1
    FeHt5IvZGC.Text = "!"
    FeHt5IvZGC.TextColor3 = Color3.fromRGB(138, 43, 226)
    FeHt5IvZGC.TextSize = 24
    FeHt5IvZGC.Font = Enum.Font.SourceSansBold
    FeHt5IvZGC.TextTransparency = 1
    FeHt5IvZGC.Parent = CbEq3FsWDZ
    
    RxBn9MptAW:Create(FeHt5IvZGC, TweenInfo.new(0.4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
        TextTransparency = 0
    }):Play()
    
    local GfIu9JwAHD = Instance.new("TextLabel")
    GfIu9JwAHD.Size = UDim2.new(1, -50, 1, 0)
    GfIu9JwAHD.Position = UDim2.new(0, 45, 0, 0)
    GfIu9JwAHD.BackgroundTransparency = 1
    GfIu9JwAHD.Text = AzCo5DqUBX
    GfIu9JwAHD.TextColor3 = Color3.fromRGB(255, 255, 255)
    GfIu9JwAHD.TextSize = 14
    GfIu9JwAHD.Font = Enum.Font.SourceSans
    GfIu9JwAHD.TextWrapped = true
    GfIu9JwAHD.TextXAlignment = Enum.TextXAlignment.Left
    GfIu9JwAHD.TextTransparency = 1
    GfIu9JwAHD.Parent = CbEq3FsWDZ
    
    RxBn9MptAW:Create(GfIu9JwAHD, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    }):Play()
    
    table.insert(JiLx7MzDKG, CbEq3FsWDZ)
    
    CbEq3FsWDZ:TweenPosition(
        UDim2.new(1, -310, 0, 10 + ((#JiLx7MzDKG - 1) * 70)),
        "Out",
        "Back",
        0.5,
        true
    )
    
    wait(5)
    
    RxBn9MptAW:Create(CbEq3FsWDZ, UIAppearTween, {
        BackgroundTransparency = 1
    }):Play()
    RxBn9MptAW:Create(FeHt5IvZGC, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    RxBn9MptAW:Create(GfIu9JwAHD, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    
    CbEq3FsWDZ:TweenPosition(
        UDim2.new(1, 10, 0, CbEq3FsWDZ.Position.Y.Offset),
        "Out",
        "Quad",
        0.3,
        true,
        function()
            for HgJv3KxBIE, IhKw7LyCJF in ipairs(JiLx7MzDKG) do
                if IhKw7LyCJF == CbEq3FsWDZ then
                    table.remove(JiLx7MzDKG, HgJv3KxBIE)
                    break
                end
            end
            
            for HgJv3KxBIE, IhKw7LyCJF in ipairs(JiLx7MzDKG) do
                IhKw7LyCJF:TweenPosition(
                    UDim2.new(1, -310, 0, 10 + ((HgJv3KxBIE - 1) * 70)),
                    "Out",
                    "Quad",
                    0.2,
                    true
                )
            end
            
            CbEq3FsWDZ:Destroy()
        end
    )
end

local function DestroyBookshelfESP()
    if #GfIu6JwAHD == 0 then
        spawn(function()
            ZyBn1CpTAW("No highlights to clear!", "info")
        end)
        return
    end

    for _, highlightData in ipairs(GfIu6JwAHD) do
        for _, connection in ipairs(highlightData.connections) do
            connection:Disconnect()
        end
        if highlightData.highlight then
            highlightData.highlight:Destroy()
        end
        if highlightData.drawing then
            highlightData.drawing:Remove()
        end
    end
    table.clear(GfIu6JwAHD)
    
    spawn(function()
        ZyBn1CpTAW("Bookshelf ESP Disabled", "success")
    end)
end

local function EnableBookshelfESP()
    local bookshelfCount = 0

    for _, child in ipairs(DcGs8HuyFB:GetChildren()) do
        if child.Name == FeHt2IvzGC then
            bookshelfCount = bookshelfCount + 1

            local highlightData = {
                highlight = nil,
                drawing = nil,
                connections = {},
                initialColorOffset = math.random() * 360
            }

            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.new(1, 1, 1)
            highlight.FillTransparency = 1
            highlight.OutlineColor = Color3.fromRGB(138, 43, 226)
            highlight.OutlineTransparency = 0
            highlight.Parent = child
            highlightData.highlight = highlight

            table.insert(GfIu6JwAHD, highlightData)

            if Drawing then
                local drawingText = Drawing.new("Text")
                drawingText.Font = 2
                drawingText.Color = Color3.new(1, 1, 1)
                drawingText.Outline = true
                drawingText.OutlineColor = Color3.new(0, 0, 0)
                drawingText.Size = 20
                drawingText.Visible = true
                highlightData.drawing = drawingText

                local function updateDrawing()
                    local character = BbFr5EtxEA.Character
                    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

                    if character and humanoidRootPart then
                        local distance = math.floor((humanoidRootPart.Position - child.Position).magnitude + 0.5)

                        drawingText.Text = "Book Is Here! [Distance: " .. distance .. "]"

                        local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(child.Position + Vector3.new(0, child.Size.Y / 2 + 1, 0))
                        
                        if onScreen then
                            drawingText.Position = Vector2.new(screenPos.X - drawingText.TextBounds.X / 2, screenPos.Y - drawingText.TextBounds.Y / 2)
                        end
                    else
                        drawingText.Visible = false
                    end
                end
                table.insert(highlightData.connections, PwAq6JlsZV.RenderStepped:Connect(updateDrawing))
            end
        end
    end

    if bookshelfCount > 0 then
        spawn(function()
            ZyBn1CpTAW("Bookshelf ESP Enabled - Found: " .. bookshelfCount, "success")
        end)
    else
        spawn(function()
            ZyBn1CpTAW("No bookshelfs found!", "error")
        end)
    end
end

local function Revive()
    local character = BbFr5EtxEA.Character
    if not character then
        spawn(function()
            ZyBn1CpTAW("Character not found!", "error")
        end)
        return
    end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid and humanoid.Health > 0 then
        spawn(function()
            ZyBn1CpTAW("Tried To Revive But Already Alive", "info")
        end)
        return
    end
    
    local success, error = pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("Bricks"):WaitForChild("Revive"):FireServer()
    end)
    
    if success then
        spawn(function()
            ZyBn1CpTAW("Revive request sent!", "success")
        end)
    else
        spawn(function()
            ZyBn1CpTAW("Failed to revive: " .. tostring(error), "error")
        end)
    end
end

local function StartFigureTrack()
    if HgJv9KxBIE then
        HgJv9KxBIE:Disconnect()
    end
    
    HgJv9KxBIE = PwAq6JlsZV.Heartbeat:Connect(function()
        local success, error = pcall(function()
            local figureSetup = workspace:FindFirstChild("FigureSetup")
            if not figureSetup then return end
            
            local figureRagdoll = figureSetup:FindFirstChild("FigureRagdoll")
            if not figureRagdoll then return end
            
            local figureTorso = figureRagdoll:FindFirstChild("Torso")
            if not figureTorso then return end
            
            local character = BbFr5EtxEA.Character
            if not character then return end
            
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart then return end
            
            local distance = (humanoidRootPart.Position - figureTorso.Position).magnitude
            
            if distance >= 15 and distance <= 20 then
                IhKw3LyCJF = IhKw3LyCJF == 1 and 2 or 1
                humanoidRootPart.CFrame = UtWi1XkOVR[IhKw3LyCJF]
            elseif distance < 15 then
                IhKw3LyCJF = IhKw3LyCJF == 1 and 2 or 1
                humanoidRootPart.CFrame = UtWi1XkOVR[IhKw3LyCJF]
            end
        end)
    end)
    
    spawn(function()
        ZyBn1CpTAW("Figure tracking started", "success")
    end)
end

local function StopFigureTrack()
    if HgJv9KxBIE then
        HgJv9KxBIE:Disconnect()
        HgJv9KxBIE = nil
        spawn(function()
            ZyBn1CpTAW("Figure tracking stopped", "info")
        end)
    else
        spawn(function()
            ZyBn1CpTAW("Figure tracking was not running", "info")
        end)
    end
end

local function TeleportToDoor()
    local character = BbFr5EtxEA.Character
    if not character then
        spawn(function()
            ZyBn1CpTAW("Character not found!", "error")
        end)
        return
    end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        spawn(function()
            ZyBn1CpTAW("HumanoidRootPart not found!", "error")
        end)
        return
    end
    
    local doorCFrame = CFrame.new(
        0.88565439, 19.2949562, -109.371742,
        -0.998881638, 0.00240474031, -0.0472193025,
        -7.93140771e-08, 0.998705626, 0.0508628227,
        0.0472804941, 0.0508059449, -0.997588754
    )
    
    humanoidRootPart.CFrame = doorCFrame
    spawn(function()
        ZyBn1CpTAW("Teleported to Door", "success")
    end)
end

local function TeleportToBPaper()
    local character = BbFr5EtxEA.Character
    if not character then
        spawn(function()
            ZyBn1CpTAW("Character not found!", "error")
        end)
        return
    end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        spawn(function()
            ZyBn1CpTAW("HumanoidRootPart not found!", "error")
        end)
        return
    end
    
    local bpaperCFrame = CFrame.new(
        -53.6578979, 11.3413105, -21.9969749,
        0.423553586, -0.90396452, -0.0587408952,
        0.1525819, 0.00727360509, 0.988264024,
        -0.892928481, -0.427545547, 0.141009375
    )
    
    humanoidRootPart.CFrame = bpaperCFrame
    spawn(function()
        ZyBn1CpTAW("Teleported to BPaper", "success")
    end)
end

local function ResetWalkSpeed()
    MlOa9PcGNJ = false
    if KjMy1NaELH then
        KjMy1NaELH:Disconnect()
        KjMy1NaELH = nil
        spawn(function()
            ZyBn1CpTAW("WalkSpeed loop stopped", "info")
        end)
    end
    
    local character = BbFr5EtxEA.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16
            spawn(function()
                ZyBn1CpTAW("WalkSpeed reset to 16", "success")
            end)
        end
    end
end

local function ApplyWalkSpeed(speedValue)
    local speed = tonumber(speedValue)
    if not speed then
        spawn(function()
            ZyBn1CpTAW("Invalid WalkSpeed value!", "error")
        end)
        return
    end
    
    if KjMy1NaELH then
        KjMy1NaELH:Disconnect()
        KjMy1NaELH = nil
    end
    
    LkNz5ObFMI = speed
    MlOa9PcGNJ = true
    
    KjMy1NaELH = PwAq6JlsZV.RenderStepped:Connect(function()
        if MlOa9PcGNJ and BbFr5EtxEA.Character and BbFr5EtxEA.Character:FindFirstChild("Humanoid") then
            BbFr5EtxEA.Character.Humanoid.WalkSpeed = LkNz5ObFMI
        end
    end)
    
    spawn(function()
        ZyBn1CpTAW("WalkSpeed set to " .. speed, "success")
    end)
end

local function BreakVelocity()
    local character = BbFr5EtxEA.Character
    if not character then
        spawn(function()
            ZyBn1CpTAW("Character not found!", "error")
        end)
        return
    end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then
        spawn(function()
            ZyBn1CpTAW("HumanoidRootPart not found!", "error")
        end)
        return
    end
    
    local success, error = pcall(function()
        humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        humanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        
        if humanoidRootPart.Velocity then
            humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        end
        
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
        end
        
        for _, child in pairs(humanoidRootPart:GetChildren()) do
            if child:IsA("BodyVelocity") or child:IsA("BodyPosition") or child:IsA("BodyAngularVelocity") or child:IsA("BodyThrust") or child:IsA("BodyForce") then
                child:Destroy()
            end
        end
    end)
    
    if success then
        spawn(function()
            ZyBn1CpTAW("Player velocity broken!", "success")
        end)
    else
        spawn(function()
            ZyBn1CpTAW("Failed to break velocity: " .. tostring(error), "error")
        end)
    end
end

local function EnableFigureESP()
    local figureSetup = workspace:FindFirstChild("FigureSetup")
    if not figureSetup then
        spawn(function()
            ZyBn1CpTAW("Figure not found!", "error")
        end)
        return
    end
    
    local figureRagdoll = figureSetup:FindFirstChild("FigureRagdoll")
    if not figureRagdoll then
        spawn(function()
            ZyBn1CpTAW("FigureRagdoll not found!", "error")
        end)
        return
    end
    
    PoRd1SfJQM = Instance.new("Highlight")
    PoRd1SfJQM.FillColor = Color3.new(1, 1, 1)
    PoRd1SfJQM.FillTransparency = 1
    PoRd1SfJQM.OutlineColor = Color3.fromRGB(138, 43, 226)
    PoRd1SfJQM.OutlineTransparency = 0
    PoRd1SfJQM.Parent = figureRagdoll
    
    spawn(function()
        ZyBn1CpTAW("Figure ESP Enabled", "success")
    end)
end

local function DisableFigureESP()
    if PoRd1SfJQM then
        PoRd1SfJQM:Destroy()
        PoRd1SfJQM = nil
        spawn(function()
            ZyBn1CpTAW("Figure ESP Disabled", "info")
        end)
    else
        spawn(function()
            ZyBn1CpTAW("Figure ESP was not enabled", "info")
        end)
    end
end

local function EnableFullBright()
    TyCo3NquBX.Brightness = 2
    TyCo3NquBX.Ambient = Color3.fromRGB(255, 255, 255)
    TyCo3NquBX.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
    TyCo3NquBX.ColorShift_Top = Color3.fromRGB(255, 255, 255)
    TyCo3NquBX.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    TyCo3NquBX.ShadowSoftness = 0
    
    spawn(function()
        ZyBn1CpTAW("Full Bright Enabled", "success")
    end)
end

local function DisableFullBright()
    TyCo3NquBX.Brightness = OnQc7ReIPL.Brightness
    TyCo3NquBX.Ambient = OnQc7ReIPL.Ambient
    TyCo3NquBX.ColorShift_Bottom = OnQc7ReIPL.ColorShift_Bottom
    TyCo3NquBX.ColorShift_Top = OnQc7ReIPL.ColorShift_Top
    TyCo3NquBX.OutdoorAmbient = OnQc7ReIPL.OutdoorAmbient
    TyCo3NquBX.ShadowSoftness = OnQc7ReIPL.ShadowSoftness
    
    spawn(function()
        ZyBn1CpTAW("Full Bright Disabled", "info")
    end)
end

local MainGui = Instance.new("ScreenGui")
MainGui.Name = "BookshelfControlGui"
MainGui.ResetOnSpawn = false
MainGui.Parent = VzDp7OrvCY

local UIScale = Instance.new("UIScale")
UIScale.Scale = 0.8
UIScale.Parent = MainGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 240, 0, 280)
MainFrame.Position = UDim2.new(0, 20, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 1
MainFrame.Parent = MainGui

RxBn9MptAW:Create(MainFrame, ElasticTween, {
    BackgroundTransparency = 0
}):Play()

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 15)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(138, 43, 226)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
TitleLabel.BorderSizePixel = 0
TitleLabel.Text = "Figure's Library"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 22
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextTransparency = 1
TitleLabel.Parent = MainFrame

RxBn9MptAW:Create(TitleLabel, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    TextTransparency = 0
}):Play()

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = TitleLabel

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(0, 10, 0, 10)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 24
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextTransparency = 1
MinimizeButton.Parent = TitleLabel

RxBn9MptAW:Create(MinimizeButton, TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
    TextTransparency = 0
}):Play()

local Page1ScrollFrame = Instance.new("ScrollingFrame")
Page1ScrollFrame.Name = "Page1ScrollFrame"
Page1ScrollFrame.Size = UDim2.new(1, -30, 1, -70)
Page1ScrollFrame.Position = UDim2.new(0, 15, 0, 60)
Page1ScrollFrame.BackgroundTransparency = 1
Page1ScrollFrame.BorderSizePixel = 0
Page1ScrollFrame.ScrollBarThickness = 6
Page1ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(138, 43, 226)
Page1ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
Page1ScrollFrame.Parent = MainFrame

local Page1Layout = Instance.new("UIListLayout")
Page1Layout.FillDirection = Enum.FillDirection.Vertical
Page1Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Page1Layout.VerticalAlignment = Enum.VerticalAlignment.Top
Page1Layout.Padding = UDim.new(0, 15)
Page1Layout.Parent = Page1ScrollFrame

Page1Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Page1ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, Page1Layout.AbsoluteContentSize.Y + 50)
end)

local Page2ScrollFrame = Instance.new("ScrollingFrame")
Page2ScrollFrame.Name = "Page2ScrollFrame"
Page2ScrollFrame.Size = UDim2.new(1, -30, 1, -70)
Page2ScrollFrame.Position = UDim2.new(0, 15, 0, 60)
Page2ScrollFrame.BackgroundTransparency = 1
Page2ScrollFrame.BorderSizePixel = 0
Page2ScrollFrame.ScrollBarThickness = 6
Page2ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(138, 43, 226)
Page2ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
Page2ScrollFrame.Visible = false
Page2ScrollFrame.Parent = MainFrame

local Page2Layout = Instance.new("UIListLayout")
Page2Layout.FillDirection = Enum.FillDirection.Vertical
Page2Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Page2Layout.VerticalAlignment = Enum.VerticalAlignment.Top
Page2Layout.Padding = UDim.new(0, 15)
Page2Layout.Parent = Page2ScrollFrame

Page2Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Page2ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, Page2Layout.AbsoluteContentSize.Y + 50)
end)

local WalkSpeedTextBox = Instance.new("TextBox")
WalkSpeedTextBox.Name = "WalkSpeedTextBox"
WalkSpeedTextBox.Size = UDim2.new(1, 0, 0, 50)
WalkSpeedTextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
WalkSpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedTextBox.PlaceholderText = "Enter WalkSpeed..."
WalkSpeedTextBox.Text = ""
WalkSpeedTextBox.Font = Enum.Font.SourceSans
WalkSpeedTextBox.TextSize = 16
WalkSpeedTextBox.BorderSizePixel = 0
WalkSpeedTextBox.LayoutOrder = 0
WalkSpeedTextBox.Parent = Page2ScrollFrame

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 10)
TextBoxCorner.Parent = WalkSpeedTextBox

local TextBoxStroke = Instance.new("UIStroke")
TextBoxStroke.Color = Color3.fromRGB(138, 43, 226)
TextBoxStroke.Transparency = 0.7
TextBoxStroke.Thickness = 1
TextBoxStroke.Parent = WalkSpeedTextBox

local function CreateButton(text, color, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 50)
    button.BackgroundColor3 = color
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = text
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 16
    button.BorderSizePixel = 0
    button.BackgroundTransparency = 1

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 10)
    buttonCorner.Parent = button

    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = Color3.fromRGB(138, 43, 226)
    buttonStroke.Transparency = 0.7
    buttonStroke.Thickness = 1
    buttonStroke.Parent = button

    local originalSize = button.Size
    local originalColor = button.BackgroundColor3

    RxBn9MptAW:Create(button, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0
    }):Play()

    button.MouseButton1Down:Connect(function()
        WvYk9ZmQXT("6895079853")
        local pressedSize = UDim2.new(originalSize.X.Scale * 0.94, originalSize.X.Offset, originalSize.Y.Scale * 0.94, originalSize.Y.Offset)
        RxBn9MptAW:Create(button, ButtonPressTween, {
            Size = pressedSize,
            BackgroundColor3 = Color3.new(
                originalColor.R * 0.6,
                originalColor.G * 0.6,
                originalColor.B * 0.6
            )
        }):Play()
    end)

    button.MouseButton1Up:Connect(function()
        RxBn9MptAW:Create(button, ButtonReleaseTween, {
            Size = originalSize,
            BackgroundColor3 = originalColor
        }):Play()
    end)

    button.MouseEnter:Connect(function()
        RxBn9MptAW:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.new(
                math.min(originalColor.R * 1.3, 1),
                math.min(originalColor.G * 1.3, 1),
                math.min(originalColor.B * 1.3, 1)
            ),
            Size = UDim2.new(originalSize.X.Scale * 1.02, originalSize.X.Offset, originalSize.Y.Scale, originalSize.Y.Offset)
        }):Play()
        RxBn9MptAW:Create(buttonStroke, TweenInfo.new(0.3), {
            Transparency = 0.2
        }):Play()
    end)

    button.MouseLeave:Connect(function()
        RxBn9MptAW:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = originalColor,
            Size = originalSize
        }):Play()
        RxBn9MptAW:Create(buttonStroke, TweenInfo.new(0.3), {
            Transparency = 0.7
        }):Play()
    end)

    button.MouseButton1Click:Connect(callback)

    return button
end

local function GoToPage2()
    Page1ScrollFrame.Visible = false
    Page2ScrollFrame.Visible = true
    Page2ScrollFrame.Position = UDim2.new(1, 15, 0, 60)
    RxBn9MptAW:Create(Page2ScrollFrame, PageTransitionTween, {
        Position = UDim2.new(0, 15, 0, 60)
    }):Play()
end

local function GoToPage1()
    Page1ScrollFrame.Visible = true
    Page2ScrollFrame.Visible = false
    Page1ScrollFrame.Position = UDim2.new(-1, 15, 0, 60)
    RxBn9MptAW:Create(Page1ScrollFrame, PageTransitionTween, {
        Position = UDim2.new(0, 15, 0, 60)
    }):Play()
end

local function ToggleMinimize()
    if NmPb3QdHOK then
        RxBn9MptAW:Create(MainFrame, PageTransitionTween, {
            Size = UDim2.new(0, 240, 0, 280)
        }):Play()
        Page1ScrollFrame.Visible = true
        Page2ScrollFrame.Visible = false
        MinimizeButton.Text = "-"
        NmPb3QdHOK = false
    else
        RxBn9MptAW:Create(MainFrame, PageTransitionTween, {
            Size = UDim2.new(0, 240, 0, 50)
        }):Play()
        Page1ScrollFrame.Visible = false
        Page2ScrollFrame.Visible = false
        MinimizeButton.Text = "+"
        NmPb3QdHOK = true
    end
end

MinimizeButton.MouseButton1Click:Connect(ToggleMinimize)

local BookshelfESPButton = CreateButton("Bookshelf ESP", Color3.fromRGB(40, 40, 50), EnableBookshelfESP)
BookshelfESPButton.LayoutOrder = 1
BookshelfESPButton.Parent = Page1ScrollFrame

local NoBookshelfESPButton = CreateButton("No Bookshelf ESP", Color3.fromRGB(40, 40, 50), DestroyBookshelfESP)
NoBookshelfESPButton.LayoutOrder = 2
NoBookshelfESPButton.Parent = Page1ScrollFrame

local StartFigureTrackButton = CreateButton("Start Figure Track", Color3.fromRGB(40, 40, 50), StartFigureTrack)
StartFigureTrackButton.LayoutOrder = 3
StartFigureTrackButton.Parent = Page1ScrollFrame

local StopFigureTrackButton = CreateButton("Stop Figure Track", Color3.fromRGB(40, 40, 50), StopFigureTrack)
StopFigureTrackButton.LayoutOrder = 4
StopFigureTrackButton.Parent = Page1ScrollFrame

local FigureESPButton = CreateButton("Figure ESP", Color3.fromRGB(40, 40, 50), EnableFigureESP)
FigureESPButton.LayoutOrder = 5
FigureESPButton.Parent = Page1ScrollFrame

local NoFigureESPButton = CreateButton("No Figure ESP", Color3.fromRGB(40, 40, 50), DisableFigureESP)
NoFigureESPButton.LayoutOrder = 6
NoFigureESPButton.Parent = Page1ScrollFrame

local FullBrightButton = CreateButton("Full Bright", Color3.fromRGB(40, 40, 50), EnableFullBright)
FullBrightButton.LayoutOrder = 7
FullBrightButton.Parent = Page1ScrollFrame

local NoFullBrightButton = CreateButton("No Full Bright", Color3.fromRGB(40, 40, 50), DisableFullBright)
NoFullBrightButton.LayoutOrder = 8
NoFullBrightButton.Parent = Page1ScrollFrame

local ReviveButton = CreateButton("Revive", Color3.fromRGB(40, 40, 50), Revive)
ReviveButton.LayoutOrder = 9
ReviveButton.Parent = Page1ScrollFrame

local TeleportToDoorButton = CreateButton("TP To Door", Color3.fromRGB(40, 40, 50), TeleportToDoor)
TeleportToDoorButton.LayoutOrder = 10
TeleportToDoorButton.Parent = Page1ScrollFrame

local TeleportToBPaperButton = CreateButton("TP To BPaper", Color3.fromRGB(40, 40, 50), TeleportToBPaper)
TeleportToBPaperButton.LayoutOrder = 11
TeleportToBPaperButton.Parent = Page1ScrollFrame

local GoToNextPageButton = CreateButton("Go To Next Page", Color3.fromRGB(40, 40, 50), GoToPage2)
GoToNextPageButton.LayoutOrder = 12
GoToNextPageButton.Parent = Page1ScrollFrame

local ApplyWalkSpeedButton = CreateButton("Apply WalkSpeed", Color3.fromRGB(40, 40, 50), function()
    ApplyWalkSpeed(WalkSpeedTextBox.Text)
end)
ApplyWalkSpeedButton.LayoutOrder = 1
ApplyWalkSpeedButton.Parent = Page2ScrollFrame

local ResetWalkSpeedButton = CreateButton("Reset WalkSpeed", Color3.fromRGB(40, 40, 50), ResetWalkSpeed)
ResetWalkSpeedButton.LayoutOrder = 2
ResetWalkSpeedButton.Parent = Page2ScrollFrame

local BreakVelocityButton = CreateButton("Break Velocity", Color3.fromRGB(40, 40, 50), BreakVelocity)
BreakVelocityButton.LayoutOrder = 3
BreakVelocityButton.Parent = Page2ScrollFrame

local GoBackButton = CreateButton("Go Back", Color3.fromRGB(40, 40, 50), GoToPage1)
GoBackButton.LayoutOrder = 4
GoBackButton.Parent = Page2ScrollFrame

local isDragging = nil
local dragSpeed = 0.25
local dragStart = nil
local startPos = nil

local function updateDrag(input)
    local delta = input.Position - dragStart
    local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    RxBn9MptAW:Create(MainFrame, TweenInfo.new(dragSpeed), {Position = position}):Play()
end

TitleLabel.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        isDragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                isDragging = false
            end
        end)
    end
end)

TitleLabel.InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        if isDragging then
            updateDrag(input)
        end
    end
end)
