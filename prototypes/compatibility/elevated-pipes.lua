
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

local casting_dict = {
    ["elevated-pipe"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)

local mapping = {
    ["casting-elevated-pipe"] = "elevated-pipe",
}
add_recipe_unlocks(mapping)