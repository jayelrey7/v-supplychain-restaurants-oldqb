local inDeliveryZone = false

CreateThread(function()
    -- Spawn warehouse manager NPC
    local model = `s_m_y_dockwork_01`
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    
    local warehouseManager = CreatePed(4, model, 1238.47, -3198.99, 4.53, 16.09, false, true)
    SetEntityHeading(warehouseManager, 16.09)
    FreezeEntityPosition(warehouseManager, true)
    SetEntityInvincible(warehouseManager, true)
    SetBlockingOfNonTemporaryEvents(warehouseManager, true)
    
    -- Play clipboard animation
    RequestAnimDict("missheistdockssetup1clipboard@base")
    while not HasAnimDictLoaded("missheistdockssetup1clipboard@base") do
        Wait(0)
    end
    TaskPlayAnim(warehouseManager, "missheistdockssetup1clipboard@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)

    -- Warehouse management point with qb-target
    exports['qb-target']:AddBoxZone("warehouse_management", 
        vector3(1238.47, -3198.99, 5.53), 
        4.0, 4.0, {
            name = "warehouse_management",
            heading = 180.0,
            debugPoly = false,
            minZ = 4.0,
            maxZ = 8.0,
        }, {
            options = {
                {
                    type = "client",
                    event = "v-supplychain:client:StartDeliveries",
                    icon = "fas fa-truck",
                    label = "Start Deliveries",
                    job = "grime"
                }
            },
            distance = 5.0
    })

    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)
        local dist = #(pos - vector3(1238.47, -3198.99, 5.53))
        
        DrawMarker(2, 1238.47, -3198.99, 5.53, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 155, false, true, 2, false, nil, nil, false)
        
        if dist < 10.0 then
            if not inDeliveryZone then
                inDeliveryZone = true
                lib.notify({
                    title = 'Warehouse Management',
                    description = 'Use Target to access delivery management',
                    type = 'info',
                    duration = 3500
                })
            end
        else
            inDeliveryZone = false
        end
    end
end)

