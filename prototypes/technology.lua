if mods["OCs_stone_casting"] and settings.startup["allow-casting-foundation"].value then
  prerequ = {"electromagnetic-science-pack","metallurgic-science-pack","agricultural-science-pack","casting-foundation-tech"}
else
  prerequ = {"electromagnetic-science-pack","metallurgic-science-pack","agricultural-science-pack","foundation"}
end
data:extend({
  { --  advanced foundry
    type = "technology",
    name = "advanced-foundry-tech",
    icon = "__OCs_foundary_expansion__/graphics/technology/advanced-foundry-tech.png", -- advanced foundry by Hurricane
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

-- add casting (item) to the tech (or multiple ones)
local recipe_unlocks = {
    ["casting-offshore-pump"] = {"foundry"},
    ["casting-pump"] = {"fluid-handling"},
    ["casting-storage-tank"] = {"fluid-handling"},
    ["casting-steam-engine"] = {"foundry"},
    ["casting-heat-pipe"] = {"nuclear-power","heating-tower"},
    ["casting-heat-exchanger"] = {"nuclear-power","heating-tower"},
    ["casting-steam-turbine"] = {"nuclear-power","heating-tower"},
    ["casting-boiler"] = {"foundry"},
    ["casting-heating-tower"] = {"heating-tower"},

    ["casting-iron-chest"] = {"foundry"},
    ["casting-steel-chest"] = {"foundry"},
    ["casting-barrel"] = {"fluid-handling"},

    ["casting-solar-panel"] = {"solar-energy"},

    ["casting-transport-belt"] = {"logistics"},
    ["casting-underground-belt"] = {"logistics"},
    ["casting-splitter"] = {"logistics"},
    ["casting-fast-transport-belt"] = {"logistics-2"},
    ["casting-fast-underground-belt"] = {"logistics-2"},
    ["casting-fast-splitter"] = {"logistics-2"},
    ["casting-express-transport-belt"] = {"logistics-3"},
    ["casting-express-underground-belt"] = {"logistics-3"},
    ["casting-express-splitter"] = {"logistics-3"},
    ["casting-turbo-transport-belt"] = {"turbo-transport-belt"},
    ["casting-turbo-underground-belt"] = {"turbo-transport-belt"},
    ["casting-turbo-splitter"] = {"turbo-transport-belt"},

    -- ["lds-space-platform-foundation"] = {"rocket-silo"},
    ["tungsten-space-platform-foundation"] = {"rocket-silo"},
    ["casting-tungsten-space-platform-foundation"] = {"rocket-silo"},

    ["casting-car"] = {"automobilism"},
    ["casting-tank"] = {"tank"},
}
add_recipe_unlocks(recipe_unlocks)