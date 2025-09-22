
-- register new alt recipes 
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
generator_api.register_single_alt_recipe("metallurgy","space-platform-foundation",{"tungsten-space-platform-foundation", "space-platform-foundation"})

-- debug_log("Alt recipes for metallurgy:".. serpent.block(generator_api.rules_table["metallurgy"].alternative_recipes), generator_api) -- debug for finding hen the table gets overwritten