--control.lua

script.on_event({defines.events.on_tick},
  function (e)
    if e.tick % 60 == 0 then -- common trick to reduce how often this runs, we don't want it running every tick, just every 60 ticks, so once per second
      local fuel_name = "sulfuric-acid"
      local fuel_count = 100.0
      local fuel_fluidbox = {
        name = fuel_name,
        amount = fuel_count
      }

      for index, surf in pairs(game.surfaces) do -- loop through all the loaded game surfaces
        for index2, ent in pairs(surf.find_entities_filtered{ name = "nuclear-mining-drill" }) do -- loop through the nuclear mining drills
          if #ent.fluidbox < 1 then
            table.insert(ent.fluidbox, fuel_fluidbox)
          else
            ent.fluidbox[1] = fuel_fluidbox
          end
        end
      end
    end
  end
)
