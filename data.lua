-- prepare the generator for recipe.lua and compat files
require("__OCs_base_assets__.prototypes.utils.helper")
local generator_api = require("__OCs_base_assets__.prototypes.utils.api") -- good practice
require("__OCs_foundary_expansion__.prototypes.compatibility.rules-patch") -- patches the rules

-- loads the real lua files
-- require("prototypes.category")
require("prototypes.item")
require("prototypes.recipe") -- where the generator_api is used
require("prototypes.entity") -- for buildings
require("prototypes.technology")
-- require("control") -- for GUIs: