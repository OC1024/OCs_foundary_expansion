-- prepare the generator for recipe.lua and compat files
require("__OCs_base_assets__.prototypes.utils.helper")
local generator_api = require("__OCs_base_assets__.prototypes.utils.api") -- manages the generator usage
require("__OCs_foundary_expansion__.rules-patch") -- patches the rules

-- loads the real lua files
-- require("prototypes.category")
require("prototypes.item")
require("prototypes.recipe")
require("prototypes.entity") -- for buildings
require("prototypes.technology")
-- require("control") -- for GUIs: