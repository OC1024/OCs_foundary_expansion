local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

log("Space solar panels had weight "..dara.raw.item["space-solar-panel"].weight.. "kg. I've set them to exactly 100kg")
data.raw.item["space-solar-panel"].weight = 100 * kg
-- making it a clean value as shown and not some abitrary fraction of a kg.
-- If weight is 115 or 120, is not even cheaty, as it was automatically set to slightly more than 115 kg.

local category_mapping = {
    ["space-solar-panel"] = "electronics",
}
oc_recipe.add_multiple_crafting_category(category_mapping)

local new_recipes = {
    ["space-solar-panel"] = "electromagnetics",
}
generator_api.batch_generator(new_recipes)

local recipe_unlock_mapping = {
    ["oc-pulse-space-solar-panel"] = {"rocket-silo"},
}
oc_tech.add_recipe_unlocks(recipe_unlock_mapping)