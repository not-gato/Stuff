local shared = odh_shared_plugins
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

local InfiniteJumpEnabled = true
local jumpConnection = nil
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

local wallhop_section = shared.AddSection("Wallhop | #1")
local cam_section = shared.AddSection("Camera Stretch | #2")
local profile_section = shared.AddSection("Profile Picture Editor | #3")
local lightning_section = shared.AddSection("Lightning | #4")
local sound_section = shared.AddSection("Sound Logger | #5")
local graphics_section = shared.AddSection("Graphics | #6")
local other_section = shared.AddSection("Other | #7")

local function getWallRaycastResult()
    local character = LocalPlayer.Character
    if not character then return nil end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    raycastParams.FilterDescendantsInstances = {character}
    local closestHit, minDistance = nil, 3
    local hrpCF = hrp.CFrame
    for i = 0,7 do
        local angle = math.rad(i*45)
        local dir = (hrpCF*CFrame.Angles(0,angle,0)).LookVector
        local ray = Workspace:Raycast(hrp.Position, dir*2, raycastParams)
        if ray and ray.Instance and ray.Distance < minDistance then
            minDistance = ray.Distance
            closestHit = ray
        end
    end
    local blockCastOrigin = hrpCF*CFrame.new(0,-1,-0.5)
    local blockResult = Workspace:Blockcast(blockCastOrigin, Vector3.new(1.5,1,0.5), hrpCF.LookVector*1.5, raycastParams)
    if blockResult and blockResult.Instance and blockResult.Distance < minDistance then
        closestHit = blockResult
    end
    return closestHit
end

local function performFaceWallJump()
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    local camera = Workspace.CurrentCamera
    if not (humanoid and rootPart and camera and humanoid:GetState() ~= Enum.HumanoidStateType.Dead) then return end
    local wall = getWallRaycastResult()
    if not wall then return end
    local maxR, maxL = math.rad(20), math.rad(-100)
    local base = Vector3.new(wall.Normal.X,0,wall.Normal.Z)
    if base.Magnitude > 0 then base = base.Unit end
    if base.Magnitude < 0.1 then
        local dir = (wall.Position - rootPart.Position)*Vector3.new(1,0,1)
        if dir.Magnitude > 0 then base = -dir.Unit end
        if base.Magnitude < 0.1 then
            base = -rootPart.CFrame.LookVector*Vector3.new(1,0,1)
            if base.Magnitude > 0 then base = base.Unit end
            if base.Magnitude < 0.1 then base = Vector3.new(0,0,1) end
        end
    end
    base = Vector3.new(base.X,0,base.Z)
    if base.Magnitude > 0 then base = base.Unit end
    if base.Magnitude < 0.1 then base = Vector3.new(0,0,1) end
    local horLook = Vector3.new(camera.CFrame.LookVector.X,0,camera.CFrame.LookVector.Z)
    if horLook.Magnitude > 0 then horLook = horLook.Unit else horLook = base end
    local dot = math.clamp(base:Dot(horLook), -1,1)
    local angle = math.acos(dot)
    local cross = base:Cross(horLook)
    local sign = -math.sign(cross.Y)
    if sign == 0 then angle = 0 end
    local finalAngle = 0
    if sign == 1 then finalAngle = math.min(angle,maxR)
    elseif sign == -1 then finalAngle = math.min(angle,maxL) end
    local adj = CFrame.Angles(0, finalAngle*sign, 0)
    local lookDir = adj:VectorToWorldSpace(base)
    rootPart.CFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + lookDir)
    RunService.Heartbeat:Wait()
    if humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        rootPart.CFrame = rootPart.CFrame*CFrame.Angles(0,-1,0)
        task.wait(0.15)
        rootPart.CFrame = rootPart.CFrame*CFrame.Angles(0,1,0)
        local back = -base
        task.wait(0.05)
        rootPart.CFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + back)
    end
end

local wallhopToggle = false
wallhop_section:AddToggle("WallHop Toggle", function(state) wallhopToggle = state end)
wallhop_section:AddKeybind("WallHop Jump Key", "J", performFaceWallJump)
jumpConnection = UserInputService.JumpRequest:Connect(function()
    if not wallhopToggle or not InfiniteJumpEnabled then return end
    performFaceWallJump()
end)

