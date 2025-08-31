
-- load the generator api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

local new_recipes = {
    ["aai-strongbox"] = "metallurgy",
    ["aai-storehouse"] = "metallurgy",
    ["aai-warehouse"] = "metallurgy",
}
generator_api.batch_generator(new_recipes)

local recipe_unlock_mapping = {
    ["casting-aai-strongbox"] = {"aai-strongbox-base"},
    ["casting-aai-storehouse"] = {"aai-storehouse-base"},
    ["casting-aai-warehouse"] = {"aai-warehouse-base"},
}
add_recipe_unlocks(recipe_unlock_mapping)