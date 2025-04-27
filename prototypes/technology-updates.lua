
-- add casting (item) to the (tech)
local recipe_unlocks = {
    ["casting-steam-engine"] = {"foundry"},
    ["casting-heat-pipe"] = {"nuclear-power","heating-tower"},
    ["casting-heat-exchanger"] = {"nuclear-power","heating-tower"},
    ["casting-steam-turbine"] = {"nuclear-power","heating-tower"},

    ["casting-iron-chest"] = {"foundry"},
    ["casting-steel-chest"] = {"foundry"},

    ["casting-solar-panel"] = {"solar-energy"},

    ["casting-transport-belt"] = {"logistics"},
    ["casting-underground-belt"] = {"logistics"},
    ["casting-splitter"] = {"logistics"},
    ["casting-fast-transport-belt"] = {"logistics-2"},
    ["casting-fast-underground-belt"] = {"logistics-2"},
    ["casting-fast-splitter"] = {"logistics-2"},
    ["casting-express-transport-belt"] = {"logistics-3"},
    ["casting-express-underground-belt"] = {"logistics-3"},
    ["casting-express-splitter"] = {"logistics-3"},
    ["casting-turbo-transport-belt"] = {"turbo-transport-belt"},
    ["casting-turbo-underground-belt"] = {"turbo-transport-belt"},
    ["casting-turbo-splitter"] = {"turbo-transport-belt"},

    -- ["lds-space-platform-foundation"] = {"rocket-silo"},
    ["tungsten-space-platform-foundation"] = {"rocket-silo"},
    ["casting-tungsten-space-platform-foundation"] = {"rocket-silo"},

    ["casting-car"] = {"automobilism"},
    ["casting-tank"] = {"tank"},
  }
  add_recipe_unlocks(recipe_unlocks)