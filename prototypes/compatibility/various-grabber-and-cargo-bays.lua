local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

local category_mapping = {
    ["octopus-asteroid-collector"] = "electronics",
    ["eel-asteroid-collector"] = "electronics",
    ["storage-cargo-bay"] = "electronics",
    ["hatch-cargo-bay"] = "electronics",
    ["space-platform-starter-pack-two"] = "electronics",
}
oc_recipe.change_multiple_crafting_category(category_mapping)

--these recipes feel less useful. Just making them electronics is probably good enough.
local new_recipes = {
    ["octopus-asteroid-collector"] = "electromagnetics",
    ["eel-asteroid-collector"] = "electromagnetics",
    ["storage-cargo-bay"] = "electromagnetics",
    ["hatch-cargo-bay"] = "electromagnetics",
    ["space-platform-starter-pack-two"] = "electromagnetics",
}
-- generator_api.batch_generator(new_recipes)

local recipe_unlock_mapping = {
    ["oc-pulse-octopus-asteroid-collector"] = {"space-platform"},
    ["oc-pulse-eel-asteroid-collector"] = {"space-platform"},
    ["oc-pulse-storage-cargo-bay"] = {"various-cargo-bays"},
    ["oc-pulse-hatch-cargo-bay"] = {"various-cargo-bays"},
    ["oc-pulse-space-platform-starter-pack-two"] = {"space-platform-starter-pack-two"},
}
-- oc_tech.add_recipe_unlocks(recipe_unlock_mapping)