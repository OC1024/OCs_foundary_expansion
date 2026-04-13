local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

local mapping = {
    ["engine-unit"] = "metallurgy-or-assembling",
    ["motor"] = "pressing",
    ["electric-motor"] = "electronics",
    ["small-iron-electric-pole"] = "electronics",
}
oc_helper.change_multiple_crafting_category(mapping)

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
    ["oc-casting-motor"] = {"foundry"},
    ["oc-pulse-electric-motor"] = {"electricity"},
    ["oc-pulse-small-iron-electric-pole"] = {"electricity"},
    ["oc-pulse-burner-turbine"] = "electricity",
    ["electronic-circuit-wood"] = "electronics", -- oversight by AAI it seeems
    -- ["oc-pulse-electronic-circuit-wood"] = "electronics", -- see above
}
oc_helper.add_recipe_unlocks(recipe_unlock_mapping)