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
local Yaj7dFiQL3T = nil
local Zaj8eGjRM4U = 16
local Abj9fHkSN5V = false
local Bbj0gIlTO6W = nil
local Cbj1hJmUP7X = false

local Dbj2iKnVQ8Y = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local Ebj3jLoWR9Z = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local Fbj4kMpXS0A = {
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

local Gbj5lNqYT1B = Instance.new("ScreenGui")
Gbj5lNqYT1B.Name = "NotificationGui"
Gbj5lNqYT1B.ResetOnSpawn = false
Gbj5lNqYT1B.Parent = Paj8uWzHC4K

local function Hbj6mOrZU2C(Ibj7nPsAV3D)
    local Jbj8oQtBW4E = Instance.new("Sound")
    Jbj8oQtBW4E.SoundId = "rbxassetid://" .. Ibj7nPsAV3D
    Jbj8oQtBW4E.Volume = 0.5
    Jbj8oQtBW4E.Parent = Qaj9vXaID5L
    Jbj8oQtBW4E:Play()
    
    Jbj8oQtBW4E.Ended:Connect(function()
        Jbj8oQtBW4E:Destroy()
    end)
end

local function Kbj9pRuCX5F(Lbj0qSvDY6G, Mbj1rTwEZ7H)
    Hbj6mOrZU2C("17582299860")
    
    local Nbj2sUxFA8I = Instance.new("Frame")
    Nbj2sUxFA8I.Size = UDim2.new(0, 300, 0, 60)
    Nbj2sUxFA8I.Position = UDim2.new(1, 10, 0, 10 + (#Xaj6cEhPK2S * 70))
    Nbj2sUxFA8I.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    Nbj2sUxFA8I.BorderSizePixel = 0
    Nbj2sUxFA8I.Parent = Gbj5lNqYT1B
    
    local Obj3tVyGB9J = Instance.new("UICorner")
    Obj3tVyGB9J.CornerRadius = UDim.new(0, 10)
    Obj3tVyGB9J.Parent = Nbj2sUxFA8I
    
    local Pbj4uWzHC0K = Instance.new("UIStroke")
    Pbj4uWzHC0K.Color = Color3.fromRGB(138, 43, 226)
    Pbj4uWzHC0K.Thickness = 2
    Pbj4uWzHC0K.Parent = Nbj2sUxFA8I
    
    local Qbj5vXaID1L = Instance.new("TextLabel")
    Qbj5vXaID1L.Size = UDim2.new(0, 40, 1, 0)
    Qbj5vXaID1L.Position = UDim2.new(0, 0, 0, 0)
    Qbj5vXaID1L.BackgroundTransparency = 1
    Qbj5vXaID1L.Text = "!"
    Qbj5vXaID1L.TextColor3 = Color3.fromRGB(138, 43, 226)
    Qbj5vXaID1L.TextSize = 24
    Qbj5vXaID1L.Font = Enum.Font.SourceSansBold
    Qbj5vXaID1L.Parent = Nbj2sUxFA8I
    
    local Rbj6wYbJE2M = Instance.new("TextLabel")
    Rbj6wYbJE2M.Size = UDim2.new(1, -50, 1, 0)
    Rbj6wYbJE2M.Position = UDim2.new(0, 45, 0, 0)
    Rbj6wYbJE2M.BackgroundTransparency = 1
    Rbj6wYbJE2M.Text = Lbj0qSvDY6G
    Rbj6wYbJE2M.TextColor3 = Color3.fromRGB(255, 255, 255)
    Rbj6wYbJE2M.TextSize = 14
    Rbj6wYbJE2M.Font = Enum.Font.SourceSans
    Rbj6wYbJE2M.TextWrapped = true
    Rbj6wYbJE2M.TextXAlignment = Enum.TextXAlignment.Left
    Rbj6wYbJE2M.Parent = Nbj2sUxFA8I
    
    table.insert(Xaj6cEhPK2S, Nbj2sUxFA8I)
    
    Nbj2sUxFA8I:TweenPosition(
        UDim2.new(1, -310, 0, 10 + ((#Xaj6cEhPK2S - 1) * 70)),
        "Out",
        "Quad",
        0.3,
        true
    )
    
    wait(5)
    
    Nbj2sUxFA8I:TweenPosition(
        UDim2.new(1, 10, 0, Nbj2sUxFA8I.Position.Y.Offset),
        "Out",
        "Quad",
        0.3,
        true,
        function()
            for Sbj7xZcKF3N, Tbj8yAdLG4O in ipairs(Xaj6cEhPK2S) do
                if Tbj8yAdLG4O == Nbj2sUxFA8I then
                    table.remove(Xaj6cEhPK2S, Sbj7xZcKF3N)
                    break
                end
            end
            
            for Sbj7xZcKF3N, Tbj8yAdLG4O in ipairs(Xaj6cEhPK2S) do
                Tbj8yAdLG4O:TweenPosition(
                    UDim2.new(1, -310, 0, 10 + ((Sbj7xZcKF3N - 1) * 70)),
                    "Out",
                    "Quad",
                    0.2,
                    true
                )
            end
            
            Nbj2sUxFA8I:Destroy()
        end
    )
end

local function Ubj9zBeMH5P()
    if #Uaj3zBeMH9P == 0 then
        spawn(function()
            Kbj9pRuCX5F("No highlights to clear!", "info")
        end)
        return
    end

    for Vbj0aCfNI6Q, Wbj1bDgOJ7R in ipairs(Uaj3zBeMH9P) do
        for Xbj2cEhPK8S, Ybj3dFiQL9T in ipairs(Wbj1bDgOJ7R.connections) do
            Ybj3dFiQL9T:Disconnect()
        end
        if Wbj1bDgOJ7R.highlight then
            Wbj1bDgOJ7R.highlight:Destroy()
        end
        if Wbj1bDgOJ7R.drawing then
            Wbj1bDgOJ7R.drawing:Remove()
        end
    end
    table.clear(Uaj3zBeMH9P)
    
    spawn(function()
        Kbj9pRuCX5F("Bookshelf ESP Deleted", "success")
    end)
end

local function Zbj4eGjRM0U()
    Ubj9zBeMH5P()

    local Acj5fHkSN1V = 0

    for Bcj6gIlTO2W, Ccj7hJmUP3X in ipairs(Saj1xZcKF7N:GetChildren()) do
        if Ccj7hJmUP3X.Name == Taj2yAdLG8O then
            Acj5fHkSN1V = Acj5fHkSN1V + 1

            local Dcj8iKnVQ4Y = {
                highlight = nil,
                drawing = nil,
                connections = {},
                initialColorOffset = math.random() * 360
            }

            local Ecj9jLoWR5Z = Instance.new("Highlight")
            Ecj9jLoWR5Z.FillColor = Color3.new(1, 1, 1)
            Ecj9jLoWR5Z.FillTransparency = 1
            Ecj9jLoWR5Z.OutlineColor = Color3.fromRGB(138, 43, 226)
            Ecj9jLoWR5Z.OutlineTransparency = 0
            Ecj9jLoWR5Z.Parent = Ccj7hJmUP3X
            Dcj8iKnVQ4Y.highlight = Ecj9jLoWR5Z

            table.insert(Uaj3zBeMH9P, Dcj8iKnVQ4Y)

            if Drawing then
                local Fcj0kMpXS6A = Drawing.new("Text")
                Fcj0kMpXS6A.Font = 2
                Fcj0kMpXS6A.Color = Color3.new(1, 1, 1)
                Fcj0kMpXS6A.Outline = true
                Fcj0kMpXS6A.OutlineColor = Color3.new(0, 0, 0)
                Fcj0kMpXS6A.Size = 20
                Fcj0kMpXS6A.Visible = true
                Dcj8iKnVQ4Y.drawing = Fcj0kMpXS6A

                local function Gcj1lNqYT7B()
                    local Hcj2mOrZU8C = Raj0wYbJE6M.Character
                    local Icj3nPsAV9D = Hcj2mOrZU8C and Hcj2mOrZU8C:FindFirstChild("HumanoidRootPart")

                    if Hcj2mOrZU8C and Icj3nPsAV9D then
                        local Jcj4oQtBW0E = math.floor((Icj3nPsAV9D.Position - Ccj7hJmUP3X.Position).magnitude + 0.5)

                        Fcj0kMpXS6A.Text = "Book Is Here! [Distance: " .. Jcj4oQtBW0E .. "]"

                        local Kcj5pRuCX1F, Lcj6qSvDY2G = workspace.CurrentCamera:WorldToScreenPoint(Ccj7hJmUP3X.Position + Vector3.new(0, Ccj7hJmUP3X.Size.Y / 2 + 1, 0))
                        
                        if Lcj6qSvDY2G then
                            Fcj0kMpXS6A.Position = Vector2.new(Kcj5pRuCX1F.X - Fcj0kMpXS6A.TextBounds.X / 2, Kcj5pRuCX1F.Y - Fcj0kMpXS6A.TextBounds.Y / 2)
                        end
                    else
                        Fcj0kMpXS6A.Visible = false
                    end
                end
                table.insert(Dcj8iKnVQ4Y.connections, Maj5rTwEZ1H.RenderStepped:Connect(Gcj1lNqYT7B))
            end
        end
    end

    if Acj5fHkSN1V > 0 then
        spawn(function()
            Kbj9pRuCX5F("Bookshelfs Found: " .. Acj5fHkSN1V, "success")
        end)
    else
        spawn(function()
            Kbj9pRuCX5F("No bookshelfs found!", "error")
        end)
    end
end

local function Mcj7rTwEZ3H()
    local Ncj8sUxFA4I = Raj0wYbJE6M.Character
    if not Ncj8sUxFA4I then
        spawn(function()
            Kbj9pRuCX5F("Character not found!", "error")
        end)
        return
    end
    
    local Ocj9tVyGB5J = Ncj8sUxFA4I:FindFirstChild("Humanoid")
    if Ocj9tVyGB5J and Ocj9tVyGB5J.Health > 0 then
        spawn(function()
            Kbj9pRuCX5F("Tried To Revive But Already Alive", "info")
        end)
        return
    end
    
    local Pcj0uWzHC6K, Qcj1vXaID7L = pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("Bricks"):WaitForChild("Revive"):FireServer()
    end)
    
    if Pcj0uWzHC6K then
        spawn(function()
            Kbj9pRuCX5F("Revive request sent!", "success")
        end)
    else
        spawn(function()
            Kbj9pRuCX5F("Failed to revive: " .. tostring(Qcj1vXaID7L), "error")
        end)
    end
end

local function Rcj2wYbJE8M()
    if Vaj4aCfNI0Q then
        Vaj4aCfNI0Q:Disconnect()
    end
    
    Vaj4aCfNI0Q = Maj5rTwEZ1H.Heartbeat:Connect(function()
        local Scj3xZcKF9N, Tcj4yAdLG0O = pcall(function()
            local Ucj5zBeMH1P = workspace:FindFirstChild("FigureSetup")
            if not Ucj5zBeMH1P then return end
            
            local Vcj6aCfNI2Q = Ucj5zBeMH1P:FindFirstChild("FigureRagdoll")
            if not Vcj6aCfNI2Q then return end
            
            local Wcj7bDgOJ3R = Vcj6aCfNI2Q:FindFirstChild("Torso")
            if not Wcj7bDgOJ3R then return end
            
            local Xcj8cEhPK4S = Raj0wYbJE6M.Character
            if not Xcj8cEhPK4S then return end
            
            local Ycj9dFiQL5T = Xcj8cEhPK4S:FindFirstChild("HumanoidRootPart")
            if not Ycj9dFiQL5T then return end
            
            local Zcj0eGjRM6U = (Ycj9dFiQL5T.Position - Wcj7bDgOJ3R.Position).magnitude
            
            if Zcj0eGjRM6U >= 15 and Zcj0eGjRM6U <= 20 then
                Waj5bDgOJ1R = Waj5bDgOJ1R == 1 and 2 or 1
                Ycj9dFiQL5T.CFrame = Fbj4kMpXS0A[Waj5bDgOJ1R]
            elseif Zcj0eGjRM6U < 15 then
                Waj5bDgOJ1R = Waj5bDgOJ1R == 1 and 2 or 1
                Ycj9dFiQL5T.CFrame = Fbj4kMpXS0A[Waj5bDgOJ1R]
            end
        end)
    end)
end

local function Adj1fHkSN7V()
    if Vaj4aCfNI0Q then
        Vaj4aCfNI0Q:Disconnect()
        Vaj4aCfNI0Q = nil
        spawn(function()
            Kbj9pRuCX5F("Figure tracking stopped", "info")
        end)
    else
        spawn(function()
            Kbj9pRuCX5F("Figure tracking was not running", "info")
        end)
    end
end

local function Bdj2gIlTO8W()
    local Cdj3hJmUP9X = Raj0wYbJE6M.Character
    if not Cdj3hJmUP9X then
        spawn(function()
            Kbj9pRuCX5F("Character not found!", "error")
        end)
        return
    end
    
    local Ddj4iKnVQ0Y = Cdj3hJmUP9X:FindFirstChild("HumanoidRootPart")
    if not Ddj4iKnVQ0Y then
        spawn(function()
            Kbj9pRuCX5F("HumanoidRootPart not found!", "error")
        end)
        return
    end
    
    local Edj5jLoWR1Z = CFrame.new(
        0.88565439, 19.2949562, -109.371742,
        -0.998881638, 0.00240474031, -0.0472193025,
        -7.93140771e-08, 0.998705626, 0.0508628227,
        0.0472804941, 0.0508059449, -0.997588754
    )
    
    Ddj4iKnVQ0Y.CFrame = Edj5jLoWR1Z
    spawn(function()
        Kbj9pRuCX5F("Teleported to Door", "success")
    end)
end

local function Fdj6kMpXS2A()
    local Gdj7lNqYT3B = Raj0wYbJE6M.Character
    if not Gdj7lNqYT3B then
        spawn(function()
            Kbj9pRuCX5F("Character not found!", "error")
        end)
        return
    end
    
    local Hdj8mOrZU4C = Gdj7lNqYT3B:FindFirstChild("HumanoidRootPart")
    if not Hdj8mOrZU4C then
        spawn(function()
            Kbj9pRuCX5F("HumanoidRootPart not found!", "error")
        end)
        return
    end
    
    local Idj9nPsAV5D = CFrame.new(
        -53.6578979, 11.3413105, -21.9969749,
        0.423553586, -0.90396452, -0.0587408952,
        0.1525819, 0.00727360509, 0.988264024,
        -0.892928481, -0.427545547, 0.141009375
    )
    
    Hdj8mOrZU4C.CFrame = Idj9nPsAV5D
    spawn(function()
        Kbj9pRuCX5F("Teleported to BPaper", "success")
    end)
end

local function Jdj0oQtBW6E()
    Abj9fHkSN5V = false
    if Yaj7dFiQL3T then
        Yaj7dFiQL3T:Disconnect()
        Yaj7dFiQL3T = nil
        spawn(function()
            Kbj9pRuCX5F("WalkSpeed loop stopped", "info")
        end)
    end
    
    local Kdj1pRuCX7F = Raj0wYbJE6M.Character
    if Kdj1pRuCX7F then
        local Ldj2qSvDY8G = Kdj1pRuCX7F:FindFirstChild("Humanoid")
        if Ldj2qSvDY8G then
            Ldj2qSvDY8G.WalkSpeed = 16
            spawn(function()
                Kbj9pRuCX5F("WalkSpeed reset to 16", "success")
            end)
        end
    end
end

local function Mdj3rTwEZ9H(Ndj4sUxFA0I)
    local Odj5tVyGB1J = tonumber(Ndj4sUxFA0I)
    if not Odj5tVyGB1J then
        spawn(function()
            Kbj9pRuCX5F("Invalid WalkSpeed value!", "error")
        end)
        return
    end
    
    if Yaj7dFiQL3T then
        Yaj7dFiQL3T:Disconnect()
        Yaj7dFiQL3T = nil
    end
    
    Zaj8eGjRM4U = Odj5tVyGB1J
    Abj9fHkSN5V = true
    
    Yaj7dFiQL3T = Maj5rTwEZ1H.RenderStepped:Connect(function()
        if Abj9fHkSN5V and Raj0wYbJE6M.Character and Raj0wYbJE6M.Character:FindFirstChild("Humanoid") then
            Raj0wYbJE6M.Character.Humanoid.WalkSpeed = Zaj8eGjRM4U
        end
    end)
    
    spawn(function()
        Kbj9pRuCX5F("WalkSpeed set to " .. Odj5tVyGB1J, "success")
    end)
end

local function Pdj6uWzHC2K()
    local Qdj7vXaID3L = Raj0wYbJE6M.Character
    if not Qdj7vXaID3L then
        spawn(function()
            Kbj9pRuCX5F("Character not found!", "error")
        end)
        return
    end
    
    local Rdj8wYbJE4M = Qdj7vXaID3L:FindFirstChild("HumanoidRootPart")
    if not Rdj8wYbJE4M then
        spawn(function()
            Kbj9pRuCX5F("HumanoidRootPart not found!", "error")
        end)
        return
    end
    
    local Sdj9xZcKF5N, Tdj0yAdLG6O = pcall(function()
        Rdj8wYbJE4M.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        Rdj8wYbJE4M.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        
        if Rdj8wYbJE4M.Velocity then
            Rdj8wYbJE4M.Velocity = Vector3.new(0, 0, 0)
        end
        
        local Udj1zBeMH7P = Qdj7vXaID3L:FindFirstChild("Humanoid")
        if Udj1zBeMH7P then
            Udj1zBeMH7P.PlatformStand = false
        end
        
        for Vdj2aCfNI8Q, Wdj3bDgOJ9R in pairs(Rdj8wYbJE4M:GetChildren()) do
            if Wdj3bDgOJ9R:IsA("BodyVelocity") or Wdj3bDgOJ9R:IsA("BodyPosition") or Wdj3bDgOJ9R:IsA("BodyAngularVelocity") or Wdj3bDgOJ9R:IsA("BodyThrust") or Wdj3bDgOJ9R:IsA("BodyForce") then
                Wdj3bDgOJ9R:Destroy()
            end
        end
    end)
    
    if Sdj9xZcKF5N then
        spawn(function()
            Kbj9pRuCX5F("Player velocity broken!", "success")
        end)
    else
        spawn(function()
            Kbj9pRuCX5F("Failed to break velocity: " .. tostring(Tdj0yAdLG6O), "error")
        end)
    end
end

local Xdj4cEhPK0S = Instance.new("ScreenGui")
Xdj4cEhPK0S.Name = "BookshelfControlGui"
Xdj4cEhPK0S.ResetOnSpawn = false
Xdj4cEhPK0S.Parent = Paj8uWzHC4K

local Ydj5dFiQL1T = Instance.new("UIScale")
Ydj5dFiQL1T.Scale = 0.8
Ydj5dFiQL1T.Parent = Xdj4cEhPK0S

local Zdj6eGjRM2U = Instance.new("Frame")
Zdj6eGjRM2U.Name = "MainFrame"
Zdj6eGjRM2U.Size = UDim2.new(0, 240, 0, 280)
Zdj6eGjRM2U.Position = UDim2.new(0, 20, 0.5, -140)
Zdj6eGjRM2U.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Zdj6eGjRM2U.BorderSizePixel = 0
Zdj6eGjRM2U.Parent = Xdj4cEhPK0S

local Aej7fHkSN3V = Instance.new("UICorner")
Aej7fHkSN3V.CornerRadius = UDim.new(0, 15)
Aej7fHkSN3V.Parent = Zdj6eGjRM2U

local Bej8gIlTO4W = Instance.new("UIStroke")
Bej8gIlTO4W.Color = Color3.fromRGB(138, 43, 226)
Bej8gIlTO4W.Thickness = 2
Bej8gIlTO4W.Parent = Zdj6eGjRM2U

local Cej9hJmUP5X = Instance.new("TextLabel")
Cej9hJmUP5X.Name = "TitleLabel"
Cej9hJmUP5X.Size = UDim2.new(1, 0, 0, 50)
Cej9hJmUP5X.Position = UDim2.new(0, 0, 0, 0)
Cej9hJmUP5X.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
Cej9hJmUP5X.BorderSizePixel = 0
Cej9hJmUP5X.Text = "Figure's Library"
Cej9hJmUP5X.TextColor3 = Color3.fromRGB(255, 255, 255)
Cej9hJmUP5X.TextSize = 22
Cej9hJmUP5X.Font = Enum.Font.SourceSansBold
Cej9hJmUP5X.Parent = Zdj6eGjRM2U

local Dej0iKnVQ6Y = Instance.new("UICorner")
Dej0iKnVQ6Y.CornerRadius = UDim.new(0, 15)
Dej0iKnVQ6Y.Parent = Cej9hJmUP5X

local Eej1jLoWR7Z = Instance.new("TextButton")
Eej1jLoWR7Z.Name = "MinimizeButton"
Eej1jLoWR7Z.Size = UDim2.new(0, 30, 0, 30)
Eej1jLoWR7Z.Position = UDim2.new(0, 10, 0, 10)
Eej1jLoWR7Z.BackgroundTransparency = 1
Eej1jLoWR7Z.Text = "-"
Eej1jLoWR7Z.TextColor3 = Color3.fromRGB(255, 255, 255)
Eej1jLoWR7Z.TextSize = 24
Eej1jLoWR7Z.Font = Enum.Font.SourceSansBold
Eej1jLoWR7Z.Parent = Cej9hJmUP5X

local Fej2kMpXS8A = Instance.new("ScrollingFrame")
Fej2kMpXS8A.Name = "Page1ScrollFrame"
Fej2kMpXS8A.Size = UDim2.new(1, -30, 1, -70)
Fej2kMpXS8A.Position = UDim2.new(0, 15, 0, 60)
Fej2kMpXS8A.BackgroundTransparency = 1
Fej2kMpXS8A.BorderSizePixel = 0
Fej2kMpXS8A.ScrollBarThickness = 6
Fej2kMpXS8A.ScrollBarImageColor3 = Color3.fromRGB(138, 43, 226)
Fej2kMpXS8A.CanvasSize = UDim2.new(0, 0, 0, 0)
Fej2kMpXS8A.Parent = Zdj6eGjRM2U

local Gej3lNqYT9B = Instance.new("UIListLayout")
Gej3lNqYT9B.FillDirection = Enum.FillDirection.Vertical
Gej3lNqYT9B.HorizontalAlignment = Enum.HorizontalAlignment.Center
Gej3lNqYT9B.VerticalAlignment = Enum.VerticalAlignment.Top
Gej3lNqYT9B.Padding = UDim.new(0, 15)
Gej3lNqYT9B.Parent = Fej2kMpXS8A

Gej3lNqYT9B:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Fej2kMpXS8A.CanvasSize = UDim2.new(0, 0, 0, Gej3lNqYT9B.AbsoluteContentSize.Y + 20)
end)

local Hej4mOrZU0C = Instance.new("ScrollingFrame")
Hej4mOrZU0C.Name = "Page2ScrollFrame"
Hej4mOrZU0C.Size = UDim2.new(1, -30, 1, -70)
Hej4mOrZU0C.Position = UDim2.new(0, 15, 0, 60)
Hej4mOrZU0C.BackgroundTransparency = 1
Hej4mOrZU0C.BorderSizePixel = 0
Hej4mOrZU0C.ScrollBarThickness = 6
Hej4mOrZU0C.ScrollBarImageColor3 = Color3.fromRGB(138, 43, 226)
Hej4mOrZU0C.CanvasSize = UDim2.new(0, 0, 0, 0)
Hej4mOrZU0C.Visible = false
Hej4mOrZU0C.Parent = Zdj6eGjRM2U

local Iej5nPsAV1D = Instance.new("UIListLayout")
Iej5nPsAV1D.FillDirection = Enum.FillDirection.Vertical
Iej5nPsAV1D.HorizontalAlignment = Enum.HorizontalAlignment.Center
Iej5nPsAV1D.VerticalAlignment = Enum.VerticalAlignment.Top
Iej5nPsAV1D.Padding = UDim.new(0, 15)
Iej5nPsAV1D.Parent = Hej4mOrZU0C

Iej5nPsAV1D:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Hej4mOrZU0C.CanvasSize = UDim2.new(0, 0, 0, Iej5nPsAV1D.AbsoluteContentSize.Y + 20)
end)

local Jej6oQtBW2E = Instance.new("TextBox")
Jej6oQtBW2E.Name = "WalkSpeedTextBox"
Jej6oQtBW2E.Size = UDim2.new(1, 0, 0, 50)
Jej6oQtBW2E.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
Jej6oQtBW2E.TextColor3 = Color3.fromRGB(255, 255, 255)
Jej6oQtBW2E.PlaceholderText = "Enter WalkSpeed..."
Jej6oQtBW2E.Text = ""
Jej6oQtBW2E.Font = Enum.Font.SourceSans
Jej6oQtBW2E.TextSize = 16
Jej6oQtBW2E.BorderSizePixel = 0
Jej6oQtBW2E.LayoutOrder = 1
Jej6oQtBW2E.Parent = Hej4mOrZU0C

local Kej7pRuCX3F = Instance.new("UICorner")
Kej7pRuCX3F.CornerRadius = UDim.new(0, 10)
Kej7pRuCX3F.Parent = Jej6oQtBW2E

local Lej8qSvDY4G = Instance.new("UIStroke")
Lej8qSvDY4G.Color = Color3.fromRGB(138, 43, 226)
Lej8qSvDY4G.Transparency = 0.7
Lej8qSvDY4G.Thickness = 1
Lej8qSvDY4G.Parent = Jej6oQtBW2E

local function Mej9rTwEZ5H(Nej0sUxFA6I, Oej1tVyGB7J, Pej2uWzHC8K)
    local Qej3vXaID9L = Instance.new("TextButton")
    Qej3vXaID9L.Size = UDim2.new(1, 0, 0, 50)
    Qej3vXaID9L.BackgroundColor3 = Oej1tVyGB7J
    Qej3vXaID9L.TextColor3 = Color3.fromRGB(255, 255, 255)
    Qej3vXaID9L.Text = Nej0sUxFA6I
    Qej3vXaID9L.Font = Enum.Font.SourceSansBold
    Qej3vXaID9L.TextSize = 16
    Qej3vXaID9L.BorderSizePixel = 0

    local Rej4wYbJE0M = Instance.new("UICorner")
    Rej4wYbJE0M.CornerRadius = UDim.new(0, 10)
    Rej4wYbJE0M.Parent = Qej3vXaID9L

    local Sej5xZcKF1N = Instance.new("UIStroke")
    Sej5xZcKF1N.Color = Color3.fromRGB(138, 43, 226)
    Sej5xZcKF1N.Transparency = 0.7
    Sej5xZcKF1N.Thickness = 1
    Sej5xZcKF1N.Parent = Qej3vXaID9L

    local Tej6yAdLG2O = Qej3vXaID9L.Size
    local Uej7zBeMH3P = Qej3vXaID9L.BackgroundColor3

    Qej3vXaID9L.MouseButton1Down:Connect(function()
        Hbj6mOrZU2C("6895079853")
        local Vej8aCfNI4Q = UDim2.new(Tej6yAdLG2O.X.Scale * 0.96, Tej6yAdLG2O.X.Offset, Tej6yAdLG2O.Y.Scale * 0.96, Tej6yAdLG2O.Y.Offset)
        Naj6sUxFA2I:Create(Qej3vXaID9L, Dbj2iKnVQ8Y, {
            Size = Vej8aCfNI4Q,
            BackgroundColor3 = Color3.new(
                Uej7zBeMH3P.R * 0.7,
                Uej7zBeMH3P.G * 0.7,
                Uej7zBeMH3P.B * 0.7
            )
        }):Play()
    end)

    Qej3vXaID9L.MouseButton1Up:Connect(function()
        Naj6sUxFA2I:Create(Qej3vXaID9L, Ebj3jLoWR9Z, {
            Size = Tej6yAdLG2O,
            BackgroundColor3 = Uej7zBeMH3P
        }):Play()
    end)

    Qej3vXaID9L.MouseEnter:Connect(function()
        Naj6sUxFA2I:Create(Qej3vXaID9L, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.new(
                math.min(Uej7zBeMH3P.R * 1.2, 1),
                math.min(Uej7zBeMH3P.G * 1.2, 1),
                math.min(Uej7zBeMH3P.B * 1.2, 1)
            )
        }):Play()
        Naj6sUxFA2I:Create(Sej5xZcKF1N, TweenInfo.new(0.2), {
            Transparency = 0.3
        }):Play()
    end)

    Qej3vXaID9L.MouseLeave:Connect(function()
        Naj6sUxFA2I:Create(Qej3vXaID9L, TweenInfo.new(0.2), {
            BackgroundColor3 = Uej7zBeMH3P
        }):Play()
        Naj6sUxFA2I:Create(Sej5xZcKF1N, TweenInfo.new(0.2), {
            Transparency = 0.7
        }):Play()
    end)

    Qej3vXaID9L.MouseButton1Click:Connect(Pej2uWzHC8K)

    return Qej3vXaID9L
end

local function Wej9bDgOJ5R()
    Fej2kMpXS8A.Visible = false
    Hej4mOrZU0C.Visible = true
end

local function Xej0cEhPK6S()
    Fej2kMpXS8A.Visible = true
    Hej4mOrZU0C.Visible = false
end

local function Yej1dFiQL7T()
    if Cbj1hJmUP7X then
        Naj6sUxFA2I:Create(Zdj6eGjRM2U, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 240, 0, 280)
        }):Play()
        Fej2kMpXS8A.Visible = true
        Hej4mOrZU0C.Visible = false
        Eej1jLoWR7Z.Text = "-"
        Cbj1hJmUP7X = false
    else
        Naj6sUxFA2I:Create(Zdj6eGjRM2U, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 240, 0, 50)
        }):Play()
        Fej2kMpXS8A.Visible = false
        Hej4mOrZU0C.Visible = false
        Eej1jLoWR7Z.Text = "+"
        Cbj1hJmUP7X = true
    end
