--item.lua

local templateItem = "electric-mining-drill"
local templateItemGroup = "item"
local newItemName = "nuclear-mining-drill"
local technologyName = "nuclear-power"





-- ["electric-mining-drill"] = {
--   flags = {
--     "goes-to-quickbar"
--   },
--   icon = "__base__/graphics/icons/electric-mining-drill.png",
--   icon_size = 32,
--   name = "electric-mining-drill",
--   order = "a[items]-b[electric-mining-drill]",
--   place_result = "electric-mining-drill",
--   stack_size = 50,
--   subgroup = "extraction-machine",
--   type = "item"
-- }

local newItem = table.deepcopy(data.raw[templateItemGroup][templateItem])

newItem.name = newItemName
newItem.icons = {
{
    icon=newItem.icon,
    tint={r=0,g=1,b=0,a=0.3}
    },
}

newItem.order = "a[items]-c[" .. newItem.name .. "]" -- newItem.order:gsub(templateItem, newItem.name)
newItem.place_result = newItem.name

data:extend{ newItem }

-- /c game.player.print( game.item_prototypes["nuclear-mining-drill"].name .. " - " .. game.item_prototypes["nuclear-mining-drill"].place_result.name )
-- /c game.player.print( game.item_prototypes["nuclear-mining-drill"].name )






-- ["electric-mining-drill"] = {
--   circuit_wire_max_distance = 9,
--   collision_box = {
--     {
--       -1.3999999999999999,
--       -1.3999999999999999
--     },
--     {
--       1.3999999999999999,
--       1.3999999999999999
--     }
--   },
--   corpse = "big-remnants",
--   energy_source = {
--     emissions = 0.09999999999999998,
--     type = "electric",
--     usage_priority = "secondary-input"
--   },
--   energy_usage = "90kW",
--   fast_replaceable_group = "mining-drill",
--   flags = {
--     "placeable-neutral",
--     "player-creation"
--   },
--   icon = "__base__/graphics/icons/electric-mining-drill.png",
--   icon_size = 32,
--   max_health = 300,
--   minable = {
--     mining_time = 1,
--     result = "electric-mining-drill"
--   },
--   mining_power = 3,
--   mining_speed = 0.5,
--   module_specification = {
--     module_slots = 3
--   },
--   name = "electric-mining-drill",
--   resource_categories = {
--     "basic-solid"
--   },
--   resource_searching_radius = 2.4900000000000002,
--   selection_box = {
--     {
--       -1.5,
--       -1.5
--     },
--     {
--       1.5,
--       1.5
--     }
--   },
--   type = "mining-drill"
-- },

local newEntity = table.deepcopy(data.raw["mining-drill"][templateItem])
newEntity.name = newItem.name
newEntity.minable.result = newItem.name
newEntity.resource_searching_radius = 4.49
newEntity.module_specification.module_slots = 6
newEntity.mining_power = 3.5
newEntity.mining_speed = 2.0
newEntity.energy_usage = "10kW"

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

-- /c game.player.force.recipes["nuclear-mining-drill"].products[1]["name"] = "nuclear-mining-drill"

-- /c game.player.print( game.player.force.recipes["nuclear-mining-drill"].products[1]["name"] )




local research = table.deepcopy(data.raw.technology[technologyName])
table.insert(research.effects, {
    recipe = recipe.name,
    type = "unlock-recipe"
})

data:extend{ research }
