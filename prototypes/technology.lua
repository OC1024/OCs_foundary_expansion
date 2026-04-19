local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

data:extend({
  { --  advanced foundry
    type = "technology",
    name = "advanced-foundry-tech",
    icon = "__OCs_foundary_expansion__/graphics/technology/advanced-foundry-tech.png", -- advanced foundry graphics by Hurricane
    icon_size = 256,                                                                   --icon_mipmaps = 4,
    prerequisites = { "electromagnetic-science-pack", "metallurgic-science-pack", "agricultural-science-pack", "casting-concrete-tech" },
    unit = {
      ingredients = {
        { "automation-science-pack",      2 },
        { "logistic-science-pack",        2 },
        { "chemical-science-pack",        1 },
        { "production-science-pack",      2 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "metallurgic-science-pack",     2 },
        { "agricultural-science-pack",    1 },
        { "electromagnetic-science-pack", 1 },
      },
      time = 60,
      count = 2000
    },
    effects = {
      { type = "unlock-recipe", recipe = "advanced-foundry" },
    },
  },
})

if not settings.startup["early-advanced-foundry"].value then -- if not early then later
  table.insert(data.raw.technology["advanced-foundry-tech"].prerequisites, "cryogenic-science-pack")
  table.insert(data.raw.technology["advanced-foundry-tech"].unit.ingredients, { "cryogenic-science-pack", 1 })
end

-- add special recipe unlocks to the tech (or multiple ones)
local recipe_unlocks = {
  -- production
  ["oc-casting-burner-mining-drill"] = "foundry",
  ["oc-casting-electric-mining-drill"] = "electric-mining-drill",
  ["oc-casting-pumpjack"] = "oil-gathering",
  ["oc-pulse-assembling-machine-1"] = "automation",
  ["oc-pulse-assembling-machine-2"] = "automation-2",
  ["oc-pulse-assembling-machine-3"] = "automation-3",
  -- energy production
  ["oc-casting-steam-engine"] = { "foundry" },
  ["oc-casting-heat-pipe"] = { "nuclear-power", "heating-tower" },
  ["oc-casting-heat-exchanger"] = { "nuclear-power", "heating-tower" },
  ["oc-casting-steam-turbine"] = { "nuclear-power", "heating-tower" },
  ["oc-casting-boiler"] = { "foundry" },
  ["oc-casting-heating-tower"] = { "heating-tower" },
  -- energy distribution
  ["oc-pulse-small-electric-pole"] = "electromagnetic-plant",
  ["oc-pulse-medium-electric-pole"] = "electric-energy-distribution-1",   -- change that with aai-industry to "medium-electric-pole"
  ["oc-pulse-big-electric-pole"] = "electric-energy-distribution-1",
  ["oc-pulse-substation"] = "electric-energy-distribution-2",
  ["oc-pulse-solar-panel"] = { "solar-energy" },
  -- ["oc-pulse-accumulator"] = {"electric-energy-accumulator"}, -- useless as the battery is chemistry

  -- fluid handling
  ["oc-casting-offshore-pump"] = { "foundry" },
  ["oc-casting-pump"] = { "fluid-handling" },
  ["oc-casting-storage-tank"] = { "fluid-handling" },
  ["oc-casting-barrel"] = { "fluid-handling" },
  -- item storage
  ["oc-casting-iron-chest"] = { "foundry" },
  ["oc-casting-steel-chest"] = { "foundry" },
  -- logistics - belts
  ["oc-casting-transport-belt"] = { "logistics" },
  ["oc-casting-underground-belt"] = { "logistics" },
  ["oc-casting-splitter"] = { "logistics" },
  ["oc-casting-fast-transport-belt"] = { "logistics-2" },
  ["oc-casting-fast-underground-belt"] = { "logistics-2" },
  ["oc-casting-fast-splitter"] = { "logistics-2" },
  ["oc-casting-express-transport-belt"] = { "logistics-3" },
  ["oc-casting-express-underground-belt"] = { "logistics-3" },
  ["oc-casting-express-splitter"] = { "logistics-3" },
  ["oc-casting-turbo-transport-belt"] = { "turbo-transport-belt" },
  ["oc-casting-turbo-underground-belt"] = { "turbo-transport-belt" },
  ["oc-casting-turbo-splitter"] = { "turbo-transport-belt" },
  -- logistics - bots

  -- intermediates
  ["oc-casting-engine-unit"] = "foundry",
  ["oc-pulse-electric-engine-unit"] = "electric-engine",
  ["forging-lithium-plate"] = "lithium-processing",   -- manually created
  ["freezing-water"] = "cryogenic-plant",             -- manually created

  -- space platform
  -- ["lds-space-platform-foundation"] = {"rocket-silo"},
  ["oc-casting-space-platform-foundation"] = { "rocket-silo" },
  ["tungsten-space-platform-foundation"] = { "rocket-silo" },
  ["oc-casting-tungsten-space-platform-foundation"] = { "rocket-silo" },

  -- vehicles
  ["oc-casting-locomotive"] = { "railway" },
  ["oc-casting-cargo-wagon"] = { "railway" },
  ["oc-casting-fluid-wagon"] = { "fluid-wagon" },
  ["oc-casting-car"] = { "automobilism" },
  ["oc-casting-tank"] = { "tank" },
}
oc_tech.add_recipe_unlocks(recipe_unlocks)
