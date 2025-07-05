local playerPreviousBuckets = {}

RegisterNetEvent('fx-channel:changeBucket', function(bucketId, entityList, previousBucket)
    local src = source
    playerPreviousBuckets[src] = previousBucket or 0

    SetPlayerRoutingBucket(src, tonumber(bucketId))
    currentBucket = bucketId

    if type(entityList) == "table" then
        for _, netId in pairs(entityList) do
            local entity = NetworkGetEntityFromNetworkId(netId)
            if entity and DoesEntityExist(entity) then
                SetEntityRoutingBucket(entity, tonumber(bucketId))
            end
        end
    end

    TriggerClientEvent('fx-channel:updateBucket', src, bucketId)
end)

RegisterNetEvent('fx-channel:resetBucket', function(entityList)
    local src = source
    local restoreBucket = playerPreviousBuckets[src] or 0

    SetPlayerRoutingBucket(src, tonumber(restoreBucket))
    currentBucket = restoreBucket

    if type(entityList) == "table" then
        for _, netId in pairs(entityList) do
            local entity = NetworkGetEntityFromNetworkId(netId)
            if entity and DoesEntityExist(entity) then
                SetEntityRoutingBucket(entity, tonumber(restoreBucket))
            end
        end
    end

    TriggerClientEvent('fx-channel:updateBucket', src, restoreBucket)
    playerPreviousBuckets[src] = nil
end)

RegisterNetEvent('fx-channel:updateBucket', function(bucketId)
    currentBucket = bucketId
end)
