local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

-- if mods["Krastorio2-spaced-out"] then
-- for _, recipe in pairs(data.raw.recipe) do
--     local function swap(ingredients)
--       if not ingredients then return end
--       for _, ing in pairs(ingredients) do
--         -- ingredient formats can be {name=..., amount=...} or {"name", amount}
--         if ing.name == "glass" then
--           ing.name = "kr-glass"
--         elseif ing[1] == "glass" then
--           ing[1] = "kr-glass"
--         end
--       end
--     end
--     swap(recipe.ingredients)
--     swap(recipe.results)
--   end

--   -- optional: hide the unusable item
--   if data.raw.item["glass"] and data.raw.item["kr-glass"] then
--     data.raw.item["glass"].hidden = true
--   end
-- end

if mods["ch-concentrated-solal"] and mods["Krastorio2-spaced-out"] then
  oc_recipe.replace_ingredient(data.raw.recipe["heliostat-mirror"], "item", "glass", "item", "kr-glass")
end

if mods["maraxsis"] then
  data:extend({
    {
      type = "recipe",
      name = "fake-electric-engine-unit",
      localised_name = { "recipe-name.electric-engine-unit" },
      icons = {
        {
          icon = "__base__/graphics/icons/electric-engine-unit.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-em-plant.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      categories = { "electromagnetics" },
      enabled = false,
      energy_required = 10,
      ingredients = {
        { type = "item",  name = "engine-unit",        amount = 1 },
        { type = "item",  name = "electronic-circuit", amount = 2 },
        { type = "fluid", name = "lubricant",          amount = 15 },
      },
      results = {
        { type = "item", name = "electric-engine-unit", amount = 1 },
      },
      allow_productivity = true,
    }
  })
  oc_tech.add_recipe_unlocks({
    ["fake-electric-engine-unit"] = "electric-engine",
  })
end

local vulcanus = false
-- Any Planet Start
if mods["any-planet-start"] then
    vulcanus = settings.startup["aps-planet"].value == "vulcanus"
end
-- Planet Picker
if not vulcanus and mods["planet-picker"] then
    vulcanus = settings.startup["oc-pp-vulcanus"].value
end
-- in either case, extra patch recipe for lazy OC
if vulcanus then
  data:extend({
    { -- sulfur from sulfuric acid
      type = "recipe",
      name = "sulfur-from-sulfuric-acid",
      icons = {
        {
          icon = "__base__/graphics/icons/sulfur.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
          icon_size = 64,
          icon_mipmaps = 4,
          scale = 0.25,
          shift = { 8, 8 },
        }
      },
      categories = { "chemistry", "cryogenics" },
      subgroup = "raw-material",
      order = "b[chemistry]-c[sulfur]-a[alternative]",
      enabled = false,
      energy_required = 2,
      ingredients = {
        { type = "fluid", name = "sulfuric-acid", amount = 100 },
      },
      results = {
        { type = "item",  name = "sulfur", amount = 5 },
        { type = "fluid", name = "water",  amount = 50, ignored_by_stats = 50 },
      },
      allow_productivity = false,
      auto_recycle = false,
      allow_decomposition = false,
      hide_from_player_crafting = true,
      crafting_machine_tint =                                      -- compied from sulfuri acid
      {
        primary = { r = 1.000, g = 0.958, b = 0.000, a = 1.000 },  -- #fff400ff
        secondary = { r = 1.000, g = 0.852, b = 0.172, a = 1.000 }, -- #ffd92bff
        tertiary = { r = 0.876, g = 0.869, b = 0.597, a = 1.000 }, -- #dfdd98ff
        quaternary = { r = 0.969, g = 1.000, b = 0.019, a = 1.000 }, -- #f7ff04ff
      }
    }
  })
  oc_tech.add_recipe_unlocks({["sulfur-from-sulfuric-acid"] = {"sulfur-processing"}})
end
