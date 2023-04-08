-- For Server 1, when not using Paradox. Contains everything required EXCEPT Paradox-related.

-- CPU USAGE REDUCER


local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end

-- PASS GIVERS CURRENTLY PATCHED. NEW TELEPORT BELOW

-- This teleport sends an event to teleport the user to Uranus.
-- It updates the Zone Multiplier & loads the map for us so we don't have to do that.

-- teleporter unused at the moment
-- local ohString22 = "spaceWorld"

 -- game:GetService("ReplicatedStorage").SpecWork.Shared.Network.TeleportTo:InvokeServer(ohString22)


 -- game:GetService("ReplicatedStorage").Bindable.Client.worldChanged:Fire()



-- Webhook for SERVER 1
getgenv().webhook = "https://discord.com/api/webhooks/1092986980192763984/CEwmCPrNADQxMtMhrzED6GHHfbXebu_e1730YVuAfVljlaphdXOMhqik112wxq5LMMGa"
local HttpService = game:GetService("HttpService")
local Player = game:GetService("Players").LocalPlayer
local FunctionModule = require(game:GetService("ReplicatedStorage").FunctionsModule)
local chat = Player.PlayerGui.Chat.Frame.ChatChannelParentFrame["Frame_MessageLogDisplay"].Scroller

function toHex(x)
   local hex =  string.format("%x", x)
   return hex:len() == 1 and "0"..hex or hex
end
function RGB2HEX(r,g,b)
   return "0x" .. toHex(r) .. toHex(g) .. toHex(b)
end

_G.TimeFormat = _G.TimeFormat or "TIME12 (TIME24)"

local Times = {}
Times["TIME12"] = "%%I:%%M %%p"
Times["TIME24"] = "%%H:%%M"
Times["DATE"] = "%%x"
Times["TIMEZONE"] = "%%Z"
Times["TIME"] = "%%X"

function FormatTime(str: string)
   for i,v in pairs(Times) do
       str = str:gsub(i,v)
   end
   return str
end

chat.ChildAdded:Connect(function(instance)
   local TextColor3 = instance.TextLabel.TextColor3
   if string.find(instance.TextLabel.Text, Player.Name.." just hatched a") then
       local ToSplit = instance.TextLabel.Text
       local split = ToSplit:split("]: ")

       local message = split[2]

       local Data = {
           ["embeds"] = {{
               ["title"] = message,
               ["color"] =  tonumber(RGB2HEX(unpack({TextColor3.R*255,TextColor3.G*255,TextColor3.B*255}))),
               ["fields"] = {{
                   ["name"] = "__Total Eggs Opened:__",
                   ["value"] = FunctionModule.comma(Player.leaderstats.Eggs.Value),
                   ["inline"] = true
               },
               {
                   ["name"] = "__Time:__",
                   ["value"] = os.date(FormatTime(_G.TimeFormat), os.time()),
                   ["inline"] = true
               }
               }
           }}
       }
       
       local HttpRequest = syn and syn.request or http_request
       HttpRequest({Url= getgenv().webhook, Body = HttpService:JSONEncode(Data), Method = "POST", Headers = {["content-type"] = "application/json"}})
   end
end)



-- FPS Cap
setfpscap(10)

--Anti-Afk
loadstring(game:HttpGet('https://pastebin.com/raw/XniN0RP9'))()

--Injection Notification


-- AUTO OPEN EGG WITHOUT BEING ON EGG

--x4 hatch
while true do

    local args = {
        [1] = "Client",
        [2] = "PurchaseEgg2",
        [3] = "Chemical", -- CHANGE THIS TO EGG NAME AND THEN INJECT IT WILL HATCH THE EGG.
        [4] = true,
        [5] = true,
        [7] = false,
        [8] = false
    }
    
    game:GetService("ReplicatedStorage").Events.ClientToServer.ClientToServerFunction:InvokeServer(unpack(args))
    
        wait(1) 
    
    end

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-20014.1152, 1990.87463, -74.4970703, -0.325602531, 0, -0.945506752, 0, 1, 0, 0.945506752, 0, -0.325602531)

-- NEW ALL PET TRADE USES NEW CLIENT TO SERVER EVENT


local ohString1 = "tradeClient"
        local ohString2 = "UpdateTradePets"
        local i = 10, 50, 1

        game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
            function(key)
                if key == "4" then
                    for i = 10, 50, 1 do
                        game:GetService("ReplicatedStorage").Events.ClientToServer.ClientToServerEvent:FireServer(
                            ohString1,
                            ohString2,
                            i
                        )
                    end
                end
            end
        )

