--data.lua

require("prototypes.nuclear_axe")
require("prototypes.nuclear_mining_drill")
require("prototypes.nuclear_beacon")

local cheap_recipes = {
	"speed-module",
	"speed-module-2",
	"speed-module-3",
	"productivity-module",
	"productivity-module-2",
	"productivity-module-3",
	"flying-robot-frame"
}

for k, v in pairs(cheap_recipes) do
	data.raw.recipe[v].energy_required = 0.5
end

data.raw["logistic-container"]["logistic-chest-passive-provider"].inventory_size = 192
data.raw["logistic-container"]["logistic-chest-requester"].inventory_size = 192
data.raw["logistic-container"]["logistic-chest-storage"].inventory_size = 192
