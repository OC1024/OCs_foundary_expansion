-- reuse code, graphics and sounds from the base game and space-age DLC
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({    
  { -- advanced foundry
    type = "item",
    name = "advanced-foundry",
    icon = "__OCs_foundary_expansion__/graphics/icons/advanced-foundry-icon.png", -- advanced foundry by Hurricane
    icon_size = 64, --icon_mipmaps = 4,
    group = "production",
    subgroup = "smelting-machine",
    order = "d[foundry]-a",
    stack_size = 5,
    default_import_location = "vulcanus",
    weight = 250 * kg, -- normal foundry 200, want to be 400 here
    place_result = "advanced-foundry",
  },
})

-- change crafting category (previously  with "foundry-expanded" and "electromagnetic-plant-expanted", now fully integrated)
local mapping = {
  -- energy and fluid handling
  ["pump"] =  "pressing",
  ["offshore-pump"] =  "pressing",
  ["storage-tank"] =  "pressing",
  ["steam-engine"] = "pressing",
  ["steam-turbine"] = "pressing",
  ["heat-pipe"] = "pressing",
  ["heat-exchanger"] = "pressing",
  -- mining
  ["electric-mining-drill"] = "pressing",
  -- intermediates
  ["engine-unit"] = "metallurgy-or-assembling", -- big non-electric engine
  ["electric-engine-unit"] = "electronics-or-assembling", -- big electric engine
  -- ["lithium-plate"] = "metallurgy-or-smelting", -- category does not exist
  -- space
  ["space-platform-foundation"] = "pressing",
  -- logistics - robots
  ["roboport"] = "electronics",
  ["flying-robot-frame"] = "electronics",
  ["logistic-robot"] = "electronics",
  ["construction-robot"] = "electronics",
  -- logistics - chests
  ["iron-chest"] = "pressing",
  ["steel-chest"] = "pressing",
  ["requester-chest"] = "electronics",
  ["active-provider-chest"] = "electronics",
  ["passive-provider-chest"] = "electronics",
  ["storage-chest"] = "electronics",
  ["buffer-chest"] = "electronics",
  -- logistics - inserters
  ["burner-inserter"] = "electronics",
  ["inserter"] = "electronics",
  ["long-handed-inserter"] = "electronics",
  ["fast-inserter"] = "electronics",
  ["bulk-inserter"] = "electronics",
  ["stack-inserter"] = "electronics",
  -- logistics - combinators
  ["small-lamp"] = "electronics",
  ["arithmetic-combinator"] = "electronics",
  ["decider-combinator"] = "electronics",
  ["selector-combinator"] = "electronics",
  ["constant-combinator"] = "electronics",
  ["power-switch"] = "electronics",
  ["programmable-speaker"] = "electronics",
  ["display-panel"] = "electronics",
  ["switchbutton"] = "electronics",
  ["switchbutton2"] = "electronics",
  -- logistics others
  ["foundation"] = "crafting-with-fluid-or-metallurgy",
  -- civil equipment
  ["exoskeleton-equipment"] = "electronics",
  ["personal-roboport-equipment"] = "electronics",
  ["personal-roboport-mk2-equipment"] = "electronics",
  ["solar-panel-equipment"] = "electronics",
  ["fission-reactor-equipment"] = "electronics",
  ["fusion-reactor-equipment"] = "electronics",
  ["battery-equipment"] = "electronics",
  ["battery-mk2-equipment"] = "electronics",
  ["battery-mk3-equipment"] = "electronics",
  -- military equipment
  ["laser-turret"] = "electronics",
  ["energy-shield-equipment"] = "electronics",
  ["energy-shield-mk2-equipment"] = "electronics",
  ["personal-laser-defense-equipment"] = "electronics",
  -- battle bots
  ["defender-capsule"] = "electronics",
  ["distractor-capsule"] = "electronics",
  ["destroyer-capsule"] = "electronics",
  -- armor
  ["light-armor"] = "pressing",
  ["heavy-armor"] = "pressing",
  ["modular-armor"] = "electronics",
  ["power-armor"] = "electronics",
  ["power-armor-mk2"] = "electronics",
  ["mech-armor"] = "electronics",
}
change_multiple_crafting_category(mapping)