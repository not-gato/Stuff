local folderPath = "Ixry Shizuka/plugins"
local fileName = "AutoWallHop.lua"
local filePath = folderPath.."/"..fileName
if not isfolder(folderPath) then makefolder(folderPath) end
local code = [[
local shared = odh_shared_plugins
local section = shared.AddSection("Auto Wall Hop")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
raycastParams.FilterDescendantsInstances = {char}
local wallhopEnabled = false
local jumpConnection
local function getWallRaycastResult()
    if not root then return nil end
    raycastParams.FilterDescendantsInstances = {char}
    local detectionDistance = 2
    local closestHit, minDistance = nil, detectionDistance + 1
    local hrpCF = root.CFrame
    for i = 0, 7 do
        local angle = math.rad(i * 45)
        local direction = (hrpCF * CFrame.Angles(0, angle, 0)).LookVector
        local ray = Workspace:Raycast(root.Position, direction * detectionDistance, raycastParams)
        if ray and ray.Instance and ray.Distance < minDistance then
            minDistance = ray.Distance
            closestHit = ray
        end
    end
    local blockCastSize = Vector3.new(1.5, 1, 0.5)
    local blockCastOffset = CFrame.new(0, -1, -0.5)
    local blockCastOriginCF = hrpCF * blockCastOffset
    local blockCastResult = Workspace:Blockcast(blockCastOriginCF, blockCastSize, hrpCF.LookVector * 1.5, raycastParams)
    if blockCastResult and blockCastResult.Instance and blockCastResult.Distance < minDistance then
        closestHit = blockCastResult
    end
    return closestHit
end
local function performFaceWallJump()
    local wallRayResult = getWallRaycastResult()
    if wallRayResult and hum and hum.Health > 0 then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end
local function setWallhop(state)
    wallhopEnabled = state
    if state then
        if not jumpConnection then
            jumpConnection = UserInputService.JumpRequest:Connect(function()
                local wallRayResult = getWallRaycastResult()
                if wallRayResult and hum and hum.Health > 0 then
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    else
        if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
        end
    end
end
section:AddToggle("Auto Wallhop", function(state) setWallhop(state) end)
section:AddButton("Perform Face Wall Jump", function() performFaceWallJump() end)
section:AddKeybind("Face Wall Jump Keybind", "J", function() performFaceWallJump() end)
]]
writefile(filePath, code)
