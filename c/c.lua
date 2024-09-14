local zoneid = 0
local currentBucket = nil
local Locations = {}
CreateThread(function()
    for k=1, #Config.ChannelZones do
        Locations[k] = PolyZone:Create(Config.ChannelZones[k].zones, {
            name = "SearchLocation"..k,
            minZ = Config.ChannelZones[k].minz,
            maxZ = Config.ChannelZones[k].maxz,
            debugGrid = Config.ChannelZones[k].debugGrid,
            gridDivisions = Config.ChannelZones[k].gridDivisions,
        })
        Locations[k]:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
            local source = source
            if isPointInside then
                zoneid = k
                local bucketId = Config.ChannelZones[k].channelId
                TriggerServerEvent('fx-channel:changeBucket', bucketId)
                if Config.ChannelNotify then
                    Notify({
                        text = Locale('change_channel', {bucketId = bucketId}),
                        time = 4000,
                        type = "success"
                    })
                end
            elseif zoneid == k then
                zoneid = nil
                TriggerServerEvent('fx-channel:resetBucket') 
                if Config.ChannelNotify then
                    Notify({
                        text = Locale('default_channel'),
                        time = 4000,
                        type = "success"
                    })
                end
            end
        end)
    end
end)