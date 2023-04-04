task.wait(20) -- Taskwait to ensure it auto-executes.

-- GLOBAL ANTIAFK
loadstring(game:HttpGet('https://pastebin.com/raw/XniN0RP9'))()

local games = {
    -- Clicker Simulator: Custom
    [{7560156054}] = "https://raw.githubusercontent.com/ZightScripts/scripts/main/ClickerSim.lua",
    -- Bedwars: VapeV4
    [{6872265039}] = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua",
    -- Arsenal: Bolts Hub
    [{286090429}] = "https://raw.githubusercontent.com/fusiongreg/BoltsHubV5/main/Main",
    --
    [{3101667897}] = "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Legends%20Of%20Speed/Script.lua",
    [{3956818381}] = "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Ninja%20Legends/Script.lua",
    [{4623386862, 5661005779}] = "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Piggy/Loader.lua",
    [{155615604}] = "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Prison%20Life/Script.lua",
    [{1962086868, 3582763398}] = "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Tower%20of%20Hell/Script.lua",
    [{6839171747}] = "https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Loader.lua",
}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        loadstring(game:HttpGet(url))()
        break
    end
end
