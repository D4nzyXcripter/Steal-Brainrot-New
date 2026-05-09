local Players = game:GetService("Players")

local blacklist = {
    ["VIP_Jeprl"] = "laper hama tolol musang ngaku admin",
    ["fansberatewindah"] = "tes akun2",
    ["toxic_kid"] = "toxic behavior",
}

local scriptUrl = "https://raw.githubusercontent.com/D4nzyXcripter/Steal-Brainrot-New/refs/heads/main/mainan.lua"

local player = Players.LocalPlayer
local reason = blacklist[player.Name]

if reason then
    game.StarterGui:SetCore("SendNotification", {
        Title = "🚫 BLACKLISTED";
        Text = "Reason: " .. reason;
        Duration = 3;
    })
    
    wait(3)
    player:Kick("⛔ BLACKLISTED\nReason: " .. reason)
else
    game.StarterGui:SetCore("SendNotification", {
        Title = "✅ Loading Script";
        Text = "Executing...";
        Duration = 2;
    })
    
    loadstring(game:HttpGet(scriptUrl))()
end
