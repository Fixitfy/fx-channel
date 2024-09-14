Config = {}
Config.Framework = "VORP" -- RSG
Config.Language = "en"

Config.Locale = {
    ["en"] = {
        ["change_channel"] = "You have switched to channel ${bucketId}!",
        ["default_channel"] = "You have switched to the default channel!",
    }    
}


Config.ChannelNotify = true
Config.ChannelZones = { 
    [1] = {
        channelId = 1,
        ---- ZONE -----
        name =  "Blackwater Sheriff",
        zones = {
            vector2(-756.5012, -1280.4236),
            vector2(-756.5743, -1261.2527),
            vector2(-769.0260, -1260.5226),
            vector2(-769.2991, -1281.0198),
        },
        minz = 40.0,
        maxz = 50.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [2] = {
        channelId = 2,
        ---- ZONE -----
        name =  "Blackwater Clothe Store",
        zones = {
            vector2(-756.5698, -1296.1128),
            vector2(-756.6893, -1288.9473),
            vector2(-768.1635, -1290.4791),
            vector2(-767.8209, -1295.6562),
        },
        minz = 40.0,
        maxz = 50.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [3] = {
        channelId = 3,
        ---- ZONE -----
        name =  "Blackwater Photographer",
        zones = {
            vector2(-808.5270, -1377.5770),
            vector2(-808.5060, -1370.5947),
            vector2(-819.4139, -1378.0740),
            vector2(-819.4861, -1370.9513),
        },
        minz = 40.0,
        maxz = 50.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [4] = {
        channelId = 4,
        ---- ZONE -----
        name =  "Blackwater Stable",
        zones = {
            vector2(-856.0084, -1372.3643),
            vector2(-856.0765, -1359.9563),
            vector2(-880.2509, -1359.3383),
            vector2(-880.7230, -1373.0320),
        },
        minz = 40.0,
        maxz = 50.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [5] = {
        channelId = 5,
        ---- ZONE -----
        name =  "Blackwater Justice",
        zones = {
            vector2(-813.2930, -1202.4773),
            vector2(-783.9316, -1202.5748),
            vector2(-784.0143, -1189.4432),
            vector2(-793.7529, -1189.3654),
            vector2(-793.6125, -1185.0637),
            vector2(-803.2813, -1184.8071),
            vector2(-803.5277, -1189.5594),
            vector2(-813.1824, -1189.5446),
        },
        minz = 40.0,
        maxz = 50.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [6] = {
        channelId = 6,
        ---- ZONE -----
        name =  "Blackwater Doctor",
        zones = {
            vector2(-791.6226, -1308.0348),
            vector2(-791.5994, -1301.2299),
            vector2(-779.8613, -1301.1510),
            vector2(-779.7189, -1308.2266),

        },
        minz = 40.0,
        maxz = 48.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [7] = {
        channelId = 7,
        ---- ZONE -----
        name =  "Blackwater Gun Store",
        zones = {
            vector2(-778.9694, -1300.7947),
            vector2(-778.9902, -1292.6661),
            vector2(-791.8029, -1292.8876),
            vector2(-791.7681, -1300.6725),

        },
        minz = 40.0,
        maxz = 48.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    -- [8] = {
    --     channelId = 8,
    --     ---- ZONE -----
    --     name =  "Blackwater Saloon",
    --     zones = {
    --         vector2(-807.6569, -1327.3511),
    --         vector2(-808.5427, -1311.1704),
    --         vector2(-827.3933, -1311.8400),
    --         vector2(-826.4937, -1328.0920),

    --     },
    --     minz = 42.0,
    --     maxz = 50.0,
    --     debugGrid = false,
    --     gridDivisions = 20,
    -- },
}

local isServer = IsDuplicityVersion()

function Notify(data)
    local text = data.text
    local time = data.time
    local type = data.type
    local dict = data.dict
    local icon = data.icon
    local color = data.color
    local core = Config.Framework
    if isServer then
        local src = data.source
        if core == "RSG" then
            RSGCore.Functions.Notify(src, text, type)
        elseif core == "VORP" then
            if icon then
                TriggerClientEvent('vorp:ShowAdvancedRightNotification', src, text,dict,icon,color,time)            
            else
                -- TriggerClientEvent("vorp:TipBottom",src, text, time, type)
                TriggerClientEvent("vorp:TipRight", src, text, time)
            end
        end
    else
        if core == "RSG" then
            RSGCore.Functions.Notify(text, type)
        elseif core == "VORP" then
            if icon then
                TriggerEvent("vorp:ShowAdvancedRightNotification", text,dict,icon,color,time)
            else
                -- TriggerEvent("vorp:TipBottom", text, time, type)
                TriggerEvent("vorp:TipRight", text, time)
            end
        end
    end
end

function Locale(key,subs)
    local translate = Config.Locale[Config.Language][key] and Config.Locale[Config.Language][key] or "Config.Locale["..Config.Language.."]["..key.."] doesn't exits"
    subs = subs and subs or {}
    for k, v in pairs(subs) do
        local templateToFind = '%${' .. k .. '}'
        translate = translate:gsub(templateToFind, tostring(v))
    end
    return tostring(translate)
end