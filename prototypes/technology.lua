if mods["OCs_stone_casting"] and settings.startup["allow-casting-foundation"].value then
  prerequ = {"electromagnetic-science-pack","metallurgic-science-pack","agricultural-science-pack","casting-foundation-tech"}
else
  prerequ = {"electromagnetic-science-pack","metallurgic-science-pack","agricultural-science-pack","foundation"}
end
data:extend({
  { --  advanced foundry
    type = "technology",
    name = "advanced-foundry-tech",
    icon = "__OCs_core_extraction__/graphics/technology/advanced-foundry-tech.png", -- advanced foundry by Hurricane
		icon_size = 256, --icon_mipmaps = 4,
    prerequisites = prerequ,
    unit = {
      ingredients = {
        {"automation-science-pack", 2},
        {"logistic-science-pack", 2},
        {"chemical-science-pack", 1},
        {"production-science-pack", 2},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 2},
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
      },
      time = 60,
      count = 2000
      },
    effects = {
      {type = "unlock-recipe", recipe = "advanced-foundry"},
    },
  },
})

-- -- add casting (item) to the (tech)
-- local recipe_unlocks = {
--   ["casting-heat-pipe"] = {"nuclear-power","heating-tower"},
--   ["casting-heat-exchanger"] = {"nuclear-power","heating-tower"},
--   ["casting-steam-turbine"] = {"nuclear-power","heating-tower"},
--   ["casting-steel-chest"] = {"steel-processing"},
--   ["casting-iron-chest"] = {"foundry"},
--   -- ["casting-stone-furnace"] = {"advanced-material-processing"}, -- stone casting mod
--   -- ["casting-steel-furnace"] = {"advanced-material-processing"}, -- stone casting mod
--   ["casting-solar-panel"] = {"solar-energy"},
--   ["casting-transport-belt"] = {"logistics"},
--   ["casting-underground-belt"] = {"logistics"},
--   ["casting-fast-transport-belt"] = {"logistics-2"},
--   ["casting-fast-underground-belt"] = {"logistics-2"},
--   -- ["lds-space-platform-foundation"] = {"rocket-silo"},
--   ["tungsten-space-platform-foundation"] = {"rocket-silo"},
-- }
-- add_recipe_unlocks(recipe_unlocks)

-- add casting rails to the stone-casting tech from my other mod
if mods["OCs_stone_casting"] and data.raw["technology"]["lava-to-stone-tech"] then
  local recipe_unlocks = {
    ["casting-rail"] = {"lava-to-stone-tech"}
  }
  add_recipe_unlocks(recipe_unlocks)
else -- should not be the case because of dependencies, vanilla fallback
  local recipe_unlocks = {
    ["casting-rail"] = {"railway"}
  }
  add_recipe_unlocks(recipe_unlocks)
end