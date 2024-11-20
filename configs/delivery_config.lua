Config = Config or {}

Config.DeliveryNPCs = {}

Config.DeliverySystem = {
    vehicle = 'pounder3',
    vehicleSpawn = vector4(1273.89, -3209.26, 5.9, 89.24),
    vehicleReturn = vector4(1245.57, -3210.6, 5.85, 89.37),
    returnRadius = 5.0,  -- Distance player needs to be from return point
    basePayment = 500,
    bonusPayment = 100,
    
    -- Store locations for deliveries
    Stores = {
        -- 24/7 Locations
        ["247supermarket"] = {
            label = "24/7 Supermarket",
            coords = vector3(24.47, -1346.62, 29.5),
            heading = 271.66,
            delivery = vector4(26.45, -1315.51, 29.62, 0.07)
        },
        ["247supermarket2"] = {
            label = "24/7 Supermarket",
            coords = vector3(-3039.54, 584.38, 7.91),
            heading = 17.27,
            delivery = vector4(-3047.95, 590.71, 7.62, 19.53)
        },
        ["247supermarket3"] = {
            label = "24/7 Supermarket",
            coords = vector3(-3242.97, 1000.01, 12.83),
            heading = 357.57,
            delivery = vector4(-3245.76, 1005.25, 12.83, 269.45)
        },
        -- LTD Gasoline Locations
        ["ltdgasoline"] = {
            label = "LTD Gasoline",
            coords = vector3(-47.02, -1758.23, 29.42),
            heading = 45.05,
            delivery = vector4(-40.51, -1747.45, 29.29, 326.39)
        },
        ["ltdgasoline2"] = {
            label = "LTD Gasoline",
            coords = vector3(-706.06, -913.97, 19.22),
            heading = 88.04,
            delivery = vector4(-702.89, -917.44, 19.21, 181.96)
        },
        -- Rob's Liquor Locations
        ["robsliquor"] = {
            label = "Rob's Liquor",
            coords = vector3(-1221.58, -908.15, 12.33),
            heading = 35.49,
            delivery = vector4(-1219.67, -910.99, 12.33, 300.76)
        },
        ["robsliquor2"] = {
            label = "Rob's Liquor",
            coords = vector3(-1486.59, -377.68, 40.16),
            heading = 139.51,
            delivery = vector4(-1468.29, -387.61, 38.79, 220.13)
        },
        -- Hardware Store Locations
        ["hardware"] = {
            label = "Hardware Store",
            coords = vector3(45.68, -1749.04, 29.61),
            heading = 53.13,
            delivery = vector4(89.15, -1745.29, 30.09, 315.25)
        }
    }
}