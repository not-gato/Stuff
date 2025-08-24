local folder = "Ixry Shizuka/plugins"
local file = folder .. "/jonkler.lua"

if not isfolder(folder) then
    makefolder(folder)
end

local pluginCode = [[
local shared = odh_shared_plugins

local jonker_section = shared.AddSection("Jonkler")

jonker_section:AddButton("Activate Jonkler", function()
    local file = "GatoStuff/jonkler.mp3"
    if not isfile(file) then
        writefile(file, game:HttpGet("https://github.com/not-gato/Stuff/raw/refs/heads/main/Files/jonkler.mp3"))
    end

    local sfx = Instance.new("Sound")
    sfx.Name = "JonklerSFX"
    sfx.SoundId = getcustomasset(file)
    sfx.Looped = true
    sfx.Volume = 1
    sfx.Parent = game:GetService("SoundService")
    sfx:Play()

    local decalId = "rbxassetid://18507322014"
    local parts = {}

    for _, part in workspace:GetDescendants() do
        if part:IsA("BasePart") then
            parts[#parts+1] = part
            for _, face in Enum.NormalId:GetEnumItems() do
                if not part:FindFirstChild("Jonkler_"..face.Name) then
                    local decal = Instance.new("Decal")
                    decal.Name = "Jonkler_"..face.Name
                    decal.Face = face
                    decal.Texture = decalId
                    decal.Parent = part
                end
            end
        end
    end

    task.spawn(function()
        while true do
            for i = 1, 20 do
                local part = parts[math.random(1, #parts)]
                if part and part:IsA("BasePart") then
                    for _, face in Enum.NormalId:GetEnumItems() do
                        local decal = part:FindFirstChild("Jonkler_"..face.Name)
                        if decal then
                            decal.Texture = decalId
                        end
                    end
                end
            end
            task.wait()
        end
    end)

    local sky = game.Lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky", game.Lighting)
    sky.Name = "JonklerSky"
    sky.SkyboxBk = decalId
    sky.SkyboxDn = decalId
    sky.SkyboxFt = decalId
    sky.SkyboxLf = decalId
    sky.SkyboxRt = decalId
    sky.SkyboxUp = decalId

    local function applyUIJonkler(gui)
        for _, child in gui:GetDescendants() do
            if child:IsA("ImageLabel") or child:IsA("ImageButton") then
                child.Image = decalId
            end
        end
    end

    applyUIJonkler(game.Players.LocalPlayer.PlayerGui)
    applyUIJonkler(game.CoreGui)
    if pcall(gethui) then
        applyUIJonkler(gethui())
    end
end)
]]

writefile(file, pluginCode)
print("Jonkler plugin installed to: " .. file)
