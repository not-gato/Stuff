local Haj2nOtBT8E = game:GetService("Players")
local Kaj3pRuCX9F = game:GetService("ReplicatedStorage")
local Laj4qSvDY0G = game:GetService("UserInputService")
local Maj5rTwEZ1H = game:GetService("RunService")
local Naj6sUxFA2I = game:GetService("TweenService")
local Oaj7tVyGB3J = game:GetService("Lighting")
local Paj8uWzHC4K = game:GetService("CoreGui")
local Qaj9vXaID5L = game:GetService("SoundService")

local Raj0wYbJE6M = Haj2nOtBT8E.LocalPlayer

local Saj1xZcKF7N = workspace:WaitForChild("Map"):WaitForChild("Assets")
local Taj2yAdLG8O = "Super Cool Bookshelf With Hint Book"

local Uaj3zBeMH9P = {}
local Vaj4aCfNI0Q = nil
local Waj5bDgOJ1R = 1
local Xaj6cEhPK2S = {}

local Yaj7dFiQL3T = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local Zaj8eGjRM4U = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local Abj9fHkSN5V = {
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

local Bbj0gIlTO6W = Instance.new("ScreenGui")
Bbj0gIlTO6W.Name = "NotificationGui"
Bbj0gIlTO6W.ResetOnSpawn = false
Bbj0gIlTO6W.Parent = Paj8uWzHC4K

local function Cbj1hJmUP7X(Dbj2iKnVQ8Y)
    local Ebj3jLoWR9Z = Instance.new("Sound")
    Ebj3jLoWR9Z.SoundId = "rbxassetid://" .. Dbj2iKnVQ8Y
    Ebj3jLoWR9Z.Volume = 0.5
    Ebj3jLoWR9Z.Parent = Qaj9vXaID5L
    Ebj3jLoWR9Z:Play()
    
    Ebj3jLoWR9Z.Ended:Connect(function()
        Ebj3jLoWR9Z:Destroy()
    end)
end

local function Fbj4kMpXS0A(Gbj5lNqYT1B, Hbj6mOrZU2C)
    Cbj1hJmUP7X("17582299860")
    
    local Ibj7nPsAV3D = Instance.new("Frame")
    Ibj7nPsAV3D.Size = UDim2.new(0, 300, 0, 60)
    Ibj7nPsAV3D.Position = UDim2.new(1, 10, 0, 10 + (#Xaj6cEhPK2S * 70))
    Ibj7nPsAV3D.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    Ibj7nPsAV3D.BorderSizePixel = 0
    Ibj7nPsAV3D.Parent = Bbj0gIlTO6W
    
    local Jbj8oQtBW4E = Instance.new("UICorner")
    Jbj8oQtBW4E.CornerRadius = UDim.new(0, 10)
    Jbj8oQtBW4E.Parent = Ibj7nPsAV3D
    
    local Kbj9pRuCX5F = Instance.new("UIStroke")
    Kbj9pRuCX5F.Color = Color3.fromRGB(138, 43, 226)
    Kbj9pRuCX5F.Thickness = 2
    Kbj9pRuCX5F.Parent = Ibj7nPsAV3D
    
    local Lbj0qSvDY6G = Instance.new("TextLabel")
    Lbj0qSvDY6G.Size = UDim2.new(0, 40, 1, 0)
    Lbj0qSvDY6G.Position = UDim2.new(0, 0, 0, 0)
    Lbj0qSvDY6G.BackgroundTransparency = 1
    Lbj0qSvDY6G.Text = "!"
    Lbj0qSvDY6G.TextColor3 = Color3.fromRGB(138, 43, 226)
    Lbj0qSvDY6G.TextSize = 24
    Lbj0qSvDY6G.Font = Enum.Font.SourceSansBold
    Lbj0qSvDY6G.Parent = Ibj7nPsAV3D
    
    local Mbj1rTwEZ7H = Instance.new("TextLabel")
    Mbj1rTwEZ7H.Size = UDim2.new(1, -50, 1, 0)
    Mbj1rTwEZ7H.Position = UDim2.new(0, 45, 0, 0)
    Mbj1rTwEZ7H.BackgroundTransparency = 1
    Mbj1rTwEZ7H.Text = Gbj5lNqYT1B
    Mbj1rTwEZ7H.TextColor3 = Color3.fromRGB(255, 255, 255)
    Mbj1rTwEZ7H.TextSize = 14
    Mbj1rTwEZ7H.Font = Enum.Font.SourceSans
    Mbj1rTwEZ7H.TextWrapped = true
    Mbj1rTwEZ7H.TextXAlignment = Enum.TextXAlignment.Left
    Mbj1rTwEZ7H.Parent = Ibj7nPsAV3D
    
    table.insert(Xaj6cEhPK2S, Ibj7nPsAV3D)
    
    Ibj7nPsAV3D:TweenPosition(
        UDim2.new(1, -310, 0, 10 + ((#Xaj6cEhPK2S - 1) * 70)),
        "Out",
        "Quad",
        0.3,
        true
    )
    
    wait(5)
    
    Ibj7nPsAV3D:TweenPosition(
        UDim2.new(1, 10, 0, Ibj7nPsAV3D.Position.Y.Offset),
        "Out",
        "Quad",
        0.3,
        true,
        function()
            for Nbj2sUxFA8I, Obj3tVyGB9J in ipairs(Xaj6cEhPK2S) do
                if Obj3tVyGB9J == Ibj7nPsAV3D then
                    table.remove(Xaj6cEhPK2S, Nbj2sUxFA8I)
                    break
                end
            end
            
            for Nbj2sUxFA8I, Obj3tVyGB9J in ipairs(Xaj6cEhPK2S) do
                Obj3tVyGB9J:TweenPosition(
                    UDim2.new(1, -310, 0, 10 + ((Nbj2sUxFA8I - 1) * 70)),
                    "Out",
                    "Quad",
                    0.2,
                    true
                )
            end
            
            Ibj7nPsAV3D:Destroy()
        end
    )
end

local function Pbj4uWzHC0K()
    if #Uaj3zBeMH9P == 0 then
        spawn(function()
            Fbj4kMpXS0A("No highlights to clear!", "info")
        end)
        return
    end

    for Qbj5vXaID1L, Rbj6wYbJE2M in ipairs(Uaj3zBeMH9P) do
        for Sbj7xZcKF3N, Tbj8yAdLG4O in ipairs(Rbj6wYbJE2M.connections) do
            Tbj8yAdLG4O:Disconnect()
        end
        if Rbj6wYbJE2M.highlight then
            Rbj6wYbJE2M.highlight:Destroy()
        end
        if Rbj6wYbJE2M.drawing then
            Rbj6wYbJE2M.drawing:Remove()
        end
    end
    table.clear(Uaj3zBeMH9P)
    
    spawn(function()
        Fbj4kMpXS0A("Bookshelf ESP Deleted", "success")
    end)
end

local function Ubj9zBeMH5P()
    Pbj4uWzHC0K()

    local Vbj0aCfNI6Q = 0

    for Wbj1bDgOJ7R, Xbj2cEhPK8S in ipairs(Saj1xZcKF7N:GetChildren()) do
        if Xbj2cEhPK8S.Name == Taj2yAdLG8O then
            Vbj0aCfNI6Q = Vbj0aCfNI6Q + 1

            local Ybj3dFiQL9T = {
                highlight = nil,
                drawing = nil,
                connections = {},
                initialColorOffset = math.random() * 360
            }

            local Zbj4eGjRM0U = Instance.new("Highlight")
            Zbj4eGjRM0U.FillColor = Color3.new(1, 1, 1)
            Zbj4eGjRM0U.FillTransparency = 1
            Zbj4eGjRM0U.OutlineColor = Color3.fromRGB(138, 43, 226)
            Zbj4eGjRM0U.OutlineTransparency = 0
            Zbj4eGjRM0U.Parent = Xbj2cEhPK8S
            Ybj3dFiQL9T.highlight = Zbj4eGjRM0U

            table.insert(Uaj3zBeMH9P, Ybj3dFiQL9T)

            if Drawing then
                local Ccj7hJmUP3X = Drawing.new("Text")
                Ccj7hJmUP3X.Font = 2
                Ccj7hJmUP3X.Color = Color3.new(1, 1, 1)
                Ccj7hJmUP3X.Outline = true
                Ccj7hJmUP3X.OutlineColor = Color3.new(0, 0, 0)
                Ccj7hJmUP3X.Size = 20
                Ccj7hJmUP3X.Visible = true
                Ybj3dFiQL9T.drawing = Ccj7hJmUP3X

                local function Dcj8iKnVQ4Y()
                    local Ecj9jLoWR5Z = Raj0wYbJE6M.Character
                    local Fcj0kMpXS6A = Ecj9jLoWR5Z and Ecj9jLoWR5Z:FindFirstChild("HumanoidRootPart")

                    if Ecj9jLoWR5Z and Fcj0kMpXS6A then
                        local Gcj1lNqYT7B = math.floor((Fcj0kMpXS6A.Position - Xbj2cEhPK8S.Position).magnitude + 0.5)

                        Ccj7hJmUP3X.Text = "Book Is Here! [Distance: " .. Gcj1lNqYT7B .. "]"

                        local Hcj2mOrZU8C, Icj3nPsAV9D = workspace.CurrentCamera:WorldToScreenPoint(Xbj2cEhPK8S.Position + Vector3.new(0, Xbj2cEhPK8S.Size.Y / 2 + 1, 0))
                        
                        if Icj3nPsAV9D then
                            Ccj7hJmUP3X.Position = Vector2.new(Hcj2mOrZU8C.X - Ccj7hJmUP3X.TextBounds.X / 2, Hcj2mOrZU8C.Y - Ccj7hJmUP3X.TextBounds.Y / 2)
                        end
                    else
                        Ccj7hJmUP3X.Visible = false
                    end
                end
                table.insert(Ybj3dFiQL9T.connections, Maj5rTwEZ1H.RenderStepped:Connect(Dcj8iKnVQ4Y))
            end
        end
    end

    if Vbj0aCfNI6Q > 0 then
        spawn(function()
            Fbj4kMpXS0A("Bookshelfs Found: " .. Vbj0aCfNI6Q, "success")
        end)
    else
        spawn(function()
            Fbj4kMpXS0A("No bookshelfs found!", "error")
        end)
    end
end

local function Jcj4oQtBW0E()
    local Kcj5pRuCX1F = Raj0wYbJE6M.Character
    if not Kcj5pRuCX1F then
        spawn(function()
            Fbj4kMpXS0A("Character not found!", "error")
        end)
        return
    end
    
    local Lcj6qSvDY2G = Kcj5pRuCX1F:FindFirstChild("Humanoid")
    if Lcj6qSvDY2G and Lcj6qSvDY2G.Health > 0 then
        spawn(function()
            Fbj4kMpXS0A("Tried To Revive But Already Alive", "info")
        end)
        return
    end
    
    local Mcj7rTwEZ3H, Ncj8sUxFA4I = pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("Bricks"):WaitForChild("Revive"):FireServer()
    end)
    
    if Mcj7rTwEZ3H then
        spawn(function()
            Fbj4kMpXS0A("Revive request sent!", "success")
        end)
    else
        spawn(function()
            Fbj4kMpXS0A("Failed to revive: " .. tostring(Ncj8sUxFA4I), "error")
        end)
    end
end

local function Ocj9tVyGB5J()
    if Vaj4aCfNI0Q then
        Vaj4aCfNI0Q:Disconnect()
    end
    
    Vaj4aCfNI0Q = Maj5rTwEZ1H.Heartbeat:Connect(function()
        local Pcj0uWzHC6K, Qcj1vXaID7L = pcall(function()
            local Rcj2wYbJE8M = workspace:FindFirstChild("FigureSetup")
            if not Rcj2wYbJE8M then return end
            
            local Scj3xZcKF9N = Rcj2wYbJE8M:FindFirstChild("FigureRagdoll")
            if not Scj3xZcKF9N then return end
            
            local Tcj4yAdLG0O = Scj3xZcKF9N:FindFirstChild("Torso")
            if not Tcj4yAdLG0O then return end
            
            local Ucj5zBeMH1P = Raj0wYbJE6M.Character
            if not Ucj5zBeMH1P then return end
            
            local Vcj6aCfNI2Q = Ucj5zBeMH1P:FindFirstChild("HumanoidRootPart")
            if not Vcj6aCfNI2Q then return end
            
            local Wcj7bDgOJ3R = (Vcj6aCfNI2Q.Position - Tcj4yAdLG0O.Position).magnitude
            
            if Wcj7bDgOJ3R >= 15 and Wcj7bDgOJ3R <= 20 then
                Waj5bDgOJ1R = Waj5bDgOJ1R == 1 and 2 or 1
                Vcj6aCfNI2Q.CFrame = Abj9fHkSN5V[Waj5bDgOJ1R]
            elseif Wcj7bDgOJ3R < 15 then
                Waj5bDgOJ1R = Waj5bDgOJ1R == 1 and 2 or 1
                Vcj6aCfNI2Q.CFrame = Abj9fHkSN5V[Waj5bDgOJ1R]
            end
        end)
    end)
end

local function Xcj8cEhPK4S()
    if Vaj4aCfNI0Q then
        Vaj4aCfNI0Q:Disconnect()
        Vaj4aCfNI0Q = nil
        spawn(function()
            Fbj4kMpXS0A("Figure tracking stopped", "info")
        end)
    else
        spawn(function()
            Fbj4kMpXS0A("Figure tracking was not running", "info")
        end)
    end
end

local function Ycj9dFiQL5T()
    local Zcj0eGjRM6U = Raj0wYbJE6M.Character
    if not Zcj0eGjRM6U then
        spawn(function()
            Fbj4kMpXS0A("Character not found!", "error")
        end)
        return
    end
    
    local Adj1fHkSN7V = Zcj0eGjRM6U:FindFirstChild("HumanoidRootPart")
    if not Adj1fHkSN7V then
        spawn(function()
            Fbj4kMpXS0A("HumanoidRootPart not found!", "error")
        end)
        return
    end
    
    local Bdj2gIlTO8W = CFrame.new(
        0.88565439, 19.2949562, -109.371742,
        -0.998881638, 0.00240474031, -0.0472193025,
        -7.93140771e-08, 0.998705626, 0.0508628227,
        0.0472804941, 0.0508059449, -0.997588754
    )
    
    Adj1fHkSN7V.CFrame = Bdj2gIlTO8W
    spawn(function()
        Fbj4kMpXS0A("Teleported to Door", "success")
    end)
end

local function Cdj3hJmUP9X()
    local Ddj4iKnVQ0Y = Raj0wYbJE6M.Character
    if not Ddj4iKnVQ0Y then
        spawn(function()
            Fbj4kMpXS0A("Character not found!", "error")
        end)
        return
    end
    
    local Edj5jLoWR1Z = Ddj4iKnVQ0Y:FindFirstChild("HumanoidRootPart")
    if not Edj5jLoWR1Z then
        spawn(function()
            Fbj4kMpXS0A("HumanoidRootPart not found!", "error")
        end)
        return
    end
    
    local Fdj6kMpXS2A = CFrame.new(
        -53.6578979, 11.3413105, -21.9969749,
        0.423553586, -0.90396452, -0.0587408952,
        0.1525819, 0.00727360509, 0.988264024,
        -0.892928481, -0.427545547, 0.141009375
    )
    
    Edj5jLoWR1Z.CFrame = Fdj6kMpXS2A
    spawn(function()
        Fbj4kMpXS0A("Teleported to BPaper", "success")
    end)
end

local Gdj7lNqYT3B = Instance.new("ScreenGui")
Gdj7lNqYT3B.Name = "BookshelfControlGui"
Gdj7lNqYT3B.ResetOnSpawn = false
Gdj7lNqYT3B.Parent = Paj8uWzHC4K

local Hdj8mOrZU4C = Instance.new("UIScale")
Hdj8mOrZU4C.Scale = 0.8
Hdj8mOrZU4C.Parent = Gdj7lNqYT3B

local Idj9nPsAV5D = Instance.new("Frame")
Idj9nPsAV5D.Name = "MainFrame"
Idj9nPsAV5D.Size = UDim2.new(0, 240, 0, 400)
Idj9nPsAV5D.Position = UDim2.new(0, 20, 0.5, -200)
Idj9nPsAV5D.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Idj9nPsAV5D.BorderSizePixel = 0
Idj9nPsAV5D.Parent = Gdj7lNqYT3B

local Jdj0oQtBW6E = Instance.new("UICorner")
Jdj0oQtBW6E.CornerRadius = UDim.new(0, 15)
Jdj0oQtBW6E.Parent = Idj9nPsAV5D

local Kdj1pRuCX7F = Instance.new("UIStroke")
Kdj1pRuCX7F.Color = Color3.fromRGB(138, 43, 226)
Kdj1pRuCX7F.Thickness = 2
Kdj1pRuCX7F.Parent = Idj9nPsAV5D

local Ldj2qSvDY8G = Instance.new("TextLabel")
Ldj2qSvDY8G.Name = "TitleLabel"
Ldj2qSvDY8G.Size = UDim2.new(1, 0, 0, 50)
Ldj2qSvDY8G.Position = UDim2.new(0, 0, 0, 0)
Ldj2qSvDY8G.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
Ldj2qSvDY8G.BorderSizePixel = 0
Ldj2qSvDY8G.Text = "Book Helper"
Ldj2qSvDY8G.TextColor3 = Color3.fromRGB(255, 255, 255)
Ldj2qSvDY8G.TextSize = 22
Ldj2qSvDY8G.Font = Enum.Font.SourceSansBold
Ldj2qSvDY8G.Parent = Idj9nPsAV5D

local Mdj3rTwEZ9H = Instance.new("UICorner")
Mdj3rTwEZ9H.CornerRadius = UDim.new(0, 15)
Mdj3rTwEZ9H.Parent = Ldj2qSvDY8G

local Ndj4sUxFA0I = Instance.new("ScrollingFrame")
Ndj4sUxFA0I.Name = "ScrollFrame"
Ndj4sUxFA0I.Size = UDim2.new(1, -30, 1, -70)
Ndj4sUxFA0I.Position = UDim2.new(0, 15, 0, 60)
Ndj4sUxFA0I.BackgroundTransparency = 1
Ndj4sUxFA0I.BorderSizePixel = 0
Ndj4sUxFA0I.ScrollBarThickness = 6
Ndj4sUxFA0I.ScrollBarImageColor3 = Color3.fromRGB(138, 43, 226)
Ndj4sUxFA0I.CanvasSize = UDim2.new(0, 0, 0, 0)
Ndj4sUxFA0I.Parent = Idj9nPsAV5D

local Odj5tVyGB1J = Instance.new("UIListLayout")
Odj5tVyGB1J.FillDirection = Enum.FillDirection.Vertical
Odj5tVyGB1J.HorizontalAlignment = Enum.HorizontalAlignment.Center
Odj5tVyGB1J.VerticalAlignment = Enum.VerticalAlignment.Top
Odj5tVyGB1J.Padding = UDim.new(0, 15)
Odj5tVyGB1J.Parent = Ndj4sUxFA0I

Odj5tVyGB1J:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Ndj4sUxFA0I.CanvasSize = UDim2.new(0, 0, 0, Odj5tVyGB1J.AbsoluteContentSize.Y + 20)
end)

local function Pdj6uWzHC2K(Qdj7vXaID3L, Rdj8wYbJE4M, Sdj9xZcKF5N)
    local Tdj0yAdLG6O = Instance.new("TextButton")
    Tdj0yAdLG6O.Size = UDim2.new(1, 0, 0, 50)
    Tdj0yAdLG6O.BackgroundColor3 = Rdj8wYbJE4M
    Tdj0yAdLG6O.TextColor3 = Color3.fromRGB(255, 255, 255)
    Tdj0yAdLG6O.Text = Qdj7vXaID3L
    Tdj0yAdLG6O.Font = Enum.Font.SourceSansBold
    Tdj0yAdLG6O.TextSize = 16
    Tdj0yAdLG6O.BorderSizePixel = 0
    Tdj0yAdLG6O.Parent = Ndj4sUxFA0I

    local Udj1zBeMH7P = Instance.new("UICorner")
    Udj1zBeMH7P.CornerRadius = UDim.new(0, 10)
    Udj1zBeMH7P.Parent = Tdj0yAdLG6O

    local Vdj2aCfNI8Q = Instance.new("UIStroke")
    Vdj2aCfNI8Q.Color = Color3.fromRGB(138, 43, 226)
    Vdj2aCfNI8Q.Transparency = 0.7
    Vdj2aCfNI8Q.Thickness = 1
    Vdj2aCfNI8Q.Parent = Tdj0yAdLG6O

    local Wdj3bDgOJ9R = Tdj0yAdLG6O.Size
    local Xdj4cEhPK0S = Tdj0yAdLG6O.BackgroundColor3

    Tdj0yAdLG6O.MouseButton1Down:Connect(function()
        Cbj1hJmUP7X("6895079853")
        local Ydj5dFiQL1T = UDim2.new(Wdj3bDgOJ9R.X.Scale * 0.96, Wdj3bDgOJ9R.X.Offset, Wdj3bDgOJ9R.Y.Scale * 0.96, Wdj3bDgOJ9R.Y.Offset)
        Naj6sUxFA2I:Create(Tdj0yAdLG6O, Yaj7dFiQL3T, {
            Size = Ydj5dFiQL1T,
            BackgroundColor3 = Color3.new(
                Xdj4cEhPK0S.R * 0.7,
                Xdj4cEhPK0S.G * 0.7,
                Xdj4cEhPK0S.B * 0.7
            )
        }):Play()
    end)

    Tdj0yAdLG6O.MouseButton1Up:Connect(function()
        Naj6sUxFA2I:Create(Tdj0yAdLG6O, Zaj8eGjRM4U, {
            Size = Wdj3bDgOJ9R,
            BackgroundColor3 = Xdj4cEhPK0S
        }):Play()
    end)

    Tdj0yAdLG6O.MouseEnter:Connect(function()
        Naj6sUxFA2I:Create(Tdj0yAdLG6O, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.new(
                math.min(Xdj4cEhPK0S.R * 1.2, 1),
                math.min(Xdj4cEhPK0S.G * 1.2, 1),
                math.min(Xdj4cEhPK0S.B * 1.2, 1)
            )
        }):Play()
        Naj6sUxFA2I:Create(Vdj2aCfNI8Q, TweenInfo.new(0.2), {
            Transparency = 0.3
        }):Play()
    end)

    Tdj0yAdLG6O.MouseLeave:Connect(function()
        Naj6sUxFA2I:Create(Tdj0yAdLG6O, TweenInfo.new(0.2), {
            BackgroundColor3 = Xdj4cEhPK0S
        }):Play()
        Naj6sUxFA2I:Create(Vdj2aCfNI8Q, TweenInfo.new(0.2), {
            Transparency = 0.7
        }):Play()
    end)

    Tdj0yAdLG6O.MouseButton1Click:Connect(Sdj9xZcKF5N)

    return Tdj0yAdLG6O
end

local Zdj6eGjRM2U = Pdj6uWzHC2K("Find Books", Color3.fromRGB(40, 40, 50), Ubj9zBeMH5P)
local Aej7fHkSN3V = Pdj6uWzHC2K("Destroy Highlights", Color3.fromRGB(40, 40, 50), Pbj4uWzHC0K)
local Bej8gIlTO4W = Pdj6uWzHC2K("Start Figure Track", Color3.fromRGB(40, 40, 50), Ocj9tVyGB5J)
local Cej9hJmUP5X = Pdj6uWzHC2K("Stop Figure Track", Color3.fromRGB(40, 40, 50), Xcj8cEhPK4S)
local Dej0iKnVQ6Y = Pdj6uWzHC2K("Revive", Color3.fromRGB(40, 40, 50), Jcj4oQtBW0E)
local Eej1jLoWR7Z = Pdj6uWzHC2K("TP To Door", Color3.fromRGB(40, 40, 50), Ycj9dFiQL5T)
local Fej2kMpXS8A = Pdj6uWzHC2K("TP To BPaper", Color3.fromRGB(40, 40, 50), Cdj3hJmUP9X)

local Gej3lNqYT9B = nil
local Hej4mOrZU0C = 0.25
local Iej5nPsAV1D = nil
local Jej6oQtBW2E = nil

local function Kej7pRuCX3F(Lej8qSvDY4G)
    local Mej9rTwEZ5H = Lej8qSvDY4G.Position - Iej5nPsAV1D
    local Nej0sUxFA6I = UDim2.new(Jej6oQtBW2E.X.Scale, Jej6oQtBW2E.X.Offset + Mej9rTwEZ5H.X, Jej6oQtBW2E.Y.Scale, Jej6oQtBW2E.Y.Offset + Mej9rTwEZ5H.Y)
    Naj6sUxFA2I:Create(Idj9nPsAV5D, TweenInfo.new(Hej4mOrZU0C), {Position = Nej0sUxFA6I}):Play()
end

Ldj2qSvDY8G.InputBegan:Connect(function(Oej1tVyGB7J)
    if (Oej1tVyGB7J.UserInputType == Enum.UserInputType.MouseButton1 or Oej1tVyGB7J.UserInputType == Enum.UserInputType.Touch) then
        Gej3lNqYT9B = true
        Iej5nPsAV1D = Oej1tVyGB7J.Position
        Jej6oQtBW2E = Idj9nPsAV5D.Position
        Oej1tVyGB7J.Changed:Connect(function()
            if Oej1tVyGB7J.UserInputState == Enum.UserInputState.End then
                Gej3lNqYT9B = false
            end
        end)
    end
end)

Ldj2qSvDY8G.InputChanged:Connect(function(Pej2uWzHC8K)
    if (Pej2uWzHC8K.UserInputType == Enum.UserInputType.MouseMovement or Pej2uWzHC8K.UserInputType == Enum.UserInputType.Touch) then
        if Gej3lNqYT9B then
            Kej7pRuCX3F(Pej2uWzHC8K)
        end
    end
end)
