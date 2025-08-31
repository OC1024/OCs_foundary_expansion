data.raw["recipe"]["engine-unit"].category = "metallurgy-or-assembling"  -- use this as hotfix of the mod "foundry-expanded"

-- require("prototypes/entity-updates")
-- require("prototypes/item-updates")
-- require("prototypes.recipe-updates")
-- require("prototypes.technology-updates")

-- quick debugging
require("__OCs_base_assets__.prototypes.utils.helper")
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

if mods["aai-containers"] then
    require("prototypes.compatibility.aai-containers")
end

if mods["Krastorio2-spaced-out"] then -- replaces normal Krastorio2 with space-age compatible version
    require("__OCs_base_assets__.prototypes.compatibility.Krastorio2")
    require("prototypes.compatibility.Krastorio2")
end