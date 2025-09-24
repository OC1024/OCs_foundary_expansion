for _, recipe in pairs(data.raw.recipe) do
  local function swap(ingredients)
    if not ingredients then return end
    for _, ing in pairs(ingredients) do
      -- ingredient formats can be {name=..., amount=...} or {"name", amount}
      if ing.name == "glass" then
        ing.name = "kr-glass"
      elseif ing[1] == "glass" then
        ing[1] = "kr-glass"
      end
    end
  end

  if recipe.normal or recipe.expensive then
    if recipe.normal then
      swap(recipe.normal.ingredients)
      swap(recipe.normal.results)
    end
    if recipe.expensive then
      swap(recipe.expensive.ingredients)
      swap(recipe.expensive.results)
    end
  else
    swap(recipe.ingredients)
    swap(recipe.results)
  end
end

-- optional: hide the unusable item
if data.raw.item["glass"] and data.raw.item["kr-glass"] then
  data.raw.item["glass"].hidden = true
end
