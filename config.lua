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
    
    --- ######################################################## BLACKWATER ########################################################
    [1] = {
        channelId = 1,
        ---- ZONE -----
        name =  "BW DOJ",
        zones = {
            vector2(-793.7518, -1189.4332),
            vector2(-793.5421, -1184.6130),
            vector2(-803.6798, -1184.5688),
            vector2(-803.4767, -1189.5430),
            vector2(-813.6775, -1189.3503),
            vector2(-813.8153, -1202.2516),
            vector2(-783.3101, -1202.0801),
            vector2(-783.4042, -1189.3440),
        },
        minz = 42.2,
        maxz = 49.8,
        debugGrid = false,
        gridDivisions = 20,
    },
    [2] = {
        channelId = 2,
        ---- ZONE -----
        name =  "Blackwater Jail",
        zones = {
            vector2(-768.6991, -1262.2108),
            vector2(-756.4689, -1262.5431),
            vector2(-756.3418, -1281.2461),
            vector2(-759.7634, -1281.7457),
            vector2(-759.8528, -1287.1660),
            vector2(-760.7088, -1287.0592),
            vector2(-760.9686, -1285.3776),
            vector2(-762.9885, -1284.6145),
            vector2(-762.8417, -1283.2529),
            vector2(-768.6835, -1282.6462),
            vector2(-768.6835, -1282.6462),
        },
        minz = 37.0,
        maxz = 41.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [3] = {
        channelId = 3,
        ---- ZONE -----
        name =  "BW SHERIFF SECOND",
        zones = {
            vector2(-769.01, -1281.62),
            vector2(-769.14, -1260.22),
            vector2(-754.98, -1260.24),
            vector2(-755.02, -1269.29),
            vector2(-754.90, -1287.38),
            vector2(-761.23, -1287.33),
            vector2(-763.16, -1287.35),
            vector2(-763.25, -1284.76),
            vector2(-767.25, -1284.57),
            vector2(-767.42, -1281.58),
        },
        minz = 47.9,
        maxz = 51.8,
        debugGrid = false,
        gridDivisions = 20,
    },
    [4] = {
        channelId = 4,
        ---- ZONE -----
        name =  "BW SHERIFF THIRD",
        zones = {
            vector2(-761.45, -1286.09),
            vector2(-763.23, -1286.09),
            vector2(-763.21, -1283.08),
            vector2(-768.10, -1282.92),
            vector2(-768.13, -1268.90),
            vector2(-768.15, -1261.67),
            vector2(-756.01, -1261.68),
            vector2(-756.02, -1268.44),
            vector2(-756.06, -1286.10),
        },
        minz = 51.9,
        maxz = 58.8,
        debugGrid = false,
        gridDivisions = 20,
    },
	[5] = {
        channelId = 5,
        ---- ZONE -----
        name =  "Blackwater Fotografci",
        zones = {
            vector2(-810.3070, -1376.2147),
            vector2(-810.0906, -1372.3304),
            vector2(-817.0870, -1371.7124),
            vector2(-816.9147, -1376.4404),
        },
        minz = 40.0,
        maxz = 50.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [6] = {
        channelId = 6,
        ---- ZONE -----
        name =  "Blackwater Berber",
        zones = {
            vector2(-811.4225, -1369.6179),
            vector2(-811.0303, -1364.8397),
            vector2(-816.7480, -1364.5687),
            vector2(-816.6864, -1369.4318),
        },
        minz = 40.0,
        maxz = 50.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [7] = {
        channelId = 7,
        ---- ZONE -----
        name =  "BW KIYAFETCI",
        zones = {
            vector2(-757.55, -1290.12),
            vector2(-757.65, -1295.29),
            vector2(-768.75, -1295.97),
            vector2(-768.18, -1289.54),
        },
        minz = 42.9,
        maxz = 47.1,
        debugGrid = false,
        gridDivisions = 20,
    },
    [8] = {
        channelId = 8,
        ---- ZONE -----
        name =  "BW BANKA",
        zones = {
            vector2(-822.02, -1279.94),
            vector2(-821.44, -1275.62),
            vector2(-817.60, -1272.45),
            vector2(-809.37, -1272.43),
            vector2(-809.36, -1279.97),
        },
        minz = 42.9,
        maxz = 47.8,
        debugGrid = false,
        gridDivisions = 20,
    },
    [9] = {
        channelId = 9,
        ---- ZONE -----
        name =  "BW GUNSMITH",
        zones = {
            vector2(-790.40, -1300.52),
            vector2(-790.34, -1293.09),
            vector2(-779.73, -1293.10),
            vector2(-779.73, -1300.44),
        },
        minz = 42.9,
        maxz = 49.8,
        debugGrid = false,
        gridDivisions = 20,
    },
    [10] = {
        channelId = 10,
        ---- ZONE -----
        name =  "BW TOBACCO",
        zones = {
            vector2(-789.92, -1316.73),
            vector2(-789.91, -1310.06),
            vector2(-776.16, -1310.06),
            vector2(-776.11, -1316.76),
        },
        minz = 42.2,
        maxz = 50.9,
        debugGrid = false,
        gridDivisions = 20,
    },
    [11] = {
        channelId = 11,
        ---- ZONE -----
        name =  "BW ALETCI",
        zones = {
            vector2(-856.98, -1275.84),
            vector2(-857.09, -1282.91),
            vector2(-862.32, -1282.78),
            vector2(-862.19, -1275.77),
        },
        minz = 42.2,
        maxz = 46.2,
        debugGrid = false,
        gridDivisions = 20,
    },
    [12] = {
        channelId = 12,
        ---- ZONE -----
        name =  "BW POSTANE",
        zones = {
            vector2(-870.93, -1326.11),
            vector2(-870.81, -1339.48),
            vector2(-879.14, -1339.46),
            vector2(-879.25, -1326.12),
        },
        minz = 42.2,
        maxz = 46.2,
        debugGrid = false,
        gridDivisions = 20,
    },
    [13] = {
        channelId = 13,
        ---- ZONE -----
        name =  "BW SALOON",
        zones = {
            vector2(-810.91, -1312.09),
            vector2(-810.67, -1313.76),
            vector2(-808.73, -1314.73),
            vector2(-808.72, -1316.87),
            vector2(-810.56, -1317.77),
            vector2(-810.59, -1321.44),
            vector2(-808.71, -1322.34),
            vector2(-808.68, -1327.39),
            vector2(-812.98, -1327.35),
            vector2(-824.84, -1327.29),
            vector2(-826.44, -1325.54),
            vector2(-826.50, -1316.81),
            vector2(-826.52, -1311.95),
        },
        minz = 42.2,
        maxz = 51.0,
        debugGrid = false,
        gridDivisions = 20,
    },

        --- ######################################################## BLACKWATER ########################################################
    [14] = {
        channelId = 14,
        ---- ZONE -----
        name =  "VAL HOTEL",
        zones = {
            vector2(-330.5794, 775.8027), 
            vector2(-322.5921, 777.1447), 
            vector2(-319.4900, 759.4293), 
            vector2(-327.2884, 758.0870), 
        },
        minz = 116.2,
        maxz = 124.0,
        debugGrid = false,
        gridDivisions = 20,
    },
    [15] = {
        channelId = 15,
        ---- ZONE -----
        name =  "VAL BANK",
        zones = {
            vector2(-312.7282, 778.8471),  
            vector2(-303.1324, 780.5272), 
            vector2(-300.0811, 763.4176), 
            vector2(-309.7468, 761.7251), 
            vector2(-311.2007, 770.3193),  
        },
        minz = 116.2,
        maxz = 122.5,
        debugGrid = false,
        gridDivisions = 20,
    },
    [16] = {
        channelId = 16,
        ---- ZONE -----
        name =  "VAL GUNSMITH",
        zones = {
            vector2(-284.0569, 784.1716),   
            vector2(-275.6694, 784.2592), 
            vector2(-275.6883, 776.6845), 
            vector2(-284.1159, 776.6639),  
        },
        minz = 117.2,
        maxz = 121.5,
        debugGrid = false,
        gridDivisions = 20,
    },
    [17] = {
        channelId = 17,
        ---- ZONE -----
        name =  "VAL SALOON1",
        zones = {
            vector2(-302.1380, 799.7424),   
            vector2(-303.1434, 798.3539), 
            vector2(-304.3751, 798.1271), 
            vector2(-305.7527, 799.0585),  
            vector2(-309.4555, 798.3721),  
            vector2(-310.4323, 797.0394),  
            vector2(-311.7703, 796.8748),  
            vector2(-313.1121, 797.7944),  
            vector2(-316.8257, 818.3286),  
            vector2(-305.6674, 820.3685),  
        },
        minz = 117.2,
        maxz = 123.5,
        debugGrid = false,
        gridDivisions = 20,
    },
    [18] = {
        channelId = 18,
        ---- ZONE -----
        name =  "VAL DOCTOR",
        zones = {
            vector2(-280.7722, 804.0355),   
            vector2(-289.5334, 802.2143), 
            vector2(-293.1540, 819.1676), 
            vector2(-284.3874, 821.0707),  
            vector2(-282.6031, 813.4293),  
            vector2(-281.1619, 806.1245),   
        },
        minz = 117.2,
        maxz = 123.5,
        debugGrid = false,
        gridDivisions = 20,
    },
    [19] = {
        channelId = 19,
        ---- ZONE -----
        name =  "VAL SHERIFF JAIL",  --14
        zones = {
            vector2(-278.0941, 823.7146),    
            vector2(-279.5259, 823.4863),  
            vector2(-279.9025, 825.0859),  
            vector2(-282.2186, 824.5839),  
            vector2(-281.4183, 820.6442),  
            vector2(-292.9935, 818.4602),   
            vector2(-291.5888, 811.2413),   
            vector2(-280.2968, 813.5415),   
            vector2(-280.1833, 813.1903),   
            vector2(-281.8276, 812.9606),   
            vector2(-280.8823, 808.2195),   
            vector2(-274.4610, 809.5215),   
            vector2(-275.3652, 814.1624),   
            vector2(-276.2094, 813.9935),       
            vector2(-276.2985, 814.3530),       
            vector2(-271.8174, 815.2518),       
            vector2(-273.2112, 822.1843),       
            vector2(-277.2705, 821.3389),       
            vector2(-277.5476, 821.2280),              
        },
        minz = 108.8,
        maxz = 111.5,
        debugGrid = false,
        gridDivisions = 20,
    },
    -- [20] = {
    --     channelId = 20,
    --     ---- ZONE -----
    --     name =  "TEST BUCKET",  --14
    --     zones = {
    --         vector2(-839.2841, -1328.5250),    
    --         vector2(-846.1611, -1328.5491),  
    --         vector2(-846.1537, -1339.0526),  
    --         vector2(-838.5189, -1339.6268),              
    --     },
    --     minz = 40.0,
    --     maxz = 50.0,
    --     debugGrid = true,
    --     gridDivisions = 20,
    -- },
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
