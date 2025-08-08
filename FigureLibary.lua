-- yes this is ai generated but, who cares

local HpYD7MGEEt4 = game:GetService("Players")
local KqZF8NHFFu5 = game:GetService("ReplicatedStorage")
local LrAG9OIGGv6 = game:GetService("UserInputService")
local MsBH0PJHHw7 = game:GetService("RunService")
local NtCI1QKIIx8 = game:GetService("TweenService")
local OuDJ2RLJJy9 = game:GetService("Lighting")
local PvEK3SMKKz0 = game:GetService("CoreGui")
local QwFL4TNLLa1 = game:GetService("SoundService")
local RxGM5UOMMb2 = game:GetService("Workspace")

local SyHN6VPNNc3 = HpYD7MGEEt4.LocalPlayer
local TzIO7WQOOd4 = workspace:WaitForChild("Map"):WaitForChild("Assets")
local UaJP8XRPPe5 = "Super Cool Bookshelf With Hint Book"
local VbKQ9YSQQf6 = {}
local WcLR0ZTRRg7 = nil
local XdMS1AUSRh8 = 1
local YeNT2BVSSi9 = {}
local ZfOU3CWTTj0 = nil
local AgPV4DXUUk1 = 16
local BhQW5EYVVl2 = false
local CiRX6FZWWm3 = false
local DjSY7GAXXn4 = {
    Brightness = OuDJ2RLJJy9.Brightness,
    Ambient = OuDJ2RLJJy9.Ambient,
    ColorShift_Bottom = OuDJ2RLJJy9.ColorShift_Bottom,
    ColorShift_Top = OuDJ2RLJJy9.ColorShift_Top,
    OutdoorAmbient = OuDJ2RLJJy9.OutdoorAmbient,
    ShadowSoftness = OuDJ2RLJJy9.ShadowSoftness
}

local EkTZ8HBYYo5 = {}
local FlUA9ICZZp6 = {}
local GmVB0JDAaq7 = nil

local HnWC1KEBBr8 = {}
local IoXD2LFCCs9 = {}
local JpYE3MGDDt0 = nil

local KqZF4NHEEu1 = false
local LrAG5OIFFv2 = nil

local MsBH6PJGGw3 = false
local NtCI7QKHHx4 = false
local OuDJ8RLIIy5 = false
local PvEK9SMJJz6 = false
local QwFL0TNKKa7 = false

local RxGM1UOLLb8 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local SyHN2VPMMc9 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local TzIO3WQNNd0 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local UaJP4XROOe1 = TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
local VbKQ5YSPPf2 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

