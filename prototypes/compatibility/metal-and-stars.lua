local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

-- changing crafting category (making thins able in foundry and EM plant)
local mapping = {
    ["antimatter-logistic-bot"] = "electronics",
    ["antimatter-construction-bot"] = "electronics",
}
oc_helper.change_multiple_crafting_category(mapping)