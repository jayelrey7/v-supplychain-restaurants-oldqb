**Preview:**
This is a link to the main developers youtube on how the script works. I will not be posting any videos on edits made here
- Check out the scripts in action with my [preview link](https://www.youtube.com/watch?v=q-rLkHe4jzA).
- MLO USED IN PREVIEW: https://forum.cfx.re/t/release-free-mlo-trucks-job-warehouse/2347310

  
**Download:**
this is the main file: 
- Access the full script package on [GitHub](https://github.com/Virgildev/v-supplychain-restaurants).
- Warehouse MLO used in preview [here] (https://forum.cfx.re/t/release-free-mlo-trucks-job-warehouse/2347310).
- Tequi-la-laMLO used in preview [here] (https://www.gta5-mods.com/maps/mlo-underground-box-ring-at-tequilala-sp-fivem).

**Overview:**
- Introducing the Advanced Restaurant and Business Script, a comprehensive solution for managing restaurants, warehouses, and various business activities in your FiveM server. This script enhances the role-playing experience by providing detailed management features and customization options.

# Features:

### Warehouse Script
- **Warehouse Configuration:** Set up and manage warehouses with forklifts, pallets, delivery markers, trucks, and trailers.
- **Box Carrying:** Customize the prop used for carrying boxes during deliveries to match your server's theme.
- **job specific** - Grime Job is the only job that can access the menu and accept orders.
- Only players who are part a business in the business.businesses section can sell items to the sales ped (work in progress)
- **Container Delivery** option to do container deliveries around the dock with a handler for small amounts of cash

### Restaurant Script
- **Restaurant Management:** Define multiple restaurants with customizable names, job roles, delivery points, and more.
- **Items Management:** Create a menu for each restaurant, including item prices and availability.
- **Driver Pay:** Configure driver payment based on a percentage of the order value.

### Business Script
- **Billing Integration:** Link with billing systems to create and manage invoices.
- **Business Details:** Set up essential business details such as name, menu URL, clock-in locations, registers, trays, storage, cooking locations, and seating arrangements.

**Installation Instructions:**
1. **Drag and Drop:** Move the provided scripts into your FiveM resources folder.
2. **Configuration:** Edit the `Config` and `Businesses` files to customize your restaurants, warehouses, and business settings.
3. **Server Configuration:** Add the resource to your `server.cfg` file to ensure it loads properly.

**Script Requirements:**
1. ox_target/qb-target
2. qb-inventory
3. ox_lib



**noted changes**
Order system by businesses: you can order one product or more than one different product in a single order
truck trailer switched to single box truck
**spawn of pallet changed to box - WIP**

**Job that goes into your QBcore Shared Jobs File** Must be named grime but you can change the display to whatever you want**
['grime'] = {
        label = 'Grime Logistics',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1000
            },
            ['1'] = {
                name = 'Employee',
                payment = 1250
            },
            ['2'] = {
                name = 'Supervisor',
                payment = 1500
            },
            ['3'] = {
                name = 'Manager',
                payment = 2000
            },
            ['4'] = {
                name = 'Co-Owner',
                payment = 2250
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                payment = 2250
            },
        },
    },

**Support:**
I am not an expert, this is my own version of the main github. please do not ask questions or improvements or to fix bugs. It is a work in progress.

**CREDIT**
Credit to Virgildev for an awesome script.


