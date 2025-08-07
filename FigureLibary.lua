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

local Ycj9dFiQL5T = Instance.new("ScreenGui")
Ycj9dFiQL5T.Name = "BookshelfControlGui"
Ycj9dFiQL5T.ResetOnSpawn = false
Ycj9dFiQL5T.Parent = Paj8uWzHC4K

local Zcj0eGjRM6U = Instance.new("UIScale")
Zcj0eGjRM6U.Scale = 0.8
Zcj0eGjRM6U.Parent = Ycj9dFiQL5T

local Adj1fHkSN7V = Instance.new("Frame")
Adj1fHkSN7V.Name = "MainFrame"
Adj1fHkSN7V.Size = UDim2.new(0, 240, 0, 400)
Adj1fHkSN7V.Position = UDim2.new(0, 20, 0.5, -200)
Adj1fHkSN7V.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Adj1fHkSN7V.BorderSizePixel = 0
Adj1fHkSN7V.Parent = Ycj9dFiQL5T

local Bdj2gIlTO8W = Instance.new("UICorner")
Bdj2gIlTO8W.CornerRadius = UDim.new(0, 15)
Bdj2gIlTO8W.Parent = Adj1fHkSN7V

local Cdj3hJmUP9X = Instance.new("UIStroke")
Cdj3hJmUP9X.Color = Color3.fromRGB(138, 43, 226)
Cdj3hJmUP9X.Thickness = 2
Cdj3hJmUP9X.Parent = Adj1fHkSN7V

local Ddj4iKnVQ0Y = Instance.new("TextLabel")
Ddj4iKnVQ0Y.Name = "TitleLabel"
Ddj4iKnVQ0Y.Size = UDim2.new(1, 0, 0, 50)
Ddj4iKnVQ0Y.Position = UDim2.new(0, 0, 0, 0)
Ddj4iKnVQ0Y.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
Ddj4iKnVQ0Y.BorderSizePixel = 0
Ddj4iKnVQ0Y.Text = "Book Helper"
Ddj4iKnVQ0Y.TextColor3 = Color3.fromRGB(255, 255, 255)
Ddj4iKnVQ0Y.TextSize = 22
Ddj4iKnVQ0Y.Font = Enum.Font.SourceSansBold
Ddj4iKnVQ0Y.Parent = Adj1fHkSN7V

local Edj5jLoWR1Z = Instance.new("UICorner")
Edj5jLoWR1Z.CornerRadius = UDim.new(0, 15)
Edj5jLoWR1Z.Parent = Ddj4iKnVQ0Y

local Fdj6kMpXS2A = Instance.new("Frame")
Fdj6kMpXS2A.Name = "ContentFrame"
Fdj6kMpXS2A.Size = UDim2.new(1, -30, 1, -70)
Fdj6kMpXS2A.Position = UDim2.new(0, 15, 0, 60)
Fdj6kMpXS2A.BackgroundTransparency = 1
Fdj6kMpXS2A.Parent = Adj1fHkSN7V

local Gdj7lNqYT3B = Instance.new("UIListLayout")
Gdj7lNqYT3B.FillDirection = Enum.FillDirection.Vertical
Gdj7lNqYT3B.HorizontalAlignment = Enum.HorizontalAlignment.Center
Gdj7lNqYT3B.VerticalAlignment = Enum.VerticalAlignment.Top
Gdj7lNqYT3B.Padding = UDim.new(0, 15)
Gdj7lNqYT3B.Parent = Fdj6kMpXS2A

