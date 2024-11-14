local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    if not Businesses.Businesses or type(Businesses.Businesses) ~= "table" then
        print("Error: Businesses.Businesses is not a valid table.")
        return
    end

    for job, details in pairs(Businesses.Businesses) do
        if not details.trays or type(details.trays) ~= "table" then
            print("Warning: 'trays' for job '" .. job .. "' is not a valid table.")
            details.trays = {}
        end

        if not details.storage or type(details.storage) ~= "table" then
            print("Warning: 'storage' for job '" .. job .. "' is not a valid table.")
            details.storage = {}
        end

        for trayIndex, _ in pairs(details.trays) do
            local trayId = "order-tray-" .. job .. '-' .. trayIndex
            local trayLabel = "Order Tray - " .. details.jobDisplay .. " - " .. trayIndex
            TriggerEvent('qb-inventory:server:CreateStash', trayId, trayLabel, 10, 50000)
        end

        for storageIndex, storageDetails in pairs(details.storage) do
            local storageId = "storage-" .. job .. '-' .. storageIndex
            local storageLabel = "Storage - " .. details.jobDisplay .. ' - ' .. storageIndex
            local slots = storageDetails.inventory.slots or 6
            local weight = (storageDetails.inventory.weight or 10) * 1000
            TriggerEvent('qb-inventory:server:CreateStash', storageId, storageLabel, slots, weight)
        end
    end
end)

RegisterServerEvent('v-businesses:GiveItem', function(info)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local iteminfo = info.iteminfo
    local quantity = info.quantity or 1

    if not iteminfo or not iteminfo.requiredItems then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Invalid item info.",
            type = "error",
            duration = 3000,
            position = "top-left"
        })
        return
    end

    if type(iteminfo.requiredItems) ~= "table" then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Required items info is not a valid table.",
            type = "error",
            duration = 3000,
            position = "top-left"
        })
        return
    end

    for _, reqItem in pairs(iteminfo.requiredItems) do
        local playerItem = Player.Functions.GetItemByName(reqItem.item)
        if not playerItem or playerItem.amount < reqItem.amount * quantity then
            TriggerClientEvent('ox_lib:notify', src, {
                title = "Insufficient required items to craft this item.",
                type = "error",
                duration = 3000,
                position = "top-left"
            })
            return
        end
    end

    for _, reqItem in pairs(iteminfo.requiredItems) do
        Player.Functions.RemoveItem(reqItem.item, reqItem.amount * quantity)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reqItem.item], "remove")
    end

    Player.Functions.AddItem(iteminfo.item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[iteminfo.item], "add")

    TriggerClientEvent('ox_lib:notify', src, {
        title = "Item crafted successfully!",
        type = "success",
        duration = 3000,
        position = "top-left"
    })
end)