local WcLR6ZTQQg3 = {
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

local XdMS7AURRh4 = CFrame.new(
    0.88565439, 19.2949562, -109.371742,
    -0.998881638, 0.00240474031, -0.0472193025,
    -7.93140771e-08, 0.998705626, 0.0508628227,
    0.0472804941, 0.0508059449, -0.997588754
)

local YeNT8BVSSi5 = Instance.new("ScreenGui")
YeNT8BVSSi5.Name = "NotificationGui"
YeNT8BVSSi5.ResetOnSpawn = false
YeNT8BVSSi5.Parent = PvEK3SMKKz0

local function ZfOU9CWTTj6(AgPV0DXUUk7)
    local BhQW1EYVVl8 = Instance.new("Sound")
    BhQW1EYVVl8.SoundId = "rbxassetid://" .. AgPV0DXUUk7
    BhQW1EYVVl8.Volume = 0.5
    BhQW1EYVVl8.Parent = QwFL4TNLLa1
    BhQW1EYVVl8:Play()
    BhQW1EYVVl8.Ended:Connect(function()
        BhQW1EYVVl8:Destroy()
    end)
end

local function CiRX2FZWWm9(DjSY3GAXXn0, EkTZ4HBYYo1)
    ZfOU9CWTTj6("17582299860")
    local FlUA5ICZZp2 = Instance.new("Frame")
    FlUA5ICZZp2.Size = UDim2.new(0, 300, 0, 60)
    FlUA5ICZZp2.Position = UDim2.new(1, 10, 0, 10 + (#YeNT2BVSSi9 * 70))
    FlUA5ICZZp2.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    FlUA5ICZZp2.BorderSizePixel = 0
    FlUA5ICZZp2.BackgroundTransparency = 1
    FlUA5ICZZp2.Parent = YeNT8BVSSi5
    
    NtCI1QKIIx8:Create(FlUA5ICZZp2, TzIO3WQNNd0, {
        BackgroundTransparency = 0
    }):Play()
    
    local GmVB6JDAaq3 = Instance.new("UICorner")
    GmVB6JDAaq3.CornerRadius = UDim.new(0, 10)
    GmVB6JDAaq3.Parent = FlUA5ICZZp2
    
    local HnWC7KEBBr4 = Instance.new("UIStroke")
    HnWC7KEBBr4.Color = Color3.fromRGB(138, 43, 226)
    HnWC7KEBBr4.Thickness = 2
    HnWC7KEBBr4.Parent = FlUA5ICZZp2
    
    local IoXD8LFCCs5 = Instance.new("TextLabel")
    IoXD8LFCCs5.Size = UDim2.new(0, 40, 1, 0)
    IoXD8LFCCs5.Position = UDim2.new(0, 0, 0, 0)
    IoXD8LFCCs5.BackgroundTransparency = 1
    IoXD8LFCCs5.Text = "!"
    IoXD8LFCCs5.TextColor3 = Color3.fromRGB(138, 43, 226)
    IoXD8LFCCs5.TextSize = 24
    IoXD8LFCCs5.Font = Enum.Font.SourceSansBold
    IoXD8LFCCs5.TextTransparency = 1
    IoXD8LFCCs5.Parent = FlUA5ICZZp2
    
    NtCI1QKIIx8:Create(IoXD8LFCCs5, TweenInfo.new(0.4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
        TextTransparency = 0
    }):Play()
    
    local JpYE9MGDDt6 = Instance.new("TextLabel")
    JpYE9MGDDt6.Size = UDim2.new(1, -50, 1, 0)
    JpYE9MGDDt6.Position = UDim2.new(0, 45, 0, 0)
    JpYE9MGDDt6.BackgroundTransparency = 1
    JpYE9MGDDt6.Text = DjSY3GAXXn0
    JpYE9MGDDt6.TextColor3 = Color3.fromRGB(255, 255, 255)
    JpYE9MGDDt6.TextSize = 14
    JpYE9MGDDt6.Font = Enum.Font.SourceSans
    JpYE9MGDDt6.TextWrapped = true
    JpYE9MGDDt6.TextXAlignment = Enum.TextXAlignment.Left
    JpYE9MGDDt6.TextTransparency = 1
    JpYE9MGDDt6.Parent = FlUA5ICZZp2
    
    NtCI1QKIIx8:Create(JpYE9MGDDt6, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    }):Play()
    
    table.insert(YeNT2BVSSi9, FlUA5ICZZp2)
    
    FlUA5ICZZp2:TweenPosition(
        UDim2.new(1, -310, 0, 10 + ((#YeNT2BVSSi9 - 1) * 70)),
        "Out",
        "Back",
        0.5,
        true
    )
    
    wait(5)
    
    NtCI1QKIIx8:Create(FlUA5ICZZp2, TzIO3WQNNd0, {
        BackgroundTransparency = 1
    }):Play()
    NtCI1QKIIx8:Create(IoXD8LFCCs5, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    NtCI1QKIIx8:Create(JpYE9MGDDt6, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    
    FlUA5ICZZp2:TweenPosition(
        UDim2.new(1, 10, 0, FlUA5ICZZp2.Position.Y.Offset),
        "Out",
        "Quad",
        0.3,
        true,
        function()
            for KqZF0NHEEu7, LrAG1OIFFv8 in ipairs(YeNT2BVSSi9) do
                if LrAG1OIFFv8 == FlUA5ICZZp2 then
                    table.remove(YeNT2BVSSi9, KqZF0NHEEu7)
                    break
                end
            end
            for KqZF0NHEEu7, LrAG1OIFFv8 in ipairs(YeNT2BVSSi9) do
                LrAG1OIFFv8:TweenPosition(
                    UDim2.new(1, -310, 0, 10 + ((KqZF0NHEEu7 - 1) * 70)),
                    "Out",
                    "Quad",
                    0.2,
                    true
                )
            end
            FlUA5ICZZp2:Destroy()
        end
    )
end

local MsBH2PJGGw9 = UaJP8XRPPe5
local NtCI3QKHHx0 = 0.1
local OuDJ4RLIIy1 = Color3.fromRGB(170, 0, 255)

local function PvEK5SMJJz2(QwFL6TNKKa3)
    if QwFL6TNKKa3:IsA("Model") then
        local RxGM7UOLLb4 = QwFL6TNKKa3:FindFirstChild("HumanoidRootPart")
        if RxGM7UOLLb4 then
            return RxGM7UOLLb4.Position
        end
        local SyHN8VPMMc5 = QwFL6TNKKa3:FindFirstChild("Torso")
        if SyHN8VPMMc5 then
            return SyHN8VPMMc5.Position
        end
        for _, TzIO9WQNNd6 in ipairs(QwFL6TNKKa3:GetDescendants()) do
            if TzIO9WQNNd6:IsA("BasePart") then
                return TzIO9WQNNd6.Position
            end
        end
    elseif QwFL6TNKKa3:IsA("BasePart") then
        return QwFL6TNKKa3.Position
    end
    return nil
end

local function UaJP0XROOe7(VbKQ1YSPPf8)
    if VbKQ1YSPPf8:IsA("Model") then
        if VbKQ1YSPPf8.PrimaryPart then
            return VbKQ1YSPPf8.PrimaryPart
        end
        local WcLR2ZTQQg9 = VbKQ1YSPPf8:FindFirstChild("HumanoidRootPart")
        if WcLR2ZTQQg9 then
            return WcLR2ZTQQg9
        end
        local XdMS3AURRh0 = VbKQ1YSPPf8:FindFirstChild("Torso")
        if XdMS3AURRh0 then
            return XdMS3AURRh0
        end
        for _, YeNT4BVSSi1 in ipairs(VbKQ1YSPPf8:GetDescendants()) do
            if YeNT4BVSSi1:IsA("BasePart") then
                return YeNT4BVSSi1
            end
        end
    elseif VbKQ1YSPPf8:IsA("BasePart") then
        return VbKQ1YSPPf8
    end
    return nil
end

local function ZfOU5CWTTj2(AgPV6DXUUk3)
    local BhQW7EYVVl4 = SyHN6VPNNc3.Character
    if not BhQW7EYVVl4 then return false end
    
    local CiRX8FZWWm5 = BhQW7EYVVl4:FindFirstChild("HumanoidRootPart")
    if not CiRX8FZWWm5 then return false end
    
    local DjSY9GAXXn6 = 0
    
    for _, EkTZ0HBYYo7 in ipairs(WcLR6ZTQQg3) do
        local FlUA1ICZZp8 = EkTZ0HBYYo7.Position
        
        for _, GmVB2JDAaq9 in pairs(AgPV6DXUUk3) do
            local HnWC3KEBBr0 = PvEK5SMJJz2(GmVB2JDAaq9.entity)
            if HnWC3KEBBr0 then
                local IoXD4LFCCs1 = (FlUA1ICZZp8 - HnWC3KEBBr0).Magnitude
                if IoXD4LFCCs1 <= 25 then
                    DjSY9GAXXn6 = DjSY9GAXXn6 + 1
                    break
                end
            end
        end
    end
    
    return DjSY9GAXXn6 >= 2
end

local function JpYE5MGDDt2()
    if MsBH6PJGGw3 then
        spawn(function()
            CiRX2FZWWm9("Bookshelf ESP is already active!", "warning")
        end)
        return
    end
    
    if GmVB0JDAaq7 then
        GmVB0JDAaq7:Disconnect()
        GmVB0JDAaq7 = nil
    end
    
    for _, KqZF6NHEEu3 in pairs(EkTZ8HBYYo5) do
        if KqZF6NHEEu3 and KqZF6NHEEu3.Parent then
            KqZF6NHEEu3:Destroy()
        end
    end
    EkTZ8HBYYo5 = {}
    
    for _, LrAG7OIFFv4 in pairs(FlUA9ICZZp6) do
        if LrAG7OIFFv4 and LrAG7OIFFv4.Parent then
            LrAG7OIFFv4:Destroy()
        end
    end
    FlUA9ICZZp6 = {}
    
    local MsBH8PJGGw5 = 0
    for _, NtCI9QKHHx6 in ipairs(TzIO7WQOOd4:GetChildren()) do
        if NtCI9QKHHx6.Name == MsBH2PJGGw9 and not NtCI9QKHHx6:FindFirstChildOfClass("Humanoid") then
            MsBH8PJGGw5 = MsBH8PJGGw5 + 1
            
            local OuDJ0RLIIy7 = UaJP0XROOe7(NtCI9QKHHx6)
            
            if OuDJ0RLIIy7 then
                local PvEK1SMJJz8 = Instance.new("Highlight")
                PvEK1SMJJz8.Adornee = NtCI9QKHHx6
                PvEK1SMJJz8.FillTransparency = 1
                PvEK1SMJJz8.OutlineTransparency = 0
                PvEK1SMJJz8.OutlineColor = OuDJ4RLIIy1
                PvEK1SMJJz8.Parent = NtCI9QKHHx6
                EkTZ8HBYYo5[NtCI9QKHHx6] = PvEK1SMJJz8
                
                local QwFL2TNKKa9 = Instance.new("BillboardGui")
                QwFL2TNKKa9.Adornee = OuDJ0RLIIy7
                QwFL2TNKKa9.Size = UDim2.fromOffset(120, 30)
                QwFL2TNKKa9.StudsOffset = Vector3.new(0, OuDJ0RLIIy7.Size.Y + 1, 0)
                QwFL2TNKKa9.AlwaysOnTop = true
                QwFL2TNKKa9.Parent = OuDJ0RLIIy7
                
                local RxGM3UOLLb0 = Instance.new("TextLabel")
                RxGM3UOLLb0.BackgroundTransparency = 1
                RxGM3UOLLb0.TextColor3 = OuDJ4RLIIy1
                RxGM3UOLLb0.TextStrokeTransparency = 0.5
                RxGM3UOLLb0.TextScaled = true
                RxGM3UOLLb0.Font = Enum.Font.SourceSans
                RxGM3UOLLb0.Size = UDim2.new(1, 0, 1, 0)
                RxGM3UOLLb0.Text = "Hint Bookshelf #" .. MsBH8PJGGw5
                RxGM3UOLLb0.Parent = QwFL2TNKKa9
                
                FlUA9ICZZp6[NtCI9QKHHx6] = {billboard = QwFL2TNKKa9, textLabel = RxGM3UOLLb0, index = MsBH8PJGGw5}
            end
        end
    end
    
    if MsBH8PJGGw5 > 0 then
        MsBH6PJGGw3 = true
        
        GmVB0JDAaq7 = MsBH0PJHHw7.RenderStepped:Connect(function()
            local SyHN4VPMMc1 = SyHN6VPNNc3.Character and SyHN6VPNNc3.Character:FindFirstChild("HumanoidRootPart")
            if not SyHN4VPMMc1 then return end
            
            for TzIO5WQNNd2, UaJP6XROOe3 in pairs(FlUA9ICZZp6) do
                if TzIO5WQNNd2.Parent and UaJP6XROOe3.billboard.Parent then
                    local VbKQ7YSPPf4 = UaJP6XROOe3.billboard.Adornee
                    if VbKQ7YSPPf4 then
                        local WcLR8ZTQQg5 = math.floor((SyHN4VPMMc1.Position - VbKQ7YSPPf4.Position).Magnitude + 0.5)
                        UaJP6XROOe3.textLabel.Text = string.format("Hint Bookshelf #%d [Distance: %d studs]", UaJP6XROOe3.index, WcLR8ZTQQg5)
                    end
                else
                    if EkTZ8HBYYo5[TzIO5WQNNd2] then
                        EkTZ8HBYYo5[TzIO5WQNNd2]:Destroy()
                        EkTZ8HBYYo5[TzIO5WQNNd2] = nil
                    end
                    FlUA9ICZZp6[TzIO5WQNNd2] = nil
                end
            end
        end)
        
        spawn(function()
            CiRX2FZWWm9("Bookshelf ESP Enabled - Found: " .. MsBH8PJGGw5, "success")
        end)
    else
        spawn(function()
            CiRX2FZWWm9("No bookshelves found!", "error")
        end)
    end
end

local function XdMS9AURRh6()
    if not MsBH6PJGGw3 then
        spawn(function()
            CiRX2FZWWm9("Bookshelf ESP is not active!", "warning")
        end)
        return
    end
    
    MsBH6PJGGw3 = false
    
    if GmVB0JDAaq7 then
        GmVB0JDAaq7:Disconnect()
        GmVB0JDAaq7 = nil
    end
    
    for _, YeNT0BVSSi7 in pairs(EkTZ8HBYYo5) do
        if YeNT0BVSSi7 and YeNT0BVSSi7.Parent then
            YeNT0BVSSi7:Destroy()
        end
    end
    EkTZ8HBYYo5 = {}
    
    for _, ZfOU1CWTTj8 in pairs(FlUA9ICZZp6) do
        if ZfOU1CWTTj8.billboard and ZfOU1CWTTj8.billboard.Parent then
            ZfOU1CWTTj8.billboard:Destroy()
        end
    end
    FlUA9ICZZp6 = {}
    
    spawn(function()
        CiRX2FZWWm9("Bookshelf ESP Disabled", "success")
    end)
end

local function AgPV2DXUUk9()
    if NtCI7QKHHx4 then
        spawn(function()
            CiRX2FZWWm9("Multi-Entity ESP is already active!", "warning")
        end)
        return
    end
    
    if JpYE3MGDDt0 then
        JpYE3MGDDt0:Disconnect()
        JpYE3MGDDt0 = nil
    end
    
    for _, BhQW3EYVVl0 in pairs(HnWC1KEBBr8) do
        if BhQW3EYVVl0 and BhQW3EYVVl0.Parent then
            BhQW3EYVVl0:Destroy()
        end
    end
    HnWC1KEBBr8 = {}
    
    for _, CiRX4FZWWm1 in pairs(IoXD2LFCCs9) do
        if CiRX4FZWWm1.billboard and CiRX4FZWWm1.billboard.Parent then
            CiRX4FZWWm1.billboard:Destroy()
        end
    end
    IoXD2LFCCs9 = {}
    
    local DjSY5GAXXn2 = 0
    local EkTZ6HBYYo3 = {Figure = 0, Drakobloxxer = 0, SCP939 = 0}
    
    for _, FlUA7ICZZp4 in ipairs(workspace:GetChildren()) do
        if FlUA7ICZZp4.Name == "FigureSetup" then
            local GmVB8JDAaq5 = FlUA7ICZZp4:FindFirstChild("FigureRagdoll")
            if GmVB8JDAaq5 then
                DjSY5GAXXn2 = DjSY5GAXXn2 + 1
                EkTZ6HBYYo3.Figure = EkTZ6HBYYo3.Figure + 1
                
                local HnWC9KEBBr6 = UaJP0XROOe7(GmVB8JDAaq5)
                if HnWC9KEBBr6 then
                    local IoXD0LFCCs7 = Instance.new("Highlight")
                    IoXD0LFCCs7.FillColor = Color3.new(1, 1, 1)
                    IoXD0LFCCs7.FillTransparency = 1
                    IoXD0LFCCs7.OutlineColor = Color3.fromRGB(255, 0, 0)
                    IoXD0LFCCs7.OutlineTransparency = 0
                    IoXD0LFCCs7.Parent = GmVB8JDAaq5
                    HnWC1KEBBr8[GmVB8JDAaq5] = IoXD0LFCCs7
                    
                    local JpYE1MGDDt8 = Instance.new("BillboardGui")
                    JpYE1MGDDt8.Adornee = HnWC9KEBBr6
                    JpYE1MGDDt8.Size = UDim2.fromOffset(120, 30)
                    JpYE1MGDDt8.StudsOffset = Vector3.new(0, HnWC9KEBBr6.Size.Y + 2, 0)
                    JpYE1MGDDt8.AlwaysOnTop = true
                    JpYE1MGDDt8.Parent = HnWC9KEBBr6
                    
                    local KqZF2NHEEu9 = Instance.new("TextLabel")
                    KqZF2NHEEu9.BackgroundTransparency = 1
                    KqZF2NHEEu9.TextColor3 = Color3.fromRGB(255, 0, 0)
                    KqZF2NHEEu9.TextStrokeTransparency = 0.5
                    KqZF2NHEEu9.TextScaled = true
                    KqZF2NHEEu9.Font = Enum.Font.SourceSansBold
                    KqZF2NHEEu9.Size = UDim2.new(1, 0, 1, 0)
                    KqZF2NHEEu9.Text = "Figure #" .. EkTZ6HBYYo3.Figure
                    KqZF2NHEEu9.Parent = JpYE1MGDDt8
                    
                    IoXD2LFCCs9[GmVB8JDAaq5] = {
                        billboard = JpYE1MGDDt8, 
                        textLabel = KqZF2NHEEu9, 
                        entity = GmVB8JDAaq5,
                        entityType = "Figure",
                        index = EkTZ6HBYYo3.Figure
                    }
                end
            end
        end
    end
    
    for _, LrAG3OIFFv0 in ipairs(workspace:GetChildren()) do
        if LrAG3OIFFv0.Name == "Drakobloxxer" then
            DjSY5GAXXn2 = DjSY5GAXXn2 + 1
            EkTZ6HBYYo3.Drakobloxxer = EkTZ6HBYYo3.Drakobloxxer + 1
            
            local MsBH4PJGGw1 = UaJP0XROOe7(LrAG3OIFFv0)
            if MsBH4PJGGw1 then
                local NtCI5QKHHx2 = Instance.new("Highlight")
                NtCI5QKHHx2.FillColor = Color3.new(1, 1, 1)
                NtCI5QKHHx2.FillTransparency = 1
                NtCI5QKHHx2.OutlineColor = Color3.fromRGB(255, 165, 0)
                NtCI5QKHHx2.OutlineTransparency = 0
                NtCI5QKHHx2.Parent = LrAG3OIFFv0
                HnWC1KEBBr8[LrAG3OIFFv0] = NtCI5QKHHx2
                
                local OuDJ6RLIIy3 = Instance.new("BillboardGui")
                OuDJ6RLIIy3.Adornee = MsBH4PJGGw1
                OuDJ6RLIIy3.Size = UDim2.fromOffset(120, 30)
                OuDJ6RLIIy3.StudsOffset = Vector3.new(0, MsBH4PJGGw1.Size.Y + 2, 0)
                OuDJ6RLIIy3.AlwaysOnTop = true
                OuDJ6RLIIy3.Parent = MsBH4PJGGw1
                
                local PvEK7SMJJz4 = Instance.new("TextLabel")
                PvEK7SMJJz4.BackgroundTransparency = 1
                PvEK7SMJJz4.TextColor3 = Color3.fromRGB(255, 165, 0)
                PvEK7SMJJz4.TextStrokeTransparency = 0.5
                PvEK7SMJJz4.TextScaled = true
                PvEK7SMJJz4.Font = Enum.Font.SourceSansBold
                PvEK7SMJJz4.Size = UDim2.new(1, 0, 1, 0)
                PvEK7SMJJz4.Text = "Drakobloxxer #" .. EkTZ6HBYYo3.Drakobloxxer
                PvEK7SMJJz4.Parent = OuDJ6RLIIy3
                
                IoXD2LFCCs9[LrAG3OIFFv0] = {
                    billboard = OuDJ6RLIIy3, 
                    textLabel = PvEK7SMJJz4, 
                    entity = LrAG3OIFFv0,
                    entityType = "Drakobloxxer",
                    index = EkTZ6HBYYo3.Drakobloxxer
                }
            end
        end
    end
    
    for _, QwFL8TNKKa5 in ipairs(workspace:GetChildren()) do
        if QwFL8TNKKa5.Name == "939Original" then
            DjSY5GAXXn2 = DjSY5GAXXn2 + 1
            EkTZ6HBYYo3.SCP939 = EkTZ6HBYYo3.SCP939 + 1
            
            local RxGM9UOLLb6 = UaJP0XROOe7(QwFL8TNKKa5)
            if RxGM9UOLLb6 then
                local SyHN0VPMMc7 = Instance.new("Highlight")
                SyHN0VPMMc7.FillColor = Color3.new(1, 1, 1)
                SyHN0VPMMc7.FillTransparency = 1
                SyHN0VPMMc7.OutlineColor = Color3.fromRGB(128, 0, 128)
                SyHN0VPMMc7.OutlineTransparency = 0
                SyHN0VPMMc7.Parent = QwFL8TNKKa5
                HnWC1KEBBr8[QwFL8TNKKa5] = SyHN0VPMMc7
                
                local TzIO1WQNNd8 = Instance.new("BillboardGui")
                TzIO1WQNNd8.Adornee = RxGM9UOLLb6
                TzIO1WQNNd8.Size = UDim2.fromOffset(120, 30)
                TzIO1WQNNd8.StudsOffset = Vector3.new(0, RxGM9UOLLb6.Size.Y + 2, 0)
                TzIO1WQNNd8.AlwaysOnTop = true
                TzIO1WQNNd8.Parent = RxGM9UOLLb6
                
                local UaJP2XROOe9 = Instance.new("TextLabel")
                UaJP2XROOe9.BackgroundTransparency = 1
                UaJP2XROOe9.TextColor3 = Color3.fromRGB(128, 0, 128)
                UaJP2XROOe9.TextStrokeTransparency = 0.5
                UaJP2XROOe9.TextScaled = true
                UaJP2XROOe9.Font = Enum.Font.SourceSansBold
                UaJP2XROOe9.Size = UDim2.new(1, 0, 1, 0)
                UaJP2XROOe9.Text = "SCP-939 #" .. EkTZ6HBYYo3.SCP939
                UaJP2XROOe9.Parent = TzIO1WQNNd8
                
                IoXD2LFCCs9[QwFL8TNKKa5] = {
                    billboard = TzIO1WQNNd8, 
                    textLabel = UaJP2XROOe9, 
                    entity = QwFL8TNKKa5,
                    entityType = "SCP-939",
                    index = EkTZ6HBYYo3.SCP939
                }
            end
        end
    end
    
    if DjSY5GAXXn2 > 0 then
        NtCI7QKHHx4 = true
        
        JpYE3MGDDt0 = MsBH0PJHHw7.RenderStepped:Connect(function()
            local VbKQ3YSPPf0 = SyHN6VPNNc3.Character and SyHN6VPNNc3.Character:FindFirstChild("HumanoidRootPart")
            if not VbKQ3YSPPf0 then return end
            
            for WcLR4ZTQQg1, XdMS5AURRh2 in pairs(IoXD2LFCCs9) do
                if WcLR4ZTQQg1.Parent and XdMS5AURRh2.billboard.Parent then
                    local YeNT6BVSSi3 = PvEK5SMJJz2(WcLR4ZTQQg1)
                    if YeNT6BVSSi3 then
                        local ZfOU7CWTTj4 = math.floor((VbKQ3YSPPf0.Position - YeNT6BVSSi3).Magnitude + 0.5)
                        XdMS5AURRh2.textLabel.Text = string.format("%s #%d [Distance: %d studs]", XdMS5AURRh2.entityType, XdMS5AURRh2.index, ZfOU7CWTTj4)
                    end
                else
                    if HnWC1KEBBr8[WcLR4ZTQQg1] then
                        HnWC1KEBBr8[WcLR4ZTQQg1]:Destroy()
                        HnWC1KEBBr8[WcLR4ZTQQg1] = nil
                    end
                    IoXD2LFCCs9[WcLR4ZTQQg1] = nil
                end
            end
        end)
        
        local AgPV8DXUUk5 = string.format("Multi-Entity ESP Enabled - Figures: %d, Drakos: %d, SCP-939s: %d", 
            EkTZ6HBYYo3.Figure, EkTZ6HBYYo3.Drakobloxxer, EkTZ6HBYYo3.SCP939)
        spawn(function()
            CiRX2FZWWm9(AgPV8DXUUk5, "success")
        end)
    else
        spawn(function()
            CiRX2FZWWm9("No entities found!", "error")
        end)
    end
end

local function BhQW9EYVVl6()
    if not NtCI7QKHHx4 then
        spawn(function()
            CiRX2FZWWm9("Multi-Entity ESP is not active!", "warning")
        end)
        return
    end
    
    NtCI7QKHHx4 = false
    
    if JpYE3MGDDt0 then
        JpYE3MGDDt0:Disconnect()
        JpYE3MGDDt0 = nil
    end
    
    for _, CiRX0FZWWm7 in pairs(HnWC1KEBBr8) do
        if CiRX0FZWWm7 and CiRX0FZWWm7.Parent then
            CiRX0FZWWm7:Destroy()
        end
    end
    HnWC1KEBBr8 = {}
    
    for _, DjSY1GAXXn8 in pairs(IoXD2LFCCs9) do
        if DjSY1GAXXn8.billboard and DjSY1GAXXn8.billboard.Parent then
            DjSY1GAXXn8.billboard:Destroy()
        end
    end
    IoXD2LFCCs9 = {}
    
    spawn(function()
        CiRX2FZWWm9("Multi-Entity ESP Disabled", "info")
    end)
end

local function EkTZ2HBYYo9()
    local FlUA3ICZZp0 = SyHN6VPNNc3.Character
    if not FlUA3ICZZp0 then
        spawn(function()
            CiRX2FZWWm9("Character not found!", "error")
        end)
        return
    end
    
    local GmVB4JDAaq1 = FlUA3ICZZp0:FindFirstChild("Humanoid")
    if GmVB4JDAaq1 and GmVB4JDAaq1.Health > 0 then
        spawn(function()
            CiRX2FZWWm9("Tried To Revive But Already Alive", "info")
        end)
        return
    end
    
    local HnWC5KEBBr2, IoXD6LFCCs3 = pcall(function()
        KqZF8NHFFu5:WaitForChild("Bricks"):WaitForChild("Revive"):FireServer()
    end)
    
    if HnWC5KEBBr2 then
        spawn(function()
            CiRX2FZWWm9("Revive request sent!", "success")
        end)
    else
        spawn(function()
            CiRX2FZWWm9("Failed to revive: " .. tostring(IoXD6LFCCs3), "error")
        end)
    end
end

local function JpYE7MGDDt4()
    if OuDJ8RLIIy5 then
        spawn(function()
            CiRX2FZWWm9("Multi-Entity tracking is already active!", "warning")
        end)
        return
    end
    
    if WcLR0ZTRRg7 then
        WcLR0ZTRRg7:Disconnect()
    end
    
    OuDJ8RLIIy5 = true
    
    WcLR0ZTRRg7 = MsBH0PJHHw7.Heartbeat:Connect(function()
        local KqZF8NHEEu5, LrAG9OIFFv6 = pcall(function()
            local MsBH0PJGGw7 = SyHN6VPNNc3.Character
            if not MsBH0PJGGw7 then return end
            
            local NtCI1QKIIx8Local = MsBH0PJGGw7:FindFirstChild("HumanoidRootPart")
            if not NtCI1QKIIx8Local then return end
            
            local OuDJ2RLJJy9Local = {}
            local PvEK3SMKKz0Local = math.huge
            local QwFL4TNLLa1Local = false
            
            for _, RxGM5UOMMb2 in ipairs(workspace:GetChildren()) do
                if RxGM5UOMMb2.Name == "Drakobloxxer" then
                    local SyHN6VPNNc3Local = PvEK5SMJJz2(RxGM5UOMMb2)
                    if SyHN6VPNNc3Local then
                        local TzIO7WQOOd4Local = (NtCI1QKIIx8Local.Position - SyHN6VPNNc3Local).magnitude
                        table.insert(OuDJ2RLJJy9Local, {entity = RxGM5UOMMb2, position = SyHN6VPNNc3Local, distance = TzIO7WQOOd4Local, type = "Drakobloxxer"})
                        
                        if TzIO7WQOOd4Local <= 20 then
                            PvEK3SMKKz0Local = math.min(PvEK3SMKKz0Local, TzIO7WQOOd4Local)
                        end
                    end
                end
            end
            
            for _, UaJP8XRPPe5 in ipairs(workspace:GetChildren()) do
                if UaJP8XRPPe5.Name == "939Original" then
                    local VbKQ9YSQQf6Local = PvEK5SMJJz2(UaJP8XRPPe5)
                    if VbKQ9YSQQf6Local then
                        local WcLR0ZTRRg7Local = (NtCI1QKIIx8Local.Position - VbKQ9YSQQf6Local).magnitude
                        table.insert(OuDJ2RLJJy9Local, {entity = UaJP8XRPPe5, position = VbKQ9YSQQf6Local, distance = WcLR0ZTRRg7Local, type = "SCP-939"})
                        
                        if WcLR0ZTRRg7Local <= 20 then
                            PvEK3SMKKz0Local = math.min(PvEK3SMKKz0Local, WcLR0ZTRRg7Local)
                        end
                    end
                end
            end
            
            for _, XdMS1AUSRh8Local in ipairs(workspace:GetChildren()) do
                if XdMS1AUSRh8Local.Name == "FigureSetup" then
                    local YeNT2BVSSi9Local = XdMS1AUSRh8Local:FindFirstChild("FigureRagdoll")
                    if YeNT2BVSSi9Local then
                        local ZfOU3CWTTj0Local = PvEK5SMJJz2(YeNT2BVSSi9Local)
                        if ZfOU3CWTTj0Local then
                            local AgPV4DXUUk1Local = (NtCI1QKIIx8Local.Position - ZfOU3CWTTj0Local).magnitude
                            table.insert(OuDJ2RLJJy9Local, {entity = YeNT2BVSSi9Local, position = ZfOU3CWTTj0Local, distance = AgPV4DXUUk1Local, type = "Figure"})
                            
                            if AgPV4DXUUk1Local <= 20 then
                                PvEK3SMKKz0Local = math.min(PvEK3SMKKz0Local, AgPV4DXUUk1Local)
                            end
                        end
                    end
                end
            end
            
            if PvEK3SMKKz0Local <= 20 then
                if ZfOU5CWTTj2(OuDJ2RLJJy9Local) then
                    NtCI1QKIIx8Local.CFrame = XdMS7AURRh4
                    spawn(function()
                        CiRX2FZWWm9("Both safe positions blocked! Teleported to Door", "warning")
                    end)
                    return
                end
                
                local BhQW5EYVVl2Local = nil
                local CiRX6FZWWm3Local = 0
                
                for _, DjSY7GAXXn4Local in ipairs(WcLR6ZTQQg3) do
                    local EkTZ8HBYYo5Local = math.huge
                    
                    for _, FlUA9ICZZp6Local in ipairs(OuDJ2RLJJy9Local) do
                        if FlUA9ICZZp6Local.distance <= 25 then
                            local GmVB0JDAaq7Local = (DjSY7GAXXn4Local.Position - FlUA9ICZZp6Local.position).Magnitude
                            EkTZ8HBYYo5Local = math.min(EkTZ8HBYYo5Local, GmVB0JDAaq7Local)
                        end
                    end
                    
                    if EkTZ8HBYYo5Local > CiRX6FZWWm3Local then
                        CiRX6FZWWm3Local = EkTZ8HBYYo5Local
                        BhQW5EYVVl2Local = DjSY7GAXXn4Local
                    end
                end
                
                if BhQW5EYVVl2Local then
                    NtCI1QKIIx8Local.CFrame = BhQW5EYVVl2Local
                    
                    local HnWC1KEBBr8Local = "Unknown"
                    for _, IoXD2LFCCs9Local in ipairs(OuDJ2RLJJy9Local) do
                        if IoXD2LFCCs9Local.distance <= 20 then
                            HnWC1KEBBr8Local = IoXD2LFCCs9Local.type
                            break
                        end
                    end
                    
                    spawn(function()
                        CiRX2FZWWm9(HnWC1KEBBr8Local .. " detected! Teleported to safe position", "warning")
                    end)
                end
            end
            
            for _, JpYE3MGDDt0Local in ipairs(workspace:GetChildren()) do
                if JpYE3MGDDt0Local.Name == "FigureSetup" then
                    local KqZF4NHEEu1Local = JpYE3MGDDt0Local:FindFirstChild("FigureRagdoll")
                    if KqZF4NHEEu1Local then
                        local LrAG5OIFFv2Local = KqZF4NHEEu1Local:FindFirstChild("Torso")
                        if LrAG5OIFFv2Local then
                            local MsBH6PJGGw3Local = (NtCI1QKIIx8Local.Position - LrAG5OIFFv2Local.Position).magnitude
                            
                            if MsBH6PJGGw3Local >= 15 and MsBH6PJGGw3Local <= 20 then
                                XdMS1AUSRh8 = XdMS1AUSRh8 == 1 and 2 or 1
                                NtCI1QKIIx8Local.CFrame = WcLR6ZTQQg3[XdMS1AUSRh8]
                            elseif MsBH6PJGGw3Local < 15 then
                                XdMS1AUSRh8 = XdMS1AUSRh8 == 1 and 2 or 1
                                NtCI1QKIIx8Local.CFrame = WcLR6ZTQQg3[XdMS1AUSRh8]
                            end
                            break
                        end
                    end
                end
            end
        end)
    end)
    
    spawn(function()
        CiRX2FZWWm9("Multi-Entity tracking started (Figure/Drako/SCP-939)", "success")
    end)
end

local function NtCI7QKHHx4Stop()
    if not OuDJ8RLIIy5 then
        spawn(function()
            CiRX2FZWWm9("Multi-Entity tracking is not active!", "warning")
        end)
        return
    end
    
    OuDJ8RLIIy5 = false
    
    if WcLR0ZTRRg7 then
        WcLR0ZTRRg7:Disconnect()
        WcLR0ZTRRg7 = nil
        spawn(function()
            CiRX2FZWWm9("Multi-Entity tracking stopped", "info")
        end)
    end
end

local function OuDJ0RLIIy7()
    local PvEK1SMJJz8 = SyHN6VPNNc3.Character
    if not PvEK1SMJJz8 then
        spawn(function()
            CiRX2FZWWm9("Character not found!", "error")
        end)
        return
    end
    
    local QwFL2TNKKa9 = PvEK1SMJJz8:FindFirstChild("HumanoidRootPart")
    if not QwFL2TNKKa9 then
        spawn(function()
            CiRX2FZWWm9("HumanoidRootPart not found!", "error")
        end)
        return
    end
    
    QwFL2TNKKa9.CFrame = XdMS7AURRh4
    spawn(function()
        CiRX2FZWWm9("Teleported to Door", "success")
    end)
end

local function RxGM3UOLLb0()
    local SyHN4VPMMc1 = SyHN6VPNNc3.Character
    if not SyHN4VPMMc1 then
        spawn(function()
            CiRX2FZWWm9("Character not found!", "error")
        end)
        return
    end
    
    local TzIO5WQNNd2 = SyHN4VPMMc1:FindFirstChild("HumanoidRootPart")
    if not TzIO5WQNNd2 then
        spawn(function()
            CiRX2FZWWm9("HumanoidRootPart not found!", "error")
        end)
        return
    end
    
    local UaJP6XROOe3 = CFrame.new(
        -53.6578979, 11.3413105, -21.9969749,
        0.423553586, -0.90396452, -0.0587408952,
        0.1525819, 0.00727360509, 0.988264024,
        -0.892928481, -0.427545547, 0.141009375
    )
    
    TzIO5WQNNd2.CFrame = UaJP6XROOe3
    spawn(function()
        CiRX2FZWWm9("Teleported to BPaper", "success")
    end)
end

local function VbKQ7YSPPf4()
    BhQW5EYVVl2 = false
    if ZfOU3CWTTj0 then
        ZfOU3CWTTj0:Disconnect()
        ZfOU3CWTTj0 = nil
        spawn(function()
            CiRX2FZWWm9("WalkSpeed loop stopped", "info")
        end)
    end
    
    local WcLR8ZTQQg5 = SyHN6VPNNc3.Character
    if WcLR8ZTQQg5 then
        local XdMS9AURRh6 = WcLR8ZTQQg5:FindFirstChild("Humanoid")
        if XdMS9AURRh6 then
            XdMS9AURRh6.WalkSpeed = 16
            spawn(function()
                CiRX2FZWWm9("WalkSpeed reset to 16", "success")
            end)
        end
    end
end

local function YeNT0BVSSi7(ZfOU1CWTTj8)
    local AgPV2DXUUk9 = tonumber(ZfOU1CWTTj8)
    if not AgPV2DXUUk9 then
        spawn(function()
            CiRX2FZWWm9("Invalid WalkSpeed value!", "error")
        end)
        return
    end
    
    if ZfOU3CWTTj0 then
        ZfOU3CWTTj0:Disconnect()
        ZfOU3CWTTj0 = nil
    end
    
    AgPV4DXUUk1 = AgPV2DXUUk9
    BhQW5EYVVl2 = true
    
    ZfOU3CWTTj0 = MsBH0PJHHw7.RenderStepped:Connect(function()
        if BhQW5EYVVl2 and SyHN6VPNNc3.Character and SyHN6VPNNc3.Character:FindFirstChild("Humanoid") then
            SyHN6VPNNc3.Character.Humanoid.WalkSpeed = AgPV4DXUUk1
        end
    end)
    
    spawn(function()
        CiRX2FZWWm9("WalkSpeed set to " .. AgPV2DXUUk9, "success")
    end)
end

local function BhQW3EYVVl0()
    local CiRX4FZWWm1 = SyHN6VPNNc3.Character
    if not CiRX4FZWWm1 then
        spawn(function()
            CiRX2FZWWm9("Character not found!", "error")
        end)
        return
    end
    
    local DjSY5GAXXn2 = CiRX4FZWWm1:FindFirstChild("HumanoidRootPart")
    if not DjSY5GAXXn2 then
        spawn(function()
            CiRX2FZWWm9("HumanoidRootPart not found!", "error")
        end)
        return
    end
    
    local EkTZ6HBYYo3, FlUA7ICZZp4 = pcall(function()
        DjSY5GAXXn2.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        DjSY5GAXXn2.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        
        if DjSY5GAXXn2.Velocity then
            DjSY5GAXXn2.Velocity = Vector3.new(0, 0, 0)
        end
        
        local GmVB8JDAaq5 = CiRX4FZWWm1:FindFirstChild("Humanoid")
        if GmVB8JDAaq5 then
            GmVB8JDAaq5.PlatformStand = false
        end
        
        for _, HnWC9KEBBr6 in pairs(DjSY5GAXXn2:GetChildren()) do
            if HnWC9KEBBr6:IsA("BodyVelocity") or HnWC9KEBBr6:IsA("BodyPosition") or HnWC9KEBBr6:IsA("BodyAngularVelocity") or HnWC9KEBBr6:IsA("BodyThrust") or HnWC9KEBBr6:IsA("BodyForce") then
                HnWC9KEBBr6:Destroy()
            end
        end
    end)
    
    if EkTZ6HBYYo3 then
        spawn(function()
            CiRX2FZWWm9("Player velocity broken!", "success")
        end)
    else
        spawn(function()
            CiRX2FZWWm9("Failed to break velocity: " .. tostring(FlUA7ICZZp4), "error")
        end)
    end
end

local function IoXD0LFCCs7()
    if PvEK9SMJJz6 then
        spawn(function()
            CiRX2FZWWm9("Full Bright is already active!", "warning")
        end)
        return
    end
    
    PvEK9SMJJz6 = true
    
    OuDJ2RLJJy9.Brightness = 2
    OuDJ2RLJJy9.Ambient = Color3.fromRGB(255, 255, 255)
    OuDJ2RLJJy9.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
    OuDJ2RLJJy9.ColorShift_Top = Color3.fromRGB(255, 255, 255)
    OuDJ2RLJJy9.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    OuDJ2RLJJy9.ShadowSoftness = 0
    
    spawn(function()
        CiRX2FZWWm9("Full Bright Enabled", "success")
    end)
end

local function JpYE1MGDDt8()
    if not PvEK9SMJJz6 then
        spawn(function()
            CiRX2FZWWm9("Full Bright is not active!", "warning")
        end)
        return
    end
    
    PvEK9SMJJz6 = false
    
    OuDJ2RLJJy9.Brightness = DjSY7GAXXn4.Brightness
    OuDJ2RLJJy9.Ambient = DjSY7GAXXn4.Ambient
    OuDJ2RLJJy9.ColorShift_Bottom = DjSY7GAXXn4.ColorShift_Bottom
    OuDJ2RLJJy9.ColorShift_Top = DjSY7GAXXn4.ColorShift_Top
    OuDJ2RLJJy9.OutdoorAmbient = DjSY7GAXXn4.OutdoorAmbient
    OuDJ2RLJJy9.ShadowSoftness = DjSY7GAXXn4.ShadowSoftness
    
    spawn(function()
        CiRX2FZWWm9("Full Bright Disabled", "info")
    end)
end

local function KqZF2NHEEu9()
    if QwFL0TNKKa7 then
        spawn(function()
            CiRX2FZWWm9("Noclip is already active!", "warning")
        end)
        return
    end
    
    QwFL0TNKKa7 = true
    KqZF4NHEEu1 = true
    
    LrAG5OIFFv2 = MsBH0PJHHw7.Stepped:Connect(function()
        if KqZF4NHEEu1 and SyHN6VPNNc3.Character then
            for _, LrAG3OIFFv0 in pairs(SyHN6VPNNc3.Character:GetDescendants()) do
                if LrAG3OIFFv0:IsA("BasePart") and LrAG3OIFFv0.CanCollide then
                    LrAG3OIFFv0.CanCollide = false
                end
            end
        end
    end)
    
    spawn(function()
        CiRX2FZWWm9("Noclip Enabled", "success")
    end)
end

local function MsBH4PJGGw1()
    if not QwFL0TNKKa7 then
        spawn(function()
            CiRX2FZWWm9("Noclip is not active!", "warning")
        end)
        return
    end
    
    QwFL0TNKKa7 = false
    KqZF4NHEEu1 = false
    
    if LrAG5OIFFv2 then
        LrAG5OIFFv2:Disconnect()
        LrAG5OIFFv2 = nil
    end
    
    if SyHN6VPNNc3.Character then
        for _, NtCI5QKHHx2 in pairs(SyHN6VPNNc3.Character:GetDescendants()) do
            if NtCI5QKHHx2:IsA("BasePart") and NtCI5QKHHx2.Name ~= "HumanoidRootPart" then
                NtCI5QKHHx2.CanCollide = true
            end
        end
    end
    
    spawn(function()
        CiRX2FZWWm9("Noclip Disabled", "success")
    end)
end

-- GUI Creation
local OuDJ6RLIIy3 = Instance.new("ScreenGui")
OuDJ6RLIIy3.Name = "BookshelfControlGui"
OuDJ6RLIIy3.ResetOnSpawn = false
OuDJ6RLIIy3.Parent = PvEK3SMKKz0

local PvEK7SMJJz4 = Instance.new("UIScale")
PvEK7SMJJz4.Scale = 0.8
PvEK7SMJJz4.Parent = OuDJ6RLIIy3

local QwFL8TNKKa5 = Instance.new("Frame")
QwFL8TNKKa5.Name = "MainFrame"
QwFL8TNKKa5.Size = UDim2.new(0, 240, 0, 280)
QwFL8TNKKa5.Position = UDim2.new(0, 20, 0.5, -140)
QwFL8TNKKa5.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
QwFL8TNKKa5.BorderSizePixel = 0
QwFL8TNKKa5.BackgroundTransparency = 1
QwFL8TNKKa5.Parent = OuDJ6RLIIy3

NtCI1QKIIx8:Create(QwFL8TNKKa5, UaJP4XROOe1, {
    BackgroundTransparency = 0
}):Play()

local RxGM9UOLLb6 = Instance.new("UICorner")
RxGM9UOLLb6.CornerRadius = UDim.new(0, 15)
RxGM9UOLLb6.Parent = QwFL8TNKKa5

local SyHN0VPMMc7 = Instance.new("UIStroke")
SyHN0VPMMc7.Color = Color3.fromRGB(138, 43, 226)
SyHN0VPMMc7.Thickness = 2
SyHN0VPMMc7.Parent = QwFL8TNKKa5

local TzIO1WQNNd8 = Instance.new("TextLabel")
TzIO1WQNNd8.Name = "TitleLabel"
TzIO1WQNNd8.Size = UDim2.new(1, 0, 0, 50)
TzIO1WQNNd8.Position = UDim2.new(0, 0, 0, 0)
TzIO1WQNNd8.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
TzIO1WQNNd8.BorderSizePixel = 0
TzIO1WQNNd8.Text = "Figure's Library"
TzIO1WQNNd8.TextColor3 = Color3.fromRGB(255, 255, 255)
TzIO1WQNNd8.TextSize = 22
TzIO1WQNNd8.Font = Enum.Font.SourceSansBold
TzIO1WQNNd8.TextTransparency = 1
TzIO1WQNNd8.Parent = QwFL8TNKKa5

NtCI1QKIIx8:Create(TzIO1WQNNd8, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    TextTransparency = 0
}):Play()

local UaJP2XROOe9 = Instance.new("UICorner")
UaJP2XROOe9.CornerRadius = UDim.new(0, 15)
UaJP2XROOe9.Parent = TzIO1WQNNd8

local VbKQ3YSPPf0 = Instance.new("TextButton")
VbKQ3YSPPf0.Name = "MinimizeButton"
VbKQ3YSPPf0.Size = UDim2.new(0, 30, 0, 30)
VbKQ3YSPPf0.Position = UDim2.new(0, 10, 0, 10)
VbKQ3YSPPf0.BackgroundTransparency = 1
VbKQ3YSPPf0.Text = "-"
VbKQ3YSPPf0.TextColor3 = Color3.fromRGB(255, 255, 255)
VbKQ3YSPPf0.TextSize = 24
VbKQ3YSPPf0.Font = Enum.Font.SourceSansBold
VbKQ3YSPPf0.TextTransparency = 1
VbKQ3YSPPf0.Parent = TzIO1WQNNd8

NtCI1QKIIx8:Create(VbKQ3YSPPf0, TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
    TextTransparency = 0
}):Play()

local WcLR4ZTQQg1 = Instance.new("ScrollingFrame")
WcLR4ZTQQg1.Name = "Page1ScrollFrame"
WcLR4ZTQQg1.Size = UDim2.new(1, -30, 1, -70)
WcLR4ZTQQg1.Position = UDim2.new(0, 15, 0, 60)
WcLR4ZTQQg1.BackgroundTransparency = 1
WcLR4ZTQQg1.BorderSizePixel = 0
WcLR4ZTQQg1.ScrollBarThickness = 6
WcLR4ZTQQg1.ScrollBarImageColor3 = Color3.fromRGB(138, 43, 226)
WcLR4ZTQQg1.CanvasSize = UDim2.new(0, 0, 0, 0)
WcLR4ZTQQg1.Parent = QwFL8TNKKa5

local XdMS5AURRh2 = Instance.new("UIListLayout")
XdMS5AURRh2.FillDirection = Enum.FillDirection.Vertical
XdMS5AURRh2.HorizontalAlignment = Enum.HorizontalAlignment.Center
XdMS5AURRh2.VerticalAlignment = Enum.VerticalAlignment.Top
XdMS5AURRh2.Padding = UDim.new(0, 15)
XdMS5AURRh2.Parent = WcLR4ZTQQg1

XdMS5AURRh2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    WcLR4ZTQQg1.CanvasSize = UDim2.new(0, 0, 0, XdMS5AURRh2.AbsoluteContentSize.Y + 50)
end)

local YeNT6BVSSi3 = Instance.new("ScrollingFrame")
YeNT6BVSSi3.Name = "Page2ScrollFrame"
YeNT6BVSSi3.Size = UDim2.new(1, -30, 1, -70)
YeNT6BVSSi3.Position = UDim2.new(0, 15, 0, 60)
YeNT6BVSSi3.BackgroundTransparency = 1
YeNT6BVSSi3.BorderSizePixel = 0
YeNT6BVSSi3.ScrollBarThickness = 6
YeNT6BVSSi3.ScrollBarImageColor3 = Color3.fromRGB(138, 43, 226)
YeNT6BVSSi3.CanvasSize = UDim2.new(0, 0, 0, 0)
YeNT6BVSSi3.Visible = false
YeNT6BVSSi3.Parent = QwFL8TNKKa5

local ZfOU7CWTTj4 = Instance.new("UIListLayout")
ZfOU7CWTTj4.FillDirection = Enum.FillDirection.Vertical
ZfOU7CWTTj4.HorizontalAlignment = Enum.HorizontalAlignment.Center
ZfOU7CWTTj4.VerticalAlignment = Enum.VerticalAlignment.Top
ZfOU7CWTTj4.Padding = UDim.new(0, 15)
ZfOU7CWTTj4.Parent = YeNT6BVSSi3

ZfOU7CWTTj4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    YeNT6BVSSi3.CanvasSize = UDim2.new(0, 0, 0, ZfOU7CWTTj4.AbsoluteContentSize.Y + 50)
end)

local AgPV8DXUUk5 = Instance.new("TextBox")
AgPV8DXUUk5.Name = "WalkSpeedTextBox"
AgPV8DXUUk5.Size = UDim2.new(1, 0, 0, 50)
AgPV8DXUUk5.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
AgPV8DXUUk5.TextColor3 = Color3.fromRGB(255, 255, 255)
AgPV8DXUUk5.PlaceholderText = "Enter WalkSpeed..."
AgPV8DXUUk5.Text = ""
AgPV8DXUUk5.Font = Enum.Font.SourceSans
AgPV8DXUUk5.TextSize = 16
AgPV8DXUUk5.BorderSizePixel = 0
AgPV8DXUUk5.LayoutOrder = 0
AgPV8DXUUk5.Parent = YeNT6BVSSi3

local BhQW9EYVVl6 = Instance.new("UICorner")
BhQW9EYVVl6.CornerRadius = UDim.new(0, 10)
BhQW9EYVVl6.Parent = AgPV8DXUUk5

local CiRX0FZWWm7 = Instance.new("UIStroke")
CiRX0FZWWm7.Color = Color3.fromRGB(138, 43, 226)
CiRX0FZWWm7.Transparency = 0.7
CiRX0FZWWm7.Thickness = 1
CiRX0FZWWm7.Parent = AgPV8DXUUk5

local function DjSY1GAXXn8(EkTZ2HBYYo9, FlUA3ICZZp0, GmVB4JDAaq1)
    local HnWC5KEBBr2 = Instance.new("TextButton")
    HnWC5KEBBr2.Size = UDim2.new(1, 0, 0, 50)
    HnWC5KEBBr2.BackgroundColor3 = FlUA3ICZZp0
    HnWC5KEBBr2.TextColor3 = Color3.fromRGB(255, 255, 255)
    HnWC5KEBBr2.Text = EkTZ2HBYYo9
    HnWC5KEBBr2.Font = Enum.Font.SourceSansBold
    HnWC5KEBBr2.TextSize = 16
    HnWC5KEBBr2.BorderSizePixel = 0
    HnWC5KEBBr2.BackgroundTransparency = 1
    
    local IoXD6LFCCs3 = Instance.new("UICorner")
    IoXD6LFCCs3.CornerRadius = UDim.new(0, 10)
    IoXD6LFCCs3.Parent = HnWC5KEBBr2
    
    local JpYE7MGDDt4 = Instance.new("UIStroke")
    JpYE7MGDDt4.Color = Color3.fromRGB(138, 43, 226)
    JpYE7MGDDt4.Transparency = 0.7
    JpYE7MGDDt4.Thickness = 1
    JpYE7MGDDt4.Parent = HnWC5KEBBr2
    
    local KqZF8NHEEu5 = HnWC5KEBBr2.Size
    local LrAG9OIFFv6 = HnWC5KEBBr2.BackgroundColor3
    
    NtCI1QKIIx8:Create(HnWC5KEBBr2, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0
    }):Play()
    
    HnWC5KEBBr2.MouseButton1Down:Connect(function()
        ZfOU9CWTTj6("6895079853")
        local MsBH0PJGGw7 = UDim2.new(KqZF8NHEEu5.X.Scale * 0.94, KqZF8NHEEu5.X.Offset, KqZF8NHEEu5.Y.Scale * 0.94, KqZF8NHEEu5.Y.Offset)
        NtCI1QKIIx8:Create(HnWC5KEBBr2, RxGM1UOLLb8, {
            Size = MsBH0PJGGw7,
            BackgroundColor3 = Color3.new(
                LrAG9OIFFv6.R * 0.6,
                LrAG9OIFFv6.G * 0.6,
                LrAG9OIFFv6.B * 0.6
            )
        }):Play()
    end)
    
    HnWC5KEBBr2.MouseButton1Up:Connect(function()
        NtCI1QKIIx8:Create(HnWC5KEBBr2, SyHN2VPMMc9, {
            Size = KqZF8NHEEu5,
            BackgroundColor3 = LrAG9OIFFv6
        }):Play()
    end)
    
    HnWC5KEBBr2.MouseEnter:Connect(function()
        NtCI1QKIIx8:Create(HnWC5KEBBr2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.new(
                math.min(LrAG9OIFFv6.R * 1.3, 1),
                math.min(LrAG9OIFFv6.G * 1.3, 1),
                math.min(LrAG9OIFFv6.B * 1.3, 1)
            ),
            Size = UDim2.new(KqZF8NHEEu5.X.Scale * 1.02, KqZF8NHEEu5.X.Offset, KqZF8NHEEu5.Y.Scale, KqZF8NHEEu5.Y.Offset)
        }):Play()
        NtCI1QKIIx8:Create(JpYE7MGDDt4, TweenInfo.new(0.3), {
            Transparency = 0.2
        }):Play()
    end)
    
    HnWC5KEBBr2.MouseLeave:Connect(function()
        NtCI1QKIIx8:Create(HnWC5KEBBr2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            BackgroundColor3 = LrAG9OIFFv6,
            Size = KqZF8NHEEu5
        }):Play()
        NtCI1QKIIx8:Create(JpYE7MGDDt4, TweenInfo.new(0.3), {
            Transparency = 0.7
        }):Play()
    end)
    
    HnWC5KEBBr2.MouseButton1Click:Connect(GmVB4JDAaq1)
    return HnWC5KEBBr2
