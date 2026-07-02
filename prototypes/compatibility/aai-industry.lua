local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

local mapping = {
    ["engine-unit"] = "metallurgy",
    ["motor"] = "metallurgy", -- instead "crafting"
    ["electric-motor"] = "electromagnetics",
    ["small-iron-electric-pole"] = "electromagnetics",
    ["area-mining-drill"] = "metallurgy", -- instead "crafting"
    ["industrial-furnace"] = "metallurgy", -- instead "crafting"
    ["burner-assembling-machine"] = "electromagnetics", -- instead "crafting"
    ["burner-lab"] = "electromagnetics", -- instead "crafting"
    ["burner-turbine"] = "electromagnetics", -- instead "crafting"
}
oc_recipe.add_multiple_crafting_category(mapping)

local new_recipes = {
    ["motor"] = "metallurgy",-- small motor
    ["engine-unit"] = "metallurgy", -- overwrite vanilla recipe and icon
    ["electric-motor"] = "electromagnetics",--  electric motor
    ["electric-engine-unit"] = "electromagnetics", -- overwrite vanilla electric motor
    -- ["electronic-circuit-wood"] = "electromagnetics", -- doesn't work without redefining the alt recipe order
    ["small-iron-electric-pole"] = "electromagnetics",
    ["burner-turbine"] = "electromagnetics",
    ["area-mining-drill"] = "metallurgy",
    ["industrial-furnace"] = "metallurgy",
    ["burner-lab"] = "electromagnetics", --maybe metallurgy
    ["burner-assembling-machine"] = "electromagnetics",
}
generator_api.batch_generator(new_recipes)

local recipe_unlock_mapping = {
    ["oc-casting-motor"] = {"foundry"},
    ["oc-pulse-electric-motor"] = {"electricity"},
    -- ["oc-pulse-electronic-circuit-wood"] = "electronics", -- see above
    ["oc-pulse-small-iron-electric-pole"] = {"electricity"},
    ["oc-pulse-burner-turbine"] = "electricity",
    ["electronic-circuit-wood"] = "electronics", -- oversight by AAI it seeems
    ["oc-casting-area-mining-drill"] = "foundry",
    ["oc-casting-industrial-furnace"] = "foundry",
    ["oc-pulse-burner-lab"] = "electromagnetic-plant", -- placeholder tech
    ["oc-pulse-burner-assembling-machine"] = "electromagnetic-plant", -- placeholder tech
}
oc_tech.add_recipe_unlocks(recipe_unlock_mapping)

--set local name for recipes:
local localisation_map = {
    ["oc-pulse-lab"] = "oc-pulse-research-lab",
    ["oc-casting-engine-unit"] = "oc-cast-aai-engine-unit",
    ["oc-pulse-electric-engine-unit"] = "oc-pulse-aai-electric-engine-unit",
}
oc_helper.set_localised_name("recipe",localisation_map)