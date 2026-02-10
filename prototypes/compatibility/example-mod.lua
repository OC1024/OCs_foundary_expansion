-- === Example Strukture for a compat-file ===
-- pepare the generator
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")


-- 1. Preparations: Edit all Tables
-- 1.1 Alternative Recipes
-- 1.1.1 Single Item
generator_api.register_single_alt_recipe("metallurgy","item-name",{"alt-recipe","standard-require"})

-- 1.1.2 Single target category
local alt_recipes_table = {
    ["item-name-1"] = {"best-alt-recipe","standard-recipe","bad-alt-recipe"},
    ["item-name-5"] = {"alternative-recipe-5","standard-recipe-5"},
}
generator_api.register_category_alt_recipes("metallurgy", alt_recipes_table)

-- 1.1.3 Multiple categories
local multi_cat_table = {
    metallurgy = {
        ["item-x"] = {"alt-x1", "alt-x2"},
        ["item-y"] = {"alt-y1", "std-y"},
    },
    electromagnetics = {
        ["item-a"] = {"alt-a", "std-a"},
        ["item-b"] = {"alt-b"},
    }
}
generator_api.register_multi_category_alt_recipes(multi_cat_table)

-- 1.2 Blacklists
-- 1.2.1 Single Category, Items
local blacklist_items = {
    "bad-item-1",
    "bad-item-2",
}
generator_api.register_item_blacklist("metallurgy", blacklist_items)

-- 1.2.2 Multiple Categories, Items
local multi_item_blacklists = {
    ["metallurgy"] = {"bad-item-3", "bad-item-4"},
    ["chemistry"]  = {"toxic-item-1", "toxic-item-2"},
}
generator_api.register_multi_item_blacklists(multi_item_blacklists)

-- 1.2.3 Single Category, Categories
local blacklist_categories = {
    "bad-category-1",
    "bad-category-2",
}
generator_api.register_category_blacklist("metallurgy", blacklist_categories)

-- 1.2.4 Multiple Categories, Categories
local multi_category_blacklists = {
    ["metallurgy"] = {"restricted-cat-1", "restricted-cat-2"},
    ["smelting"]   = {"blocked-cat-1", "blocked-cat-2"},
}
generator_api.register_multi_category_blacklists(multi_category_blacklists)

-- 2. Execute the Generator. The most crucial part of the compatibility file. Note: this will produce recipes with the name "prefix-item-name-1"
local casting_dict = {
    ["item-name-1"] = "metallurgy",
    ["item-name-2"] = "chemistry",
    ["item-name-3"] = "organic",
}
generator_api.batch_generator(casting_dict)

-- 3. Add and Remove Recipes to Techs (Note: helper function, not generator)
local recipe_tech_mapping = {
    ["casting-item-name-1"] = {"technology-name-1","tech-name-3"},
    ["bio-item-name-2"] = "technology-name-2",
}
add_recipe_unlocks(recipe_tech_mapping)

local unwanted_recipe_mapping = {
    ["pulsing-bad-item-1"] = {"random-tech-name-1","random-tech-name-2"},
    ["cryo-bad-item-2"] = "technology-name-3"
}
remove_recipe_unlocks(unwanted_recipe_mapping)