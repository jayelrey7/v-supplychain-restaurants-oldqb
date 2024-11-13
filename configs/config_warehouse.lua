Config = {}

/*

░██╗░░░░░░░██╗░█████╗░██████╗░███████╗██╗░░██╗░█████╗░██╗░░░██╗░██████╗███████╗
░██║░░██╗░░██║██╔══██╗██╔══██╗██╔════╝██║░░██║██╔══██╗██║░░░██║██╔════╝██╔════╝
░╚██╗████╗██╔╝███████║██████╔╝█████╗░░███████║██║░░██║██║░░░██║╚█████╗░█████╗░░
░░████╔═████║░██╔══██║██╔══██╗██╔══╝░░██╔══██║██║░░██║██║░░░██║░╚═══██╗██╔══╝░░
░░╚██╔╝░╚██╔╝░██║░░██║██║░░██║███████╗██║░░██║╚█████╔╝╚██████╔╝██████╔╝███████╗
░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝░╚════╝░░╚═════╝░╚═════╝░╚══════╝
*/

Config.Core = 'qbcore' -- qbcore or qbox
Config.Inventory = 'qb' -- ox. maybe qb in the future, will not work now
Config.Target = 'qb' -- qb or ox
Config.Progress = 'ox' -- its ox get fucked
Config.Notify = 'ox' -- its ox get fucked
Config.Menu = 'ox' -- its ox get fucked

-- Restaurant Configuration
Config.Restaurants = {
    [1] = {
        name = "Stop Car Performance",
        job = "tuning",
        position = vector3(2719.33, 3491.42, 55.73), -- Adjust as needed
        delivery = vector3(2742.79, 3442.65, 56.25),
        deliveryFoot = vector3(2747.72, 3464.14, 54.73),
        heading = 64.59
    },
    [2] = {
        name = "Snap Off Tools and Logistics",
        job = "snapoff",
        position = vector3(1209.99, -3158.46, 5.53), -- Adjust as needed
        delivery = vector3(1246.68, -3162.5, 5.66),
        deliveryFoot = vector3(1240.62, -3161.8, 7.1),
        heading = 106.5
    },
    -- add more here
}

-- Add warehouse locations, idk why youd use more than one
Config.WarehousesLocation = {
    {
        position = vector3(1241.00, -3115.76, 4.52),
        heading = 91.52,
        pedhash = 's_m_y_construct_02',
    } 
}

-- Warehouse Configuration
Config.Warehouses = {
    {
        forkliftPosition = vector3(1225.97, -3188.33, 5.52),
        pallets = {
            vector3(1220.43, -3188.02, 4.52),
            vector3(1219.50, -3182.24, 4.52),
            vector3(1221.62, -3195.49, 4.52)
        },
        deliveryMarker = { -- Delivery marker for Warehouse 1
            position = vector3(1238.0282, -3155.8708, 6.0997),
            radius = 4.0
        },
        --truck = {
        --    model = 'W900',
        --    position = vector4(1290.1298, -3134.9062, 5.9064, 358.0195) -- Adjust as needed
        --},
        trailer = {
            model = 'pounder2',
            position = vector4(1289.5369, -3153.1648, 5.9064, 359.3230) -- Adjust as needed
        }
    },
    {
        forkliftPosition = vector3(1226.6061, -3130.2217, 5.5277),
        pallets = {
            vector3(1221.4413, -3133.3848, 4.5277),
            vector3(1221.3192, -3129.9758, 4.5277),
            vector3(1218.3257, -3131.8977, 4.5277)
        },
        deliveryMarker = { -- Delivery marker for Warehouse 2
            position = vector3(1237.7931, -3135.7043, 6.0997), -- Example position for Warehouse 2 delivery
            radius = 7.0
        },
        --truck = {
        --    model = 'W900',
        --    position = vector4(1290.1298, -3134.9062, 5.9064, 358.0195) -- Adjust as needed
        --},
        trailer = {
            model = 'pounder2',
            position = vector4(1289.5369, -3153.1648, 5.9064, 359.3230) -- Adjust as needed
        }
    }
    -- Add more warehouses as needed
}

