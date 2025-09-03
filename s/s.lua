
local playerBucketStack = {}

RegisterNetEvent('fx-channel:changeBucket', function(bucketId, entityList, previousBucket, ledNetId)
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

    if ledNetId and type(ledNetId) == "number" then
        TriggerClientEvent("fx-channel:relead-led-horse", src, ledNetId)
    end
end)


