local QBCore = exports['qb-core']:GetCoreObject()
local storeInventory = {}
local lastSelectedStores = {}

-- Initialize store inventories
CreateThread(function()
    for k, v in pairs(Config.DeliverySystem.Stores) do
        storeInventory[k] = {
            stock = 100,
            lastRestock = os.time()
        }
    end
end)

-- Get stores that need restocking
QBCore.Functions.CreateCallback('v-supplychain:server:GetLowStockStores', function(source, cb)
    local randomStores = {}
    local storeList = {}
    
    -- Create list of all stores, excluding recently used ones
    for k, v in pairs(Config.DeliverySystem.Stores) do
        if not lastSelectedStores[k] then
            table.insert(storeList, {
                id = k,
                label = v.label,
                coords = v.coords,
                heading = v.heading
            })
        end
    end
    
    -- Select 3 random stores
    for i = 1, 3 do
        if #storeList > 0 then
            local randomIndex = math.random(1, #storeList)
            local selectedStore = storeList[randomIndex]
            table.insert(randomStores, selectedStore)
            lastSelectedStores[selectedStore.id] = true
            table.remove(storeList, randomIndex)
        end
    end
    
    -- Clear tracking after selection
    lastSelectedStores = {}
    
    cb(randomStores)
end)

-- Handle store restocking
RegisterNetEvent('v-supplychain:server:RestockStore', function(storeId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player.PlayerData.job.name == "grime" then
        if storeInventory[storeId] then
            storeInventory[storeId].stock = 100
            storeInventory[storeId].lastRestock = os.time()
            
            local totalPayment = Config.DeliverySystem.basePayment + Config.DeliverySystem.bonusPayment
            
            Player.Functions.AddMoney('bank', totalPayment)
            TriggerClientEvent('QBCore:Notify', src, 'Store restocked! Payment: $' .. totalPayment, 'success')
        end
    end
end)