Config.maxBoxes = math.random(5,8) -- Max amount of boxes the player has to drag inside, you can easily make it a math.random - example: Config.maxBoxes = math.random(3,5)

-- Items Configuration for Each Restaurant - ORDERING
Config.Items = {
    ["snapoff"] = {
        --[[["nos"] = {name = "Nos", price = 500},
        ["noscolour"] = {name = "Nos Colour", price = 500},
        ["mechanic_tools"] = {name = "Mechanic Tools", price = 250},
        ["sparetire"] = {name = "Spare Tire", price = 0},
        ["axleparts"] = {name = "Axle Parts", price = 0},
        ["carbattery"] = {name = "Car Battery", price = 0},
        ["sparkplugs"] = {name = "Spark Plugs", price = 0},
        ["newoil"] = {name = "New Oil", price = 0},
        ["toolbox"] = {name = "Toolbox", price = 350},
        ["ducttape"] = {name = "Duct Tape", price = 100},
        ["paintcan"] = {name = "Paint Can", price = 250},
        ["tint_supplies"] = {name = "Tint Supplies", price = 0},
        ["underglow_controller"] = {name = "Underglow Controller", price = 0},
        ["cleaningkit"] = {name = "Cleaning Kit", price = 0},
        ["turbo"] = {name = "Turbo", price = 100},
        ["engine1"] = {name = "Engine 1", price = 1000},
        ["engine2"] = {name = "Engine 2", price = 2000},
        ["engine3"] = {name = "Engine 3", price = 3000},
        ["engine4"] = {name = "Engine 4", price = 4000},
        ["engine5"] = {name = "Engine 5", price = 5000},
        ["transmission1"] = {name = "Transmission 1", price = 1000},
        ["transmission2"] = {name = "Transmission 2", price = 2000},
        ["transmission3"] = {name = "Transmission 3", price = 3000},
        ["transmission4"] = {name = "Transmission 4", price = 4000},
        ["brakes1"] = {name = "Brakes 1", price = 250},
        ["brakes2"] = {name = "Brakes 2", price = 500},
        ["brakes3"] = {name = "Brakes 3", price = 750},
        ["car_armor"] = {name = "Car Armor", price = 10000},
        ["suspension1"] = {name = "Suspension 1", price = 250},
        ["suspension2"] = {name = "Suspension 2", price = 500},
        ["suspension3"] = {name = "Suspension 3", price = 750},
        ["suspension4"] = {name = "Suspension 4", price = 1000},
        ["suspension5"] = {name = "Suspension 5", price = 1250},
        ["airsuspension"] = {name = "Air Suspension", price = 6500},
        ["suspensionremover"] = {name = "Suspension Remover", price = 250},
        ["bprooftires"] = {name = "Bulletproof Tires", price = 20000},
        ["drifttires"] = {name = "Drift Tires", price = 5000},
        ["oilp1"] = {name = "Oil P1", price = 250},
        ["oilp2"] = {name = "Oil P2", price = 500},
        ["oilp3"] = {name = "Oil P3", price = 750},
        ["drives1"] = {name = "Driveshaft 1", price = 250},
        ["drives2"] = {name = "Driveshaft 2", price = 500},
        ["drives3"] = {name = "Driveshaft 3", price = 750},
        ["cylind1"] = {name = "Cylinder 1", price = 250},
        ["cylind2"] = {name = "Cylinder 2", price = 500},
        ["cylind3"] = {name = "Cylinder 3", price = 750},
        ["cables1"] = {name = "Cables 1", price = 250},
        ["cables2"] = {name = "Cables 2", price = 500},
        ["cables3"] = {name = "Cables 3", price = 750},
        ["fueltank1"] = {name = "Fuel Tank 1", price = 250},
        ["fueltank2"] = {name = "Fuel Tank 2", price = 500},
        ["fueltank3"] = {name = "Fuel Tank 3", price = 750},
        ["harness"] = {name = "Harness", price = 1000},
        ["antilag"] = {name = "Anti-Lag", price = 2500},
        ["manual"] = {name = "Manual", price = 3000},
        ["hood"] = {name = "Hood", price = 0},
        ["roof"] = {name = "Roof", price = 0},
        ["spoiler"] = {name = "Spoiler", price = 0},
        ["bumper"] = {name = "Bumper", price = 0},
        ["skirts"] = {name = "Skirts", price = 0},
        ["exhaust"] = {name = "Exhaust", price = 0},
        ["seat"] = {name = "Seat", price = 0},
        ["livery"] = {name = "Livery", price = 0},
        ["tires"] = {name = "Tires", price = 0},
        ["horn"] = {name = "Horn", price = 0},
        ["internals"] = {name = "Internals", price = 0},
        ["externals"] = {name = "Externals", price = 0},
        ["customplate"] = {name = "Custom Plate", price = 0},
        ["headlights"] = {name = "Headlights", price = 0},
        ["rims"] = {name = "Rims", price = 0},
        ["rollcage"] = {name = "Roll Cage", price = 0},
        ["tuning_laptop"] = {name = "Race Tuning laptop", price = 1000},
        ["underglow"] = {name = "Underglow", price = 0},--]]
        ["steel"] = {name = "Steel", price = 35},
        ["plastic"] = {name = "Plastic", price = 35},
        ["iron"] = {name = "Iron", price = 35},
        ["metalscrap"] = {name = "Metal Scrap", price = 35},
        ["rubber"] = {name = "Rubber", price = 35},
        ["aluminum"] = {name = "Aluminum", price = 35},
        ["aluminumoxide"] = {name = "Aluminum Oxide", price = 35},
        ["ironoxide"] = {name = "Iron Oxide", price = 35},
        ["copper"] = {name = "Copper", price = 35},
        ["aluminium"] = {name = "Aluminium", price = 15},
        ["forged_steel"] = {name = "Forged Steel", price = 20},
        ["titanium"] = {name = "Titanium", price = 25},
        ["super"] = {name = "Super Metal", price = 30},
        ["unobtanium"] = {name = "Unobtanium", price = 45},
        ["indestructible"] = {name = "Indestructible", price = 50}
    },
    ["tuning"] = {
        --[[["nos"] = {name = "Nos", price = 500},
        ["noscolour"] = {name = "Nos Colour", price = 500},
        ["mechanic_tools"] = {name = "Mechanic Tools", price = 250},
        ["sparetire"] = {name = "Spare Tire", price = 0},
        ["axleparts"] = {name = "Axle Parts", price = 0},
        ["carbattery"] = {name = "Car Battery", price = 0},
        ["sparkplugs"] = {name = "Spark Plugs", price = 0},
        ["newoil"] = {name = "New Oil", price = 0},
        ["toolbox"] = {name = "Toolbox", price = 350},
        ["ducttape"] = {name = "Duct Tape", price = 100},
        ["paintcan"] = {name = "Paint Can", price = 250},
        ["tint_supplies"] = {name = "Tint Supplies", price = 0},
        ["underglow_controller"] = {name = "Underglow Controller", price = 0},
        ["cleaningkit"] = {name = "Cleaning Kit", price = 0},
        ["turbo"] = {name = "Turbo", price = 100},
        ["engine1"] = {name = "Engine 1", price = 1000},
        ["engine2"] = {name = "Engine 2", price = 2000},
        ["engine3"] = {name = "Engine 3", price = 3000},
        ["engine4"] = {name = "Engine 4", price = 4000},
        ["engine5"] = {name = "Engine 5", price = 5000},
        ["transmission1"] = {name = "Transmission 1", price = 1000},
        ["transmission2"] = {name = "Transmission 2", price = 2000},
        ["transmission3"] = {name = "Transmission 3", price = 3000},
        ["transmission4"] = {name = "Transmission 4", price = 4000},
        ["brakes1"] = {name = "Brakes 1", price = 250},
        ["brakes2"] = {name = "Brakes 2", price = 500},
        ["brakes3"] = {name = "Brakes 3", price = 750},
        ["car_armor"] = {name = "Car Armor", price = 10000},
        ["suspension1"] = {name = "Suspension 1", price = 250},
        ["suspension2"] = {name = "Suspension 2", price = 500},
        ["suspension3"] = {name = "Suspension 3", price = 750},
        ["suspension4"] = {name = "Suspension 4", price = 1000},
        ["suspension5"] = {name = "Suspension 5", price = 1250},
        ["airsuspension"] = {name = "Air Suspension", price = 6500},
        ["suspensionremover"] = {name = "Suspension Remover", price = 250},
        ["bprooftires"] = {name = "Bulletproof Tires", price = 20000},
        ["drifttires"] = {name = "Drift Tires", price = 5000},
        ["oilp1"] = {name = "Oil P1", price = 250},
        ["oilp2"] = {name = "Oil P2", price = 500},
        ["oilp3"] = {name = "Oil P3", price = 750},
        ["drives1"] = {name = "Driveshaft 1", price = 250},
        ["drives2"] = {name = "Driveshaft 2", price = 500},
        ["drives3"] = {name = "Driveshaft 3", price = 750},
        ["cylind1"] = {name = "Cylinder 1", price = 250},
        ["cylind2"] = {name = "Cylinder 2", price = 500},
        ["cylind3"] = {name = "Cylinder 3", price = 750},
        ["cables1"] = {name = "Cables 1", price = 250},
        ["cables2"] = {name = "Cables 2", price = 500},
        ["cables3"] = {name = "Cables 3", price = 750},
        ["fueltank1"] = {name = "Fuel Tank 1", price = 250},
        ["fueltank2"] = {name = "Fuel Tank 2", price = 500},
        ["fueltank3"] = {name = "Fuel Tank 3", price = 750},
        ["harness"] = {name = "Harness", price = 1000},
        ["antilag"] = {name = "Anti-Lag", price = 2500},
        ["manual"] = {name = "Manual", price = 3000},
        ["hood"] = {name = "Hood", price = 0},
        ["roof"] = {name = "Roof", price = 0},
        ["spoiler"] = {name = "Spoiler", price = 0},
        ["bumper"] = {name = "Bumper", price = 0},
        ["skirts"] = {name = "Skirts", price = 0},
        ["exhaust"] = {name = "Exhaust", price = 0},
        ["seat"] = {name = "Seat", price = 0},
        ["livery"] = {name = "Livery", price = 0},
        ["tires"] = {name = "Tires", price = 0},
        ["horn"] = {name = "Horn", price = 0},
        ["internals"] = {name = "Internals", price = 0},
        ["externals"] = {name = "Externals", price = 0},
        ["customplate"] = {name = "Custom Plate", price = 0},
        ["headlights"] = {name = "Headlights", price = 0},
        ["rims"] = {name = "Rims", price = 0},
        ["rollcage"] = {name = "Roll Cage", price = 0},
        ["tuning_laptop"] = {name = "Race Tuning laptop", price = 1000},
        ["underglow"] = {name = "Underglow", price = 0},--]]
        ["steel"] = {name = "Steel", price = 35},
        ["plastic"] = {name = "Plastic", price = 35},
        ["iron"] = {name = "Iron", price = 35},
        ["metalscrap"] = {name = "Metal Scrap", price = 35},
        ["rubber"] = {name = "Rubber", price = 35},
        ["aluminum"] = {name = "Aluminum", price = 35},
        ["aluminumoxide"] = {name = "Aluminum Oxide", price = 35},
        ["ironoxide"] = {name = "Iron Oxide", price = 35},
        ["copper"] = {name = "Copper", price = 35},
        ["aluminium"] = {name = "Aluminium", price = 15},
        ["forged_steel"] = {name = "Forged Steel", price = 20},
        ["titanium"] = {name = "Titanium", price = 25},
        ["super"] = {name = "Super Metal", price = 30},
        ["unobtanium"] = {name = "Unobtanium", price = 45},
        ["indestructible"] = {name = "Indestructible", price = 50}
    },
    -- add more here
}

