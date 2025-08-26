local baseFolder = "Ixry Shizuka"
local pluginsFolder = baseFolder .. "/plugins"
local addonFile = pluginsFolder .. "/AddonPack.lua"

if not isfolder(baseFolder) then
    makefolder(baseFolder)
end

if not isfolder(pluginsFolder) then
    makefolder(pluginsFolder)
end

local url = "https://raw.githubusercontent.com/not-gato/Stuff/refs/heads/main/Files/addonpack.lua"

local success, content = pcall(function()
    return game:HttpGet(url)
end)

if success and content then
    writefile(addonFile, content)
    print("AddonPack.lua successfully created in " .. pluginsFolder)
else
    game.Players.LocalPlayer:Kick("An Error Ocurred While Trying To Download Github Files, Hmmmm...")
end
