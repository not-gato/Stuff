local shared = odh_shared_plugins
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
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
local other_section = shared.AddSection("Other | #6")

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
    local base = Vector3.new(wall.Normal.X,0,wall.Normal.Z).Unit
    if base.Magnitude < 0.1 then
        local dir = (wall.Position - rootPart.Position)*Vector3.new(1,0,1)
        base = -dir.Unit
        if base.Magnitude < 0.1 then
            base = -rootPart.CFrame.LookVector*Vector3.new(1,0,1)
            if base.Magnitude > 0.1 then base = base.Unit end
            if base.Magnitude < 0.1 then base = Vector3.new(0,0,1) end
        end
    end
    base = Vector3.new(base.X,0,base.Z).Unit
    if base.Magnitude < 0.1 then base = Vector3.new(0,0,1) end
    local horLook = Vector3.new(camera.CFrame.LookVector.X,0,camera.CFrame.LookVector.Z).Unit
    if horLook.Magnitude < 0.1 then horLook = base end
    local dot = math.clamp(base:Dot(horLook), -1,1)
    local angle = math.acos(dot)
    local cross = base:Cross(horLook)
    local sign = -math.sign(cross.Y)
    if sign == 0 then angle = 0 end
    local finalAngle = 0
    if sign == 1 then finalAngle = math.min(angle,maxR)
    elseif sign == -1 then finalAngle = math.min(angle,maxL) end
    local adj = CFrame.Angles(0, finalAngle*sign, 0)
    local lookDir = adj*base
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
cam_section:AddLabel("<font color='#FF0000'>Some Executors May Break This, Use With Caution</font>")
cam_section:AddToggle("Camera Stretch", function(state)
    StretchActive = state
    if StretchActive then
        if not stretchConnection then
            stretchConnection = RunService.RenderStepped:Connect(function()
                Camera.CFrame = Camera.CFrame*CFrame.new(0,0,0,1,0,0,0,0.67,0,0,0,1)
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
    if isfile(fileName) then delfile(fileName) end
    local success, content = pcall(function() return game:HttpGet(link) end)
    if success and content then writefile(fileName, content) end
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
                shared.Notify("Owner profile picture applied.", 2)
            else
                shared.Notify("Could not fetch owner avatar.", 2)
            end
        else
            shared.Notify("Discord API fetch failed.", 2)
        end
    else
        if profileLinks[selectedProfile] then
            setProfilePicture(profileLinks[selectedProfile])
            shared.Notify("Profile picture applied: "..selectedProfile, 2)
        end
    end
end)

local customProfileLink = ""
profile_section:AddTextBox("Custom Profile Picture Link", function(text) customProfileLink = text end)
profile_section:AddButton("Apply Custom Profile Picture", function()
    if customProfileLink ~= "" then
        setProfilePicture(customProfileLink)
        shared.Notify("Custom profile picture applied.", 2)
    end
end)

profile_section:AddButton("Remove Profile Picture", function()
    local fileName = "Ixry Shizuka/avatar.png"
    if isfile(fileName) then delfile(fileName) end
    shared.Notify("Profile picture removed.", 2)
end)

local fogStart, fogEnd, fogColor = 0, 1000, Color3.new(1,1,1)

local skyboxOptions = {
    "Realistic Sky",
    "Minecraft Sky",
    "Sunset",
    "Purple Nighty Sky #1",
    "Purple Nighty Sky #2",
    "Nighty Sky"
}

local skyboxPresets = {
    ["Minecraft Sky"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then obj:Destroy() end
        end
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
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then obj:Destroy() end
        end
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
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then obj:Destroy() end
        end
        local nebulaSky = Instance.new("Sky")
        nebulaSky.Name = "NebulaSky"
        nebulaSky.SkyboxBk = "rbxassetid://159454299"
        nebulaSky.SkyboxDn = "rbxassetid://159454296"
        nebulaSky.SkyboxFt = "rbxassetid://159454293"
        nebulaSky.SkyboxLf = "rbxassetid://159454286"
        nebulaSky.SkyboxRt = "rbxassetid://159454300"
        nebulaSky.SkyboxUp = "rbxassetid://159454288"
        nebulaSky.SunTextureId = ""
        nebulaSky.MoonTextureId = ""
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
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then obj:Destroy() end
        end
        local sky = Instance.new("Sky")
        sky.Parent = Lighting
        sky.SkyboxBk = "rbxassetid://14543264135"
        sky.SkyboxDn = "rbxassetid://14543358958"
        sky.SkyboxFt = "rbxassetid://14543257810"
        sky.SkyboxLf = "rbxassetid://14543275895"
        sky.SkyboxRt = "rbxassetid://14543280890"
        sky.SkyboxUp = "rbxassetid://14543371676"
        sky.SunTextureId = ""
        sky.MoonTextureId = ""
        Lighting.Ambient = Color3.fromRGB(124, 1, 205)
        Lighting.Brightness = 0.23
        Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        Lighting.GlobalShadows = true
        Lighting.OutdoorAmbient = Color3.fromRGB(95, 0, 182)
        Lighting.ShadowSoftness = 0.5
        Lighting.Technology = Enum.Technology.Future
    end,
    ["Sunset"] = function()
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then obj:Destroy() end
        end
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
        for _, obj in pairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then
                obj:Destroy()
            end
        end
        local sky = Instance.new("Sky")
        sky.Name = "CustomSky"
        sky.SkyboxBk = "rbxassetid://168387023"
        sky.SkyboxDn = "rbxassetid://168387089"
        sky.SkyboxFt = "rbxassetid://168387054"
        sky.SkyboxLf = "rbxassetid://168534432"
        sky.SkyboxRt = "rbxassetid://168387190"
        sky.SkyboxUp = "rbxassetid://168387135"
        sky.Parent = Lighting
        Lighting.Ambient = Color3.new(0, 0, 0)
        Lighting.Brightness = 0.3
        Lighting.ClockTime = 14.5
        Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
        Lighting.ColorShift_Top = Color3.new(0, 0, 0)
        Lighting.OutdoorAmbient = Color3.new(0, 0, 0)
        Lighting.ShadowColor = Color3.new(0, 0, 0)
        Lighting.ShadowSoftness = 0.2
        Lighting.TimeOfDay = "14:30:00"
        Lighting.Technology = Enum.Technology.Future
    end
}

local selectedSkybox = nil
lightning_section:AddDropdown("Predefined Skyboxes", skyboxOptions, function(selected) selectedSkybox = selected end)
lightning_section:AddButton("Apply Selected Predefined Skybox", function()
    if selectedSkybox and skyboxPresets[selectedSkybox] then
        skyboxPresets[selectedSkybox]()
        shared.Notify("Applied " .. selectedSkybox, 2)
    else
        shared.Notify("No skybox selected or preset missing.", 2)
    end
end)

local customSkyboxBk = ""
local customSkyboxDn = ""
local customSkyboxFt = ""
local customSkyboxLf = ""
local customSkyboxRt = ""
local customSkyboxUp = ""
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
    for _, obj in ipairs(Lighting:GetChildren()) do
        if obj:IsA("Sky") then obj:Destroy() end
    end
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
        shared.Notify("✅ Custom skybox applied.", 2)
    else
        shared.Notify("❌ Failed to apply custom skybox.", 2)
    end
end)

lightning_section:AddLabel("Skyboxes use Texture IDs, not Decal IDs!")

lightning_section:AddTextBox("Fog Start", function(text) fogStart = tonumber(text) or fogStart end)
lightning_section:AddTextBox("Fog End", function(text) fogEnd = tonumber(text) or fogEnd end)
lightning_section:AddTextBox("Fog Color (R,G,B)", function(text)
    local r,g,b = text:match("(%d+),(%d+),(%d+)")
    if r and g and b then
        fogColor = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
    end
end)
lightning_section:AddButton("Apply Fog", function()
    Lighting.FogStart = fogStart
    Lighting.FogEnd = fogEnd
    Lighting.FogColor = fogColor
    shared.Notify("Fog applied.", 2)
end)

local lightingTechMap = {
    Future = Enum.Technology.Future,
    ShadowMap = Enum.Technology.ShadowMap,
    Voxel = Enum.Technology.Voxel,
    Compatibility = Enum.Technology.Compatibility
}

local lightingTechs = {"Future", "ShadowMap", "Voxel", "Compatibility"}
local selectedTech = "Future"
lightning_section:AddDropdown("Lighting Technology", lightingTechs, function(selected) selectedTech = selected end)
lightning_section:AddButton("Apply Selected Lighting Technology", function()
    if selectedTech and lightingTechMap[selectedTech] then
        Lighting.Technology = lightingTechMap[selectedTech]
        shared.Notify("Lighting technology applied: "..selectedTech, 2)
    else
        shared.Notify("Invalid lighting technology.", 2)
    end
end)

local soundProperties = {["SoundId"]=true, ["Volume"]=true, ["PlaybackSpeed"]=true, ["Pitch"]=true}
local soundHook = nil
local soundLoggerActive = false
sound_section:AddToggle("Sound Logger", function(state)
    soundLoggerActive = state
    if soundLoggerActive and not soundHook then
        soundHook = hookmetamethod(game,"__newindex",newcclosure(function(self,key,value)
            if self:IsA("Sound") and soundProperties[key] then return end
            return soundHook(self,key,value)
        end))
    end
end)
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

other_section:AddButton("Copy Server JobID", function() setclipboard(game.JobId) end)
other_section:AddButton("Server Hop", function()
    local placeId = game.PlaceId
    local success, servers = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100"))
    end)
    if not success or not servers then return end
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