Config.DriverPayPrec = 0.1 --precent of the order the driver gets, if you want to redo the way pricing is done go to server/sv_processing about line 220

Config.CarryBoxProp = 'prop_cs_cardbox_01' -- prop the player carries when carrying boxes inside the resturant for delivery


--[[ 
███████╗███████╗██╗     ██╗     ███████╗██████╗ 
██╔════╝██╔════╝██║     ██║     ██╔════╝██╔══██╗
███████╗█████╗  ██║     ██║     █████╗  ██████╔╝
╚════██║██╔══╝  ██║     ██║     ██╔══╝  ██╔══██╗
███████║███████╗███████╗███████╗███████╗██║  ██║
╚══════╝╚══════╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
]]

-- ANY ITEMS SOLD TO THIS PERSON AUTO GO TO THE WAREHOUSE'S STOCK!!!!!!!!!!!!!!!!!!!!!!

-- Define the ped model
Config.PedModel = "s_m_y_xmech_02"

-- Define the ped and target location
Config.Location = {
    coords = vector3(1243.69, -3109.96, 5.03),
    heading = 292.66
}

-- Blip for the purchaser
Config.SellerBlip = {
    label = 'Parts and Supply Buyer',
    coords = vector3(1243.69, -3109.96, 6.03),
    --blipSprite = 1,
    --blipColor = 1,
    --blipScale = 0.8,
}

