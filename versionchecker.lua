Citizen.CreateThread(function()
    local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
        PerformHttpRequest("https://raw.githubusercontent.com/Fixitfy/fx-newversioncheckers/refs/heads/Fixitfy/fx-channel.json", function(err, data, headers)
            if err == 200 or  err == 301 or err == 302 then
                local myData = json.decode(data)
                if myData[#myData].version == currentVersion then
                    print("^3[^5"..GetCurrentResourceName().."^3] ^2┌─────────────────────────────┐^0")
                    print("^3[^5"..GetCurrentResourceName().."^3] ^2├ ✅ Version "..currentVersion.." Up to date^0")
                    print("^3[^5"..GetCurrentResourceName().."^3] ^2└─────────────────────────────┘^0")
                else
                    local finded = false
                    local neededUpdate = {}
                    print("^3[^5"..GetCurrentResourceName().."^3] ^1┌──────────────────────────────────────────────────────────────────┐^0")
                    ::printChangelog::
                    for i=1,#myData do
                        if finded then
                            for a=1,#myData[i].changelog do
                                print("^3[^5"..GetCurrentResourceName().."^3] ^1├ ^0Version: "..myData[i].version.." = "..myData[i].changelog[a].." ^0")
                            end
                            for k,v in pairs(myData[i].updateFiles) do
                                neededUpdate[v] = true
                            end
                        end
                        if myData[i].version == currentVersion then
                            finded = true
                        end
                    end

                    if not finded then
                        finded = true
                        goto printChangelog
                    end
                    print("^3[^5"..GetCurrentResourceName().."^3] ^3├ UPDATE FILES ^0")
                    for k,v in pairs(neededUpdate) do
                        print("^3[^5"..GetCurrentResourceName().."^3] ^2├ "..k.."^0")
                    end
                    print("^3[^5"..GetCurrentResourceName().."^3] ^5├──────────────────────────────────────────────────────────────────^0")
                    print("^3[^5"..GetCurrentResourceName().."^3] ^1├ ❌ Version "..currentVersion.." OUTDATED! Please upgarde from keymaster account^0")
                    print("^3[^5"..GetCurrentResourceName().."^3] ^1└──────────────────────────────────────────────────────────────────┘^0")
                end
            else
                print("^3[^5"..GetCurrentResourceName().."^3] ^1┌─────────────────────────────┐^0")
                print("^3[^5"..GetCurrentResourceName().."^3] ^1├ ❌ Failed to establish a connection to Github. Error Code: "..err.."^0")
                print("^3[^5"..GetCurrentResourceName().."^3] ^1└─────────────────────────────┘^0")
            end
    end, "GET", "")
end)