local QBCore = exports['qb-core']:GetCoreObject()
local deliveryVehicle = nil
local isOnDelivery = false
local currentStore = nil
local deliveryBlip = nil
local totalDeliveries = 3
local completedDeliveries = 0
local isCarryingBox = false
local boxesRequired = 0
local boxesDelivered = 0
local currentBox = nil


function AddTruckTargetZone()
    exports['qb-target']:AddTargetEntity(deliveryVehicle, {
        options = {
            {
                type = "client",
                event = "v-supplychain:client:GrabDeliveryBox",
                icon = "fas fa-box",
                label = "Grab Delivery Box",
                canInteract = function()
                    return not isCarryingBox
                end
            }
        },
        distance = 2.5
    })
end

-- Add delivery point inside store
function CreateStoreDeliveryPoint(store)
    CreateThread(function()
        local storeData = Config.DeliverySystem.Stores[store.id]
        while currentStore and currentStore.id == store.id do
            Wait(0)
            local pos = GetEntityCoords(PlayerPedId())
            local deliveryPoint = vector3(storeData.delivery.x, storeData.delivery.y, storeData.delivery.z)
            local dist = #(pos - deliveryPoint)
            
            if dist < 2.0 then
                if isCarryingBox then
                    DrawText3D(deliveryPoint.x, deliveryPoint.y, deliveryPoint.z, '[E] Deliver Package')
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent('v-supplychain:client:DeliverBox', {store = store.id})
                    end
                else
                    DrawText3D(deliveryPoint.x, deliveryPoint.y, deliveryPoint.z, 'Get box from truck')
                end
            end
        end
    end)
end




RegisterNetEvent('v-supplychain:client:GrabDeliveryBox', function()
    if not isCarryingBox then
        isCarryingBox = true
        
        RequestAnimDict("anim@heists@box_carry@")
        while not HasAnimDictLoaded("anim@heists@box_carry@") do
            Wait(100)
        end
        
        TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
        
        local model = `v_ret_ml_beerbla1`
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(100)
        end
        
        currentBox = CreateObject(model, 0.0, 0.0, 0.0, true, true, true)
        AttachEntityToEntity(currentBox, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57705), 
        0.0,   -- X offset (forward/back)
        0.3,   -- Y offset (left/right)
        0.2,   -- Z offset (up/down)
        0.0,   -- Pitch
        0.0,   -- Roll
        0.0,   -- Yaw
        true, true, false, true, 1, true)

        
        lib.notify({
            title = 'Box Grabbed',
            description = 'Take the box to the marked delivery point',
            type = 'inform',
            duration = 3500
        })
    end
end)



RegisterNetEvent('v-supplychain:client:DeliverBox', function(data)
    if isCarryingBox then
        isCarryingBox = false
        ClearPedTasks(PlayerPedId())
        DeleteObject(currentBox)
        currentBox = nil
        boxesDelivered = boxesDelivered + 1
        
        if boxesDelivered < boxesRequired then
            lib.notify({
                title = 'Box Delivered',
                description = 'Return to truck for next box (' .. boxesDelivered .. '/' .. boxesRequired .. ')',
                type = 'success',
                duration = 3500
            })
        else
            CompleteStoreDelivery(data.store)
        end
    end
end)

-- Modify GetNextStore to add both target zones
function GetNextStore()
    QBCore.Functions.TriggerCallback('v-supplychain:server:GetLowStockStores', function(stores)
        if stores and #stores > 0 then
            currentStore = stores[1]
            boxesRequired = math.random(3, 5)
            boxesDelivered = 0
            CreateDeliveryRoute(currentStore)
            AddTruckTargetZone()
            CreateStoreDeliveryPoint(currentStore)
            
            lib.notify({
                title = 'New Delivery',
                description = 'Exit vehicle and grab ' .. boxesRequired .. ' boxes from the truck',
                type = 'inform',
                duration = 5000
            })
        end
    end)
end

local function SpawnDeliveryVehicle()
    QBCore.Functions.SpawnVehicle('pounder3', function(vehicle)
        deliveryVehicle = vehicle
        local plate = "DLV"..tostring(math.random(1000, 9999))
        
        SetVehicleNumberPlateText(vehicle, plate)
        exports['LegacyFuel']:SetFuel(vehicle, 100.0)
        SetVehicleOnGroundProperly(vehicle)
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
        TriggerEvent('vehiclekeys:client:SetOwner', plate)
        TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
        SetVehicleEngineOn(vehicle, true, true)
        
        lib.notify({
            title = 'Delivery Vehicle',
            description = 'Vehicle ready for deliveries',
            type = 'success',
            duration = 3500
        })
        
        GetNextStore()
    end, vector4(1273.89, -3209.26, 5.9, 89.24), true)
