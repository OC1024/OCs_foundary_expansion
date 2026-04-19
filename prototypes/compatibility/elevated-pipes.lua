
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

local casting_dict = {
    ["elevated-pipe"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)

local mapping = {
    ["oc-casting-elevated-pipe"] = "elevated-pipe",
}
oc_tech.add_recipe_unlocks(mapping)