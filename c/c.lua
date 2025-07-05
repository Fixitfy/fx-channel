local zoneid = 0
local currentBucket = 0
local Locations = {}

local function GetGroupAnimalPeds(ped)
    local groupId = GetPedGroupIndex(ped)
    local groupMembers = {}

    for i = 0, 7 do
        local member = GetPedAsGroupMember(groupId, i)
        if DoesEntityExist(member) and not IsPedAPlayer(member) and not IsPedHuman(member) then
            table.insert(groupMembers, member)
        end
    end

    return groupMembers
end

local function GetAllRelatedEntities(ped)
    local entities = {}

    local mount = GetMount(ped)
    if mount ~= 0 and NetworkGetNetworkIdFromEntity(mount) ~= 0 then
        table.insert(entities, NetworkGetNetworkIdFromEntity(mount))
    end

    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 and NetworkGetNetworkIdFromEntity(vehicle) ~= 0 then
        table.insert(entities, NetworkGetNetworkIdFromEntity(vehicle))
    end

    if IsPedLeadingHorse(ped) then
        local ledHorse = GetLastLedMount(ped)
        if ledHorse ~= 0 and NetworkGetNetworkIdFromEntity(ledHorse) ~= 0 then
            table.insert(entities, NetworkGetNetworkIdFromEntity(ledHorse))
        end
    end

    local groupAnimals = GetGroupAnimalPeds(ped)
    for _, animal in ipairs(groupAnimals) do
        if NetworkGetNetworkIdFromEntity(animal) ~= 0 then
            table.insert(entities, NetworkGetNetworkIdFromEntity(animal))
        end
    end

    return entities
end

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
            local playerPed = PlayerPedId()
            if isPointInside then
                zoneid = k
                local bucketId = Config.ChannelZones[k].channelId
                local relatedEntities = GetAllRelatedEntities(playerPed) -- NEW

                for _, netId in ipairs(relatedEntities) do
                    TriggerServerEvent('fx-channel:changeBucket', bucketId, netId, currentBucket)
                end

                currentBucket = bucketId
                if Config.ChannelNotify then
                    Notify({
                        text = Locale('change_channel', {bucketId = bucketId}),
                        time = 4000,
                        type = "success"
                    })
                end
            elseif zoneid == k then
                zoneid = nil
                local relatedEntities = GetAllRelatedEntities(playerPed) -- NEW

                for _, netId in ipairs(relatedEntities) do
                    TriggerServerEvent('fx-channel:resetBucket', netId)
                end

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


RegisterNetEvent('fx-channel:updateBucket', function(bucketId)
    currentBucket = bucketId
    -- print("Client: Updated currentBucket to ", bucketId)
end)