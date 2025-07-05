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
        name =  "Blackwater Photographer",
        zones = {
            vector2(-809.3248, -1376.7449),
            vector2(-818.4514, -1377.4347),
            vector2(-818.3472, -1371.2006),
            vector2(-810.0699, -1371.5941),
        },
        minz = 40.0,
        maxz = 50.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [2] = {
        channelId = 2,
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
    --saint denis
    [3] = {
        channelId = 3,
        ---- ZONE -----
        name =  "Saint Klamotten",
        zones = {
            vector2(2547.2205, -1173.3087),
            vector2(2559.1748, -1173.5138),
            vector2(2559.8992, -1155.4806),
            vector2(2547.1602, -1155.2102),

        },
        minz = 40.0,
        maxz = 60.0,
        debugGrid = false,
        gridDivisions = 20,
    },    
    [4] = {
        channelId = 4,
        ---- ZONE -----
        name =  "Saint Kirche",
        zones = {
            vector2(2735.4082, -1272.9368),
            vector2(2748.0164, -1256.0757),
            vector2(2768.8064, -1271.3762),
            vector2(2756.0134, -1285.7622),

        },
        minz = 40.0,
        maxz = 60.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [5] = {
        channelId = 5,
        ---- ZONE -----
        name =  "Saint Theater",
        zones = {
            vector2(2533.1011, -1275.1228),
            vector2(2532.9636, -1315.3376),
            vector2(2564.2563, -1314.9877),
            vector2(2562.1323, -1274.3236),

        },
        minz = 40.0,
        maxz = 60.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [6] = {
        channelId = 6,
        ---- ZONE -----
        name =  "Saint Pub",
        zones = {
            vector2(2802.0444, -1178.3547),
            vector2(2781.4614, -1166.8154),
            vector2(2786.6855, -1157.7345),
            vector2(2793.6902, -1162.3320),
            vector2(2796.5002, -1159.7537),
            vector2(2806.7205, -1165.9081),

        },
        minz = 40.0,
        maxz = 60.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [7] = {
        channelId = 7,
        ---- ZONE -----
        name =  "Saint Tabak",
        zones = {
            vector2(2677.3369, -1397.4232),
            vector2(2661.9497, -1379.7019),
            vector2(2648.6301, -1391.0032),
            vector2(2653.4045, -1404.6588),
            vector2(2650.3599, -1406.4303),
            vector2(2653.5032, -1411.7881),
            vector2(2677.0103, -1400.0635),

        },
        minz = 40.0,
        maxz = 62.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [8] = {
        channelId = 8,
        ---- ZONE -----
        name =  "Half Map",
        zones = {
            vector2(-313.4684, -2371.4988),
            vector2(-605.2681, -717.5277),
            vector2(-785.6693, -366.9247),
            vector2(-449.2942, -114.9248),
            vector2(-397.3019, 85.3356),
            vector2(-515.8019, 197.4606),
            vector2(-771.8619, 96.3907),
            vector2(-819.8620, 20.2657),
            vector2(-992.0204, -75.4048),
            vector2(-1179.8958, 27.7202),
            vector2(-1173.5209, 272.9702),
            vector2(-932.0209, 559.8452),
            vector2(-745.6750, 584.0767),
            vector2(-727.3000, 692.0767),
            vector2(-687.5500, 712.3268),
            vector2(-621.1754, 905.8268),
            vector2(-531.1755, 912.5769),
            vector2(-475.6756, 1056.9521),
            vector2(-398.4255, 1084.7023),
            vector2(-286.6755, 1168.3273),
            vector2(-246.5506, 1403.8274),
            vector2(-87.5506, 1434.9526),
            vector2(-33.9256, 1549.7028),
            vector2(277.3244, 1533.2029),
            vector2(431.4494, 1688.4529),
            vector2(535.3322, 1796.9711),
            vector2(895.2491, 3331.9241),
            vector2(5030.0000, 3226.0000),
            vector2(4472.0005, -3746.0007),
            vector2(-492.9998, -3871.0005),

        },
        minz = 1.0,
        maxz = 750.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [9] = {
        channelId = 9,
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
}

if Config.Framework == "VORP" then
    --
elseif Config.Framework == "RSG" then
    RSGCore = exports['rsg-core']:GetCoreObject()
end

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
