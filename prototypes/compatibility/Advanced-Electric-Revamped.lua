
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

local casting_dict = {
  ["advanced-solar"] = "electromagnetics",
  ["elite-solar"] = "electromagnetics",
  ["ultimate-solar"] = "electromagnetics",
  ["advanced-accumulator"] = "electromagnetics",
  ["elite-accumulator"] = "electromagnetics",
  ["ultimate-accumulator"] = "electromagnetics",
}
generator_api.batch_generator(casting_dict)

local recipe_tech_mapping = {
    ["oc-pulse-advanced-solar"] = {"advanced-solar"},
    ["oc-pulse-elite-solar"] = {"elite-solar"},
    ["oc-pulse-ultimate-solar"] = {"ultimate-solar"},
    ["oc-pulse-advanced-accumulator"] = {"advanced-accumulator"},
    ["oc-pulse-elite-accumulator"] = {"elite-accumulator"},
    ["oc-pulse-ultimate-accumulator"] = {"ultimate-accumulator"},
}
oc_tech.add_recipe_unlocks(recipe_tech_mapping)