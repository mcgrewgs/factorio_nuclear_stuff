--nuclear_beacon.lua

local templateItem = "beacon"
local templateItemGroup = "beacon"
local newItemName = "nuclear-beacon"
local technologyName = "nuclear-power"

-- beacon = {
--   flags = {
--     "goes-to-quickbar"
--   },
--   icon = "__base__/graphics/icons/beacon.png",
--   icon_size = 32,
--   name = "beacon",
--   order = "a[beacon]",
--   place_result = "beacon",
--   stack_size = 10,
--   subgroup = "module",
--   type = "item"
-- },

local newItem = table.deepcopy(data.raw["item"][templateItem])

newItem.name = newItemName
newItem.icons = {
    {
        icon = newItem.icon,
        tint = {r=0,g=1,b=0,a=0.3}
    },
}

newItem.order = "a[beacon]-b[nuclear-beacon]" -- newItem.order:gsub(templateItem, newItem.name)
newItem.place_result = newItem.name

data.raw["item"][templateItem].order = "a[beacon]-a[beacon]"

data:extend{ newItem }


-- beacon = {
--   beacon = {
--     allowed_effects = {
--       "consumption",
--       "speed",
--       "pollution"
--     },
--     distribution_effectivity = 0.5,
--     energy_usage = "480kW",
--     flags = {
--       "placeable-player",
--       "player-creation"
--     },
--     max_health = 200,
--     minable = {
--       mining_time = 1,
--       result = "beacon"
--     },
--     module_specification = {
--       module_info_icon_shift = {
--         0,
--         0.5
--       },
--       module_info_multi_row_initial_height_modifier = -0.3,
--       module_slots = 2
--     },
--     name = "beacon",
--     supply_area_distance = 3,
--     type = "beacon"
--   }
-- }

local newEntity = table.deepcopy(data.raw[templateItemGroup][templateItem])
newEntity.name = newItem.name
newEntity.minable.result = newItem.name

newEntity.energy_usage = "1MW"

newEntity.supply_area_distance = 64
newEntity.distribution_effectivity = 1.0
newEntity.module_specification.module_slots = 8

data:extend{ newEntity }





local recipe = table.deepcopy(data.raw.recipe[templateItem])
recipe.normal = nil
recipe.expensive = nil
recipe.enabled = false
recipe.name = newItem.name
recipe.ingredients = {
    {
        templateItem,
        5
    },
    {
        "uranium-fuel-cell",
        1
    }
}
recipe.result = newItem.name

data:extend{ recipe }




local research = table.deepcopy(data.raw.technology[technologyName])
table.insert(research.effects, {
    recipe = recipe.name,
    type = "unlock-recipe"
})

data:extend{ research }
