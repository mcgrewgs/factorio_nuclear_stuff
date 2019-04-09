--reload_techs.lua

local recipesEnabledByTech = {
  ["nuclear-power"] = {
    "nuclear-axe",
    "nuclear-mining-drill",
    "nuclear-beacon"
  }
}

for index, force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  for k, vList in pairs(recipesEnabledByTech) do
    for index, v in pairs(vList) do
      if technologies[k].researched then
        recipes[v].enabled = true
        recipes[v].reload()
      end
    end
  end
end