end

function CreateDeliveryRoute(store)
    if deliveryBlip then RemoveBlip(deliveryBlip) end
    
    local storeData = Config.DeliverySystem.Stores[store.id]
    deliveryBlip = AddBlipForCoord(storeData.delivery.x, storeData.delivery.y, storeData.delivery.z)
    SetBlipSprite(deliveryBlip, 501)
    SetBlipDisplay(deliveryBlip, 4)
    SetBlipScale(deliveryBlip, 0.8)
    SetBlipColour(deliveryBlip, 5)
    SetBlipRoute(deliveryBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Delivery Point")
    EndTextCommandSetBlipName(deliveryBlip)

    -- Add marker thread
    CreateThread(function()
        while currentStore and currentStore.id == store.id do
            Wait(0)
            DrawMarker(1, storeData.delivery.x, storeData.delivery.y, storeData.delivery.z - 1.0, 
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
                1.0, 1.0, 1.0, 
                255, 255, 0, 100, 
                false, true, 2, false, nil, nil, false)
        end
    end)
end


function UpdateDeliveryProgress()
    completedDeliveries = completedDeliveries + 1
    lib.notify({
        title = 'Delivery Progress',
        description = 'Completed: ' .. completedDeliveries .. '/' .. totalDeliveries,
        type = 'success'
    })
end

local returnZone = false

function CompleteStoreDelivery(storeId)
    if currentStore and currentStore.id == storeId then
        TriggerServerEvent('v-supplychain:server:RestockStore', storeId)
        exports['qb-target']:RemoveZone("store_delivery_"..storeId)
        
        UpdateDeliveryProgress()
        if deliveryBlip then RemoveBlip(deliveryBlip) end
        
        if completedDeliveries >= totalDeliveries then
            deliveryBlip = AddBlipForCoord(1245.57, -3210.6, 5.85)
            SetBlipSprite(deliveryBlip, 501)
            SetBlipDisplay(deliveryBlip, 4)
            SetBlipScale(deliveryBlip, 0.8)
            SetBlipColour(deliveryBlip, 5)
            SetBlipRoute(deliveryBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Return Truck")
            EndTextCommandSetBlipName(deliveryBlip)
            
            lib.notify({
                title = 'Deliveries Complete',
                description = 'Return the truck to the warehouse',
                type = 'success'
            })
            
            returnZone = true
            CreateThread(function()
                while returnZone do
                    Wait(0)
                    local pos = GetEntityCoords(PlayerPedId())
                    local returnPoint = vector3(1245.57, -3210.6, 5.85)
                    local dist = #(pos - returnPoint)
                    
                    if dist < 5.0 and IsPedInVehicle(PlayerPedId(), deliveryVehicle, true) then
                        DrawText3D(returnPoint.x, returnPoint.y, returnPoint.z, '[E] Return Truck')
                        if IsControlJustPressed(0, 38) then -- E key
                            ReturnTruck()
                        end
                    end
                end
            end)
        else
            GetNextStore()
        end
    end
end

function ReturnTruck()
    if deliveryBlip then RemoveBlip(deliveryBlip) end
    DeleteVehicle(deliveryVehicle)
    isOnDelivery = false
    returnZone = false
    
    lib.notify({
        title = 'Job Complete',
        description = 'Thanks for your work!',
        type = 'success'
    })
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end



function PlayAnimation(ped, dict, anim)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 0, 0, false, false, false)
    RemoveAnimDict(dict)
end

RegisterNetEvent('v-supplychain:client:StartDeliveries', function()
    local Player = QBCore.Functions.GetPlayerData()
    if Player.job.name == "grime" then
        if not isOnDelivery then
            isOnDelivery = true
            completedDeliveries = 0
            SpawnDeliveryVehicle()
        end
    else
        lib.notify({
            title = 'Access Denied',
            description = 'You need to be a Grime employee',
            type = 'error'
        })
    end
end)

RegisterNetEvent('v-supplychain:client:DeliverToStore', function(data)
    CompleteStoreDelivery(data.store)
end)
