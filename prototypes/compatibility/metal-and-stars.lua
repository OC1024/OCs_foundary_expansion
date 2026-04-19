local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

-- changing crafting category (making thins able in foundry and EM plant)
local mapping = {
  ["antimatter-logistic-bot"] = "electronics",
  ["antimatter-construction-bot"] = "electronics",
}
oc_recipe.change_multiple_crafting_category(mapping)
