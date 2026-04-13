
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

local casting_dict = {
    ["elevated-pipe"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)

local mapping = {
    ["oc-casting-elevated-pipe"] = "elevated-pipe",
}
oc_helper.add_recipe_unlocks(mapping)