end

local function GoToNextPage()
    WcLR4ZTQQg1.Visible = false
    YeNT6BVSSi3.Visible = true
    YeNT6BVSSi3.Position = UDim2.new(1, 15, 0, 60)
    NtCI1QKIIx8:Create(YeNT6BVSSi3, VbKQ5YSPPf2, {
        Position = UDim2.new(0, 15, 0, 60)
    }):Play()
end

local function GoBackPage()
    WcLR4ZTQQg1.Visible = true
    YeNT6BVSSi3.Visible = false
    WcLR4ZTQQg1.Position = UDim2.new(-1, 15, 0, 60)
    NtCI1QKIIx8:Create(WcLR4ZTQQg1, VbKQ5YSPPf2, {
        Position = UDim2.new(0, 15, 0, 60)
    }):Play()
end

local function ToggleMinimize()
    if CiRX6FZWWm3 then
        NtCI1QKIIx8:Create(QwFL8TNKKa5, VbKQ5YSPPf2, {
            Size = UDim2.new(0, 240, 0, 280)
        }):Play()
        WcLR4ZTQQg1.Visible = true
        YeNT6BVSSi3.Visible = false
        VbKQ3YSPPf0.Text = "-"
        CiRX6FZWWm3 = false
    else
        NtCI1QKIIx8:Create(QwFL8TNKKa5, VbKQ5YSPPf2, {
            Size = UDim2.new(0, 240, 0, 50)
        }):Play()
        WcLR4ZTQQg1.Visible = false
        YeNT6BVSSi3.Visible = false
        VbKQ3YSPPf0.Text = "+"
        CiRX6FZWWm3 = true
    end
