local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

local category_mapping = {
    ["lane-splitter"] = "pressing",
    ["fast-lane-splitter"] = "pressing",
    ["express-lane-splitter"] = "metallurgy-or-crafting-with-fluid",
    ["turbo-lane-splitter"] = "metallurgy",
}
oc_recipe.change_multiple_crafting_category(category_mapping)

local new_recipes = {
    ["lane-splitter"] = "metallurgy",
    ["fast-lane-splitter"] = "metallurgy",
    ["express-lane-splitter"] = "metallurgy",
    ["turbo-lane-splitter"] = "metallurgy",
}
generator_api.batch_generator(new_recipes)

local recipe_unlock_mapping = {
    ["oc-casting-line-splitter"] = {"logistics"},
    ["oc-casting-fast-lane-splitter"] = {"logistics-2"},
    ["oc-casting-express-lane-spitter"] = {"logistics-3"},
    ["oc-casting-turbo-lane-spitter"] = {"turbo-transport-belt"},
}
oc_tech.add_recipe_unlocks(recipe_unlock_mapping)