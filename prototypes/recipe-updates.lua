-- used for testing the casting-generator
local casting_dict = {
  -- basic transporotation 
  ["transport-belt"] = "metallurgy",
  ["underground-belt"] = "metallurgy",
  ["splitter"] = "metallurgy",
  ["fast-transport-belt"] = "metallurgy",
  ["fast-underground-belt"] = "metallurgy",
  ["fast-splitter"] = "metallurgy",
  ["express-transport-belt"] = "metallurgy",
  ["express-splitter"] = "metallurgy",
  ["express-underground-belt"] = "metallurgy",
  ["turbo-transport-belt"] = "metallurgy",
  ["turbo-splitter"] = "metallurgy",
  ["turbo-underground-belt"] = "metallurgy",
  -- fluid handling
  ["pump"] = "metallurgy",
  ["storage-tank"] = "metallurgy",
  ["barrel"] = "metallurgy",
  -- heating
  ["steam-engine"] = "metallurgy",
  ["heat-exchanger"] = "metallurgy",
  ["heat-pipe"] = "metallurgy",
  ["steam-turbine"] = "metallurgy",
  -- buildings
  ["solar-panel"] = "metallurgy",
  ["steel-furnace"] = "metallurgy",
  ["steel-chest"] = "metallurgy",
  ["iron-chest"] = "metallurgy",
  -- ["coal-liquefaction"] = "oil-refining", -- should be blacklisted by category
  -- ["plastic-bar"] = "chemistry", -- blacklisted by item and/or category
  -- ["solid-fuel-from-light-oil"] = "crafting-with-fluid", -- blacklisted by ingredients
  ["tungsten-space-platform-foundation"] = "metallurgy",

  ["car"] = "metallurgy",
  ["tank"] = "metallurgy",
}
batch_generator(casting_dict)