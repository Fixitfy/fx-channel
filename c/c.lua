
local zoneStack = {}
local currentBucket = 0
local Locations = {}

local function GetAllRelatedEntities(ped)
    local entities = {}

    local function getSafeNetId(entity)
        if DoesEntityExist(entity) and NetworkGetEntityIsNetworked(entity) then
            local netId = NetworkGetNetworkIdFromEntity(entity)
            if netId and netId ~= 0 then
                return netId
            end
        end
        return nil
    end

    local playerNetId = getSafeNetId(ped)
    if playerNetId then table.insert(entities, playerNetId) end

    local mount = GetMount(ped)
    local mountNetId = getSafeNetId(mount)
    if mountNetId then table.insert(entities, mountNetId) end

    local vehicle = GetVehiclePedIsIn(ped, false)
    local vehicleNetId = getSafeNetId(vehicle)
    if vehicleNetId then
        table.insert(entities, vehicleNetId)
        for seat = -1, 5 do
            local wagonPed = GetPedInVehicleSeat(vehicle, seat)
            local wagonNetId = getSafeNetId(wagonPed)
            if wagonNetId then
                table.insert(entities, wagonNetId)
            end
        end
    end

    if IsPedLeadingHorse(ped) then
        local ledMount = GetLastLedMount(ped)
        local ledNetId = getSafeNetId(ledMount)
        if ledNetId then table.insert(entities, ledNetId) end
    end

    local groupIndex = GetPedGroupIndex(ped)
    for i = 0, 7 do
        local member = GetPedAsGroupMember(groupIndex, i)
        if DoesEntityExist(member) and not IsPedAPlayer(member) then
            local memberNetId = getSafeNetId(member)
            if memberNetId then
                table.insert(entities, memberNetId)
            end
        end
    end

    local playerCoords = GetEntityCoords(ped)
    local allPeds = GetGamePool("CPed")
    for _, otherPed in ipairs(allPeds) do
        if DoesEntityExist(otherPed)
            and not IsPedAPlayer(otherPed)
            and NetworkGetEntityIsNetworked(otherPed)
            and Vdist(GetEntityCoords(otherPed), playerCoords) < 200.0
        then
            local npcNetId = NetworkGetNetworkIdFromEntity(otherPed)
            if npcNetId and npcNetId ~= 0 then
                table.insert(entities, npcNetId)
            end
        end
    end

    return entities
end

CreateThread(function()
    for k = 1, #Config.ChannelZones do
        Locations[k] = PolyZone:Create(Config.ChannelZones[k].zones, {
            name = "SearchLocation" .. k,
            minZ = Config.ChannelZones[k].minz,
            maxZ = Config.ChannelZones[k].maxz,
            debugGrid = Config.ChannelZones[k].debugGrid,
            gridDivisions = Config.ChannelZones[k].gridDivisions,
        })

        Locations[k]:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
            local playerPed = PlayerPedId()
            local bucketId = Config.ChannelZones[k].channelId
            local relatedEntities = GetAllRelatedEntities(playerPed)

            if isPointInside then
                table.insert(zoneStack, currentBucket)
                TriggerServerEvent('fx-channel:changeBucket', bucketId, relatedEntities, currentBucket)
                currentBucket = bucketId

                if Config.ChannelNotify then
                    Notify({
                        text = Locale('change_channel', { bucketId = bucketId }),
                        time = 4000,
                        type = "success"
                    })
                end
            elseif zoneStack[#zoneStack] and currentBucket == bucketId then
                currentBucket = table.remove(zoneStack)
                TriggerServerEvent('fx-channel:changeBucket', currentBucket, relatedEntities, bucketId)

                if Config.ChannelNotify then
                    Notify({
                        text = Locale('change_channel', { bucketId = currentBucket }),
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
end)
