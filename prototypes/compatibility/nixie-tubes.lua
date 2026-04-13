
local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

local mapping = {
    ["nixie-tube"] = "electromagnetics",
    ["nixie-tube-alpha"] = "electromagnetics",
    ["nixie-tube-small"] = "electromagnetics",
}
oc_helper.change_multiple_crafting_category(mapping)