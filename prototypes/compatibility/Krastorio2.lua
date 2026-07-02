local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

-- changing crafting category (making thins able in foundry and EM plant)
local mapping = {
  -- intermediates
  ["kr-automation-core"] = "metallurgy", -- instead of electronics
  -- ["kr-lithium-plate"]  = "metallurgy-or-smelting",
  ["kr-matter-stabilizer"] = "electromagnetics",
  -- logistics
  ["kr-superior-inserter"] = "electromagnetics",
  ["kr-superior-long-inserter"] = "electromagnetics",
  -- buildings
  ["kr-advanced-assembling-machine"] = "electromagnetics",
  -- equipment
  ["kr-energy-shield-mk3-equipment"] = "electromagnetics",
  ["kr-energy-shield-mk4-equipment"] = "electromagnetics",
  ["kr-advanced-exoskeleton-equipment"] = "electromagnetics",
  ["kr-superior-exoskeleton-equipment"] = "electromagnetics",
  ["kr-superior-nightvision-equipment"] = "electromagnetics",
  ["kr-personal-laser-defence-mk2-equipment"] = "electromagnetics",
  ["kr-personal-laser-defence-mk3-equipment"] = "electromagnetics",
  ["kr-personal-laser-defence-mk4-equipment"] = "electromagnetics",
  ["kr-fusion-reactor-equipment"] = "electromagnetics",
  ["kr-antimatter-reactor-equipment"] = "electromagnetics",
}
oc_recipe.add_multiple_crafting_category(mapping)

-- change my lithium recipe
oc_recipe.replace_ingredient("forging-lithium-plate", "item", "lithium", "item", "kr-lithium")
if mods["metall-and-stars"] then
  -- hotfix metal and stars lithium output
  -- replace_result("mirandite-processing","item","lithium","item","kr-lithium")
  -- just in case this didn't work
  -- add_result("mirandite-processing","item","kr-lithium",1)
  -- or we create a recipe to switch one to the other
  data:extend({
    { -- lithium conversion
      type = "recipe",
      name = "lithium-conversion",
      energy_required = 1,
      category = "pressing",
      icons = {
        {
          icon = "__space-age__/graphics/icons/lithium.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-foundry.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      ingredients = {
        { type = "item", name = "lithium", amount = 10 },
      },
      results = {
        { type = "item", name = "kr-lithium", amount = 10 }
      },
      enabled = true, -- for dirty quick hack
      allow_decomposition = false,
      allow_productivity = false,
      auto_recycle = false,
    }
  })
end

-- generate new recipes
local casting_dict = {
  -- intermetiates
  -- ["kr-iron-gear"] = "metallurgy",
  ["kr-blank-tech-card"] = "electromagnetics", -- category: electronics
  ["kr-automation-core"] = "metallurgy",       -- category: electronics (see change above)
  ["kr-inserter-parts"] = "metallurgy",
  -- imersium intermetiates
  ["kr-imersium-plate"] = "metallurgy",
  ["kr-imersium-beam"] = "metallurgy",
  ["kr-imersium-gear-wheel"] = "metallurgy",
  -- kr-logistic-5 (purple belts)
  -- ["kr-superior-transport-belt"] = "metallurgy",
  -- ["kr-superior-underground-belt"] = "metallurgy",
  -- ["kr-superior-splitter"] = "metallurgy",
  --  high-tech
  ["kr-advanced-assembling-machine"] = "electromagnetics",
  ["kr-empty-dt-fuel-cell"] = "electromagnetics",
  ["kr-matter-stabilizer"] = "electromagnetics",
  ["kr-teleportation-gps-module"] = "electromagnetics",
}
generator_api.batch_generator(casting_dict)


-- Add Recipes to Techs
local recipe_tech_mapping = {
  ["oc-pulse-kr-blank-tech-card"] = { "electromagnetic-plant" }, -- or "automation-science-pack" or free
  ["oc-casting-kr-automation-core"] = { "foundry" },             -- or "kr-automation-core" tech
  ["oc-casting-kr-inserter-parts"] = "foundry",
  -- imersium intermediates
  ["oc-casting-kr-imersium-beam"] = { "kr-imersium-processing" },
  ["oc-casting-kr-imersium-gear-wheel"] = { "kr-imersium-processing" },
  -- kr-logistic-5 (purple belts)
  ["oc-casting-kr-superior-transport-belt"] = { "kr-logistic-5" },
  ["oc-casting-kr-superior-underground-belt"] = { "kr-logistic-5" },
  ["oc-casting-kr-superior-splitter"] = { "kr-logistic-5" },
  -- high-tech
  ["oc-pulse-kr-advanced-assembling-machine"] = { "kr-automation" },
  ["oc-pulse-kr-empty-dt-fuel-cell"] = { "kr-fusion-energy" },
  ["kr-matter-stabilizer"] = "kr-matter-processing",
  ["kr-teleportation-gps-module"] = "kr-planetary-teleporter",
}
oc_tech.add_recipe_unlocks(recipe_tech_mapping)
