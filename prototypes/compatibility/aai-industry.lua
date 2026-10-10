local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

local mapping = {
    ["engine-unit"] = "metallurgy",
    ["motor"] = "metallurgy",
    ["electric-motor"] = "electromagnetics",
    ["small-iron-electric-pole"] = "electromagnetics",
    ["area-mining-drill"] = "metallurgy",
    ["industrial-furnace"] = "metallurgy",
    ["burner-assembling-machine"] = "electromagnetics",
    ["burner-lab"] = "electromagnetics",
    ["burner-turbine"] = "electromagnetics",
}
oc_recipe.add_crafting_categories(mapping)

local new_recipes = {
    ["motor"] = "metallurgy",-- small motor
    ["engine-unit"] = "metallurgy", -- overwrite vanilla recipe and icon
    ["electric-motor"] = "electromagnetics",--  electric motor
    ["electric-engine-unit"] = "electromagnetics", -- overwrite vanilla electric motor
    ["electronic-circuit-wood"] = "electromagnetics",
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
    ["oc-pulse-electronic-circuit"] = "electronics",
    ["oc-pulse-small-iron-electric-pole"] = {"electricity"},
    ["oc-pulse-burner-turbine"] = "electricity",
    ["oc-pulse-electronic-circuit-wood"] = "electronics",
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