end

VbKQ3YSPPf0.MouseButton1Click:Connect(ToggleMinimize)

-- Create all buttons
local QwFL4TNLLa1 = DjSY1GAXXn8("Bookshelf ESP", Color3.fromRGB(40, 40, 50), JpYE5MGDDt2)
QwFL4TNLLa1.LayoutOrder = 1
QwFL4TNLLa1.Parent = WcLR4ZTQQg1

local RxGM5UOMMb2 = DjSY1GAXXn8("No Bookshelf ESP", Color3.fromRGB(40, 40, 50), XdMS9AURRh6)
RxGM5UOMMb2.LayoutOrder = 2
RxGM5UOMMb2.Parent = WcLR4ZTQQg1

local SyHN6VPNNc3 = DjSY1GAXXn8("Start Multi-Entity Track", Color3.fromRGB(40, 40, 50), JpYE7MGDDt4)
SyHN6VPNNc3.LayoutOrder = 3
SyHN6VPNNc3.Parent = WcLR4ZTQQg1

local TzIO7WQOOd4 = DjSY1GAXXn8("Stop Multi-Entity Track", Color3.fromRGB(40, 40, 50), NtCI7QKHHx4Stop)
TzIO7WQOOd4.LayoutOrder = 4
TzIO7WQOOd4.Parent = WcLR4ZTQQg1

