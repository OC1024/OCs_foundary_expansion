local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

-- changing crafting category (making thins able in foundry and EM plant)
local mapping = {
  ["long-stack-inserter"] = "electromagnetics",
}
oc_recipe.add_crafting_categories(mapping)