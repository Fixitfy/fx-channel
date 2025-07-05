local playerPreviousBuckets = {} 

RegisterNetEvent('fx-channel:changeBucket', function(bucketId, entityId, previousBucket)
    local src = source
    playerPreviousBuckets[src] = previousBucket or 0

    SetPlayerRoutingBucket(src, tonumber(bucketId))
    currentBucket = bucketId

    local entity = nil
    if entityId and DoesEntityExist(NetworkGetEntityFromNetworkId(entityId)) then
        entity = NetworkGetEntityFromNetworkId(entityId)
    end

    if entity and DoesEntityExist(entity) then
        SetEntityRoutingBucket(entity, tonumber(bucketId))
    end

    TriggerClientEvent('fx-channel:updateBucket', src, bucketId)
end)

RegisterNetEvent('fx-channel:resetBucket', function(entityId)
    local src = source
    local restoreBucket = playerPreviousBuckets[src] or 0

    SetPlayerRoutingBucket(src, tonumber(restoreBucket))
    currentBucket = restoreBucket

    local entity = nil
    if entityId and DoesEntityExist(NetworkGetEntityFromNetworkId(entityId)) then
        entity = NetworkGetEntityFromNetworkId(entityId)
    end

    if entity and DoesEntityExist(entity) then
        SetEntityRoutingBucket(entity, tonumber(restoreBucket))
    end

    TriggerClientEvent('fx-channel:updateBucket', src, restoreBucket)

    playerPreviousBuckets[src] = nil
end)

RegisterNetEvent('fx-channel:updateBucket', function(bucketId)
    currentBucket = bucketId
end)