local UaJP8XRPPe5 = DjSY1GAXXn8("Multi-Entity ESP", Color3.fromRGB(40, 40, 50), AgPV2DXUUk9)
UaJP8XRPPe5.LayoutOrder = 5
UaJP8XRPPe5.Parent = WcLR4ZTQQg1

local VbKQ9YSQQf6 = DjSY1GAXXn8("No Multi-Entity ESP", Color3.fromRGB(40, 40, 50), BhQW9EYVVl6)
VbKQ9YSQQf6.LayoutOrder = 6
VbKQ9YSQQf6.Parent = WcLR4ZTQQg1

local WcLR0ZTRRg7 = DjSY1GAXXn8("Full Bright", Color3.fromRGB(40, 40, 50), IoXD0LFCCs7)
WcLR0ZTRRg7.LayoutOrder = 7
WcLR0ZTRRg7.Parent = WcLR4ZTQQg1

local XdMS1AUSRh8 = DjSY1GAXXn8("No Full Bright", Color3.fromRGB(40, 40, 50), JpYE1MGDDt8)
XdMS1AUSRh8.LayoutOrder = 8
XdMS1AUSRh8.Parent = WcLR4ZTQQg1

local YeNT2BVSSi9 = DjSY1GAXXn8("Revive", Color3.fromRGB(40, 40, 50), EkTZ2HBYYo9)
YeNT2BVSSi9.LayoutOrder = 9
YeNT2BVSSi9.Parent = WcLR4ZTQQg1

