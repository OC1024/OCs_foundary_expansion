-- used for testing the casting-generator
local casting_list = {
  "transport-belt",
  "underground-belt",
  "splitter",
  "fast-transport-belt",
  "fast-underground-belt",
  "fast-splitter",
  "express-transport-belt",
  "express-splitter",
  "express-underground-belt",
  "turbo-transport-belt",
  "turbo-splitter",
  "turbo-underground-belt",

  "steam-engine",
  "heat-exchanger",
  "heat-pipe",
  "steam-turbine",

  "solar-panel",
  "steel-furnace",
  "steel-chest",
  "iron-chest",
  -- "coal-liquefaction", -- should be blacklisted by category
  -- "plastic-bar", -- blacklisted by item and/or category
  -- "solid-fuel-from-light-oil", -- blacklisted by ingredients
  "tungsten-space-platform-foundation",

  "car",
  "tank",
  -- extend as needed
}
batch_generator(casting_list)