end

Eej1jLoWR7Z.MouseButton1Click:Connect(Yej1dFiQL7T)

local Zej2eGjRM8U = Mej9rTwEZ5H("Find Books", Color3.fromRGB(40, 40, 50), Zbj4eGjRM0U)
Zej2eGjRM8U.Parent = Fej2kMpXS8A

local Afj3fHkSN9V = Mej9rTwEZ5H("Destroy Highlights", Color3.fromRGB(40, 40, 50), Ubj9zBeMH5P)
Afj3fHkSN9V.Parent = Fej2kMpXS8A

local Bfj4gIlTO0W = Mej9rTwEZ5H("Start Figure Track", Color3.fromRGB(40, 40, 50), Rcj2wYbJE8M)
Bfj4gIlTO0W.Parent = Fej2kMpXS8A

local Cfj5hJmUP1X = Mej9rTwEZ5H("Stop Figure Track", Color3.fromRGB(40, 40, 50), Adj1fHkSN7V)
Cfj5hJmUP1X.Parent = Fej2kMpXS8A

local Dfj6iKnVQ2Y = Mej9rTwEZ5H("Revive", Color3.fromRGB(40, 40, 50), Mcj7rTwEZ3H)
Dfj6iKnVQ2Y.Parent = Fej2kMpXS8A