local ZfOU3CWTTj0 = DjSY1GAXXn8("TP To Door", Color3.fromRGB(40, 40, 50), OuDJ0RLIIy7)
ZfOU3CWTTj0.LayoutOrder = 10
ZfOU3CWTTj0.Parent = WcLR4ZTQQg1

local AgPV4DXUUk1 = DjSY1GAXXn8("TP To BPaper", Color3.fromRGB(40, 40, 50), RxGM3UOLLb0)
AgPV4DXUUk1.LayoutOrder = 11
AgPV4DXUUk1.Parent = WcLR4ZTQQg1

local BhQW5EYVVl2 = DjSY1GAXXn8("Go To Next Page", Color3.fromRGB(40, 40, 50), GoToNextPage)
BhQW5EYVVl2.LayoutOrder = 12
BhQW5EYVVl2.Parent = WcLR4ZTQQg1

local CiRX6FZWWm3 = DjSY1GAXXn8("Apply WalkSpeed", Color3.fromRGB(40, 40, 50), function()
    YeNT0BVSSi7(AgPV8DXUUk5.Text)
end)
CiRX6FZWWm3.LayoutOrder = 1
CiRX6FZWWm3.Parent = YeNT6BVSSi3

local DjSY7GAXXn4 = DjSY1GAXXn8("Reset WalkSpeed", Color3.fromRGB(40, 40, 50), VbKQ7YSPPf4)
DjSY7GAXXn4.LayoutOrder = 2
DjSY7GAXXn4.Parent = YeNT6BVSSi3