-- Animation while selling to the ped
Config.SellingAnimDict = 'amb@world_human_clipboard@male@idle_a'
Config.SellingAnimName = 'idle_a'

-- Progress time for selling
Config.SellProgress = 10000

-- Purchaser and their prices
Config.ItemsFarming = {
    --[[['lime'] = {label = 'Lime', price = 4},
    ['orange'] = {label = 'Orange', price = 4},
    ['coconut'] = {label = 'Coconut', price = 4},
    ['pineapple'] = {label = 'Pineapple', price = 4},
    ['broccoli'] = {label = 'Broccoli', price = 4},
    ['cabbage'] = {label = 'Cabbage', price = 4},
    ['carrots'] = {label = 'Carrots', price = 4},
    ['lettuce'] = {label = 'Lettuce', price = 4},
    ['spinach'] = {label = 'Spinach', price = 4},
    ['milk'] = {label = 'Milk', price = 4},
    ['egg'] = {label = 'Eggs', price = 4},
    ['onion'] = {label = 'Onion', price = 4},
    ['mushroom'] = {label = 'Mushroom', price = 4},
    ['potato'] = {label = 'Potato', price = 4},
    ['tomato'] = {label = 'Tomato', price = 4},
    ['raspberries'] = {label = 'Raspberries', price = 4},
    ['cherry'] = {label = 'Cherry', price = 4},
    ['corn'] = {label = 'Corn', price = 4},
    ['peach'] = {label = 'Peach', price = 4},
    ['banana'] = {label = 'Banana', price = 4},
    ['strawberry'] = {label = 'Strawberry', price = 4},
    ['mint'] = {label = 'Mint', price = 4},
    ['lemon'] = {label = 'Lemon', price = 4},
    ['mango'] = {label = 'Mango', price = 4},
    ['watermelon'] = {label = 'Watermelon', price = 4},
    ['water'] = {label = 'Water', price = 4},--]]
    ['steel'] = {label = 'Steel', price = 10},
    ['plastic'] = {label = 'Plastic', price = 10},
    ['iron'] = {label = 'Iron', price = 10},
    ['metalscrap'] = {label = 'Metal Scrap', price = 10},
    ['rubber'] = {label = 'Rubber', price = 10},
    ['aluminum'] = {label = 'aluminum', price = 10},
    ['aluminumoxide'] = {label = 'Aluminum Oxide', price = 10},
    ['ironoxide'] = {label = 'Iron Oxide', price = 10},
    ['copper'] = {label = 'Copper', price = 10},
    ['aluminium'] = {label = 'Aluminium', price = 7},
    ['forged_steel'] = {label = 'Forged Steel', price = 10},
    ['titanium'] = {label = 'Titanium', price = 12},
    ['super'] = {label = 'Super Metal', price = 15},
    ['unobtanium'] = {label = 'Unobtanium', price = 23},
    ['indestructible'] = {label = 'Indestructible', price = 25},

}
