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

local skyLeft, skyRight, skyFront, skyBack, skyUp, skyDown = "", "", "", "", "", ""
local fogStart, fogEnd, fogColor = 0, 1000, Color3.new(1,1,1)

lightning_section:AddTextBox("Skybox Left", function(text) skyLeft = text end)
lightning_section:AddTextBox("Skybox Right", function(text) skyRight = text end)
lightning_section:AddTextBox("Skybox Front", function(text) skyFront = text end)
lightning_section:AddTextBox("Skybox Back", function(text) skyBack = text end)
lightning_section:AddTextBox("Skybox Up", function(text) skyUp = text end)
lightning_section:AddTextBox("Skybox Down", function(text) skyDown = text end)

lightning_section:AddButton("Apply Custom Skybox", function()
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then
            v:Destroy()
        end
    end

    local defaultSky = {
        Bk = "rbxasset://textures/sky/sky512_bk.tex",
        Ft = "rbxasset://textures/sky/sky512_ft.tex",
        Lf = "rbxasset://textures/sky/sky512_lf.tex",
        Rt = "rbxasset://textures/sky/sky512_rt.tex",
        Up = "rbxasset://textures/sky/sky512_up.tex",
        Dn = "rbxasset://textures/sky/sky512_dn.tex",
    }

    local sky = Instance.new("Sky")
    sky.Parent = Lighting

    sky.SkyboxBk = (skyBack ~= "" and skyBack ~= "0") and "rbxassetid://"..skyBack or defaultSky.Bk
    sky.SkyboxFt = (skyFront ~= "" and skyFront ~= "0") and "rbxassetid://"..skyFront or defaultSky.Ft
    sky.SkyboxLf = (skyLeft ~= "" and skyLeft ~= "0") and "rbxassetid://"..skyLeft or defaultSky.Lf
    sky.SkyboxRt = (skyRight ~= "" and skyRight ~= "0") and "rbxassetid://"..skyRight or defaultSky.Rt
    sky.SkyboxUp = (skyUp ~= "" and skyUp ~= "0") and "rbxassetid://"..skyUp or defaultSky.Up
    sky.SkyboxDn = (skyDown ~= "" and skyDown ~= "0") and "rbxassetid://"..skyDown or defaultSky.Dn

    shared.Notify("Custom skybox applied (default used for empty/0 IDs).", 2)
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
