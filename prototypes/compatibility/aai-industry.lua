
local mapping = {
    ["engine-unit"] = "metallurgy-or-assembling",
    ["motor"] = "pressing",
    ["electric-motor"] = "electronics",
    ["small-iron-electric-pole"] = "electronics",
}
change_multiple_crafting_category(mapping)

-- load the generator api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

local new_recipes = {
    ["motor"] = "metallurgy",
    ["electric-motor"] = "electromagnetics",
    ["small-iron-electric-pole"] = "electromagnetics",
    ["burner-turbine"] = "electromagnetics",
    -- ["electronic-circuit-wood"] = "electromagnetics", -- doesn't work without redefining the alt recipe order
}
generator_api.batch_generator(new_recipes)

local recipe_unlock_mapping = {
    ["casting-motor"] = {"foundry"},
    ["pulse-electric-motor"] = {"electricity"},
    ["pulse-small-iron-electric-pole"] = {"electricity"},
    ["pulse-burner-turbine"] = "electricity",
    ["electronic-circuit-wood"] = "electronics", -- oversight by AAI it seeems
    -- ["pulse-electronic-circuit-wood"] = "electronics",
}
add_recipe_unlocks(recipe_unlock_mapping)