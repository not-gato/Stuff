-- WARNING: THIS IS A FALSE POSITIVE, THIS SCRIPT DOES NOT HARM YOUR DEVICE OR ACCOUNT, WE ONLY CREATE FILES OR CALL LOADSTRINGS(), CHECK FOR YOURSELF!

local BindModule = loadstring(game:HttpGet("https://github.com/not-gato/Stuff/raw/refs/heads/main/BindButton.lua"))()
local Shared = odh_shared_plugins
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local InsertService = game:GetService("InsertService")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local GuiService = game:GetService("GuiService")

local SavedPosition = nil
local Respawning = false
local SelectedRespawnAmount = 12

local DecalId = 101525741634578
local LoopJOB = false
local LoopThread = nil
local SelectedTargetType = "Nearest Player"
local SelectedPlayer = nil

local InfiniteJumpEnabled = true
local JumpConnection = nil
local RaycastParams = RaycastParams.new()
RaycastParams.FilterType = Enum.RaycastFilterType.Blacklist

local OriginalMaterials = {}
local OriginalAccessories = {}
local OriginalTechnology = Lighting.Technology

local hui = gethui()
local originals = {}
local connections = {}
local currentScale = 1

local otherUI = {}
pcall(function()
    local hidden = hui[""]
    if hidden then
        otherUI[#otherUI+1] = hidden:FindFirstChild("Maximize")
        otherUI[#otherUI+1] = hidden:FindFirstChild("\208\183\208\176\209\129\209\130\209\128\208\181\208\187\208\184\209\130\209\140 \209\131\208\177\208\184\208\185\209\134\209\131")
    end
end)

local ui_enabled = false
local screen_ui
local current_scale = 1

local buttonsHidden = false
local uiScaleValue = 1

local deleting = false

local WallhopSection = Shared.AddSection("Wallhop | #1")
local CamSection = Shared.AddSection("Camera Stretch | #2")
local ProfileSection = Shared.AddSection("Profile Picture Editor | #3")
local LightningSection = Shared.AddSection("Lightning | #4")
local GraphicsSection = Shared.AddSection("Graphics | #5")
local Section = Shared.AddSection("Spray Paint | #6")
local MyOwnSection = Shared.AddSection("Map Voter | #7")
local PerformanceSection = Shared.AddSection("Performance | #8")
local OtherSection = Shared.AddSection("Other | #9")
local fun_section = Shared.AddSection("Fun | #10")

-- REINA DOES MAKE GAY THINGS ✅️✅️✅️✅️✅️✅️✅️✅️✅️

local function GetWallRaycastResult()
    local Character = LocalPlayer.Character
    if not Character then return nil end
    local Hrp = Character:FindFirstChild("HumanoidRootPart")
    if not Hrp then return nil end
        
    RaycastParams.FilterDescendantsInstances = {Character}
        
    local ClosestHit, MinDistance = nil, 3
    local HrpCF = Hrp.CFrame
        
    for i = 0,7 do
        local Angle = math.rad(i*45)
        local Dir = (HrpCF*CFrame.Angles(0,Angle,0)).LookVector
        local Ray = Workspace:Raycast(Hrp.Position, Dir*2, RaycastParams)
        if Ray and Ray.Instance and Ray.Distance < MinDistance then
            MinDistance = Ray.Distance
            ClosestHit = Ray
        end
    end
        
    local BlockCastOrigin = HrpCF*CFrame.new(0,-1,-0.5)
    local BlockResult = Workspace:Blockcast(BlockCastOrigin, Vector3.new(1.5,1,0.5), HrpCF.LookVector*1.5, RaycastParams)
    if BlockResult and BlockResult.Instance and BlockResult.Distance < MinDistance then
        ClosestHit = BlockResult
    end
        
    return ClosestHit
end

local function PerformFaceWallJump()
    local Character = LocalPlayer.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
    local Camera = Workspace.CurrentCamera
        
    if not (Humanoid and RootPart and Camera and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead) then return end
        
    local Wall = GetWallRaycastResult()
    if not Wall then return end
        
    local MaxR, MaxL = math.rad(20), math.rad(-100)
    local Base = Vector3.new(Wall.Normal.X,0,Wall.Normal.Z)
    if Base.Magnitude > 0 then Base = Base.Unit end
        
    if Base.Magnitude < 0.1 then
        local Dir = (Wall.Position - RootPart.Position)*Vector3.new(1,0,1)
        if Dir.Magnitude > 0 then Base = -Dir.Unit end
        if Base.Magnitude < 0.1 then
            Base = -RootPart.CFrame.LookVector*Vector3.new(1,0,1)
            if Base.Magnitude > 0 then Base = Base.Unit end
            if Base.Magnitude < 0.1 then Base = Vector3.new(0,0,1) end
        end
    end
        
    Base = Vector3.new(Base.X,0,Base.Z)
    if Base.Magnitude > 0 then Base = Base.Unit end
    if Base.Magnitude < 0.1 then Base = Vector3.new(0,0,1) end
        
    local HorLook = Vector3.new(Camera.CFrame.LookVector.X,0,Camera.CFrame.LookVector.Z)
    if HorLook.Magnitude > 0 then HorLook = HorLook.Unit else HorLook = Base end
        
    local Dot = math.clamp(Base:Dot(HorLook), -1,1)
    local Angle = math.acos(Dot)
    local Cross = Base:Cross(HorLook)
    local Sign = -math.sign(Cross.Y)
    if Sign == 0 then Angle = 0 end
        
    local FinalAngle = 0
    if Sign == 1 then FinalAngle = math.min(Angle,MaxR)
    elseif Sign == -1 then FinalAngle = math.min(Angle,MaxL) end
        
    local Adj = CFrame.Angles(0, FinalAngle*Sign, 0)
    local LookDir = Adj:VectorToWorldSpace(Base)
    RootPart.CFrame = CFrame.lookAt(RootPart.Position, RootPart.Position + LookDir)
        
    RunService.Heartbeat:Wait()
        
    if Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        RootPart.CFrame = RootPart.CFrame*CFrame.Angles(0,-1,0)
        task.wait(0.15)
        RootPart.CFrame = RootPart.CFrame*CFrame.Angles(0,1,0)
        local Back = -Base
        task.wait(0.05)
        RootPart.CFrame = CFrame.lookAt(RootPart.Position, RootPart.Position + Back)
    end
end

local WallhopToggle = false
WallhopSection:AddToggle("WallHop Toggle", function(state) WallhopToggle = state end)

WallhopSection:AddToggle("WallHop Bindable Button", function(state)
    if state then
        BindModule:CreateBindable("WallHop", function(toggled)
            WallhopToggle = toggled
        end)
    else
        BindModule:RemoveBind("WallHop")
    end
end)

WallhopSection:AddKeybind("WallHop Jump Key", "J", PerformFaceWallJump)

JumpConnection = UserInputService.JumpRequest:Connect(function()
    if not WallhopToggle or not InfiniteJumpEnabled then return end
    PerformFaceWallJump()
end)

local Camera = Workspace.CurrentCamera
local StretchActive = false
local StretchConnection = nil

CamSection:AddLabel("Some Executors May Break This, Use With Caution")
CamSection:AddToggle("Camera Stretch", function(state)
    StretchActive = state
    if StretchActive then
        if not StretchConnection then
            StretchConnection = RunService.RenderStepped:Connect(function()
                Camera.CFrame = Camera.CFrame * CFrame.new(0,0,0,1,0,0,0,0.67,0,0,0,1)
            end)
        end
    else
        if StretchConnection then StretchConnection:Disconnect(); StretchConnection = nil end
    end
end)

local ProfileOptions = {
    "Cat Profile Picture #1",
    "Cat Profile Picture #2",
    "Cat Profile Picture #3",
    "Cat Profile Picture #4",
    "Cat Profile Picture #5",
    "Red Eyes",
    "Purple Eyes",
    "Blue Eyes",
    "Gojo",
    "Orange Anime Girl",
    "Owner Current Profile Picture"
}

local ProfileLinks = {
    ["Cat Profile Picture #1"] = "https://raw.githubusercontent.com/not-gato/Stuff/refs/heads/main/Cute/Awesome.png",
    ["Cat Profile Picture #2"] = "https://raw.githubusercontent.com/not-gato/Stuff/refs/heads/main/Cute/Cute.png",
    ["Cat Profile Picture #3"] = "https://raw.githubusercontent.com/not-gato/Stuff/refs/heads/main/Cute/Cuteee.jpeg",
    ["Cat Profile Picture #4"] = "https://raw.githubusercontent.com/not-gato/Stuff/refs/heads/main/Cute/Lovely.png",
    ["Cat Profile Picture #5"] = "https://raw.githubusercontent.com/not-gato/Stuff/refs/heads/main/Cute/VeryCute.png",
    ["Red Eyes"] = "https://raw.githubusercontent.com/not-gato/Stuff/refs/heads/main/Cute/RedEyes.png",
    ["Purple Eyes"] = "https://raw.githubusercontent.com/not-gato/Stuff/refs/heads/main/Cute/PurpleEyes.png",
    ["Blue Eyes"] = "https://raw.githubusercontent.com/not-gato/Stuff/refs/heads/main/Cute/BlueEyes.png",
    ["Gojo"] = "https://raw.githubusercontent.com/not-gato/Stuff/refs/heads/main/Cute/GojoPFP.png",
    ["Orange Anime Girl"] = "https://raw.githubusercontent.com/not-gato/Stuff/refs/heads/main/Cute/OrangeCartoonyOrangeGirl.jpeg",
}

local function SetProfilePicture(link)
    local Folder = "Ixry Shizuka"
    local FileName = Folder.."/avatar.png"
    if isfile(FileName) then pcall(delfile, FileName) end
    local Success, Content = pcall(function() return game:HttpGet(link) end)
    if Success and Content then
        pcall(writefile, FileName, Content)
    end
end

local SelectedProfile = ProfileOptions[1]
ProfileSection:AddDropdown("Select Profile Picture", ProfileOptions, function(selected)
    SelectedProfile = selected
end)

ProfileSection:AddButton("Apply Selected Profile Picture", function()
    if SelectedProfile == "Owner Current Profile Picture" then
        local UserId = "1183776221302104097"
        local ApiUrl = "https://discord.com/api/v10/users/"..UserId
        local Success, Result = pcall(function() return game:HttpGet(ApiUrl, true) end)
        if Success and Result then
            local Data = HttpService:JSONDecode(Result)
            if Data and Data.avatar then
                local AvatarUrl = "https://cdn.discordapp.com/avatars/"..UserId.."/"..Data.avatar..".png?size=1024"
                SetProfilePicture(AvatarUrl)
                Shared.Notify("Owner profile picture applied.", 1)
            else
                Shared.Notify("Could not fetch owner avatar.", 2)
            end
        else
            Shared.Notify("Discord API fetch failed.", 2)
        end
    else
        if ProfileLinks[SelectedProfile] then
            SetProfilePicture(ProfileLinks[SelectedProfile])
            Shared.Notify("Profile picture applied: "..SelectedProfile, 1)
        end
    end
end)

ProfileSection:AddTextBox("Custom Profile Picture Link", function(text) CustomProfileLink = text end)

ProfileSection:AddButton("Apply Custom Profile Picture", function()
    if CustomProfileLink ~= "" then
        SetProfilePicture(CustomProfileLink)
        Shared.Notify("Custom profile picture applied.", 1)
    end
end)

ProfileSection:AddButton("Remove Profile Picture", function()
    local FileName = "Ixry Shizuka/avatar.png"
    if isfile(FileName) then pcall(delfile, FileName) end
    Shared.Notify("Profile picture removed.", 1)
end)

local FogStart, FogEnd, FogColor = 0, 1000, Color3.new(1,1,1)

local SkyboxPresets = {
    ["Minecraft Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://8735166756"
        Sky.SkyboxDn = "rbxassetid://8735166707"
        Sky.SkyboxFt = "rbxassetid://8735231668"
        Sky.SkyboxLf = "rbxassetid://8735166755"
        Sky.SkyboxRt = "rbxassetid://8735166751"
        Sky.SkyboxUp = "rbxassetid://8735166729"
        Sky.SunTextureId = "rbxassetid://8735166708"
        Sky.MoonTextureId = "rbxassetid://8735166687"
        Sky.Parent = Lighting
        Lighting.FogColor = Color3.fromRGB(185, 242, 246)
        Lighting.FogEnd = 2000
        Lighting.FogStart = 0
        Lighting.Ambient = Color3.fromRGB(2, 125, 157)
        Lighting.Brightness = 3.133
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(9, 111, 157)
        Lighting.ShadowSoftness = 1
        Lighting.Technology = Enum.Technology.Future
    end,
    ["Realistic Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local RealisticSky = Instance.new("Sky")
        RealisticSky.Name = "RealisticSky"
        RealisticSky.SkyboxBk = "rbxassetid://144933338"
        RealisticSky.SkyboxDn = "rbxassetid://144931530"
        RealisticSky.SkyboxFt = "rbxassetid://144933262"
        RealisticSky.SkyboxLf = "rbxassetid://144933244"
        RealisticSky.SkyboxRt = "rbxassetid://144933299"
        RealisticSky.SkyboxUp = "rbxassetid://144931564"
        RealisticSky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(110, 157, 152)
        Lighting.Brightness = 3.133
        Lighting.ColorShift_Bottom = Color3.fromRGB(118, 161, 155)
        Lighting.ColorShift_Top = Color3.fromRGB(92, 136, 129)
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(117, 157, 151)
        Lighting.ShadowSoftness = 0.5
        Lighting.Technology = Enum.Technology.Voxel
    end,
    ["Purple Nighty Sky #1"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local NebulaSky = Instance.new("Sky"); NebulaSky.Name = "NebulaSky"
        NebulaSky.SkyboxBk = "rbxassetid://159454299"
        NebulaSky.SkyboxDn = "rbxassetid://159454296"
        NebulaSky.SkyboxFt = "rbxassetid://159454293"
        NebulaSky.SkyboxLf = "rbxassetid://159454286"
        NebulaSky.SkyboxRt = "rbxassetid://159454300"
        NebulaSky.SkyboxUp = "rbxassetid://159454288"
        NebulaSky.SunTextureId = ""; NebulaSky.MoonTextureId = ""
        NebulaSky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(87, 6, 105)
        Lighting.Brightness = -9
        Lighting.ColorShift_Bottom = Color3.fromRGB(58, 31, 79)
        Lighting.ColorShift_Top = Color3.fromRGB(41, 32, 74)
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(69, 0, 157)
        Lighting.ShadowSoftness = 0.5
        Lighting.Technology = Enum.Technology.Future
    end,
    ["Purple Nighty Sky #2"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://14543264135"
        Sky.SkyboxDn = "rbxassetid://14543358958"
        Sky.SkyboxFt = "rbxassetid://14543257810"
        Sky.SkyboxLf = "rbxassetid://14543275895"
        Sky.SkyboxRt = "rbxassetid://14543280890"
        Sky.SkyboxUp = "rbxassetid://14543371676"
        Sky.SunTextureId = ""; Sky.MoonTextureId = ""
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(124, 1, 205)
        Lighting.Brightness = 0.23
        Lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
        Lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(95,0,182)
        Lighting.ShadowSoftness = 0.5
        Lighting.Technology = Enum.Technology.Future
    end,
    ["Sunset"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://15502525195"
        Sky.SkyboxDn = "rbxassetid://15502522797"
        Sky.SkyboxFt = "rbxassetid://15502524520"
        Sky.SkyboxLf = "rbxassetid://15502522129"
        Sky.SkyboxRt = "rbxassetid://15502523711"
        Sky.SkyboxUp = "rbxassetid://15502526102"
        Sky.Parent = Lighting
        Lighting.OutdoorAmbient = Color3.fromRGB(210, 104, 0)
        Lighting.ShadowColor = Color3.fromRGB(109, 91, 34)
        Lighting.ShadowSoftness = 1
        Lighting.TimeOfDay = "07:00:00"
        Lighting.Technology = Enum.Technology.Future
        Lighting.Ambient = Color3.fromRGB(233, 191, 12)
        Lighting.Brightness = 1.7
        Lighting.ClockTime = 6.5
    end,
    ["Nighty Sky"] = function()
        for _, obj in pairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky"); Sky.Name = "CustomSky"
        Sky.SkyboxBk = "rbxassetid://168387023"
        Sky.SkyboxDn = "rbxassetid://168387089"
        Sky.SkyboxFt = "rbxassetid://168387054"
        Sky.SkyboxLf = "rbxassetid://168534432"
        Sky.SkyboxRt = "rbxassetid://168387190"
        Sky.SkyboxUp = "rbxassetid://168387135"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.new(0,0,0)
        Lighting.Brightness = 0.3
        Lighting.ClockTime = 14.5
        Lighting.ColorShift_Bottom = Color3.new(0,0,0)
        Lighting.ColorShift_Top = Color3.new(0,0,0)
        Lighting.OutdoorAmbient = Color3.new(0,0,0)
        Lighting.ShadowColor = Color3.new(0,0,0)
        Lighting.ShadowSoftness = 0.2
        Lighting.TimeOfDay = "14:30:00"
        Lighting.Technology = Enum.Technology.Future
    end,
    ["Sunset Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://458016711"
        Sky.SkyboxDn = "rbxassetid://458016826"
        Sky.SkyboxFt = "rbxassetid://458016532"
        Sky.SkyboxLf = "rbxassetid://458016655"
        Sky.SkyboxRt = "rbxassetid://458016782"
        Sky.SkyboxUp = "rbxassetid://458016792"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(255,114,0)
        Lighting.Brightness = 2
        Lighting.ClockTime = 14.5
        Lighting.OutdoorAmbient = Color3.fromRGB(246,105,53)
        Lighting.ShadowColor = Color3.fromRGB(160,105,45)
        Lighting.ShadowSoftness = 0.2
    end,
    ["Night Fog"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://1370717244"
        Sky.SkyboxDn = "rbxassetid://1370717336"
        Sky.SkyboxFt = "rbxassetid://1370717438"
        Sky.SkyboxLf = "rbxassetid://1370717567"
        Sky.SkyboxRt = "rbxassetid://1370717698"
        Sky.SkyboxUp = "rbxassetid://1370717782"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(19,47,98)
        Lighting.Brightness = 0.2
        Lighting.ClockTime = 14.5
        Lighting.OutdoorAmbient = Color3.fromRGB(17,82,115)
        Lighting.ShadowColor = Color3.fromRGB(2,16,51)
        Lighting.ShadowSoftness = 0.2
    end,
    ["Blood Moon"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://401664839"
        Sky.SkyboxDn = "rbxassetid://401664862"
        Sky.SkyboxFt = "rbxassetid://401664960"
        Sky.SkyboxLf = "rbxassetid://401664881"
        Sky.SkyboxRt = "rbxassetid://401664901"
        Sky.SkyboxUp = "rbxassetid://401664936"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(207,71,6)
        Lighting.Brightness = 1
        Lighting.OutdoorAmbient = Color3.fromRGB(187,2,2)
        Lighting.ShadowColor = Color3.fromRGB(82,0,0)
        Lighting.ShadowSoftness = 0.2
    end,
    ["Spongebob Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://15962101128"
        Sky.SkyboxDn = "rbxassetid://15970246218"
        Sky.SkyboxFt = "rbxassetid://15962101128"
        Sky.SkyboxLf = "rbxassetid://15962101128"
        Sky.SkyboxRt = "rbxassetid://15962101128"
        Sky.SkyboxUp = "rbxassetid://15962901054"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(19,171,207)
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(11,188,178)
        Lighting.ShadowColor = Color3.fromRGB(5,82,72)
    end,
    ["Pink Blossom"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://271042516"
        Sky.SkyboxDn = "rbxassetid://271077243"
        Sky.SkyboxFt = "rbxassetid://271042556"
        Sky.SkyboxLf = "rbxassetid://271042310"
        Sky.SkyboxRt = "rbxassetid://271042467"
        Sky.SkyboxUp = "rbxassetid://271077958"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(222,186,255)
        Lighting.Brightness = 3.135
        Lighting.OutdoorAmbient = Color3.fromRGB(231,216,255)
        Lighting.ShadowColor = Color3.fromRGB(163,137,184)
    end,
    ["Purple Sunset"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://264908339"
        Sky.SkyboxDn = "rbxassetid://264907909"
        Sky.SkyboxFt = "rbxassetid://264909420"
        Sky.SkyboxLf = "rbxassetid://264909758"
        Sky.SkyboxRt = "rbxassetid://264908886"
        Sky.SkyboxUp = "rbxassetid://264907379"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(63,21,176)
        Lighting.Brightness = 1
        Lighting.ClockTime = 14.5
        Lighting.OutdoorAmbient = Color3.fromRGB(57,29,125)
        Lighting.ShadowColor = Color3.fromRGB(14,4,39)
        Lighting.ShadowSoftness = 0.2
    end,
    ["Half-Life 2 Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://9000922368"
        Sky.SkyboxDn = "rbxassetid://9000922033"
        Sky.SkyboxFt = "rbxassetid://9000921543"
        Sky.SkyboxLf = "rbxassetid://9000920853"
        Sky.SkyboxRt = "rbxassetid://9000920563"
        Sky.SkyboxUp = "rbxassetid://9000920353"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(169,177,133)
        Lighting.Brightness = 1.299
        Lighting.OutdoorAmbient = Color3.fromRGB(116,126,98)
        Lighting.ShadowColor = Color3.fromRGB(37,40,29)
    end,
    ["Void Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://16262356578"
        Sky.SkyboxDn = "rbxassetid://16262358026"
        Sky.SkyboxFt = "rbxassetid://16262360469"
        Sky.SkyboxLf = "rbxassetid://16262362003"
        Sky.SkyboxRt = "rbxassetid://16262363873"
        Sky.SkyboxUp = "rbxassetid://16262366016"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(99,12,177)
        Lighting.Brightness = 1.7
        Lighting.ClockTime = 14.5
        Lighting.OutdoorAmbient = Color3.fromRGB(83,49,139)
        Lighting.ShadowColor = Color3.fromRGB(48,18,73)
    end,
    ["Purple Night"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://5084575798"
        Sky.SkyboxDn = "rbxassetid://5084575916"
        Sky.SkyboxFt = "rbxassetid://5103949679"
        Sky.SkyboxLf = "rbxassetid://5103948542"
        Sky.SkyboxRt = "rbxassetid://5103948784"
        Sky.SkyboxUp = "rbxassetid://5084576400"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(99,12,177)
        Lighting.Brightness = 1.7
        Lighting.ClockTime = 14.5
        Lighting.OutdoorAmbient = Color3.fromRGB(83,49,139)
        Lighting.ShadowColor = Color3.fromRGB(48,18,73)
    end,
    ["Pink Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://271042516"
        Sky.SkyboxDn = "rbxassetid://271077243"
        Sky.SkyboxFt = "rbxassetid://271042556"
        Sky.SkyboxLf = "rbxassetid://271042310"
        Sky.SkyboxRt = "rbxassetid://271042467"
        Sky.SkyboxUp = "rbxassetid://271077958"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(177,112,170)
        Lighting.Brightness = 1.7
        Lighting.OutdoorAmbient = Color3.fromRGB(135,102,140)
        Lighting.ShadowColor = Color3.fromRGB(73,1,68)
    end,
    ["Realistic Moon"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local Sky = Instance.new("Sky")
        Sky.SkyboxBk = "rbxassetid://2670643994"
        Sky.SkyboxDn = "rbxassetid://2670643365"
        Sky.SkyboxFt = "rbxassetid://2670643214"
        Sky.SkyboxLf = "rbxassetid://2670643070"
        Sky.SkyboxRt = "rbxassetid://2670644173"
        Sky.SkyboxUp = "rbxassetid://2670644331"
        Sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(34,39,61)
        Lighting.Brightness = 0.5
        Lighting.OutdoorAmbient = Color3.fromRGB(73,76,100)
        Lighting.ShadowColor = Color3.fromRGB(32,33,43)
        Lighting.ShadowSoftness = 0.2
    end,
}

local PresetKeys = {}
for k,_ in pairs(SkyboxPresets) do table.insert(PresetKeys, k) end
table.sort(PresetKeys)

local SelectedSkybox = nil
LightningSection:AddDropdown("Predefined Skyboxes", PresetKeys, function(selected) SelectedSkybox = selected end)

LightningSection:AddButton("Apply Selected Predefined Skybox", function()
    if SelectedSkybox and SkyboxPresets[SelectedSkybox] then
        SkyboxPresets[SelectedSkybox]()
        Shared.Notify("Applied "..SelectedSkybox, 1)
    else
        Shared.Notify("No skybox selected or preset missing.", 3)
    end
end)

local CustomSkyboxBk, CustomSkyboxDn, CustomSkyboxFt = "", "", ""
local CustomSkyboxLf, CustomSkyboxRt, CustomSkyboxUp = "", "", ""
local DefaultSkyId = "rbxassetid://8409591219"

local function NormalizeSkyId(s)
    if not s then return DefaultSkyId end
    s = tostring(s):match("^%s*(.-)%s*$")
    if s == "" then return DefaultSkyId end
    local Digits = s:match("(%d+)")
    if not Digits or tonumber(Digits) == 0 then return DefaultSkyId end
    return "rbxassetid://" .. Digits
end

LightningSection:AddTextBox("Custom Skybox - Back (SkyboxBk)", function(text) CustomSkyboxBk = text end)
LightningSection:AddTextBox("Custom Skybox - Down (SkyboxDn)", function(text) CustomSkyboxDn = text end)
LightningSection:AddTextBox("Custom Skybox - Front (SkyboxFt)", function(text) CustomSkyboxFt = text end)
LightningSection:AddTextBox("Custom Skybox - Left (SkyboxLf)", function(text) CustomSkyboxLf = text end)
LightningSection:AddTextBox("Custom Skybox - Right (SkyboxRt)", function(text) CustomSkyboxRt = text end)
LightningSection:AddTextBox("Custom Skybox - Up (SkyboxUp)", function(text) CustomSkyboxUp = text end)

LightningSection:AddButton("Apply Custom Skybox", function()
    for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
    local Sky = Instance.new("Sky")
    Sky.Name = "CustomSky"
    Sky.SkyboxBk = NormalizeSkyId(CustomSkyboxBk)
    Sky.SkyboxDn = NormalizeSkyId(CustomSkyboxDn)
    Sky.SkyboxFt = NormalizeSkyId(CustomSkyboxFt)
    Sky.SkyboxLf = NormalizeSkyId(CustomSkyboxLf)
    Sky.SkyboxRt = NormalizeSkyId(CustomSkyboxRt)
    Sky.SkyboxUp = NormalizeSkyId(CustomSkyboxUp)
    Sky.Parent = Lighting
    task.wait(0)
    if Lighting:FindFirstChild("CustomSky") then
        Shared.Notify("Skybox Set Successfully", 1)
    else
        Shared.Notify("Skybox Set Was Unsuccessful!", 2)
    end
end)

local CreatorStoreSkyAssetId = ""
LightningSection:AddTextBox("Creator Store Sky (AssetID)", function(text) CreatorStoreSkyAssetId = text end)

LightningSection:AddButton("Apply Creator Store Sky", function()
    local Raw = tostring(CreatorStoreSkyAssetId or "")
    local Digits = Raw:match("(%d+)")
    if not Digits then
        Shared.Notify("Invalid AssetID.", 2)
        return
    end
    local AssetId = tonumber(Digits)
    local LoadedRoot
    local Ok, Res = pcall(function()
        return game:GetObjects("rbxassetid://"..Digits)
    end)
    if Ok and Res and #Res > 0 then
        LoadedRoot = Res[1]
    else
        local Ok2, Model = pcall(function()
            return InsertService:LoadAsset(AssetId)
        end)
        if Ok2 and Model then
            LoadedRoot = Model
        end
    end
    if not LoadedRoot then
        Shared.Notify("Failed to load asset: "..Digits, 2)
        return
    end
    local AllowedClass = {
        Sky = true,
        Atmosphere = true,
        BloomEffect = true,
        BlurEffect = true,
        DepthOfFieldEffect = true,
        ColorCorrectionEffect = true,
        SunRaysEffect = true,
        Clouds = true
    }
    for _, V in ipairs(Lighting:GetChildren()) do
        if AllowedClass[V.ClassName] then
            pcall(function() V:Destroy() end)
        end
    end
    local function ApplyFrom(Container)
        if AllowedClass[Container.ClassName] then
            local C = Container:Clone()
            C.Parent = Lighting
        end
        for _, Obj in ipairs(Container:GetDescendants()) do
            if AllowedClass[Obj.ClassName] then
                local Clone = Obj:Clone()
                Clone.Parent = Lighting
            end
        end
    end
    ApplyFrom(LoadedRoot)
    pcall(function() LoadedRoot:Destroy() end)
    Shared.Notify("Creator Store Sky applied from AssetID: "..Digits, 1)
end)

local OriginalSkyProps = {}
local RemoveCelestialsConn = nil
local RemoveCelestialsEnabled = false

local function StoreAndDisableSky(Sky)
    if not Sky or not Sky:IsA("Sky") then return end
    if OriginalSkyProps[Sky] then return end
    OriginalSkyProps[Sky] = {
        CelestialBodiesShown = Sky.CelestialBodiesShown,
        SunTextureId = Sky.SunTextureId,
        MoonTextureId = Sky.MoonTextureId,
        StarCount = Sky.StarCount
    }
    pcall(function() Sky.CelestialBodiesShown = false end)
end

local function RestoreAllSkies()
    for Sky, Props in pairs(OriginalSkyProps) do
        if Sky and Sky.Parent then
            pcall(function()
                if Props.CelestialBodiesShown ~= nil then Sky.CelestialBodiesShown = Props.CelestialBodiesShown end
                if Props.SunTextureId ~= nil then Sky.SunTextureId = Props.SunTextureId end
                if Props.MoonTextureId ~= nil then Sky.MoonTextureId = Props.MoonTextureId end
                if Props.StarCount ~= nil then pcall(function() Sky.StarCount = Props.StarCount end) end
            end)
        end
    end
    OriginalSkyProps = {}
end

LightningSection:AddToggle("Remove Celestial Bodies (Sun & Moon)", function(state)
    if state then
        RemoveCelestialsEnabled = true
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then StoreAndDisableSky(obj) end
        end
        if not RemoveCelestialsConn then
            RemoveCelestialsConn = Lighting.ChildAdded:Connect(function(child)
                if RemoveCelestialsEnabled and child and child:IsA("Sky") then
                    StoreAndDisableSky(child)
                end
            end)
        end
    else
        RemoveCelestialsEnabled = false
        if RemoveCelestialsConn then RemoveCelestialsConn:Disconnect(); RemoveCelestialsConn = nil end
        RestoreAllSkies()
        Shared.Notify("Celestial bodies restored.", 1)
    end
end)

LightningSection:AddLabel("Skyboxes use Texture IDs, not Decal IDs!")

LightningSection:AddTextBox("Fog Start", function(text) FogStart = tonumber(text) or FogStart end)
LightningSection:AddTextBox("Fog End", function(text) FogEnd = tonumber(text) or FogEnd end)
LightningSection:AddTextBox("Fog Color (R,G,B)", function(text)
    local r,g,b = text:match("(%d+),(%d+),(%d+)")
    if r and g and b then FogColor = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b)) end
end)

LightningSection:AddButton("Apply Fog", function()
    Lighting.FogStart = FogStart
    Lighting.FogEnd = FogEnd
    Lighting.FogColor = FogColor
    Shared.Notify("Fog applied.", 1)
end)

local LightingTechMap = {
    Future = Enum.Technology.Future,
    ShadowMap = Enum.Technology.ShadowMap,
    Voxel = Enum.Technology.Voxel,
    Compatibility = Enum.Technology.Compatibility
}

local LightingTechs = {"Future", "ShadowMap", "Voxel", "Compatibility"}
local SelectedTech = "Future"

GraphicsSection:AddDropdown("Lighting Technology", LightingTechs, function(selected) SelectedTech = selected end)

GraphicsSection:AddButton("Apply Selected Lighting Technology", function()
    if SelectedTech and LightingTechMap[SelectedTech] then
        Lighting.Technology = LightingTechMap[SelectedTech]
        Shared.Notify("Lighting technology applied: "..SelectedTech, 1)
    else
        Shared.Notify("Invalid lighting technology.", 2)
    end
end)

GraphicsSection:AddToggle("No Global Shadows", function(state)
    if state then
        Lighting.GlobalShadows = false
        Shared.Notify("Global shadows disabled.", 1)
    else
        Lighting.GlobalShadows = true
        Shared.Notify("Global shadows enabled.", 1)
    end
end)

local CurrentShadowSoftness = Lighting.ShadowSoftness or 0
GraphicsSection:AddTextBox("Shadow Softness", function(text) CurrentShadowSoftness = tonumber(text) or CurrentShadowSoftness end)

GraphicsSection:AddButton("Apply Shadow Softness", function()
    Lighting.ShadowSoftness = CurrentShadowSoftness
    Shared.Notify("Shadow softness set to "..tostring(CurrentShadowSoftness)..".", 1)
end)

local BlurIntensity = 0
local BloomIntensity, BloomSize, BloomThreshold = 0, 24, 2
local CceBrightness, CceContrast, CceSaturation = 0, 0, 0
local CceColor = Color3.new(1,1,1)
local DofeFarIntensity, DofeFocusDistance, DofeInFocusDistance, DofeNearIntensity = 0, 50, 20, 0
local PostInfoText = "<font color='#00FF00'><u>CCE = Color Correction Effect, D.O.F.E. = Depth Of Field Effect</u></font>"

GraphicsSection:AddTextBox("Blur Intensity", function(text) BlurIntensity = tonumber(text) or BlurIntensity end)

GraphicsSection:AddButton("Apply Blur", function()
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("BlurEffect") and v.Name ~= "NewltemBlur" and v.Name ~= "MenuBlur" then pcall(function() v:Destroy() end) end
    end
    local Blur = Instance.new("BlurEffect")
    pcall(function() Blur.Size = BlurIntensity end)
    Blur.Name = "CustomBlur"
    Blur.Parent = Lighting
    Shared.Notify("Blur applied.", 1)
end)

GraphicsSection:AddButton("Remove Blur", function()
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("BlurEffect") and v.Name ~= "NewltemBlur" and v.Name ~= "MenuBlur" then pcall(function() v:Destroy() end) end
    end
    Shared.Notify("Blur removed.", 1)
end)

GraphicsSection:AddTextBox("Bloom Intensity", function(text) BloomIntensity = tonumber(text) or BloomIntensity end)
GraphicsSection:AddTextBox("Bloom Size", function(text) BloomSize = tonumber(text) or BloomSize end)
GraphicsSection:AddTextBox("Bloom Threshold", function(text) BloomThreshold = tonumber(text) or BloomThreshold end)

GraphicsSection:AddButton("Apply Bloom", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("BloomEffect") then pcall(function() v:Destroy() end) end end
    local Bloom = Instance.new("BloomEffect")
    pcall(function() Bloom.Intensity = BloomIntensity end)
    pcall(function() Bloom.Size = BloomSize end)
    pcall(function() Bloom.Threshold = BloomThreshold end)
    Bloom.Name = "CustomBloom"
    Bloom.Parent = Lighting
    Shared.Notify("Bloom applied.", 1)
end)

GraphicsSection:AddButton("Remove Bloom", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("BloomEffect") and v.Name == "CustomBloom" then pcall(function() v:Destroy() end) end end
    Shared.Notify("Bloom removed.", 1)
end)

GraphicsSection:AddTextBox("CCE Brightness", function(text) CceBrightness = tonumber(text) or CceBrightness end)
GraphicsSection:AddTextBox("CCE Constrast", function(text) CceContrast = tonumber(text) or CceContrast end)
GraphicsSection:AddTextBox("CCE Saturation", function(text) CceSaturation = tonumber(text) or CceSaturation end)
GraphicsSection:AddTextBox("CCE Color (R,G,B)", function(text)
    local r,g,b = text:match("(%d+),(%d+),(%d+)")
    if r and g and b then
        CceColor = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
    else
        local rf,gf,bf = text:match("([%d%.]+),([%d%.]+),([%d%.]+)")
        if rf and gf and bf then CceColor = Color3.new(tonumber(rf), tonumber(gf), tonumber(bf)) end
    end
end)

GraphicsSection:AddButton("Apply CCE", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("ColorCorrectionEffect") then pcall(function() v:Destroy() end) end end
    local Cce = Instance.new("ColorCorrectionEffect")
    pcall(function() Cce.Brightness = CceBrightness end)
    pcall(function() Cce.Contrast = CceContrast end)
    pcall(function() Cce.Saturation = CceSaturation end)
    pcall(function() Cce.TintColor = CceColor end)
    Cce.Name = "CustomCCE"
    Cce.Parent = Lighting
    Shared.Notify("Color Correction Effect applied.", 1)
end)

GraphicsSection:AddButton("Remove CCE", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("ColorCorrectionEffect") and v.Name == "CustomCCE" then pcall(function() v:Destroy() end) end end
    Shared.Notify("Color Correction Effect removed.", 1)
end)

GraphicsSection:AddTextBox("D.O.F.E. Far Intensity", function(text) DofeFarIntensity = tonumber(text) or DofeFarIntensity end)
GraphicsSection:AddTextBox("D.O.F.E. Focus Distance", function(text) DofeFocusDistance = tonumber(text) or DofeFocusDistance end)
GraphicsSection:AddTextBox("D.O.F.E. InFocus Distance", function(text) DofeInFocusDistance = tonumber(text) or DofeInFocusDistance end)
GraphicsSection:AddTextBox("D.O.F.E. Near Intensity", function(text) DofeNearIntensity = tonumber(text) or DofeNearIntensity end)

GraphicsSection:AddButton("Apply D.O.F.E.", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("DepthOfFieldEffect") then pcall(function() v:Destroy() end) end end
    local Dofe = Instance.new("DepthOfFieldEffect")
    pcall(function() Dofe.FarIntensity = DofeFarIntensity end)
    pcall(function() Dofe.FocusDistance = DofeFocusDistance end)
    pcall(function() Dofe.InFocusRadius = DofeInFocusDistance end)
    pcall(function() Dofe.NearIntensity = DofeNearIntensity end)
    Dofe.Name = "CustomDOFE"
    Dofe.Parent = Lighting
    Shared.Notify("Depth Of Field Effect applied.", 1)
end)

GraphicsSection:AddButton("Remove D.O.F.E.", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("DepthOfFieldEffect") and v.Name == "CustomDOFE" then pcall(function() v:Destroy() end) end end
    Shared.Notify("Depth Of Field Effect removed.", 1)
end)

GraphicsSection:AddLabel(PostInfoText)

local Enabled = false
local Smoothness = 50
local Intensity = 100

GraphicsSection:AddToggle("Motion Blur", function(state)
    Enabled = state
end)

GraphicsSection:AddSlider("Smoothness (%)", 1, 100, Smoothness, function(value)
    Smoothness = value
end)

GraphicsSection:AddSlider("Blur Intense (%)", 1, 200, Intensity, function(value)
    Intensity = value
end)

local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local Blur = game.Lighting:FindFirstChildOfClass("BlurEffect") or Instance.new("BlurEffect", game.Lighting)
local LastRotation = Vector3.new(0, 0, 0)

RunService.RenderStepped:Connect(function()
    if not Enabled then
        Blur.Size = 0
        return
    end
    local x, y, z = Camera.CFrame:ToEulerAnglesXYZ()
    local CurrentRotation = Vector3.new(math.deg(x), math.deg(y), math.deg(z))
    local Difference = (CurrentRotation - LastRotation).Magnitude * (Intensity / 100)
    local Smoothed = Difference * (Smoothness / 100)
    Blur.Size = math.clamp(Smoothed, 0, 100)
    LastRotation = CurrentRotation
end)

local function GetSprayTool()
    local Char = LocalPlayer.Character
    local Backpack = LocalPlayer:FindFirstChild("Backpack")
    return (Char and Char:FindFirstChild("SprayPaint")) or (Backpack and Backpack:FindFirstChild("SprayPaint"))
end

local function EquipTool(tool)
    local Char = LocalPlayer.Character
    local Hum = Char and Char:FindFirstChildOfClass("Humanoid")
    if Hum and tool then
        tool.Parent = Char
        Hum:EquipTool(tool)
    end
end

local function GetTarget()
    if SelectedTargetType == "Nearest Player" then
        local Root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not Root then return nil end
        local Nearest, Shortest = nil, math.huge
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local Torso = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or p.Character:FindFirstChild("LowerTorso") or p.Character:FindFirstChild("HumanoidRootPart")
                if Torso then
                    local D = (Root.Position - Torso.Position).Magnitude
                    if D < Shortest then
                        Shortest = D
                        Nearest = p
                    end
                end
            end
        end
        return Nearest
    elseif SelectedTargetType == "Random" then
        local T = {}
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then table.insert(T, p) end
        end
        return #T > 0 and T[math.random(1,#T)] or nil
    elseif SelectedTargetType == "Select Player" then
        return SelectedPlayer
    end
    return nil
end

local function Spray(target)
    local Tool = GetSprayTool()
    if not Tool or not target or not target.Character then return end
    EquipTool(Tool)
    local Torso = target.Character:FindFirstChild("Torso") or target.Character:FindFirstChild("UpperTorso") or target.Character:FindFirstChild("LowerTorso") or target.Character:FindFirstChild("HumanoidRootPart")
    if not Torso then return end
    local Cframe = Torso.CFrame + Torso.CFrame.LookVector * 0.6
    local Remote = Tool:FindFirstChildWhichIsA("RemoteEvent")
    if Remote then
        Remote:FireServer(DecalId, Enum.NormalId.Front, 2048, Torso, Cframe)
    end
end

local function LoopSpray()
    while LoopJOB do
        local Target = GetTarget()
        if Target then Spray(Target) end
        for i = 1, 14 do
            if not LoopJOB then break end
            task.wait(1)
        end
    end
    LoopThread = nil
end

Section:AddToggle("Loop Spray Paint", function(state)
    LoopJOB = state
    if LoopJOB and not LoopThread then
        LoopThread = task.spawn(LoopSpray)
    elseif not LoopJOB and LoopThread then
        LoopJOB = false
        LoopThread = nil
    end
end)

Section:AddDropdown("Target Type", {"Nearest Player","Random","Select Player"}, function(opt)
    SelectedTargetType = opt
end)

Section:AddPlayerDropdown("Select Player", function(player)
    SelectedPlayer = player
end)

Section:AddTextBox("Decal ID", function(text)
    local Num = tonumber(text)
    if Num then
        DecalId = Num
    end
end)

Section:AddButton("Spray Paint Player", function()
    local Target = GetTarget()
    if not Target then return end
    task.spawn(function()
        for i = 1, 5 do
            Spray(Target)
            task.wait(13)
        end
    end)
end)

Section:AddToggle("Spray Paint Player Bindable Button", function(state)
    if state then
        BindModule:CreateBindable("SprayPaint", function(toggled)
            if toggled then
                local Target = GetTarget()
                if Target then
                    task.spawn(function()
                        for i = 1, 5 do
                            Spray(Target)
                            task.wait(13)
                        end
                    end)
                end
            end
        end)
    else
        BindModule:RemoveBind("SprayPaint")
    end
end)

Section:AddButton("Get Spray Tool", function()
    local Args = {"SprayPaint"}
    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Extras"):WaitForChild("ReplicateToy"):InvokeServer(unpack(Args))
    Shared.Notify("Spray tool requested!", 1)
end)

Section:AddParagraph(
    "WARNING",
    '<u><font color="rgb(255,0,0)">' ..
    'WARNING: THIS WILL GET YOU BANNED ON MMV OR ANY MM2 COPY<br>' ..
    'THAT HAS A GOOD ANTICHEAT, AND<br>' ..
    'I AM NOT GONNA BE RESPONSIBLE<br>' ..
    'FOR ANY BANS BECAUSE OF THIS FEATURE' ..
    '</font></u>'
)

MyOwnSection:AddSlider("Votes Amount", 1, 20, SelectedRespawnAmount, function(value)
    SelectedRespawnAmount = value
end)

MyOwnSection:AddButton("Vote Map", function()
    local Player = game.Players.LocalPlayer
    if not Player or not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    SavedPosition = Player.Character.HumanoidRootPart.Position
    Respawning = true
    local RespawnCount = 0
    local MaxRespawns = SelectedRespawnAmount
    task.spawn(function()
        while RespawnCount < MaxRespawns and Respawning do
            if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                Player.Character.Humanoid.Health = 0
                RespawnCount += 1
            end
            task.wait(0.3)
        end
        Respawning = false
        SavedPosition = nil
    end)
    Player.CharacterAdded:Connect(function(char)
        if SavedPosition then
            char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(SavedPosition)
        end
    end)
end)

MyOwnSection:AddToggle("Vote Map Bindable Button", function(state)
    if state then
        BindModule:CreateBindable("VoteMap", function(toggled)
            if toggled then
                local Player = game.Players.LocalPlayer
                if not Player or not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") then
                    return
                end
                SavedPosition = Player.Character.HumanoidRootPart.Position
                Respawning = true
                local RespawnCount = 0
                local MaxRespawns = SelectedRespawnAmount
                task.spawn(function()
                    while RespawnCount < MaxRespawns and Respawning do
                        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                            Player.Character.Humanoid.Health = 0
                            RespawnCount += 1
                        end
                        task.wait(0.3)
                    end
                    Respawning = false
                    SavedPosition = nil
                end)
                Player.CharacterAdded:Connect(function(char)
                    if SavedPosition then
                        char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(SavedPosition)
                    end
                end)
            end
        end)
    else
        BindModule:RemoveBind("VoteMap")
    end
end)

MyOwnSection:AddLabel("Credits To <u><font color='rgb(0,255,0)'>@lzzzx</font></u>")

local AutoChatMessage = ""
local AutoChatDelay = 1
local AutoChatToggle = false

OtherSection:AddTextBox("Message To Chat", function(text) AutoChatMessage = text end)
OtherSection:AddSlider("Delay (s)", 0.1, 60, 1, function(val) AutoChatDelay = val end)
OtherSection:AddToggle("Auto Chat", function(state) AutoChatToggle = state end)

task.spawn(function()
    while true do
        if AutoChatToggle and AutoChatMessage ~= "" then
            pcall(function() TextChatService.TextChannels.RBXGeneral:SendAsync(AutoChatMessage) end)
        end
        task.wait(AutoChatDelay)
    end
end)

OtherSection:AddButton("Copy Server JobID", function() pcall(function() setclipboard(game.JobId) end) end)

OtherSection:AddButton("Server Hop", function()
    local PlaceId = game.PlaceId
    local Success, Servers = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    end)
    if not Success or not Servers then 
        Shared.Notify("Server list fetch failed.", 2)
        return 
    end
    local NextCursor = Servers.nextPageCursor
    local ChosenServer
    local function FindAvailableServer(ServerList)
        for _, Srv in pairs(ServerList) do
            if Srv.playing < Srv.maxPlayers and Srv.id ~= game.JobId then return Srv.id end
        end
    end
    ChosenServer = FindAvailableServer(Servers.data)
    while not ChosenServer and NextCursor do
        local PageSuccess, PageServers = pcall(function()
            return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..NextCursor))
        end)
        if not PageSuccess or not PageServers then break end
        ChosenServer = FindAvailableServer(PageServers.data)
        NextCursor = PageServers.nextPageCursor
    end
    if ChosenServer then TeleportService:TeleportToPlaceInstance(PlaceId, ChosenServer, LocalPlayer) end
end)

OtherSection:AddButton("Rejoin", function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)

OtherSection:AddToggle("Rejoin Bindable Button", function(state)
    if state then
        BindModule:CreateBindable("Rejoin", function(toggled)
            if toggled then
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end
        end)
    else
        BindModule:RemoveBind("Rejoin")
    end
end)

local JoinJobID = ""
OtherSection:AddTextBox("Server JobID", function(text) JoinJobID = text end)

OtherSection:AddButton("Join Server (JobID)", function()
    if JoinJobID ~= "" then TeleportService:TeleportToPlaceInstance(game.PlaceId, JoinJobID, LocalPlayer) end
end)

OtherSection:AddButton("Force Quit Game", function() game:Shutdown() end)

OtherSection:AddToggle("FQG Bindable Button", function(state)
    if state then
        BindModule:CreateBindable("FQG", function(toggled)
            if toggled then
                game:Shutdown()
            end
        end)
    else
        BindModule:RemoveBind("FQG")
    end
end)

OtherSection:AddButton("Mute Gun Sounds", function()
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    task.spawn(function()
        while task.wait(1) do
            local Char = Player.Character or Player.CharacterAdded:Wait()
            local Gun = Char:FindFirstChild("Gun")
            if Gun then
                local Handle = Gun:FindFirstChild("Handle")
                if Handle then
                    local Reload = Handle:FindFirstChild("Reload")
                    if Reload and Reload:IsA("Sound") then
                        Reload.Volume = 0
                    end
                    local Gunshot = Handle:FindFirstChild("Gunshot")
                    if Gunshot and Gunshot:IsA("Sound") then
                        Gunshot.Volume = 0
                    end
                end
            end
        end
    end)
end)

PerformanceSection:AddToggle("Remove All Materials", function(state)
    if state then
        OriginalMaterials = {}
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                OriginalMaterials[obj] = obj.Material
                obj.Material = Enum.Material.Plastic
            end
        end
        Shared.Notify("All materials removed.", 1)
    else
        for obj, material in pairs(OriginalMaterials) do
            if obj and obj.Parent then
                obj.Material = material
            end
        end
        OriginalMaterials = {}
        Shared.Notify("Materials restored.", 1)
    end
end)

PerformanceSection:AddToggle("Remove All Materials Bindable Button", function(state)
    if state then
        BindModule:CreateBindable("RemoveMaterials", function(toggled)
            if toggled then
                OriginalMaterials = {}
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        OriginalMaterials[obj] = obj.Material
                        obj.Material = Enum.Material.Plastic
                    end
                end
            else
                for obj, material in pairs(OriginalMaterials) do
                    if obj and obj.Parent then
                        obj.Material = material
                    end
                end
                OriginalMaterials = {}
            end
        end)
    else
        BindModule:RemoveBind("RemoveMaterials")
    end
end)

PerformanceSection:AddToggle("Low Graphics", function(state)
    if state then
        OriginalTechnology = Lighting.Technology
        pcall(function() game:SetFastFlagForTesting("RBX_LightingTechnologyUnifiedMigration", false) end)
        Lighting.Technology = Enum.Technology.Compatibility
        Shared.Notify("Low graphics mode enabled.", 1)
    else
        pcall(function() game:SetFastFlagForTesting("RBX_LightingTechnologyUnifiedMigration", true) end)
        Lighting.Technology = OriginalTechnology
        Shared.Notify("Low graphics mode disabled.", 1)
    end
end)

PerformanceSection:AddToggle("Low Graphics Bindable Button", function(state)
    if state then
        BindModule:CreateBindable("LowGraphics", function(toggled)
            if toggled then
                OriginalTechnology = Lighting.Technology
                pcall(function() game:SetFastFlagForTesting("RBX_LightingTechnologyUnifiedMigration", false) end)
                Lighting.Technology = Enum.Technology.Compatibility
            else
                pcall(function() game:SetFastFlagForTesting("RBX_LightingTechnologyUnifiedMigration", true) end)
                Lighting.Technology = OriginalTechnology
            end
        end)
    else
        BindModule:RemoveBind("LowGraphics")
    end
end)

PerformanceSection:AddToggle("Destroy All Player Accessories", function(state)
    if state then
        OriginalAccessories = {}
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                OriginalAccessories[player] = {}
                for _, obj in pairs(player.Character:GetChildren()) do
                    if obj:IsA("Accessory") then
                        table.insert(OriginalAccessories[player], obj:Clone())
                        obj:Destroy()
                    end
                end
            end
        end
        Shared.Notify("All player accessories destroyed.", 1)
    else
        for player, accessories in pairs(OriginalAccessories) do
            if player and player.Character then
                for _, accessory in pairs(accessories) do
                    local newAccessory = accessory:Clone()
                    newAccessory.Parent = player.Character
                end
            end
        end
        OriginalAccessories = {}
        Shared.Notify("Player accessories restored.", 1)
    end
end)

PerformanceSection:AddToggle("Destroy All Player Accessories Bindable Button", function(state)
    if state then
        BindModule:CreateBindable("DestroyAccessories", function(toggled)
            if toggled then
                OriginalAccessories = {}
                for _, player in pairs(Players:GetPlayers()) do
                    if player.Character then
                        OriginalAccessories[player] = {}
                        for _, obj in pairs(player.Character:GetChildren()) do
                            if obj:IsA("Accessory") then
                                table.insert(OriginalAccessories[player], obj:Clone())
                                obj:Destroy()
                            end
                        end
                    end
                end
            else
                for player, accessories in pairs(OriginalAccessories) do
                    if player and player.Character then
                        for _, accessory in pairs(accessories) do
                            local newAccessory = accessory:Clone()
                            newAccessory.Parent = player.Character
                        end
                    end
                end
                OriginalAccessories = {}
            end
        end)
    else
        BindModule:RemoveBind("DestroyAccessories")
    end
end)

PerformanceSection:AddButton("Destroy All Particles", function()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") then
            obj:Destroy()
        end
    end
    Shared.Notify("All particles destroyed.", 1)
end)

local thresholdSize = Vector3.new(2, 2, 2)
local removeMeshes = false
PerformanceSection:AddTextBox("Meshes Size (X, Y, Z)", function(text)
    local x, y, z = text:match("([%d%.]+),%s*([%d%.]+),%s*([%d%.]+)")
    if x and y and z then
        thresholdSize = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
        Shared.Notify("Mesh size threshold set to: "..x..","..y..","..z, 1)
    else
        Shared.Notify("Invalid format! Use X,Y,Z (numbers only)", 2)
    end
end)
PerformanceSection:AddToggle("Remove Selected Size Meshes", function(state)
    removeMeshes = state
end)
local function isInPlayerCharacter(part)
    if not part then return false end
    local model = part:FindFirstAncestorWhichIsA("Model")
    if not model then return false end
    return Players:GetPlayerFromCharacter(model) ~= nil
end
task.spawn(function()
    while true do
        if removeMeshes then
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("MeshPart") then
                    if obj.Size.X <= thresholdSize.X and obj.Size.Y <= thresholdSize.Y and obj.Size.Z <= thresholdSize.Z then
                        if not isInPlayerCharacter(obj) then
                            obj:Destroy()
                        end
                    end
                end
            end
        end
        task.wait(1)
    end
end)

PerformanceSection:AddSlider("UI Scale (%)", 50, 200, 100, function(val)
    current_scale = val / 100
    if screen_ui then
        local uiscale = screen_ui:FindFirstChildWhichIsA("UIScale", true)
        if uiscale then
            uiscale.Scale = current_scale
        end
    end
end)

PerformanceSection:AddToggle("Show Stats UI", function(state)
    ui_enabled = state
    if ui_enabled then
        local coregui = game:GetService("CoreGui")
        local runservice = game:GetService("RunService")
        local stats = game:GetService("Stats")
        local textservice = game:GetService("TextService")
        local tweenservice = game:GetService("TweenService")
        local userinputservice = game:GetService("UserInputService")

        local padding = 8
        local min_size = 15
        local text_size = 18
        local max_frame_width = 220
        local max_frame_height = 180

        screen_ui = Instance.new("ScreenGui")
        screen_ui.IgnoreGuiInset = false
        screen_ui.ResetOnSpawn = false
        screen_ui.Parent = coregui

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, max_frame_width, 0, 120)
        frame.Position = UDim2.new(0, 0, 0, 0)
        frame.AnchorPoint = Vector2.new(0, 0)
        frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        frame.Active = true
        frame.Parent = screen_ui

        local uiscale = Instance.new("UIScale")
        uiscale.Scale = current_scale
        uiscale.Parent = frame

        local uicorner = Instance.new("UICorner")
        uicorner.CornerRadius = UDim.new(0, 10)
        uicorner.Parent = frame

        local bggradient = Instance.new("UIGradient")
        bggradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 45)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
        }
        bggradient.Rotation = 0
        bggradient.Parent = frame

        local uistroke = Instance.new("UIStroke")
        uistroke.Color = Color3.fromRGB(255, 255, 255)
        uistroke.Transparency = 0.5
        uistroke.Thickness = 2
        uistroke.Parent = frame

        local strokegradient = Instance.new("UIGradient")
        strokegradient.Color = bggradient.Color
        strokegradient.Rotation = 45
        strokegradient.Parent = uistroke

        local statslabel = Instance.new("TextLabel")
        statslabel.AnchorPoint = Vector2.new(0, 0)
        statslabel.Position = UDim2.new(0, padding, 0, padding)
        statslabel.BackgroundTransparency = 1
        statslabel.RichText = true
        statslabel.TextWrapped = true
        statslabel.TextScaled = false
        statslabel.TextXAlignment = Enum.TextXAlignment.Left
        statslabel.TextYAlignment = Enum.TextYAlignment.Top
        statslabel.Font = Enum.Font.SourceSansLight
        statslabel.TextSize = text_size
        statslabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        statslabel.Parent = frame

        local dragging = false
        local drag_start = Vector2.new()
        local start_pos = UDim2.new()
        local drag_input

        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                drag_start = input.Position
                start_pos = frame.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                        local corners = {
                            UDim2.new(0, 0, 0, 0),
                            UDim2.new(0.82, 0, 0, 0),
                            UDim2.new(0, 0, 0.45, 0),
                            UDim2.new(0.82, 0, 0.45, 0)
                        }
                        local snap_distance = 20
                        for _, corner in ipairs(corners) do
                            local corner_pos = Vector2.new(
                                corner.X.Scale * screen_ui.AbsoluteSize.X + corner.X.Offset,
                                corner.Y.Scale * screen_ui.AbsoluteSize.Y + corner.Y.Offset
                            )
                            local frame_pos = Vector2.new(
                                frame.Position.X.Scale * screen_ui.AbsoluteSize.X + frame.Position.X.Offset,
                                frame.Position.Y.Scale * screen_ui.AbsoluteSize.Y + frame.Position.Y.Offset
                            )
                            if (frame_pos - corner_pos).Magnitude <= snap_distance then
                                tweenservice:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Position = corner}):Play()
                                break
                            end
                        end
                    end
                end)
            end
        end)

        frame.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                drag_input = input
            end
        end)

        userinputservice.InputChanged:Connect(function(input)
            if dragging and input == drag_input then
                local delta = input.Position - drag_start
                frame.Position = UDim2.new(
                    start_pos.X.Scale,
                    start_pos.X.Offset + delta.X,
                    start_pos.Y.Scale,
                    start_pos.Y.Offset + delta.Y
                )
            end
        end)

        local frame_count = 0
        local fps = 0
        local last_fps_time = tick()
        runservice.RenderStepped:Connect(function()
            frame_count = frame_count + 1
        end)

        local hb_sum = 0
        local hb_count = 0
        runservice.Heartbeat:Connect(function(dt)
            hb_sum = hb_sum + dt
            hb_count = hb_count + 1
        end)

        local function get_color(value, type_str)
            if type_str == "FPS" then
                if value >= 60 then return "0,255,0" elseif value >= 30 then return "255,255,0" elseif value >= 12 then return "255,165,0" else return "255,0,0" end
            elseif type_str == "Ping" then
                if value < 50 then return "0,255,0" elseif value <= 150 then return "255,255,0" else return "255,0,0" end
            elseif type_str == "Memory" then
                if value < 500 then return "0,255,0" elseif value <= 1000 then return "255,255,0" else return "255,0,0" end
            elseif type_str == "CPU" then
                if value < 40 then return "0,255,0" elseif value <= 70 then return "255,255,0" else return "255,0,0" end
            elseif type_str == "GPU" then
                if value < 40 then return "0,255,0" elseif value <= 70 then return "255,255,0" else return "255,0,0" end
            end
            return "255,255,255"
        end

        local function to_percent(val)
            if not val then return 0 end
            if type(val) ~= "number" then return 0 end
            if val >= 0 and val <= 1 then return val * 100 else return val end
        end

        local function autosize_and_set_text(rich_text, plain_lines)
            local max_w = 0
            local total_h = 0
            for i, line in ipairs(plain_lines) do
                local size = textservice:GetTextSize(line, text_size, statslabel.Font, Vector2.new(max_frame_width, max_frame_height))
                if size.X > max_w then max_w = size.X end
                total_h = total_h + size.Y
            end
            total_h = total_h + (#plain_lines - 1) * 2
            local final_w = math.min(math.max(math.ceil(max_w) + padding * 2, min_size), max_frame_width)
            local final_h = math.min(math.max(math.ceil(total_h) + padding * 2, min_size), max_frame_height)
            statslabel.Size = UDim2.new(0, final_w - padding * 2, 0, final_h - padding * 2)
            frame.Size = UDim2.new(0, final_w, 0, final_h)
            statslabel.Text = rich_text
        end

        spawn(function()
            while ui_enabled do
                wait(1)
                local now = tick()
                local dt = now - last_fps_time
                if dt > 0 then fps = math.floor(frame_count / dt + 0.5) else fps = 0 end
                frame_count = 0
                last_fps_time = now

                local ping = 0
                pcall(function()
                    local item = stats.Network and stats.Network.ServerStatsItem and stats.Network.ServerStatsItem["Data Ping"]
                    if item then
                        local val = item:GetValue()
                        if type(val) == "number" then ping = math.floor(val + 0.5) end
                    end
                end)

                local memory = 0
                pcall(function()
                    local ok, mval = pcall(function() return stats:GetTotalMemoryUsageMb() end)
                    if ok and type(mval) == "number" then memory = math.floor(mval + 0.5) end
                end)

                local cpu_percent = 0
                local gpu_percent = 0
                pcall(function()
                    local perf = stats.PerformanceStats
                    if perf then
                        local raw_cpu = perf.CPU or perf.CPUPercent or perf.CPUUsage or perf.CPUTime
                        local raw_gpu = perf.GPU or perf.GPUPercent or perf.GPUUsage or perf.GPUTime
                        if raw_cpu and type(raw_cpu) == "number" then cpu_percent = math.floor(to_percent(raw_cpu) + 0.5) end
                        if raw_gpu and type(raw_gpu) == "number" then gpu_percent = math.floor(to_percent(raw_gpu) + 0.5) end
                    end
                end)

                if cpu_percent == 0 then
                    local avg_dt = 0
                    if hb_count > 0 then avg_dt = hb_sum / math.max(hb_count, 1) end
                    hb_sum = 0
                    hb_count = 0
                    local baseline = 1 / 60
                    cpu_percent = math.floor(math.clamp((avg_dt / baseline) * 100, 0, 100) + 0.5)
                end

                local lines = {
                    ("FPS: <font color=\"rgb(%s)\">%d</font>"):format(get_color(fps, "FPS"), fps),
                    ("Ping: <font color=\"rgb(%s)\">%d</font>"):format(get_color(ping, "Ping"), ping),
                    ("Memory: <font color=\"rgb(%s)\">%dMB</font>"):format(get_color(memory, "Memory"), memory),
                    ("CPU: <font color=\"rgb(%s)\">%d%%</font>"):format(get_color(cpu_percent, "CPU"), cpu_percent),
                    ("GPU: <font color=\"rgb(%s)\">%d%%</font>"):format(get_color(gpu_percent, "GPU"), gpu_percent)
                }
                autosize_and_set_text(table.concat(lines, "\n"), lines)
            end
        end)
    else
        if screen_ui then
            screen_ui:Destroy()
            screen_ui = nil
        end
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "onemoregamelol"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Enabled = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.Position = UDim2.new(0, 0, 0, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://133708083647813"
imageLabel.ScaleType = Enum.ScaleType.Stretch
imageLabel.Parent = screenGui

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://109090958199961"
sound.Volume = 1
sound.Looped = true
sound.Parent = screenGui

local motivatorEnabled = false

fun_section:AddToggle("Motivator", function(enabled)
    motivatorEnabled = enabled
    if not enabled then
        screenGui.Enabled = false
        sound:Stop()
    end
end)

GuiService.MenuOpened:Connect(function()
    if motivatorEnabled then
        screenGui.Enabled = true
        sound:Play()
    end
end)

GuiService.MenuClosed:Connect(function()
    if motivatorEnabled then
        screenGui.Enabled = false
        sound:Stop()
    end
end)

pcall(function()
    local hidden = hui[""]
    if hidden then
        otherUI[#otherUI+1] = hidden:FindFirstChild("Maximize")
        otherUI[#otherUI+1] = hidden:FindFirstChild(otherName)
    end
end)

local function hideButton(btn)
    if not originals[btn] then
        originals[btn] = {
            bg = btn.BackgroundTransparency,
            txt = btn:IsA("TextButton") and btn.TextTransparency or nil,
            img = btn:IsA("ImageButton") and btn.ImageTransparency or nil,
            strokes = {}
        }
        for _, sub in ipairs(btn:GetChildren()) do
            if sub:IsA("UIStroke") then
                table.insert(originals[btn].strokes, {stroke = sub, enabled = sub.Enabled})
                sub.Enabled = false
            end
        end
    end
    if btn:IsA("TextButton") then
        btn.BackgroundTransparency = 1
        btn.TextTransparency = 1
    elseif btn:IsA("ImageButton") then
        btn.BackgroundTransparency = 1
        btn.ImageTransparency = 1
    end
end

local function restoreButton(btn)
    local data = originals[btn]
    if data then
        if data.bg ~= nil then btn.BackgroundTransparency = data.bg end
        if data.txt then btn.TextTransparency = data.txt end
        if data.img then btn.ImageTransparency = data.img end
        if data.strokes then
            for _, strokeData in ipairs(data.strokes) do
                if strokeData.stroke then strokeData.stroke.Enabled = strokeData.enabled end
            end
        end
        originals[btn] = nil
    end
end

local function addUIScale(btn, scale)
    if not btn:FindFirstChild("ODH_UIScale") then
        local uiScale = Instance.new("UIScale")
        uiScale.Name = "ODH_UIScale"
        uiScale.Scale = scale
        uiScale.Parent = btn
    end
end

local function updateUIScales(scale, targets)
    for _, btn in ipairs(targets) do
        if btn and btn.Parent then
            local uiScale = btn:FindFirstChild("ODH_UIScale")
            if uiScale then
                uiScale.Scale = scale
            end
        end
    end
end

local connections = {}
local function connectHandlers(state)
    for _, con in ipairs(connections) do
        con:Disconnect()
    end
    connections = {}
    if state then
        for _, child in ipairs(hui:GetDescendants()) do
            if (child:IsA("TextButton") or child:IsA("ImageButton")) and child.Name == "привязываемая кнопка" then
                hideButton(child)
            end
        end
        table.insert(connections, hui.DescendantAdded:Connect(function(obj)
            if (obj:IsA("TextButton") or obj:IsA("ImageButton")) and obj.Name == "привязываемая кнопка" then
                hideButton(obj)
            end
        end))
        table.insert(connections, hui.DescendantRemoving:Connect(function(obj)
            if originals[obj] then
                originals[obj] = nil
            end
        end))
    else
        for btn in pairs(originals) do
            restoreButton(btn)
        end
        originals = {}
    end
end

fun_section:AddToggle("Hide Bindable Buttons", function(state)
    connectHandlers(state)
    Shared.Notify(state and "Hiding привязываемая кнопка buttons enabled" or "Hiding привязываемая кнопка buttons disabled", 2)
end)

fun_section:AddButton("Add UIScale To All Buttons", function()
    for _, child in ipairs(hui:GetDescendants()) do
        if (child:IsA("TextButton") or child:IsA("ImageButton")) and child.Name == "привязываемая кнопка" then
            addUIScale(child, currentScale)
        end
    end
    Shared.Notify("UIScale added to all привязываемая кнопка buttons", 2)
end)

fun_section:AddSlider("Button Size (%)", 50, 200, 100, function(value)
    currentScale = value / 100
    local targets = {}
    for _, child in ipairs(hui:GetDescendants()) do
        if (child:IsA("TextButton") or child:IsA("ImageButton")) and child.Name == "привязываемая кнопка" then
            targets[#targets+1] = child
        end
    end
    updateUIScales(currentScale, targets)
end)

local hideOtherLoop = false

fun_section:AddToggle("Hide Other UI Elements", function(state)
    hideOtherLoop = state
    for _, obj in ipairs(otherUI) do
        if obj and obj.Parent then
            if state then
                if not originals[obj] then
                    originals[obj] = {}
                    if obj:IsA("ImageButton") then
                        originals[obj].img = obj.ImageTransparency
                        originals[obj].bg = obj.BackgroundTransparency
                        obj.ImageTransparency = 1
                        obj.BackgroundTransparency = 1
                    elseif obj:IsA("TextButton") then
                        originals[obj].bg = obj.BackgroundTransparency
                        originals[obj].txt = obj.TextTransparency
                        obj.BackgroundTransparency = 1
                        obj.TextTransparency = 1
                    end
                    for _, sub in ipairs(obj:GetChildren()) do
                        if sub:IsA("UIStroke") then
                            if not originals[obj].strokes then originals[obj].strokes = {} end
                            table.insert(originals[obj].strokes, {stroke = sub, enabled = sub.Enabled})
                            sub.Enabled = false
                        end
                    end
                end
            else
                local data = originals[obj]
                if data then
                    if obj:IsA("ImageButton") then
                        if data.img then obj.ImageTransparency = data.img end
                        if data.bg then obj.BackgroundTransparency = data.bg end
                    elseif obj:IsA("TextButton") then
                        if data.bg ~= nil then obj.BackgroundTransparency = data.bg end
                        if data.txt then obj.TextTransparency = data.txt end
                    end
                    if data.strokes then
                        for _, strokeData in ipairs(data.strokes) do
                            if strokeData.stroke then strokeData.stroke.Enabled = strokeData.enabled end
                        end
                    end
                    originals[obj] = nil
                end
            end
        end
    end

    if state then
        task.spawn(function()
            while hideOtherLoop do
                local ok, hidden = pcall(function() return hui[""] end)
                if ok and hidden then
                    local target = hidden:FindFirstChild(otherName)
                    if target and target.Parent and target:IsA("TextButton") then
                        target.BackgroundTransparency = 1
                        target.TextTransparency = 1
                    end
                end
                task.wait(1)
            end
        end)
    end
end)

fun_section:AddButton("Add UIScale To Other UI Elements", function()
    for _, obj in ipairs(otherUI) do
        if obj and obj.Parent then
            addUIScale(obj, otherScale)
        end
    end
end)

fun_section:AddSlider("Other UI Elements Size (%)", 50, 200, 100, function(value)
    otherScale = value / 100
    updateUIScales(otherScale, otherUI)
end)

local function getBindArea()
    local gui = game.CoreGui:FindFirstChild("Bind")
    if not gui then return nil end
    return gui:FindFirstChild("BindArea")
end

local function applyToButton(btn)
    if not btn or not btn.Parent then return end
    if buttonsHidden then
        btn.BackgroundTransparency = 1
        btn.TextTransparency = 1
        local stroke = btn:FindFirstChildOfClass("UIStroke")
        if stroke then stroke.Transparency = 1 end
    else
        btn.BackgroundTransparency = 0.5
        btn.TextTransparency = 0
        local stroke = btn:FindFirstChildOfClass("UIStroke")
        if stroke then
            stroke.Transparency = 0
        else
            local ns = Instance.new("UIStroke")
            ns.Thickness = 2
            ns.Color = Color3.fromRGB(255,255,255)
            ns.Transparency = 0
            ns.Parent = btn
        end
    end
    local us = btn:FindFirstChildOfClass("UIScale")
    if us then
        us.Scale = uiScaleValue
    end
end

local function updateButtons()
    local bindArea = getBindArea()
    if not bindArea then return end
    for _, obj in ipairs(bindArea:GetDescendants()) do
        if obj:IsA("TextButton") then
            applyToButton(obj)
        end
    end
end

fun_section:AddToggle("Hide All Other Bindable Buttons", function(state)
    buttonsHidden = state or false
    updateButtons()
end)

fun_section:AddButton("Add UIScale To Other Bindable Buttons", function()
    local bindArea = getBindArea()
    if not bindArea then return end
    for _, obj in ipairs(bindArea:GetDescendants()) do
        if obj:IsA("TextButton") and not obj:FindFirstChildOfClass("UIScale") then
            local us = Instance.new("UIScale")
            us.Scale = uiScaleValue
            us.Parent = obj
        end
    end
end)

fun_section:AddTextBox("Other Bindable Button Scale", function(text)
    local num = tonumber(text)
    if num and num > 0 then
        uiScaleValue = num
        updateButtons()
    end
end)

fun_section:AddButton("Disable VFX (Buttons)", function()
    deleting = not deleting
end)

local function deleteVFXFromButtons(parent, buttonNames)
    for _, obj in ipairs(parent:GetChildren()) do
        for _, name in ipairs(buttonNames) do
            if obj.Name == name then
                local vfx = obj:FindFirstChild("VFX")
                if vfx then
                    vfx:Destroy()
                end
            end
        end
        deleteVFXFromButtons(obj, buttonNames)
    end
end

RunService.RenderStepped:Connect(function()
    if deleting then
        local guiRoot = gethui()
        if guiRoot then
            deleteVFXFromButtons(guiRoot, {"застрелить убийцу", "привязываемая кнопка"})
        end
    end
end)

warn("[#]: Loaded")

warn("[#]: Game Detected: ".. MarketplaceService:GetProductInfo(game.PlaceId).Name .." Supported: Yes")

-- hi rmd
