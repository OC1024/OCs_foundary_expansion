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
      category = "electromagnetics",
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
