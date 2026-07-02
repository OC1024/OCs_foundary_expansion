local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")


-- generate new recipes
local casting_dict = {
  -- aluminium buildings
  ["muluna-silicon-solar-panel"] = "electromagnetics",
  ["space-chest-muluna"] = "metallurgy",
  ["muluna-steam-crusher"] = "metallurgy",
  ["muluna-advanced-boiler"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)

-- Add Recipes to Techs
local recipe_tech_mapping = {
  ["oc-pulse-muluna-silicon-solar-panel"] = { "muluna-silicon-processing" },
  ["oc-casting-space-chest-muluna"] = { "space-chest-muluna" },
  ["oc-casting-muluna-steam-crusher"] = { "muluna-steam-crusher" },
  ["oc-casting-muluna-advanced-boiler"] = { "muluna-advanced-boiler" },
}
oc_tech.add_recipe_unlocks(recipe_tech_mapping)
