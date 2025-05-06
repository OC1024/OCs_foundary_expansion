-- === Example Strukture for a compat-file ===

-- 1. Preparations: Edit all Tables
if casting_materials then
    -- Add/Change Materials from the casting_materials table
    local additions = {
        ["item-name-1"] = { fluid = "lava", ratio = 8, energy_required = 2.5 },
        ["item-name-2"] = { fluid = "lava", ratio = 12, energy_required = 3.0 },
    }
    for name, props in pairs(additions) do
        casting_materials[name] = props
    end

    -- Remove Materials from the casting_materials table
    local removals = {
        "item-name-3",
        "item-name-4",
    }
    for _, name in ipairs(removals) do
        casting_materials[name] = nil
    end

    -- log the new version of the casting_materials table
    local keys = {}
    for k in pairs(casting_materials) do table.insert(keys, k) end
    table.sort(keys)
    debug_log("Current casting_materials: " .. table.concat(keys, ", "),"generator")

end

if alternative_recipes then
    -- Add/Change order of Alternative Receptes
    local alternatives = {
        ["item-name-1"] = {"alternative-recipe-1","standard-recipe","bad-alt-recipe-2"},
        ["item-name-5"] = {"alternative-recipe-2"},
    }
    for name, alt_list in pairs(alternatives) do
        alternative_recipes[name] = alt_list
    end

    -- To remove alternative recipes entirely
    local remove_alternatives = {
        "item-name-3",
        "item-name-6",
    }
    for _, name in ipairs(remove_alternatives) do
        alternative_recipes[name] = nil
    end
end

if casting_blacklist then
    -- Block single Items
    local blacklist_items = {
      ["bad-item-1"] = true,
      ["bad-item-2"] = true,
    }
    for name, _ in pairs(blacklist_items) do
      casting_blacklist[name] = true
    end
end

if category_blacklist then
    -- Block complete Categories
    local blacklist_categories = {
      ["category-1"] = true,
      ["category-2"] = true,
    }
    for name, _ in pairs(blacklist_categories) do
      category_blacklist[name] = true
    end
end

-- 2. Execute the Generator. The most crucial part of the compatibility file. Note: this will produce recipes with the name "casting-item-name-1"
local casting_dict = {
    ["item-name-1"] = "metallurgy",
    ["item-name-2"] = "chemistry",
    -- more Items
}
batch_generator(casting_dict)

-- 3. Add Recipes to Techs
local recipe_tech_mapping = {
    ["casting-item-name-1"] = {"technology-name-1","tech-name-3"},
    ["casting-item-name-2"] = {"technology-name-2"},
}
add_recipe_unlocks(recipe_tech_mapping)
