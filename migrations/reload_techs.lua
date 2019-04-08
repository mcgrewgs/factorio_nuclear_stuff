--reload_techs.lua

local recipesEnabledByTech = {
  {
    recipe = "nuclear-axe",
    tech = "nuclear-power"
  },
  {
    recipe = "nuclear-mining-drill",
    tech = "nuclear-power"
  }
}

for index, force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  for index, doEnable in pairs(recipesEnabledByTech) do
    if technologies[doEnable.tech].researched then
      recipes[doEnable.recipe].enabled = true
      recipes[doEnable.recipe].reload()
    end
  end
end
