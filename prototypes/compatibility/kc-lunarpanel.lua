local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

-- add alternative recipes so the chain is used
local alt_recipe_dict = {
  ["kc-lunar-panel"] = {
    [80] = "oc-pulse-kc-lunar-panel",
    [40] = "kc-lunar-panel",
  },
  ["kc-advanced-lunar-panel"] = {
    [80] = "oc-pulse-kc-advanced-lunar-panel",
    [40] = "kc-advanced-lunar-panel",
  },
  ["kc-elite-lunar-panel"] = {
    [80] = "oc-pulse-kc-elite-lunar-panel",
    [40] = "kc-elite-lunar-panel",
  },
}
generator_api.register_category_alt_recipes("electromagnetics", alt_recipe_dict)

local casting_dict = {
  ["kc-lunar-panel"] = "electromagnetics",
  -- advanced solar panes tripple compat:
  ["kc-advanced-lunar-panel"] = "electromagnetics",
  ["kc-elite-lunar-panel"] = "electromagnetics",
  ["kc-ultimate-lunar-panel"] = "electromagnetics",
}
if mods["deadsun"] then
  -- casting_dict["kc-elite-lunar-panel"] = nil
  -- casting_dict["kc-ultimate-lunar-panel"] = nil
end
generator_api.batch_generator(casting_dict)

local recipe_tech_mapping = {
  ["oc-pulse-kc-lunar-panel"] = { "kc-lunar-energy" },
  -- advanced solar panes tripple compat:
  ["oc-pulse-kc-advanced-lunar-panel"] = { "kc-advanced-lunar-panel" },
  ["oc-pulse-kc-elite-lunar-panel"] = { "kc-elite-lunar-panel" },
  ["oc-pulse-kc-ultimate-lunar-panel"] = { "kc-ultimate-lunar-panel" },
  -- ["kc-lunar-panel-equipment"] = "kc-lunar-panel-equipment",
}
oc_tech.add_recipe_unlocks(recipe_tech_mapping)