local Efj7jLoWR3Z = Mej9rTwEZ5H("TP To Door", Color3.fromRGB(40, 40, 50), Bdj2gIlTO8W)
Efj7jLoWR3Z.Parent = Fej2kMpXS8A

local Ffj8kMpXS4A = Mej9rTwEZ5H("TP To BPaper", Color3.fromRGB(40, 40, 50), Fdj6kMpXS2A)
Ffj8kMpXS4A.Parent = Fej2kMpXS8A

local Gfj9lNqYT5B = Mej9rTwEZ5H("Go To Next Page", Color3.fromRGB(40, 40, 50), Wej9bDgOJ5R)
Gfj9lNqYT5B.Parent = Fej2kMpXS8A

local Hfj0mOrZU6C = Mej9rTwEZ5H("Apply WalkSpeed", Color3.fromRGB(40, 40, 50), function()
    Mdj3rTwEZ9H(Jej6oQtBW2E.Text)
end)
Hfj0mOrZU6C.LayoutOrder = 2
Hfj0mOrZU6C.Parent = Hej4mOrZU0C

local Ifj1nPsAV7D = Mej9rTwEZ5H("Reset WalkSpeed", Color3.fromRGB(40, 40, 50), Jdj0oQtBW6E)
Ifj1nPsAV7D.LayoutOrder = 3
Ifj1nPsAV7D.Parent = Hej4mOrZU0C

