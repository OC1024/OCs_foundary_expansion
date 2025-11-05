-- require("prototypes/entity-updates")
-- require("prototypes/item-updates")
-- require("prototypes.recipe-updates")
-- require("prototypes.technology-updates")

-- quick debugging
require("__OCs_base_assets__.prototypes.utils.helper")
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

if mods["aai-industry"] then
    require("prototypes.compatibility.aai-industry")
end

if mods["Krastorio2-spaced-out"] then -- replaces normal Krastorio2 with space-age compatible version
    require("__OCs_base_assets__.prototypes.compatibility.Krastorio2")
    require("prototypes.compatibility.Krastorio2")
end

if mods["aai-containers"] then
    require("prototypes.compatibility.aai-containers")
end

if mods["factorissimo-2-notnotmelon"] then
    require("prototypes.compatibility.factorissimo")
end

if mods["elevated-pipes"] then
    require("prototypes.compatibility.elevated-pipes")
end