local EkTZ8HBYYo5 = DjSY1GAXXn8("Break Velocity", Color3.fromRGB(40, 40, 50), BhQW3EYVVl0)
EkTZ8HBYYo5.LayoutOrder = 3
EkTZ8HBYYo5.Parent = YeNT6BVSSi3

local FlUA9ICZZp6 = DjSY1GAXXn8("Noclip", Color3.fromRGB(40, 40, 50), KqZF2NHEEu9)
FlUA9ICZZp6.LayoutOrder = 4
FlUA9ICZZp6.Parent = YeNT6BVSSi3

local GmVB0JDAaq7 = DjSY1GAXXn8("No Noclip", Color3.fromRGB(40, 40, 50), MsBH4PJGGw1)
GmVB0JDAaq7.LayoutOrder = 5
GmVB0JDAaq7.Parent = YeNT6BVSSi3

local HnWC1KEBBr8 = DjSY1GAXXn8("Go Back", Color3.fromRGB(40, 40, 50), GoBackPage)
HnWC1KEBBr8.LayoutOrder = 6
HnWC1KEBBr8.Parent = YeNT6BVSSi3

-- Dragging functionality
local IoXD2LFCCs9 = nil
local JpYE3MGDDt0 = 0.25
local KqZF4NHEEu1 = nil
local LrAG5OIFFv2 = nil

