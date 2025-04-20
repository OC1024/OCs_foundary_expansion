
-- add casting (item) to the (tech)
local recipe_unlocks = {
    ["casting-heat-pipe"] = {"nuclear-power","heating-tower"},
    ["casting-heat-exchanger"] = {"nuclear-power","heating-tower"},
    ["casting-steam-turbine"] = {"nuclear-power","heating-tower"},
    ["casting-steel-chest"] = {"steel-processing"},
    ["casting-iron-chest"] = {"foundry"},
    -- ["casting-stone-furnace"] = {"advanced-material-processing"},
    -- ["casting-steel-furnace"] = {"advanced-material-processing"},
    ["casting-solar-panel"] = {"solar-energy"},
    ["casting-transport-belt"] = {"logistics"},
    ["casting-underground-belt"] = {"logistics"},
    ["casting-fast-transport-belt"] = {"logistics-2"},
    ["casting-fast-underground-belt"] = {"logistics-2"},
    -- ["lds-space-platform-foundation"] = {"rocket-silo"},
    ["tungsten-space-platform-foundation"] = {"rocket-silo"},
  }
  add_recipe_unlocks(recipe_unlocks)