local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

local casting_dict = {
  -- ["lead-plate"] = "metallurgy", -- base material, should be stay the same or be rejected
  -- ["lead-expansion-bolt"] = "metallurgy", -- testing consistency: already exist. expect 50:50 molten-lead:molten-iron for 10 bolts
  ["lead-chest"] = "metallurgy",
  ["lithium-lead-eutectic"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)

local mapping = {                                              -- it seems that lead is a early game material so casting shall be ASAP.
  ["oc-casting-lead-expansion-bolt"] = { "foundry" },          -- to be sure it is there as the mod wants it.
  ["oc-casting-lead-chest"] = { "foundry" },                   -- base item instantly craftable but casting still needs the foundry to be useful. avoid cluttering
  ["oc-casting-lithium-lead-eutectic"] = { "fusion-reactor" }, -- this should be moved to another mod, not the ammo mod but eh, who cares?
}
oc_tech.add_recipe_unlocks(mapping)