local function Hdj8mOrZU4C(Idj9nPsAV5D, Jdj0oQtBW6E, Kdj1pRuCX7F)
    local Ldj2qSvDY8G = Instance.new("TextButton")
    Ldj2qSvDY8G.Size = UDim2.new(1, 0, 0, 50)
    Ldj2qSvDY8G.BackgroundColor3 = Jdj0oQtBW6E
    Ldj2qSvDY8G.TextColor3 = Color3.fromRGB(255, 255, 255)
    Ldj2qSvDY8G.Text = Idj9nPsAV5D
    Ldj2qSvDY8G.Font = Enum.Font.SourceSansBold
    Ldj2qSvDY8G.TextSize = 16
    Ldj2qSvDY8G.BorderSizePixel = 0
    Ldj2qSvDY8G.Parent = Fdj6kMpXS2A

    local Mdj3rTwEZ9H = Instance.new("UICorner")
    Mdj3rTwEZ9H.CornerRadius = UDim.new(0, 10)
    Mdj3rTwEZ9H.Parent = Ldj2qSvDY8G

    local Ndj4sUxFA0I = Instance.new("UIStroke")
    Ndj4sUxFA0I.Color = Color3.fromRGB(138, 43, 226)
    Ndj4sUxFA0I.Transparency = 0.7
    Ndj4sUxFA0I.Thickness = 1
    Ndj4sUxFA0I.Parent = Ldj2qSvDY8G

    local Odj5tVyGB1J = Ldj2qSvDY8G.Size
    local Pdj6uWzHC2K = Ldj2qSvDY8G.BackgroundColor3

    Ldj2qSvDY8G.MouseButton1Down:Connect(function()
        Cbj1hJmUP7X("6895079853")
        local Qdj7vXaID3L = UDim2.new(Odj5tVyGB1J.X.Scale * 0.96, Odj5tVyGB1J.X.Offset, Odj5tVyGB1J.Y.Scale * 0.96, Odj5tVyGB1J.Y.Offset)
        Naj6sUxFA2I:Create(Ldj2qSvDY8G, Yaj7dFiQL3T, {
            Size = Qdj7vXaID3L,
            BackgroundColor3 = Color3.new(
                Pdj6uWzHC2K.R * 0.7,
                Pdj6uWzHC2K.G * 0.7,
                Pdj6uWzHC2K.B * 0.7
            )
        }):Play()
    end)

    Ldj2qSvDY8G.MouseButton1Up:Connect(function()
        Naj6sUxFA2I:Create(Ldj2qSvDY8G, Zaj8eGjRM4U, {
            Size = Odj5tVyGB1J,
            BackgroundColor3 = Pdj6uWzHC2K
        }):Play()
    end)

    Ldj2qSvDY8G.MouseEnter:Connect(function()
        Naj6sUxFA2I:Create(Ldj2qSvDY8G, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.new(
                math.min(Pdj6uWzHC2K.R * 1.2, 1),
                math.min(Pdj6uWzHC2K.G * 1.2, 1),
                math.min(Pdj6uWzHC2K.B * 1.2, 1)
            )
        }):Play()
        Naj6sUxFA2I:Create(Ndj4sUxFA0I, TweenInfo.new(0.2), {
            Transparency = 0.3
        }):Play()
    end)

    Ldj2qSvDY8G.MouseLeave:Connect(function()
        Naj6sUxFA2I:Create(Ldj2qSvDY8G, TweenInfo.new(0.2), {
            BackgroundColor3 = Pdj6uWzHC2K
        }):Play()
        Naj6sUxFA2I:Create(Ndj4sUxFA0I, TweenInfo.new(0.2), {
            Transparency = 0.7
        }):Play()
    end)

    Ldj2qSvDY8G.MouseButton1Click:Connect(Kdj1pRuCX7F)

    return Ldj2qSvDY8G
end

local Rdj8wYbJE4M = Hdj8mOrZU4C("Find Books", Color3.fromRGB(40, 40, 50), Ubj9zBeMH5P)
local Sdj9xZcKF5N = Hdj8mOrZU4C("Destroy Highlights", Color3.fromRGB(40, 40, 50), Pbj4uWzHC0K)
local Tdj0yAdLG6O = Hdj8mOrZU4C("Start Figure Track", Color3.fromRGB(40, 40, 50), Ocj9tVyGB5J)
local Udj1zBeMH7P = Hdj8mOrZU4C("Stop Figure Track", Color3.fromRGB(40, 40, 50), Xcj8cEhPK4S)
local Vdj2aCfNI8Q = Hdj8mOrZU4C("Revive", Color3.fromRGB(40, 40, 50), Jcj4oQtBW0E)

local Wdj3bDgOJ9R = nil
local Xdj4cEhPK0S = 0.25
local Ydj5dFiQL1T = nil
local Zdj6eGjRM2U = nil

local function Aej7fHkSN3V(Bej8gIlTO4W)
    local Cej9hJmUP5X = Bej8gIlTO4W.Position - Ydj5dFiQL1T
    local Dej0iKnVQ6Y = UDim2.new(Zdj6eGjRM2U.X.Scale, Zdj6eGjRM2U.X.Offset + Cej9hJmUP5X.X, Zdj6eGjRM2U.Y.Scale, Zdj6eGjRM2U.Y.Offset + Cej9hJmUP5X.Y)
    Naj6sUxFA2I:Create(Adj1fHkSN7V, TweenInfo.new(Xdj4cEhPK0S), {Position = Dej0iKnVQ6Y}):Play()
end

Ddj4iKnVQ0Y.InputBegan:Connect(function(Eej1jLoWR7Z)
    if (Eej1jLoWR7Z.UserInputType == Enum.UserInputType.MouseButton1 or Eej1jLoWR7Z.UserInputType == Enum.UserInputType.Touch) then
        Wdj3bDgOJ9R = true
        Ydj5dFiQL1T = Eej1jLoWR7Z.Position
        Zdj6eGjRM2U = Adj1fHkSN7V.Position
        Eej1jLoWR7Z.Changed:Connect(function()
            if Eej1jLoWR7Z.UserInputState == Enum.UserInputState.End then
                Wdj3bDgOJ9R = false
            end
        end)
    end
end)

Ddj4iKnVQ0Y.InputChanged:Connect(function(Fej2kMpXS8A)
    if (Fej2kMpXS8A.UserInputType == Enum.UserInputType.MouseMovement or Fej2kMpXS8A.UserInputType == Enum.UserInputType.Touch) then
        if Wdj3bDgOJ9R then
            Aej7fHkSN3V(Fej2kMpXS8A)
        end
    end
end)
