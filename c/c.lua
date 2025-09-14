
local zoneStack = {}
local currentBucket = 0
local Locations = {}

local function GetAllRelatedEntities(ped)
    local entities = {}
    local ledNetId = nil

    local function addSafeNetId(entity)
        if entity and entity ~= 0 and DoesEntityExist(entity) and NetworkGetEntityIsNetworked(entity) then
            local netId = NetworkGetNetworkIdFromEntity(entity)
            if netId and netId ~= 0 then
                entities[#entities+1] = netId
                return netId
            end
        end
        return nil
    end

    addSafeNetId(ped)

    local mount = GetMount(ped)
    if mount and DoesEntityExist(mount) and NetworkGetEntityOwner(mount) == PlayerId() then
        addSafeNetId(mount)
    end

    if IsPedLeadingHorse(ped) then
        local ledMount = GetLastLedMount(ped)
        if ledMount and DoesEntityExist(ledMount) and NetworkGetEntityOwner(ledMount) == PlayerId() then
            ledNetId = addSafeNetId(ledMount)
            TaskStopLeadingHorse(ped) -- Lead'i kes
        end
    end

    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle and DoesEntityExist(vehicle) and NetworkGetEntityOwner(vehicle) == PlayerId() then
        addSafeNetId(vehicle)
    end

    return entities, ledNetId
end



CreateThread(function()
    for k, v in pairs(Config.ChannelZones) do
        Locations[k] = PolyZone:Create(v.zones, {
            name = "SearchLocation" .. k,
            minZ = v.minz,
            maxZ = v.maxz,
            debugGrid = v.debugGrid,
            gridDivisions = v.gridDivisions,
        })

        Locations[k]:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
            local playerPed = PlayerPedId()
            local bucketId = v.channelId
            local relatedEntities, ledNetId = GetAllRelatedEntities(playerPed)

            if isPointInside then
                table.insert(zoneStack, currentBucket)
                -- TriggerEvent("gum_stables:fleeHorseInstant", true)
                -- TriggerEvent("gum_stables:fleeCartInstant", true)
                TriggerServerEvent("fx-channel:changeBucket", bucketId, relatedEntities, currentBucket, ledNetId)

                currentBucket = bucketId

                if Config.ChannelNotify then
                    Notify({
                        text = Locale("change_channel", { bucketId = bucketId }),
                        time = 4000,
                        type = "success"
                    })
                end
            elseif zoneStack[#zoneStack] and currentBucket == bucketId then
                currentBucket = table.remove(zoneStack)
                -- TriggerEvent("gum_stables:fleeHorseInstant", true)
                -- TriggerEvent("gum_stables:fleeCartInstant", true)
                TriggerServerEvent("fx-channel:changeBucket", currentBucket, relatedEntities, bucketId, ledNetId)

                if Config.ChannelNotify then
                    Notify({
                        text = Locale("change_channel", { bucketId = currentBucket }),
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

RegisterNetEvent('fx-channel:relead-led-horse', function(ledNetId)
    local ped = PlayerPedId()
    if not ledNetId then return end
    local horse = NetworkGetEntityFromNetworkId(ledNetId)
    if not DoesEntityExist(horse) then return end
    TaskLeadHorse(ped, horse)
end)
