
local playerBucketStack = {}

RegisterNetEvent('fx-channel:changeBucket', function(bucketId, entityList, previousBucket)
    local src = source

    if not playerBucketStack[src] then
        playerBucketStack[src] = {}
    end
    table.insert(playerBucketStack[src], bucketId)

    SetPlayerRoutingBucket(src, tonumber(bucketId))

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

    if not playerBucketStack[src] or #playerBucketStack[src] == 0 then
        return
    end

    table.remove(playerBucketStack[src])

    local restoreBucket = playerBucketStack[src][#playerBucketStack[src]] or 0

    SetPlayerRoutingBucket(src, tonumber(restoreBucket))

    if type(entityList) == "table" then
        for _, netId in pairs(entityList) do
            local entity = NetworkGetEntityFromNetworkId(netId)
            if entity and DoesEntityExist(entity) then
                SetEntityRoutingBucket(entity, tonumber(restoreBucket))
            end
        end
    end

    TriggerClientEvent('fx-channel:updateBucket', src, restoreBucket)

    if #playerBucketStack[src] == 0 then
        playerBucketStack[src] = nil
    end
end)

RegisterNetEvent('fx-channel:updateBucket', function(bucketId)
    -- Client update, no server-side tracking needed anymore
end)
