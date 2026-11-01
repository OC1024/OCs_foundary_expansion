local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

local zinc_tint = { r = 0.7, g = 0.7, b = 0.8 }
local zinc_color = { 0.3, 0.3, 0.5 }
local three_fluids = not settings.startup["supress-extra-fluid-limit"].value

-- custom OC recipe by hand IF advanced foundry + 3 inputs
-- Base recipe name: "casting-galvanized-steel-plate"
-- to make it a bit more spicy, maybe add slightly annoying byproducts?
data:extend({
  {
    type = "fluid",
    name = "molten-zinc",
    subgroup = "fluid",
    default_temperature = 420, -- 419.53 melting  point of zinc
    gas_temperature = 907,     -- boiling point of zinc
    icons = {
      {
        icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
        icon_size = 64,
        icon_mipmaps = 4,
        tint = zinc_tint,
      },
    },
    base_color = zinc_color,
    flow_color = zinc_color,
    auto_barrel = false
  },
  {
    type = "recipe",
    name = "molten-zinc-from-zinc-solution",
    subgroup = "paracelsin-processes",
    icons = {
      {
        icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
        icon_size = 64,
        icon_mipmaps = 4,
        tint = zinc_tint,
      },
      {
        icon = "__Paracelsin-Graphics__/graphics/icons/zinc-ore.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.5,
        shift = { 0, 8 },
      },
    },
    enabled = false,
    categories = { "metallurgy" },
    energy_required = 6.4,
    ingredients = {
      { type = "fluid", name = "zinc-solution", amount = 20 },
      { type = "fluid", name = "heavy-oil",     amount = 20 },
    },
    results = {
      { type = "fluid", name = "molten-zinc", amount = 20 },
    },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "zinc-plate-from-molten-zinc",
    -- subgroup = "paracelsin-processes",
    icons = {
      {
        icon = "__Paracelsin-Graphics__/graphics/icons/zinc-plate.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
        icon_size = 64,
        icon_mipmaps = 4,
        tint = zinc_tint,
        scale = 0.25,
        shift = { 8, -8 },
      },
    },
    enabled = false,
    categories = { "metallurgy" },
    energy_required = 3.2,
    ingredients = {
      { type = "fluid", name = "molten-zinc", amount = 20 },
    },
    results = {
      { type = "item", name = "zinc-plate", amount = 2 },
    },
  }
})

-- Add/Change order of Alternative Receptes
local alternatives = {
  ["zinc-plate"] = {
    [40] = "zinc-plate-from-molten-zinc", -- 1 fluid input
    [20] = "zinc-plate",                  -- standard recipe with 2 fluid inputs
  },
}
generator_api.unregister_item_blacklist("metallurgy", "zinc-plate") -- now obviously allowed

if three_fluids then
  data:extend({
    {
      type = "recipe",
      name = "oc-casting-galvanized-steel-plate",
      -- subgroup = "paracelsin-processes",
      localised_name = { "recipe-name.casting-galvanized-steel-plate" },
      icons = {
        {
          icon = "__Paracelsin-Graphics__/graphics/icons/galvanized-steel-plate.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
          icon_size = 64,
          icon_mipmaps = 4,
          tint = zinc_tint,
          scale = 0.25,
          shift = { 8, -8 },
        },
      },
      enabled = false,
      categories = { "metallurgy" },
      energy_required = 12,
      ingredients = {
        { type = "fluid", name = "molten-zinc", amount = 20 },
        { type = "fluid", name = "molten-iron", amount = 150 },
        { type = "fluid", name = "nitrogen",    amount = 20 },
        { type = "item",  name = "carbon",      amount = 2 },
      },
      results = {
        { type = "item", name = "galvanized-steel-plate", amount = 5 },
      },
      allow_productivity = true,
    },
  })
  -- add alt recipes to rule set
  alternatives["galvanized-steel-plate"] = {
    [40] = "oc-casting-galvanized-steel-plate", -- 3 fluid inputs
    [20] = "casting-galvanized-steel-plate",    -- standard recipe with 2 fluid inputs
  }
  generator_api.unregister_item_blacklist("metallurgy", "galvanized-steel-plate") -- allow casting of galvanized steel plate
end
generator_api.register_category_alt_recipes("metallurgy", alternatives)

-- generate new recipes
local casting_dict = {
  -- zinc items
  -- ["zinc-plate"] = "metallurgy", -- if not yet existing
  ["zinc-rivets"] = "metallurgy",
  ["zinc-solder"] = "metallurgy",
  -- ["electric-coil"] = "metallurgy",
  -- ["advanced-repair-device"] = "metallurgy", -- that's very advanced but castable
  -- advanced: zinc pipe casting (recipes are too weird and slightly inconsistent to be auto-generated)
  -- ["zinc-pipe"] = "metallurgy",
  -- ["zinc-pipe-to-ground"] = "metallurgy",
  -- ["zinc-storage-tank"] = "metallurgy",
  -- ["zinc-pump"] = "metallurgy",
}
if mods["elevated-pipes"] then
  casting_dict["elevated-pipe"] = "metallurgy" -- recalculate
end
generator_api.batch_generator(casting_dict)

-- Add Recipes to Techs
local recipe_tech_mapping = {
  ["zinc-extraction"] = {
    "oc-casting-zinc-plate",
    "oc-casting-zinc-rivets",
    "oc-casting-zinc-solder",
    "zinc-plate-from-molten-zinc",
    "molten-zinc-from-zinc-solution",
  },
  -- ["mechanical-plant"] = "oc-casting-electric-coil",
  ["galvanized-steel"] = "oc-casting-galvanized-steel-plate",
  -- ["advanced-repair-device"] = "oc-casting-advanced-repair-device",
  -- advanced: zinc pipe casting
  -- ["zinc-piping"] = {
  --   "oc-casting-zinc-pipe",
  --   "oc-casting-zinc-pipe-to-ground",
  --   "oc-casting-zinc-storage-tank",
  --   "oc-casting-zinc-pump",
  -- },
}
oc_tech.add_tech_unlocks(recipe_tech_mapping)
