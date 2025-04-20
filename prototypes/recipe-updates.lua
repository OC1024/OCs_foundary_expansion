-- used for testing the casting-generator
local whitelist = {
  "transport-belt",
  "underground-belt",
  "fast-transport-belt",
  "fast-underground-belt",
  "heat-exchanger",
  "heat-pipe",
  "steam-turbine",
  -- "cannon-shell",
  "solar-panel",
  "steel-furnace",
  "steel-chest",
  "iron-chest",
  "coal-liquefaction", -- should be blacklisted by category
  "plastic-bar", -- blacklisted by item and/or category
  "solid-fuel-from-light-oil", -- blacklisted by ingredients
  "tungsten-carbide", -- all inputs are blacklisted or native liquid
  -- "tungsten-space-platform-foundation"
  -- extend as needed
}
batch_generate_castings(whitelist)
