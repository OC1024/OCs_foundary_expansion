local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

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
  oc_helper.replace_ingredient(data.raw.recipe["heliostat-mirror"],"item","glass","item","kr-glass",true)
end