local jerkcock1 = loadstring(game:HttpGet('https://raw.githubusercontent.com/kyrakyrakyra1232-blip/goat/refs/heads/main/source1.lua?token=GHSAT0AAAAAADX2R2Q7U6QC45M3L5EPCKOG2NWB5XA'))()

local player = game.Players.LocalPlayer
local username = player.Name

local Window = Rayfield:CreateWindow({
   Name = "@" .. username, 
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "kyras sandbox",
   LoadingSubtitle = "made by @ryrl",
   ShowText = "Rayfield", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Bloom", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "kyras sandbox",
      Subtitle = "Key System",
      Note = "discord.gg/979w", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"key1", "key2"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local Tab2 = Window:CreateTab("Misc", "file-text") -- Title, Image (can use Roblox ID or string for Lucide Icons)
local Section2 = Tab2:CreateSection("Visibility")
local SliderFOV = Tab2:CreateSlider({
   Name = "Fov",
   Range = {30, 120},
   Increment = 1,
   Suffix = "°",
   CurrentValue = 70,
   Flag = "SliderFOV", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    workspace.CurrentCamera.FieldOfView = Value
   end, 
})

local FullbrightToggle = Tab2:CreateToggle({
   Name = "Fullbright",
   CurrentValue = false,
   Flag = "FullbrightToggle",
   Callback = function(Value)
      local Lighting = game:GetService("Lighting")
      
      if Value then
         -- Enable Fullbright
         Lighting.Brightness = 2
         Lighting.ClockTime = 14
         Lighting.FogEnd = 100000
         Lighting.GlobalShadows = false
         Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
         
         -- Remove atmosphere density
         local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
         if atmosphere then
            atmosphere.Density = 0
            atmosphere.Offset = 0
         end
      else
         -- Disable Fullbright (reset to default values)
         Lighting.Brightness = 1
         Lighting.ClockTime = 14
         Lighting.FogEnd = 100000
         Lighting.GlobalShadows = true
         Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
         
         -- Restore atmosphere density
         local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
         if atmosphere then
            atmosphere.Density = 0.395
            atmosphere.Offset = 0.25
         end
      end
   end,
})


-- Skybox presets (now includes atmosphere settings)
local skyboxPresets = {
   ["Default"] = {
      SkyboxBk = "rbxassetid://6444884337",
      SkyboxDn = "rbxassetid://6444884785",
      SkyboxFt = "rbxassetid://6444884337",
      SkyboxLf = "rbxassetid://6444884337",
      SkyboxRt = "rbxassetid://6444884337",
      SkyboxUp = "rbxassetid://6412503613",
      Density = 0,  -- No density for default
      Haze = 0      -- No haze for default
   },
   ["Starry Night"] = {
      SkyboxBk = "http://www.roblox.com/asset/?id=154185004",
      SkyboxDn = "http://www.roblox.com/asset/?id=154184960",
      SkyboxFt = "http://www.roblox.com/asset/?id=154185021",
      SkyboxLf = "http://www.roblox.com/asset/?id=154184943",
      SkyboxRt = "http://www.roblox.com/asset/?id=154184972",
      SkyboxUp = "http://www.roblox.com/asset/?id=154185031",
      Density = 0.4,
      Haze = 2
   },
   ["Sunset"] = {
      SkyboxBk = "http://www.roblox.com/asset/?id=458016711",
      SkyboxDn = "http://www.roblox.com/asset/?id=458016826",
      SkyboxFt = "http://www.roblox.com/asset/?id=458016532",
      SkyboxLf = "http://www.roblox.com/asset/?id=458016655",
      SkyboxRt = "http://www.roblox.com/asset/?id=458016782",
      SkyboxUp = "http://www.roblox.com/asset/?id=458016792",
      Density = 0.4,
      Haze = 2
   },
   ["Night Sky"] = {
      SkyboxBk = "rbxassetid://12064107",
      SkyboxDn = "rbxassetid://12064152",
      SkyboxFt = "rbxassetid://12064121",
      SkyboxLf = "rbxassetid://12063984",
      SkyboxRt = "rbxassetid://12064115",
      SkyboxUp = "rbxassetid://12064131",
      Density = 0.4,
      Haze = 2
   },
   ["Pink Daylight"] = {
      SkyboxBk = "rbxassetid://271042516",
      SkyboxDn = "rbxassetid://271077243",
      SkyboxFt = "rbxassetid://271042556",
      SkyboxLf = "rbxassetid://271042310",
      SkyboxRt = "rbxassetid://271042467",
      SkyboxUp = "rbxassetid://271077958",
      Density = 0.4,
      Haze = 2
   },
   ["Vaporwave"] = {
      SkyboxBk = "rbxassetid://1417494030",
      SkyboxDn = "rbxassetid://1417494146",
      SkyboxFt = "rbxassetid://1417494253",
      SkyboxLf = "rbxassetid://1417494402",
      SkyboxRt = "rbxassetid://1417494499",
      SkyboxUp = "rbxassetid://1417494643",
      Density = 0.5,
      Haze = 2.5
   }
}

-- Function to apply skybox
local function applySkybox(preset)
   local Lighting = game:GetService("Lighting")
  
   
   -- Remove old sky if exists
   for _, obj in pairs(Lighting:GetChildren()) do
      if obj:IsA("Sky") then
         obj:Destroy()
      end
   end
   
   -- Create new Sky object
   local sky = Instance.new("Sky")
   sky.Name = "CustomSky"
   
   -- Apply the skybox textures
   sky.SkyboxBk = preset.SkyboxBk
   sky.SkyboxDn = preset.SkyboxDn
   sky.SkyboxFt = preset.SkyboxFt
   sky.SkyboxLf = preset.SkyboxLf
   sky.SkyboxRt = preset.SkyboxRt
   sky.SkyboxUp = preset.SkyboxUp
   
   -- Important: Set these properties
   sky.StarCount = 3000
   sky.SunAngularSize = 21
   sky.MoonAngularSize = 11
   sky.MoonTextureId = "rbxasset://sky/moon.jpg"
   sky.SunTextureId = "rbxasset://sky/sun.jpg"
   sky.CelestialBodiesShown = true
   
   -- Parent it to Lighting
   sky.Parent = Lighting
   
   -- Apply Atmosphere settings (density and haze)
   local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
   if not atmosphere then
      atmosphere = Instance.new("Atmosphere")
      atmosphere.Parent = Lighting
   end
   
   atmosphere.Density = preset.Density or 0
   atmosphere.Haze = preset.Haze or 0
   atmosphere.Offset = 0.25
   
   print("Skybox changed to: " .. (sky.SkyboxBk or "Unknown"))
   print("Density: " .. atmosphere.Density .. ", Haze: " .. atmosphere.Haze)
end

-- Create dropdown
local SkyboxDropDown = Tab2:CreateDropdown({
   Name = "Select Skybox",
   Options = {"Default", "Starry Night", "Sunset", "Night Sky", "Pink Daylight", "Vaporwave"},
   CurrentOption = {"Default"},
   MultipleOptions = false,
   Flag = "SkyboxDropdown",
   Callback = function(Option)
      -- Option is a table, get the first element
      local selectedOption = Option[1] or Option
      print("Dropdown selected: " .. tostring(selectedOption))
      
      local selectedPreset = skyboxPresets[selectedOption]
      if selectedPreset then
         applySkybox(selectedPreset)
      else
         warn("Skybox preset not found: " .. tostring(selectedOption))
      end
   end,
})

local Tab = Window:CreateTab("Ryrl", "circle-fading-plus") -- Title, Image (can use Roblox ID or string for Lucide Icons)
local Section = Tab:CreateSection("Soccials")
local button1 = Tab:CreateButton({
   Name = "Discord",
   Callback = function()
      local inviteLink = "discord.gg/979w" -- Your Discord invite link here
      setclipboard(inviteLink)
      Rayfield:Notify({
         Title = "Discord",
         Content = "Discord link copied to clipboard!",
         Duration = 5,
         Image = "bade-alert"
      })
   end
})

local Divider = Tab:CreateDivider()

local button2 = Tab:CreateButton({
   Name = "Github",
   Callback = function()
      local inviteLink = "https://github.com/ryrl/kyras-sandbox" -- Your GitHub link here
      setclipboard(inviteLink)
      Rayfield:Notify({
         Title = "GitHub",
         Content = "GitHub link copied to clipboard!",
         Duration = 5,
         Image = "github"
      })
   end
})
