local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

-- custom base recipes
data:extend({
  { -- foundry lithium plate
    type = "recipe",
    name = "forging-lithium-plate",
    icons = {
      {
        icon = "__space-age__/graphics/icons/lithium-plate.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-foundry.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    categories = {"metallurgy"},
    enabled = false,
    hide_from_player_crafting = true,
    energy_required = 6.4,
    ingredients = {
      { type = "item", name = "lithium", amount = 1 },
    },
    results = {
      { type = "item", name = "lithium-plate", amount = 1 }
    },
    allow_productivity = true,
  },
  { -- freezing water to ice
    type = "recipe",
    name = "freezing-water",
    icons = {
      {
        icon = "__space-age__/graphics/icons/ice.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-cryo-plant.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    categories = {"cryogenics"},
    subgroup = "fluid-recipes",
    order = "d[other-chemistry]-d[water-freezing]",
    enabled = false, -- either free or with "cryogenic-plant"
    hide_from_player_crafting = true,
    energy_required = 1,
    ingredients = {
      { type = "fluid", name = "water", amount = 20 },
    },
    results = {
      { type = "item", name = "ice", amount = 1 }
    },
    allow_productivity = false,
    allow_decomposition = false,
    auto_recycle = false,
  }
})

data:extend({
  --[[
  -- { -- LDS space platform
  --   type = "recipe",
  --   name = "lds-space-platform-foundation",
  --   categories = { "metallurgy", "crafting-with-fluid" }
  --   subgroup = "space-related",
  --   order = "a[space-platform-foundation]-b[lds]",
  --   icons = {
  --     {
  --       icon = "__space-age__/graphics/icons/space-platform-foundation.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__base__/graphics/icons/light-density-structure.png",
  --       icon_size = 64,
  --       icon_mipmaps = 4,
  --       icon_scale = 0.5,
  --       icon_shift = {8,8},
  --     }
  --   },
  --   enabled = false,
  --   energy_required = 20,
  --   ingredients = {
  --     {type = "item", name = "low-density-structure", amount = 1},
  --     {type = "item", name = "steel-plate", amount = 20},
  --   },
  --   results = {
  --     {type = "item", name = "space-platform-foundation", amount = 2}
  --   },
  -- },
  --]]
  { -- LDS+tungsten space platform foundation
    type = "recipe",
    name = "tungsten-space-platform-foundation",
    categories = { "crafting-with-fluid", "metallurgy" },
    -- subgroup = "space-related",
    -- order = "a[space-platform-foundation]-c[tungsten]",
    icons = {
      {
        icon = "__space-age__/graphics/icons/space-platform-foundation.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-tungsten-plate-shifted.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "item", name = "low-density-structure", amount = 1 },
      { type = "item", name = "tungsten-plate",        amount = 10 },
    },
    results = {
      { type = "item", name = "space-platform-foundation", amount = 2 }
    },
    allow_decomposition = false,
    allow_productivity = false,
    auto_recycle = false,
    -- show_amount_in_title = false,
  },
  { -- casting normal space platform foundation
    type = "recipe",
    name = "oc-casting-space-platform-foundation",
    categories = { "metallurgy" },
    -- subgroup = "space-related",
    -- order = "a[space-platform-foundation]-c[tungsten]",
    icons = {
      {
        icon = "__space-age__/graphics/icons/space-platform-foundation.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-copper-shifted.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "fluid", name = "molten-iron",   amount = 600 },
      { type = "fluid", name = "molten-copper", amount = 100 },
    },
    results = {
      { type = "item", name = "space-platform-foundation", amount = 1 }
    },
    allow_decomposition = false,
    allow_productivity = false,
    auto_recycle = false,
  },
})

 -- buildings
data:extend({
  { -- advanced-foundry"
    type = "recipe",
    name = "advanced-foundry",
    categories = { "metallurgy" },
    group = "production",
    subgroup = "smelting-machine",
    order = "d[foundry]-a",
    -- order = "z-c",
    icon = "__OCs_foundary_expansion__/graphics/icons/advanced-foundry-icon.png",
    icon_size = 64, -- icon_mipmaps = 4
    enabled = false,
    energy_required = 30,
    surface_conditions = { -- Vulcanus only
      {
        property = "pressure",
        min = 4000,
        max = 4000
      }
    },
    ingredients = {
      { type = "fluid", name = "molten-iron",      amount = 300 },
      { type = "item",  name = "refined-concrete", amount = 20 },
      { type = "item",  name = "advanced-circuit", amount = 40 },
      { type = "item",  name = "tungsten-plate",   amount = 25 },
      { type = "item",  name = "foundry",          amount = 1 },
    },
    results = {
      { type = "item", name = "advanced-foundry", amount = 1 }
    },
    allow_productivity = false,
    allow_decomposition = true,
  },
})

-- change crafting category to allow foundry, EM-plant or whatever
local category_mapping = {
  -- energy and fluid handling
  ["pump"] = { "metallurgy" },
  ["offshore-pump"] = { "metallurgy" },
  ["storage-tank"] = { "metallurgy" },
  ["steam-engine"] = { "metallurgy" },
  ["steam-turbine"] = { "metallurgy" },
  ["heat-pipe"] = { "metallurgy" },
  ["heat-exchanger"] = { "metallurgy" },
  -- mining
  ["burner-mining-drill"] = { "metallurgy" },
  ["electric-mining-drill"] = { "metallurgy" }, -- or {"electromagnetics"}
  -- production buildings
  ["assembling-machine-1"] = { "electromagnetics" },
  ["assembling-machine-2"] = { "electromagnetics" },
  ["assembling-machine-3"] = { "electromagnetics" },
  ["electric-furnace"] = { "metallurgy" },
  -- intermediates
  ["engine-unit"] = { "metallurgy" },  -- non-electric engine. no handcrafting
  ["electric-engine-unit"] = { "electromagnetics" }, -- electric engine
  -- ["lithium-plate"] = "metallurgy-or-smelting", -- category does not exist
  ["battery"] = {"electromagnetics"}, -- cheesy such that akkumulator can be directly crafted in EMplant, too
  -- space
  ["space-platform-foundation"] = { "metallurgy" },
  -- logistics - robots
  ["roboport"] = { "electromagnetics" },
  ["flying-robot-frame"] = { "electromagnetics" },
  ["logistic-robot"] = { "electromagnetics" },
  ["construction-robot"] = { "electromagnetics" },
  -- logistics - chests
  ["iron-chest"] = { "metallurgy" },
  ["steel-chest"] = { "metallurgy" },
  ["requester-chest"] = { "electromagnetics" },
  ["active-provider-chest"] = { "electromagnetics" },
  ["passive-provider-chest"] = { "electromagnetics" },
  ["storage-chest"] = { "electromagnetics" },
  ["buffer-chest"] = { "electromagnetics" },
  -- logistics - inserters
  ["burner-inserter"] = { "electromagnetics" },
  ["inserter"] = { "electromagnetics" },
  ["long-handed-inserter"] = { "electromagnetics" },
  ["fast-inserter"] = { "electromagnetics" },
  ["bulk-inserter"] = { "electromagnetics" },
  ["stack-inserter"] = { "electromagnetics" },
  -- logistics - combinators
  ["small-lamp"] = { "electromagnetics" },
  ["arithmetic-combinator"] = { "electromagnetics" },
  ["decider-combinator"] = { "electromagnetics" },
  ["selector-combinator"] = { "electromagnetics" },
  ["constant-combinator"] = { "electromagnetics" },
  ["power-switch"] = { "electromagnetics" },
  ["programmable-speaker"] = { "electromagnetics" },
  ["display-panel"] = { "electromagnetics" },
  -- switchbutton mod
  ["switchbutton"] = { "electromagnetics" },
  ["switchbutton2"] = { "electromagnetics" },
  -- logistics others
  -- ["foundation"] = {"metallurgy"}, -- to cheaty? I rather want them to use my other recipe


  -- Space
  ["space-platform-hub"] = { "electromagnetics" },
  ["cargo-bay"] = { "electromagnetics" },
  ["landing-pad-unloading-bay"] = { "electromagnetics" },
  ["asteroid-collector"] = { "electromagnetics" },
  ["crusher"] = { "electromagnetics" },
  ["thruster"] = { "electromagnetics" },


  -- civil equipment
  ["toolbelt-equipment"] = { "electromagnetics" },
  ["nightvision-equipment"] = { "electromagnetics" },
  ["exoskeleton-equipment"] = { "electromagnetics" },
  ["personal-roboport-equipment"] = { "electromagnetics" },
  ["personal-roboport-mk2-equipment"] = { "electromagnetics" },
  ["solar-panel-equipment"] = { "electromagnetics" },
  ["fission-reactor-equipment"] = { "electromagnetics" },
  ["fusion-reactor-equipment"] = { "electromagnetics" },
  ["battery-equipment"] = { "electromagnetics" },
  ["battery-mk2-equipment"] = { "electromagnetics" },
  ["battery-mk3-equipment"] = { "electromagnetics" },
  -- military equipment
  ["laser-turret"] = { "electromagnetics" },
  ["discharge-defence-equipment"] = { "electromagnetics" },
  ["energy-shield-equipment"] = { "electromagnetics" },
  ["energy-shield-mk2-equipment"] = { "electromagnetics" },
  ["personal-laser-defense-equipment"] = { "electromagnetics" },
  -- battle bots
  ["defender-capsule"] = { "electromagnetics" },
  ["distractor-capsule"] = { "electromagnetics" },
  ["destroyer-capsule"] = { "electromagnetics" },
  -- armor
  ["light-armor"] = { "metallurgy" },
  ["heavy-armor"] = { "metallurgy" },
  ["modular-armor"] = { "electromagnetics" },
  ["power-armor"] = { "electromagnetics" },
  ["power-armor-mk2"] = { "electromagnetics" },
  ["mech-armor"] = { "electromagnetics" },
}
oc_recipe.add_multiple_crafting_category(category_mapping)


-- create new recipes for foundry, EMplant, etc.
local new_recipes_dict = {
  ["lab"] = "electromagnetics",
  -- production
  ["burner-mining-drill"] = "metallurgy",
  ["electric-mining-drill"] = "metallurgy",
  ["pumpjack"] = "metallurgy",
  ["assembling-machine-1"] = "electromagnetics",
  ["assembling-machine-2"] = "electromagnetics",
  ["assembling-machine-3"] = "electromagnetics",
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
  ["offshore-pump"] = "metallurgy",
  ["pump"] = "metallurgy",
  ["storage-tank"] = "metallurgy",
  ["barrel"] = "metallurgy",
  ["pipe-to-ground"] = "metallurgy",
  -- heating and power
  ["heating-tower"] = "metallurgy",
  ["steam-engine"] = "metallurgy",
  ["heat-exchanger"] = "metallurgy",
  ["heat-pipe"] = "metallurgy",
  ["steam-turbine"] = "metallurgy",
  ["boiler"] = "metallurgy",
  -- energy distribution
  ["small-electric-pole"] = "electromagnetics",
  ["medium-electric-pole"] = "electromagnetics",
  ["big-electric-pole"] = "electromagnetics",
  ["substation"] = "electromagnetics",
  ["solar-panel"] = "electromagnetics",
  ["accumulator"] = "electromagnetics", -- useless as the battery is chemistry. "fixed" that
  -- logistics - combinators
  ["small-lamp"] = "electromagnetics",
  ["arithmetic-combinator"] = "electromagnetics",
  ["decider-combinator"] = "electromagnetics",
  ["selector-combinator"] = "electromagnetics",
  ["constant-combinator"] = "electromagnetics",
  ["power-switch"] = "electromagnetics",
  ["programmable-speaker"] = "electromagnetics",
  ["display-panel"] = "electromagnetics",
  -- other buildings
  ["radar"] = "electromagnetics",
  -- item storage
  ["iron-chest"] = "metallurgy",
  ["steel-chest"] = "metallurgy",

  -- intermediates
  ["engine-unit"] = "metallurgy",
  ["electric-engine-unit"] = "electromagnetics",
  -- space related
  -- ["space-platform-foundation"] = "metallurgy", -- manually created because same item is casted differently
  ["tungsten-space-platform-foundation"] = "metallurgy",
  -- testing
  -- ["coal-liquefaction"] = "oil-refining", -- should be blacklisted by category
  -- ["plastic-bar"] = "chemistry", -- blacklisted by item and/or category
  -- ["solid-fuel-from-light-oil"] = "crafting-with-fluid", -- blacklisted by ingredients

  -- vehicles
  ["locomotive"] = "metallurgy",
  ["cargo-wagon"] = "metallurgy",
  ["fluid-wagon"] = "metallurgy",
  ["car"] = "metallurgy",
  ["tank"] = "metallurgy",

  -- Space
  -- ["space-platform-hub"] = "metallurgy",
  -- ["cargo-bay"] = "electromagnetics",
  -- ["asteroid-collector"] = "electromagnetics",
}
generator_api.batch_generator(new_recipes_dict)