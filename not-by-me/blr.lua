game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Carregando BLR.lua...")

if game.PlaceId ~= 18668065416 then
    local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    game.Players.LocalPlayer:Kick("O jogo que você está jogando: " .. info.Name .. " não é suportado")
end

print("[TASKER]: Loading (0%)")

local repo = "https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

print("[TASKER]: Loading (10%)

local Options, Toggles = Library.Options, Library.Toggles
local Window = Library:CreateWindow({
    Title = "Nick's Place | Blue Lock Rivals",
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

print("[TASKER]: Loading (20%)

local Tabs = {
    Main = Window:AddTab("Principal"),
    Visuals = Window:AddTab("Visuais"),
    Exploits = Window:AddTab("Exploits")
end


        
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local VirtualUser = game:GetService("VirtualUser")

local function notify(text)
    Library:Notify(text, 5)
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://8551372796"
    s.Volume = 2
    s.Parent = workspace
    s:Play()
    game:GetService("Debris"):AddItem(s, 5)
end

local lightingDefaults = {
    Brightness = Lighting.Brightness,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    FogStart = Lighting.FogStart,
    FogColor = Lighting.FogColor
}

local playerGroup = Tabs.Main:AddLeftGroupbox("Jogador")
playerGroup:AddSlider("WalkSpeed", {Text = "Velocidade", Default = 16, Min = 16, Max = 80, Rounding = 0})

local utilsGroup = Tabs.Main:AddRightGroupbox("Utilitários")
utilsGroup:AddToggle("AntiKick", {Text="Bloquear Kick", Default=false})
utilsGroup:AddToggle("AntiAFK", {Text="Anti-AFK", Default=false})
utilsGroup:AddToggle("AntiVoid", {Text="Proteção contra Void", Default=false})
utilsGroup:AddToggle("Noclip", {Text="Noclip (Atravessar Paredes)", Default=false})

local cameraGroup = Tabs.Visuals:AddLeftGroupbox("Câmera")
cameraGroup:AddSlider("FOV", {Text = "Campo de Visão (FOV)", Default = 70, Min = 70, Max = 180, Rounding = 0})
cameraGroup:AddToggle("FullBright", {Text = "Luz Total", Default = false})
cameraGroup:AddToggle("NoFog", {Text = "Sem Névoa", Default = false})

local ESPGroup = Tabs.Visuals:AddLeftGroupbox("ESP")
ESPGroup:AddToggle("BolaESP", {Text = "ESP Bola", Default = false})
ESPGroup:AddToggle("PlayerESP", {Text = "ESP Jogador", Default = false})

local aimGroup = Tabs.Exploits:AddLeftGroupbox("Mira")
aimGroup:AddToggle("AimLockBall", {Text = "Travar Mira (Com Bola)", Default = false})

local helperGroup = Tabs.Exploits:AddLeftGroupbox("Assistente")
helperGroup:AddToggle("NotifyBall", {Text = "Avisar Quem Tem a Bola", Default = false})

local bolaESP = {}
local playerESP = {}
local lastHolder = nil
local aimTarget = nil

local function enableBolaESP()
    local ball = workspace:FindFirstChild("Football")
    if not ball then return end
    local highlight = Instance.new("Highlight")
    highlight.Adornee = ball
    highlight.FillTransparency = 1
    highlight.OutlineTransparency = 0
    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
    highlight.Parent = ball
    local espText = Drawing.new("Text")
    espText.Size = 16
    espText.Center = true
    espText.Outline = true
    espText.OutlineColor = Color3.fromRGB(0, 0, 0)
    espText.Color = Color3.fromRGB(0, 255, 0)
    espText.Text = "Bola"
    espText.Visible = true
    bolaESP.Highlight = highlight
    bolaESP.Text = espText
    bolaESP.Conn = RunService.RenderStepped:Connect(function()
        if Toggles.BolaESP.Value and ball and ball:IsDescendantOf(workspace) then
            local pos, onScreen = Camera:WorldToViewportPoint(ball.Position + Vector3.new(0, (ball.Size and ball.Size.Y or 2)/2 + 2, 0))
            espText.Visible = onScreen
            if onScreen then espText.Position = Vector2.new(pos.X, pos.Y) end
        else
            espText.Visible = false
        end
    end)
end

local function disableBolaESP()
    if bolaESP.Conn then bolaESP.Conn:Disconnect() end
    if bolaESP.Text then bolaESP.Text:Remove() end
    if bolaESP.Highlight then bolaESP.Highlight:Destroy() end
    bolaESP = {}
end

local function createPlayerESP(p)
    if p == LocalPlayer or playerESP[p] then return end
    local highlight = Instance.new("Highlight")
    highlight.FillTransparency = 1
    highlight.OutlineTransparency = 0
    highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
    highlight.Parent = game.CoreGui
    local espText = Drawing.new("Text")
    espText.Size = 16
    espText.Center = true
    espText.Outline = true
    espText.OutlineColor = Color3.fromRGB(0, 0, 0)
    espText.Color = Color3.fromRGB(255, 255, 0)
    espText.Visible = true
    local tracer = Drawing.new("Line")
    tracer.Thickness = 2
    tracer.Color = Color3.fromRGB(0, 255, 0)
    tracer.Visible = false
    playerESP[p] = {Text = espText, Highlight = highlight, Tracer = tracer}
end

local function removePlayerESP(p)
    local data = playerESP[p]
    if data then
        data.Text:Remove()
        data.Tracer:Remove()
        data.Highlight:Destroy()
        playerESP[p] = nil
    end
end

for _, plr in ipairs(Players:GetPlayers()) do createPlayerESP(plr) end
Players.PlayerAdded:Connect(createPlayerESP)
Players.PlayerRemoving:Connect(removePlayerESP)

Toggles.BolaESP:OnChanged(function()
    if Toggles.BolaESP.Value then
        enableBolaESP()
    else
        disableBolaESP()
    end
end)

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    if Toggles.AntiKick.Value and getnamecallmethod() == "Kick" then
        return nil
    end
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)

Players.LocalPlayer.Idled:Connect(function()
    if Toggles.AntiAFK.Value then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end
end)

RunService.Heartbeat:Connect(function()
    if Toggles.AntiVoid.Value then
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart.Position.Y < -10 then
            char:MoveTo(Vector3.new(0, 50, 0))
        end
    end
end)

RunService.Stepped:Connect(function()
    if Toggles.Noclip.Value then
        local char = LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if Toggles.FullBright.Value then
        Lighting.Brightness = 2
        Lighting.ClockTime = 12
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    else
        for k, v in pairs(lightingDefaults) do Lighting[k] = v end
    end

    if Toggles.NoFog.Value then
        Lighting.FogEnd = 100000
    else
        Lighting.FogEnd = lightingDefaults.FogEnd
        Lighting.FogStart = lightingDefaults.FogStart
        Lighting.FogColor = lightingDefaults.FogColor
    end

    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = Options.WalkSpeed.Value end
    end

    Camera.FieldOfView = Options.FOV.Value

    for p, data in pairs(playerESP) do
        local char = workspace:FindFirstChild(p.Name)
        if Toggles.PlayerESP.Value and char and char:FindFirstChild("Head") then
            local head = char.Head
            local vals = char:FindFirstChild("Values")
            local stunned = (vals and vals:FindFirstChild("Stunned") and vals.Stunned.Value) and "Sim" or "Não"
            local hasBall = vals and vals:FindFirstChild("HasBall") and vals.HasBall.Value
            data.Highlight.Adornee = char
            local col = hasBall and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 0)
            data.Highlight.OutlineColor = col
            data.Text.Color = col
            local pos, onScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 3, 0))
            data.Text.Visible = onScreen
            if onScreen then
                data.Text.Position = Vector2.new(pos.X, pos.Y)
                data.Text.Text = string.format("%s [Atordoado: %s, Tem Bola: %s]", p.Name, stunned, hasBall and "Sim" or "Não")
            end
            if hasBall and onScreen then
                data.Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                data.Tracer.To = Vector2.new(pos.X, pos.Y)
                data.Tracer.Visible = true
            else
                data.Tracer.Visible = false
            end
            if hasBall then
                if Toggles.NotifyBall.Value and lastHolder ~= p then
                    notify("[ALERTA DE BOLA!]: " .. p.Name)
                    lastHolder = p
                end
                if Toggles.AimLockBall.Value then
                    aimTarget = head
                end
            end
        else
            data.Text.Visible = false
            data.Tracer.Visible = false
            data.Highlight.Adornee = nil
        end
    end

    if Toggles.AimLockBall.Value and aimTarget then
        local camPos = Camera.CFrame.Position
        local dir = (aimTarget.Position - camPos).Unit
        Camera.CFrame = CFrame.new(camPos, camPos + dir)
    end
end)