local function MsBH6PJGGw3(NtCI7QKHHx4)
    local OuDJ8RLIIy5 = NtCI7QKHHx4.Position - KqZF4NHEEu1
    local PvEK9SMJJz6 = UDim2.new(LrAG5OIFFv2.X.Scale, LrAG5OIFFv2.X.Offset + OuDJ8RLIIy5.X, LrAG5OIFFv2.Y.Scale, LrAG5OIFFv2.Y.Offset + OuDJ8RLIIy5.Y)
    NtCI1QKIIx8:Create(QwFL8TNKKa5, TweenInfo.new(JpYE3MGDDt0), {Position = PvEK9SMJJz6}):Play()
end

TzIO1WQNNd8.InputBegan:Connect(function(QwFL0TNKKa7)
    if (QwFL0TNKKa7.UserInputType == Enum.UserInputType.MouseButton1 or QwFL0TNKKa7.UserInputType == Enum.UserInputType.Touch) then
        IoXD2LFCCs9 = true
        KqZF4NHEEu1 = QwFL0TNKKa7.Position
        LrAG5OIFFv2 = QwFL8TNKKa5.Position
        
        QwFL0TNKKa7.Changed:Connect(function()
            if QwFL0TNKKa7.UserInputState == Enum.UserInputState.End then
                IoXD2LFCCs9 = false
            end
        end)
    end
end)

TzIO1WQNNd8.InputChanged:Connect(function(RxGM1UOLLb8)
    if (RxGM1UOLLb8.UserInputType == Enum.UserInputType.MouseMovement or RxGM1UOLLb8.UserInputType == Enum.UserInputType.Touch) then
        if IoXD2LFCCs9 then
            MsBH6PJGGw3(RxGM1UOLLb8)
        end
    end
end)
