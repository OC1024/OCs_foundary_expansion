
data:extend({
  { --  advanced foundry
    type = "technology",
    name = "advanced-foundry-tech",
    icon = "__OCs_foundary_expansion__/graphics/technology/advanced-foundry-tech.png", -- advanced foundry graphics by Hurricane
		icon_size = 256, --icon_mipmaps = 4,
    prerequisites = {"electromagnetic-science-pack","metallurgic-science-pack","agricultural-science-pack","casting-concrete-tech"},
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

if not settings.startup["early_advanced_foundry"].value then -- if not early then later
  table.insert(data.raw.technology["advanced-foundry-tech"].prerequisites, "cryogenetic-science-pack")
  table.insert(data.raw.technology["advanced-foundry-tech"].unit.ingredients, {"cryogenetic-science-pack", 1})
end

-- add casting (item) to the tech (or multiple ones)
local recipe_unlocks = {
    -- energy production
    ["casting-steam-engine"] = {"foundry"},
    ["casting-heat-pipe"] = {"nuclear-power","heating-tower"},
    ["casting-heat-exchanger"] = {"nuclear-power","heating-tower"},
    ["casting-steam-turbine"] = {"nuclear-power","heating-tower"},
    ["casting-boiler"] = {"foundry"},
    ["casting-heating-tower"] = {"heating-tower"},
    -- energy distribution
    ["pulse-small-electric-pole"] = "electromagnetic-plant",
    ["pulse-medium-electric-pole"] = "electric-energy-distribution-1",  -- change that with aai-industry to "medium-electric-pole"
    ["pulse-big-electric-pole"] = "electric-energy-distribution-1",
    ["pulse-substation"] = "electric-energy-distribution-2",
    ["pulse-solar-panel"] = {"solar-energy"},
    -- ["pulse-accumulator"] = {"electric-energy-accumulator"}, -- useless as the battery is chemistry

    -- fluid handling
    ["casting-offshore-pump"] = {"foundry"},
    ["casting-pump"] = {"fluid-handling"},
    ["casting-storage-tank"] = {"fluid-handling"},
    ["casting-barrel"] = {"fluid-handling"},
    -- item storage
    ["casting-iron-chest"] = {"foundry"},
    ["casting-steel-chest"] = {"foundry"},
    -- logistics - belts
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
    -- logistics - bots
    -- intermediates
    ["casting-engine-unit"] = "foundry",
    ["pulse-electric-engine-unit"] =  "electric-engine",
    ["forging-lithium-plate"] = "lithium-processing", -- not frm the generator but manually created
    ["freezing-water"] = "cryogenetic-plant", -- also custom recipe

    -- space platform
    -- ["lds-space-platform-foundation"] = {"rocket-silo"},
    ["casting-space-platform-foundation"] = {"rocket-silo"},
    ["tungsten-space-platform-foundation"] = {"rocket-silo"},
    ["casting-tungsten-space-platform-foundation"] = {"rocket-silo"},

    -- vehicles
    ["casting-locomotive"] = {"railway"},
    ["casting-cargo-wagon"] = {"railway"},
    ["casting-fluid-wagon"] = {"fluid-wagon"},
    ["casting-car"] = {"automobilism"},
    ["casting-tank"] = {"tank"},
}
add_recipe_unlocks(recipe_unlocks)