local Camera = Workspace.CurrentCamera
local StretchActive = false
local stretchConnection = nil
cam_section:AddLabel("Some Executors May Break This, Use With Caution")
cam_section:AddToggle("Camera Stretch", function(state)
    StretchActive = state
    if StretchActive then
        if not stretchConnection then
            stretchConnection = RunService.RenderStepped:Connect(function()
                Camera.CFrame = Camera.CFrame * CFrame.new(0,0,0,1,0,0,0,0.67,0,0,0,1)
            end)
        end
    else
        if stretchConnection then stretchConnection:Disconnect(); stretchConnection = nil end
    end
end)

local profileOptions = {
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

local profileLinks = {
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

local function setProfilePicture(link)
    local folder = "Ixry Shizuka"
    local fileName = folder.."/avatar.png"
    if isfile(fileName) then pcall(delfile, fileName) end
    local success, content = pcall(function() return game:HttpGet(link) end)
    if success and content then
        pcall(writefile, fileName, content)
    end
end

local selectedProfile = profileOptions[1]
profile_section:AddDropdown("Select Profile Picture", profileOptions, function(selected)
    selectedProfile = selected
end)

profile_section:AddButton("Apply Selected Profile Picture", function()
    if selectedProfile == "Owner Current Profile Picture" then
        local userId = "1183776221302104097"
        local apiUrl = "https://discord.com/api/v10/users/"..userId
        local success, result = pcall(function() return game:HttpGet(apiUrl, true) end)
        if success and result then
            local data = HttpService:JSONDecode(result)
            if data and data.avatar then
                local avatarUrl = "https://cdn.discordapp.com/avatars/"..userId.."/"..data.avatar..".png?size=1024"
                setProfilePicture(avatarUrl)
                shared.Notify("Owner profile picture applied.", 1)
            else
                shared.Notify("Could not fetch owner avatar.", 4)
            end
        else
            shared.Notify("Discord API fetch failed.", 4)
        end
    else
        if profileLinks[selectedProfile] then
            setProfilePicture(profileLinks[selectedProfile])
            shared.Notify("Profile picture applied: "..selectedProfile, 1)
        end
    end
end)

local customProfileLink = ""
profile_section:AddTextBox("Custom Profile Picture Link", function(text) customProfileLink = text end)
profile_section:AddButton("Apply Custom Profile Picture", function()
    if customProfileLink ~= "" then
        setProfilePicture(customProfileLink)
        shared.Notify("Custom profile picture applied.", 1)
    end
end)

profile_section:AddButton("Remove Profile Picture", function()
    local fileName = "Ixry Shizuka/avatar.png"
    if isfile(fileName) then pcall(delfile, fileName) end
    shared.Notify("Profile picture removed.", 1)
end)

local fogStart, fogEnd, fogColor = 0, 1000, Color3.new(1,1,1)

local skyboxPresets = {
    ["Minecraft Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://8735166756"
        sky.SkyboxDn = "rbxassetid://8735166707"
        sky.SkyboxFt = "rbxassetid://8735231668"
        sky.SkyboxLf = "rbxassetid://8735166755"
        sky.SkyboxRt = "rbxassetid://8735166751"
        sky.SkyboxUp = "rbxassetid://8735166729"
        sky.SunTextureId = "rbxassetid://8735166708"
        sky.MoonTextureId = "rbxassetid://8735166687"
        sky.Parent = Lighting
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
        local realisticSky = Instance.new("Sky")
        realisticSky.Name = "RealisticSky"
        realisticSky.SkyboxBk = "rbxassetid://144933338"
        realisticSky.SkyboxDn = "rbxassetid://144931530"
        realisticSky.SkyboxFt = "rbxassetid://144933262"
        realisticSky.SkyboxLf = "rbxassetid://144933244"
        realisticSky.SkyboxRt = "rbxassetid://144933299"
        realisticSky.SkyboxUp = "rbxassetid://144931564"
        realisticSky.Parent = Lighting
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
        local nebulaSky = Instance.new("Sky"); nebulaSky.Name = "NebulaSky"
        nebulaSky.SkyboxBk = "rbxassetid://159454299"
        nebulaSky.SkyboxDn = "rbxassetid://159454296"
        nebulaSky.SkyboxFt = "rbxassetid://159454293"
        nebulaSky.SkyboxLf = "rbxassetid://159454286"
        nebulaSky.SkyboxRt = "rbxassetid://159454300"
        nebulaSky.SkyboxUp = "rbxassetid://159454288"
        nebulaSky.SunTextureId = ""; nebulaSky.MoonTextureId = ""
        nebulaSky.Parent = Lighting
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
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://14543264135"
        sky.SkyboxDn = "rbxassetid://14543358958"
        sky.SkyboxFt = "rbxassetid://14543257810"
        sky.SkyboxLf = "rbxassetid://14543275895"
        sky.SkyboxRt = "rbxassetid://14543280890"
        sky.SkyboxUp = "rbxassetid://14543371676"
        sky.SunTextureId = ""; sky.MoonTextureId = ""
        sky.Parent = Lighting
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
        local sky = Instance.new("Sky"); sky.Name = "CustomSky"
        sky.SkyboxBk = "rbxassetid://168387023"
        sky.SkyboxDn = "rbxassetid://168387089"
        sky.SkyboxFt = "rbxassetid://168387054"
        sky.SkyboxLf = "rbxassetid://168534432"
        sky.SkyboxRt = "rbxassetid://168387190"
        sky.SkyboxUp = "rbxassetid://168387135"
        sky.Parent = Lighting
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
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://458016711"
        sky.SkyboxDn = "rbxassetid://458016826"
        sky.SkyboxFt = "rbxassetid://458016532"
        sky.SkyboxLf = "rbxassetid://458016655"
        sky.SkyboxRt = "rbxassetid://458016782"
        sky.SkyboxUp = "rbxassetid://458016792"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(255,114,0)
        Lighting.Brightness = 2
        Lighting.ClockTime = 14.5
        Lighting.OutdoorAmbient = Color3.fromRGB(246,105,53)
        Lighting.ShadowColor = Color3.fromRGB(160,105,45)
        Lighting.ShadowSoftness = 0.2
    end,

    ["Night Fog"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://1370717244"
        sky.SkyboxDn = "rbxassetid://1370717336"
        sky.SkyboxFt = "rbxassetid://1370717438"
        sky.SkyboxLf = "rbxassetid://1370717567"
        sky.SkyboxRt = "rbxassetid://1370717698"
        sky.SkyboxUp = "rbxassetid://1370717782"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(19,47,98)
        Lighting.Brightness = 0.2
        Lighting.ClockTime = 14.5
        Lighting.OutdoorAmbient = Color3.fromRGB(17,82,115)
        Lighting.ShadowColor = Color3.fromRGB(2,16,51)
        Lighting.ShadowSoftness = 0.2
    end,

    ["Blood Moon"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://401664839"
        sky.SkyboxDn = "rbxassetid://401664862"
        sky.SkyboxFt = "rbxassetid://401664960"
        sky.SkyboxLf = "rbxassetid://401664881"
        sky.SkyboxRt = "rbxassetid://401664901"
        sky.SkyboxUp = "rbxassetid://401664936"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(207,71,6)
        Lighting.Brightness = 1
        Lighting.OutdoorAmbient = Color3.fromRGB(187,2,2)
        Lighting.ShadowColor = Color3.fromRGB(82,0,0)
        Lighting.ShadowSoftness = 0.2
    end,

    ["Spongebob Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://15962101128"
        sky.SkyboxDn = "rbxassetid://15970246218"
        sky.SkyboxFt = "rbxassetid://15962101128"
        sky.SkyboxLf = "rbxassetid://15962101128"
        sky.SkyboxRt = "rbxassetid://15962101128"
        sky.SkyboxUp = "rbxassetid://15962901054"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(19,171,207)
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(11,188,178)
        Lighting.ShadowColor = Color3.fromRGB(5,82,72)
    end,

    ["Pink Blossom"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://271042516"
        sky.SkyboxDn = "rbxassetid://271077243"
        sky.SkyboxFt = "rbxassetid://271042556"
        sky.SkyboxLf = "rbxassetid://271042310"
        sky.SkyboxRt = "rbxassetid://271042467"
        sky.SkyboxUp = "rbxassetid://271077958"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(222,186,255)
        Lighting.Brightness = 3.135
        Lighting.OutdoorAmbient = Color3.fromRGB(231,216,255)
        Lighting.ShadowColor = Color3.fromRGB(163,137,184)
    end,

    ["Purple Sunset"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://264908339"
        sky.SkyboxDn = "rbxassetid://264907909"
        sky.SkyboxFt = "rbxassetid://264909420"
        sky.SkyboxLf = "rbxassetid://264909758"
        sky.SkyboxRt = "rbxassetid://264908886"
        sky.SkyboxUp = "rbxassetid://264907379"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(63,21,176)
        Lighting.Brightness = 1
        Lighting.ClockTime = 14.5
        Lighting.OutdoorAmbient = Color3.fromRGB(57,29,125)
        Lighting.ShadowColor = Color3.fromRGB(14,4,39)
        Lighting.ShadowSoftness = 0.2
    end,

    ["Half-Life 2 Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://9000922368"
        sky.SkyboxDn = "rbxassetid://9000922033"
        sky.SkyboxFt = "rbxassetid://9000921543"
        sky.SkyboxLf = "rbxassetid://9000920853"
        sky.SkyboxRt = "rbxassetid://9000920563"
        sky.SkyboxUp = "rbxassetid://9000920353"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(169,177,133)
        Lighting.Brightness = 1.299
        Lighting.OutdoorAmbient = Color3.fromRGB(116,126,98)
        Lighting.ShadowColor = Color3.fromRGB(37,40,29)
    end,

    ["Void Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://16262356578"
        sky.SkyboxDn = "rbxassetid://16262358026"
        sky.SkyboxFt = "rbxassetid://16262360469"
        sky.SkyboxLf = "rbxassetid://16262362003"
        sky.SkyboxRt = "rbxassetid://16262363873"
        sky.SkyboxUp = "rbxassetid://16262366016"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(99,12,177)
        Lighting.Brightness = 1.7
        Lighting.ClockTime = 14.5
        Lighting.OutdoorAmbient = Color3.fromRGB(83,49,139)
        Lighting.ShadowColor = Color3.fromRGB(48,18,73)
    end,

    ["Purple Night"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://5084575798"
        sky.SkyboxDn = "rbxassetid://5084575916"
        sky.SkyboxFt = "rbxassetid://5103949679"
        sky.SkyboxLf = "rbxassetid://5103948542"
        sky.SkyboxRt = "rbxassetid://5103948784"
        sky.SkyboxUp = "rbxassetid://5084576400"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(99,12,177)
        Lighting.Brightness = 1.7
        Lighting.ClockTime = 14.5
        Lighting.OutdoorAmbient = Color3.fromRGB(83,49,139)
        Lighting.ShadowColor = Color3.fromRGB(48,18,73)
    end,

    ["Pink Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://271042516"
        sky.SkyboxDn = "rbxassetid://271077243"
        sky.SkyboxFt = "rbxassetid://271042556"
        sky.SkyboxLf = "rbxassetid://271042310"
        sky.SkyboxRt = "rbxassetid://271042467"
        sky.SkyboxUp = "rbxassetid://271077958"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(177,112,170)
        Lighting.Brightness = 1.7
        Lighting.OutdoorAmbient = Color3.fromRGB(135,102,140)
        Lighting.ShadowColor = Color3.fromRGB(73,1,68)
    end,

    ["Realistic Moon"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://2670643994"
        sky.SkyboxDn = "rbxassetid://2670643365"
        sky.SkyboxFt = "rbxassetid://2670643214"
        sky.SkyboxLf = "rbxassetid://2670643070"
        sky.SkyboxRt = "rbxassetid://2670644173"
        sky.SkyboxUp = "rbxassetid://2670644331"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.fromRGB(34,39,61)
        Lighting.Brightness = 0.5
        Lighting.OutdoorAmbient = Color3.fromRGB(73,76,100)
        Lighting.ShadowColor = Color3.fromRGB(32,33,43)
        Lighting.ShadowSoftness = 0.2
    end,
}

local presetKeys = {}
for k,_ in pairs(skyboxPresets) do table.insert(presetKeys, k) end
table.sort(presetKeys)

local selectedSkybox = nil
lightning_section:AddDropdown("Predefined Skyboxes", presetKeys, function(selected) selectedSkybox = selected end)
lightning_section:AddButton("Apply Selected Predefined Skybox", function()
    if selectedSkybox and skyboxPresets[selectedSkybox] then
        skyboxPresets[selectedSkybox]()
        shared.Notify("Applied "..selectedSkybox, 1)
    else
        shared.Notify("No skybox selected or preset missing.", 3)
    end
end)

local customSkyboxBk, customSkyboxDn, customSkyboxFt = "", "", ""
local customSkyboxLf, customSkyboxRt, customSkyboxUp = "", "", ""
local defaultSkyId = "rbxassetid://8409591219"

local function normalizeSkyId(s)
    if not s then return defaultSkyId end
    s = tostring(s):match("^%s*(.-)%s*$")
    if s == "" then return defaultSkyId end
    local digits = s:match("(%d+)")
    if not digits or tonumber(digits) == 0 then return defaultSkyId end
    return "rbxassetid://" .. digits
end

lightning_section:AddTextBox("Custom Skybox - Back (SkyboxBk)", function(text) customSkyboxBk = text end)
lightning_section:AddTextBox("Custom Skybox - Down (SkyboxDn)", function(text) customSkyboxDn = text end)
lightning_section:AddTextBox("Custom Skybox - Front (SkyboxFt)", function(text) customSkyboxFt = text end)
lightning_section:AddTextBox("Custom Skybox - Left (SkyboxLf)", function(text) customSkyboxLf = text end)
lightning_section:AddTextBox("Custom Skybox - Right (SkyboxRt)", function(text) customSkyboxRt = text end)
lightning_section:AddTextBox("Custom Skybox - Up (SkyboxUp)", function(text) customSkyboxUp = text end)

lightning_section:AddButton("Apply Custom Skybox", function()
    for _, obj in ipairs(Lighting:GetChildren()) do if obj:IsA("Sky") then obj:Destroy() end end
    local sky = Instance.new("Sky")
    sky.Name = "CustomSky"
    sky.SkyboxBk = normalizeSkyId(customSkyboxBk)
    sky.SkyboxDn = normalizeSkyId(customSkyboxDn)
    sky.SkyboxFt = normalizeSkyId(customSkyboxFt)
    sky.SkyboxLf = normalizeSkyId(customSkyboxLf)
    sky.SkyboxRt = normalizeSkyId(customSkyboxRt)
    sky.SkyboxUp = normalizeSkyId(customSkyboxUp)
    sky.Parent = Lighting
    task.wait(0)
    if Lighting:FindFirstChild("CustomSky") then
        shared.Notify("Custom skybox applied.", 1)
    else
        shared.Notify("Failed to apply custom skybox.", 4)
    end
end)

local creatorStoreSkyAssetId = ""
lightning_section:AddTextBox("Creator Store Sky (AssetID)", function(text) creatorStoreSkyAssetId = text end)
lightning_section:AddButton("Apply Creator Store Sky", function()
    local raw = tostring(creatorStoreSkyAssetId or "")
    local digits = raw:match("(%d+)")
    if not digits then
        shared.Notify("Invalid AssetID.", 4)
        return
    end
    local assetId = tonumber(digits)
    local loadedRoot

    local ok, res = pcall(function()
        return game:GetObjects("rbxassetid://"..digits)
    end)
    if ok and res and #res > 0 then
        loadedRoot = res[1]
    else
        local ok2, model = pcall(function()
            return InsertService:LoadAsset(assetId)
        end)
        if ok2 and model then
            loadedRoot = model
        end
    end

    if not loadedRoot then
        shared.Notify("Failed to load asset: "..digits, 4)
        return
    end

    local allowedClass = {
        Sky = true,
        Atmosphere = true,
        BloomEffect = true,
        BlurEffect = true,
        DepthOfFieldEffect = true,
        ColorCorrectionEffect = true,
        SunRaysEffect = true,
        Clouds = true
    }

    for _, v in ipairs(Lighting:GetChildren()) do
        if allowedClass[v.ClassName] then
            pcall(function() v:Destroy() end)
        end
    end

    local function applyFrom(container)
        if allowedClass[container.ClassName] then
            local c = container:Clone()
            c.Parent = Lighting
        end
        for _, obj in ipairs(container:GetDescendants()) do
            if allowedClass[obj.ClassName] then
                local clone = obj:Clone()
                clone.Parent = Lighting
            end
        end
    end

    applyFrom(loadedRoot)
    pcall(function() loadedRoot:Destroy() end)
    shared.Notify("Creator Store Sky applied from AssetID: "..digits, 1)
end)

local originalSkyProps = {}
local removeCelestialsConn = nil
local removeCelestialsEnabled = false

local function storeAndDisableSky(sky)
    if not sky or not sky:IsA("Sky") then return end
    if originalSkyProps[sky] then return end
    originalSkyProps[sky] = {
        CelestialBodiesShown = sky.CelestialBodiesShown,
        SunTextureId = sky.SunTextureId,
        MoonTextureId = sky.MoonTextureId,
        StarCount = sky.StarCount
    }
    pcall(function() sky.CelestialBodiesShown = false end)
end

local function restoreAllSkies()
    for sky, props in pairs(originalSkyProps) do
        if sky and sky.Parent then
            pcall(function()
                if props.CelestialBodiesShown ~= nil then sky.CelestialBodiesShown = props.CelestialBodiesShown end
                if props.SunTextureId ~= nil then sky.SunTextureId = props.SunTextureId end
                if props.MoonTextureId ~= nil then sky.MoonTextureId = props.MoonTextureId end
                if props.StarCount ~= nil then pcall(function() sky.StarCount = props.StarCount end) end
            end)
        end
    end
    originalSkyProps = {}
end

lightning_section:AddToggle("Remove Celestial Bodies (Sun & Moon)", function(state)
    if state then
        removeCelestialsEnabled = true
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then storeAndDisableSky(obj) end
        end
        if not removeCelestialsConn then
            removeCelestialsConn = Lighting.ChildAdded:Connect(function(child)
                if removeCelestialsEnabled and child and child:IsA("Sky") then
                    storeAndDisableSky(child)
                end
            end)
        end
        shared.Notify("Celestial bodies disabled (sun & moon hidden).", 1)
    else
        removeCelestialsEnabled = false
        if removeCelestialsConn then removeCelestialsConn:Disconnect(); removeCelestialsConn = nil end
        restoreAllSkies()
        shared.Notify("Celestial bodies restored.", 1)
    end
end)

lightning_section:AddLabel("Skyboxes use Texture IDs, not Decal IDs!")

lightning_section:AddTextBox("Fog Start", function(text) fogStart = tonumber(text) or fogStart end)
lightning_section:AddTextBox("Fog End", function(text) fogEnd = tonumber(text) or fogEnd end)
lightning_section:AddTextBox("Fog Color (R,G,B)", function(text)
    local r,g,b = text:match("(%d+),(%d+),(%d+)")
    if r and g and b then fogColor = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b)) end
end)
lightning_section:AddButton("Apply Fog", function()
    Lighting.FogStart = fogStart
    Lighting.FogEnd = fogEnd
    Lighting.FogColor = fogColor
    shared.Notify("Fog applied.", 1)
end)

local lightingTechMap = {
    Future = Enum.Technology.Future,
    ShadowMap = Enum.Technology.ShadowMap,
    Voxel = Enum.Technology.Voxel,
    Compatibility = Enum.Technology.Compatibility
}
local lightingTechs = {"Future", "ShadowMap", "Voxel", "Compatibility"}
local selectedTech = "Future"

graphics_section:AddDropdown("Lighting Technology", lightingTechs, function(selected) selectedTech = selected end)
graphics_section:AddButton("Apply Selected Lighting Technology", function()
    if selectedTech and lightingTechMap[selectedTech] then
        Lighting.Technology = lightingTechMap[selectedTech]
        shared.Notify("Lighting technology applied: "..selectedTech, 1)
    else
        shared.Notify("Invalid lighting technology.", 4)
    end
end)

graphics_section:AddToggle("No Global Shadows", function(state)
    if state then
        Lighting.GlobalShadows = false
        shared.Notify("Global shadows disabled.", 1)
    else
        Lighting.GlobalShadows = true
        shared.Notify("Global shadows enabled.", 1)
    end
end)

local currentShadowSoftness = Lighting.ShadowSoftness or 0
graphics_section:AddTextBox("Shadow Softness", function(text) currentShadowSoftness = tonumber(text) or currentShadowSoftness end)
graphics_section:AddButton("Apply Shadow Softness", function()
    Lighting.ShadowSoftness = currentShadowSoftness
    shared.Notify("Shadow softness set to "..tostring(currentShadowSoftness)..".", 1)
end)

local blurIntensity = 0
local bloomIntensity, bloomSize, bloomThreshold = 0, 24, 2
local cceBrightness, cceContrast, cceSaturation = 0, 0, 0
local cceColor = Color3.new(1,1,1)
local dofeFarIntensity, dofeFocusDistance, dofeInFocusDistance, dofeNearIntensity = 0, 50, 20, 0
local postInfoText = "<font color='#00FF00'><u>CCE = Color Correction Effect, D.O.F.E. = Depth Of Field Effect</u></font>"

graphics_section:AddTextBox("Blur Intensity", function(text) blurIntensity = tonumber(text) or blurIntensity end)
graphics_section:AddButton("Apply Blur", function()
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("BlurEffect") and v.Name ~= "NewltemBlur" and v.Name ~= "MenuBlur" then pcall(function() v:Destroy() end) end
    end
    local blur = Instance.new("BlurEffect")
    pcall(function() blur.Size = blurIntensity end)
    blur.Name = "CustomBlur"
    blur.Parent = Lighting
    shared.Notify("Blur applied.", 1)
end)
graphics_section:AddButton("Remove Blur", function()
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("BlurEffect") and v.Name ~= "NewltemBlur" and v.Name ~= "MenuBlur" then pcall(function() v:Destroy() end) end
    end
    shared.Notify("Blur removed.", 1)
end)

graphics_section:AddTextBox("Bloom Intensity", function(text) bloomIntensity = tonumber(text) or bloomIntensity end)
graphics_section:AddTextBox("Bloom Size", function(text) bloomSize = tonumber(text) or bloomSize end)
graphics_section:AddTextBox("Bloom Threshold", function(text) bloomThreshold = tonumber(text) or bloomThreshold end)
graphics_section:AddButton("Apply Bloom", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("BloomEffect") then pcall(function() v:Destroy() end) end end
    local bloom = Instance.new("BloomEffect")
    pcall(function() bloom.Intensity = bloomIntensity end)
    pcall(function() bloom.Size = bloomSize end)
    pcall(function() bloom.Threshold = bloomThreshold end)
    bloom.Name = "CustomBloom"
    bloom.Parent = Lighting
    shared.Notify("Bloom applied.", 1)
end)
graphics_section:AddButton("Remove Bloom", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("BloomEffect") and v.Name == "CustomBloom" then pcall(function() v:Destroy() end) end end
    shared.Notify("Bloom removed.", 1)
end)

graphics_section:AddTextBox("CCE Brightness", function(text) cceBrightness = tonumber(text) or cceBrightness end)
graphics_section:AddTextBox("CCE Constrast", function(text) cceContrast = tonumber(text) or cceContrast end)
graphics_section:AddTextBox("CCE Saturation", function(text) cceSaturation = tonumber(text) or cceSaturation end)
graphics_section:AddTextBox("CCE Color (R,G,B)", function(text)
    local r,g,b = text:match("(%d+),(%d+),(%d+)")
    if r and g and b then
        cceColor = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
    else
        local rf,gf,bf = text:match("([%d%.]+),([%d%.]+),([%d%.]+)")
        if rf and gf and bf then cceColor = Color3.new(tonumber(rf), tonumber(gf), tonumber(bf)) end
    end
end)
graphics_section:AddButton("Apply CCE", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("ColorCorrectionEffect") then pcall(function() v:Destroy() end) end end
    local cce = Instance.new("ColorCorrectionEffect")
    pcall(function() cce.Brightness = cceBrightness end)
    pcall(function() cce.Contrast = cceContrast end)
    pcall(function() cce.Saturation = cceSaturation end)
    pcall(function() cce.TintColor = cceColor end)
    cce.Name = "CustomCCE"
    cce.Parent = Lighting
    shared.Notify("Color Correction Effect applied.", 1)
end)
graphics_section:AddButton("Remove CCE", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("ColorCorrectionEffect") and v.Name == "CustomCCE" then pcall(function() v:Destroy() end) end end
    shared.Notify("Color Correction Effect removed.", 1)
end)

graphics_section:AddTextBox("D.O.F.E. Far Intensity", function(text) dofeFarIntensity = tonumber(text) or dofeFarIntensity end)
graphics_section:AddTextBox("D.O.F.E. Focus Distance", function(text) dofeFocusDistance = tonumber(text) or dofeFocusDistance end)
graphics_section:AddTextBox("D.O.F.E. InFocus Distance", function(text) dofeInFocusDistance = tonumber(text) or dofeInFocusDistance end)
graphics_section:AddTextBox("D.O.F.E. Near Intensity", function(text) dofeNearIntensity = tonumber(text) or dofeNearIntensity end)
graphics_section:AddButton("Apply D.O.F.E.", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("DepthOfFieldEffect") then pcall(function() v:Destroy() end) end end
    local dofe = Instance.new("DepthOfFieldEffect")
    pcall(function() dofe.FarIntensity = dofeFarIntensity end)
    pcall(function() dofe.FocusDistance = dofeFocusDistance end)
    pcall(function() dofe.InFocusRadius = dofeInFocusDistance end)
    pcall(function() dofe.NearIntensity = dofeNearIntensity end)
    dofe.Name = "CustomDOFE"
    dofe.Parent = Lighting
    shared.Notify("Depth Of Field Effect applied.", 1)
end)
graphics_section:AddButton("Remove D.O.F.E.", function()
    for _, v in ipairs(Lighting:GetChildren()) do if v:IsA("DepthOfFieldEffect") and v.Name == "CustomDOFE" then pcall(function() v:Destroy() end) end end
    shared.Notify("Depth Of Field Effect removed.", 1)
end)

graphics_section:AddLabel(postInfoText)

local soundProperties = {["SoundId"]=true, ["Volume"]=true, ["PlaybackSpeed"]=true, ["Pitch"]=true}
local soundLoggerActive = false
do
    local orig_newindex
    sound_section:AddToggle("Sound Logger", function(state)
        soundLoggerActive = state
        if soundLoggerActive and not orig_newindex then
            orig_newindex = hookmetamethod(game, "__newindex", newcclosure(function(self, key, value)
                if not checkcaller() and typeof(self) == "Instance" and self:IsA("Sound") and soundProperties[key] then
                    local ok = pcall(function()
                        print(string.format("[SoundLogger] %s changed %s => %s", tostring(self), tostring(key), tostring(value)))
                    end)
                end
                return orig_newindex(self, key, value)
            end))
        elseif not soundLoggerActive and orig_newindex then
            orig_newindex = orig_newindex
        end
    end)
end
sound_section:AddLabel('Credits To: <font color="rgb(0,255,0)"><u>Unlucks (@unluckyau)</u></font>')

local autoChatMessage = ""
local autoChatDelay = 1
local autoChatToggle = false
other_section:AddTextBox("Message To Chat", function(text) autoChatMessage = text end)
other_section:AddSlider("Delay (s)", 0.1, 60, 1, function(val) autoChatDelay = val end)
other_section:AddToggle("Auto Chat", function(state) autoChatToggle = state end)
task.spawn(function()
    while true do
        if autoChatToggle and autoChatMessage ~= "" then
            pcall(function() TextChatService.TextChannels.RBXGeneral:SendAsync(autoChatMessage) end)
        end
        task.wait(autoChatDelay)
    end
end)

other_section:AddButton("Copy Server JobID", function() pcall(function() setclipboard(game.JobId) end) end)
other_section:AddButton("Server Hop", function()
    local placeId = game.PlaceId
    local success, servers = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100"))
    end)
    if not success or not servers then shared.Notify("Server list fetch failed.", 4); return end
    local nextCursor = servers.nextPageCursor
    local chosenServer
    local function findAvailableServer(serverList)
        for _, srv in pairs(serverList) do
            if srv.playing < srv.maxPlayers and srv.id ~= game.JobId then return srv.id end
        end
    end
    chosenServer = findAvailableServer(servers.data)
    while not chosenServer and nextCursor do
        local pageSuccess, pageServers = pcall(function()
            return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..nextCursor))
        end)
        if not pageSuccess or not pageServers then break end
        chosenServer = findAvailableServer(pageServers.data)
        nextCursor = pageServers.nextPageCursor
    end
    if chosenServer then TeleportService:TeleportToPlaceInstance(placeId, chosenServer, LocalPlayer) end
end)

other_section:AddButton("Rejoin", function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
local joinJobID = ""
other_section:AddTextBox("Server JobID", function(text) joinJobID = text end)
other_section:AddButton("Join Server (JobID)", function()
    if joinJobID ~= "" then TeleportService:TeleportToPlaceInstance(game.PlaceId, joinJobID, LocalPlayer) end
end)
other_section:AddButton("Force Quit Game", function() game:Shutdown() end)
