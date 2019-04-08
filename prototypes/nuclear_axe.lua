--item.lua

local templateItem = "steel-axe"
local templateItemGroup = "mining-tool"
local newItemName = "nuclear-axe"
local technologyName = "nuclear-power"

-- ["steel-axe"] = {
--   action = {
--     action_delivery = {
--       target_effects = {
--         damage = {
--           amount = 8,
--           type = "physical"
--         },
--         type = "damage"
--       },
--       type = "instant"
--     },
--     type = "direct"
--   },
--   durability = 5000,
--   flags = {
--     "goes-to-main-inventory"
--   },
--   icon = "__base__/graphics/icons/steel-axe.png",
--   icon_size = 32,
--   localised_description = {
--     "item-description.mining-tool"
--   },
--   name = "steel-axe",
--   order = "a[mining]-b[steel-axe]",
--   speed = 4,
--   stack_size = 20,
--   subgroup = "tool",
--   type = "mining-tool"
-- }

local newItem = table.deepcopy(data.raw[templateItemGroup][templateItem])

newItem.name = newItemName
newItem.icons = {
{
    icon=newItem.icon,
    tint={r=0,g=1,b=0,a=0.3}
    },
}

newItem.order = "a[mining]-c[" .. newItem.name .. "]" -- newItem.order:gsub(templateItem, newItem.name)
newItem.speed = 100
newItem.durability = 1048576

-- ["steel-axe"] = {
--   enabled = false,
--   ingredients = {
--     {
--       "steel-plate",
--       5
--     },
--     {
--       "iron-stick",
--       2
--     }
--   },
--   name = "steel-axe",
--   result = "steel-axe",
--   type = "recipe"
-- }

local recipe = table.deepcopy(data.raw.recipe[templateItem])
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

local research = table.deepcopy(data.raw.technology[technologyName])
table.insert(research.effects, {
    recipe = recipe.name,
    type = "unlock-recipe"
})

data:extend{ newItem, recipe, research }