local Jfj2oQtBW8E = Mej9rTwEZ5H("Break Velocity", Color3.fromRGB(40, 40, 50), Pdj6uWzHC2K)
Jfj2oQtBW8E.LayoutOrder = 4
Jfj2oQtBW8E.Parent = Hej4mOrZU0C

local Kfj3pRuCX9F = Mej9rTwEZ5H("Go Back", Color3.fromRGB(40, 40, 50), Xej0cEhPK6S)
Kfj3pRuCX9F.LayoutOrder = 5
Kfj3pRuCX9F.Parent = Hej4mOrZU0C

local Lfj4qSvDY0G = nil
local Mfj5rTwEZ1H = 0.25
local Nfj6sUxFA2I = nil
local Ofj7tVyGB3J = nil

local function Pfj8uWzHC4K(Qfj9vXaID5L)
    local Rfj0wYbJE6M = Qfj9vXaID5L.Position - Nfj6sUxFA2I
    local Sfj1xZcKF7N = UDim2.new(Ofj7tVyGB3J.X.Scale, Ofj7tVyGB3J.X.Offset + Rfj0wYbJE6M.X, Ofj7tVyGB3J.Y.Scale, Ofj7tVyGB3J.Y.Offset + Rfj0wYbJE6M.Y)
    Naj6sUxFA2I:Create(Zdj6eGjRM2U, TweenInfo.new(Mfj5rTwEZ1H), {Position = Sfj1xZcKF7N}):Play()
end

Cej9hJmUP5X.InputBegan:Connect(function(Tfj2yAdLG8O)
    if (Tfj2yAdLG8O.UserInputType == Enum.UserInputType.MouseButton1 or Tfj2yAdLG8O.UserInputType == Enum.UserInputType.Touch) then
        Lfj4qSvDY0G = true
        Nfj6sUxFA2I = Tfj2yAdLG8O.Position
        Ofj7tVyGB3J = Zdj6eGjRM2U.Position
        Tfj2yAdLG8O.Changed:Connect(function()
            if Tfj2yAdLG8O.UserInputState == Enum.UserInputState.End then
                Lfj4qSvDY0G = false
            end
        end)
    end
end)

Cej9hJmUP5X.InputChanged:Connect(function(Ufj3zBeMH9P)
    if (Ufj3zBeMH9P.UserInputType == Enum.UserInputType.MouseMovement or Ufj3zBeMH9P.UserInputType == Enum.UserInputType.Touch) then
        if Lfj4qSvDY0G then
            Pfj8uWzHC4K(Ufj3zBeMH9P)
        end
    end
end)
