
RegisterNetEvent('fx-channel:changeBucket', function(bucketId)
    local src = source
    SetPlayerRoutingBucket(src, tonumber(bucketId))
    currentBucket = bucketId
end)

RegisterNetEvent('fx-channel:resetBucket', function()
    local src = source
    SetPlayerRoutingBucket(src, 0)
    currentBucket = 0
end)