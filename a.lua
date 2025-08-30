local TweenService = game:GetService("TweenService")

local baseFolder = "Ixry Shizuka"
local pluginsFolder = baseFolder .. "/plugins"

if not isfolder(baseFolder) then makefolder(baseFolder) end
if not isfolder(pluginsFolder) then makefolder(pluginsFolder) end

local function getFileList()
    local files = listfiles(pluginsFolder)
    local names = {}
    for _, path in ipairs(files) do
        local name = path:match("[^/\\]+$")
        table.insert(names, name)
    end
    return names
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "File Manager"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = MainFrame

local Dropdown = Instance.new("TextButton")
Dropdown.Size = UDim2.new(1, -40, 0, 40)
Dropdown.Position = UDim2.new(0, 20, 0, 60)
Dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Dropdown.Text = "Select File"
Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
Dropdown.Font = Enum.Font.Gotham
Dropdown.TextSize = 16
Dropdown.Parent = MainFrame

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 8)
UICorner2.Parent = Dropdown

local FileListFrame = Instance.new("Frame")
FileListFrame.Size = UDim2.new(1, -40, 0, 80)
FileListFrame.Position = UDim2.new(0, 20, 0, 100)
FileListFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
FileListFrame.Visible = false
FileListFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = FileListFrame
UIListLayout.Padding = UDim.new(0, 4)

local DeleteButton = Instance.new("TextButton")
DeleteButton.Size = UDim2.new(1, -40, 0, 40)
DeleteButton.Position = UDim2.new(0, 20, 1, -50)
DeleteButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
DeleteButton.Text = "Delete Selected File"
DeleteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DeleteButton.Font = Enum.Font.Gotham
DeleteButton.TextSize = 16
DeleteButton.Parent = MainFrame

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 8)
UICorner3.Parent = DeleteButton

local selectedFile

local function refreshFileList()
    for _, child in ipairs(FileListFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    for _, name in ipairs(getFileList()) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 30)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.Text = name
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 14
        btn.Parent = FileListFrame
        btn.MouseButton1Click:Connect(function()
            selectedFile = name
            Dropdown.Text = name
            FileListFrame.Visible = false
        end)
    end
end

Dropdown.MouseButton1Click:Connect(function()
    FileListFrame.Visible = not FileListFrame.Visible
    if FileListFrame.Visible then
        refreshFileList()
    end
end)

DeleteButton.MouseButton1Click:Connect(function()
    if selectedFile then
        local filePath = pluginsFolder .. "/" .. selectedFile
        if isfile(filePath) then
            delfile(filePath)
            selectedFile = nil
            Dropdown.Text = "Select File"
            refreshFileList()
            local tweenIn = TweenService:Create(DeleteButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 70, 70)})
            local tweenOut = TweenService:Create(DeleteButton, TweenInfo.new(0.5), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)})
            tweenIn:Play()
            tweenIn.Completed:Wait()
            tweenOut:Play()
        end
    end
end)

refreshFileList()
