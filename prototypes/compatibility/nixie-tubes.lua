local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

local mapping = {
  ["nixie-tube"] = "electromagnetics",
  ["nixie-tube-alpha"] = "electromagnetics",
  ["nixie-tube-small"] = "electromagnetics",
}
oc_recipe.change_multiple_crafting_category(mapping)
