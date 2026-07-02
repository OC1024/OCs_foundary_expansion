local util = require("util")

--------------------------------------------------------------------------------
-- 辅助函数区
-- Auxiliary Functions Section
--------------------------------------------------------------------------------
local function get_primary_result_name(recipe)
    if recipe.result then return recipe.result end
    if recipe.results and recipe.results[1] then return recipe.results[1].name or recipe.results[1][1] end
    return recipe.name
end

-- 👇 必须要把这个能量换算函数加在这里，下面的代码才能调得到它！
-- 👇 This energy conversion function must be added here so that the code below can call it!
local function multiply_energy_usage(energy_str, multiplier)
    if not energy_str then return nil end
    -- 匹配数字和单位（支持小数和无单位情况）
    local num, unit = string.match(energy_str, "^([%d%.]+)%s*(%a*)$")
    if num then
        return (tonumber(num) * multiplier) .. (unit or "")
    end
    return energy_str
end

--------------------------------------------------------------------------------
-- 1. 终极铸造配方平衡与综合修正 (全自动泛用型)
-- 1. Ultimate Forging Formula Balancing and Comprehensive Adjustment (Fully Automatic, General-Purpose)
--------------------------------------------------------------------------------
local CONFIG = {
    time_accumulation_ratio = 1.0,
    min_crafting_time = 0.5,
    -- 新增：递归产能白嫖系数 (铸造厂自带50% = 1.5)
    -- 核心魔法：每往下递归计算一层，产出就乘1.5，让基础材料和时间需求指数级降低
    recursive_productivity_factor = 1.5
}

-- [ignore_list 和 solid_blacklist 等保持原样不变...]

-- [memoized_values 保持原样不变...]

-- [get_recipe_result_count 保持原样不变...]

local function get_item_cost(item_name, visited)
    visited = visited or {}

    if solid_blacklist[item_name] then return nil end
    if memoized_values[item_name] then return memoized_values[item_name] end
    if data.raw.fluid[item_name] then return nil end
    if visited[item_name] then return nil end

    visited[item_name] = true

    local recipe = data.raw.recipe[item_name]
    if not recipe then
        visited[item_name] = nil; return nil
    end

    local ingredients = recipe.ingredients
    if not ingredients then
        visited[item_name] = nil; return nil
    end

    local result_count = get_recipe_result_count(recipe, item_name)
    if result_count <= 0 then result_count = 1 end

    -- 👉 关键修改：计算单价时，认为实际产量享受了产能加成
    local effective_result_count = result_count * CONFIG.recursive_productivity_factor

    local base_time = recipe.energy_required or 0.5

    local total_fluids = {}
    local total_items = {}
    local accumulated_time = 0

    for _, ing in pairs(ingredients) do
        local i_name = ing.name or ing[1]
        local i_amount = ing.amount or ing[2] or 1
        local i_type = ing.type or (data.raw.fluid[i_name] and "fluid" or "item")

        local sub_cost = get_item_cost(i_name, visited)

        if sub_cost then
            for f_name, f_amt in pairs(sub_cost.fluids or {}) do
                total_fluids[f_name] = (total_fluids[f_name] or 0) + (f_amt * i_amount)
            end
            for s_name, s_amt in pairs(sub_cost.items or {}) do
                total_items[s_name] = (total_items[s_name] or 0) + (s_amt * i_amount)
            end
            accumulated_time = accumulated_time + (sub_cost.time * i_amount * CONFIG.time_accumulation_ratio)
        else
            if i_type == "fluid" then
                total_fluids[i_name] = (total_fluids[i_name] or 0) + i_amount
            else
                total_items[i_name] = (total_items[i_name] or 0) + i_amount
            end
        end
    end

    -- 👉 关键修复：顺便修复了原代码中 items 没有除以产出数量的 Bug！
    -- 现在时间、流体、固体物品，都会被放大的 effective_result_count 摊薄
    local final_cost = { fluids = {}, items = {}, time = (base_time + accumulated_time) / effective_result_count }

    for f_name, f_amount in pairs(total_fluids) do
        final_cost.fluids[f_name] = f_amount / effective_result_count
    end
    for s_name, s_amount in pairs(total_items) do
        final_cost.items[s_name] = s_amount / effective_result_count
    end

    memoized_values[item_name] = final_cost
    visited[item_name] = nil
    return final_cost
end

-- 直接忽略配平的白名单 (保持原配方，一丝一毫都不改)
-- Whitelist items that are to be ignored entirely (keep the original recipe exactly as it is, without changing a single thing)
local ignore_list = {
    ["oc-casting-concrete"] = true,
    ["oc-casting-heavy-armour-plating"] = true,
    ["oc-casting-electric-mining-drill"] = true,
    ["oc-casting-tungsten-space-platform-foundation"] = true,
    ["kr-casting-rare-metals"] = true,
}

-- 不会递归计算的中间体
local solid_blacklist = {
    ["electronic-circuit"] = true,
    ["advanced-circuit"] = true,
    ["processing-unit"] = true,
    ["plastic-bar"] = true,
    ["concrete"] = true,
    ["wood"] = true,
    ["refined-concrete"] = true,
    ["holmium-plate"] = true,
    ["tungsten-plate"] = true,
    ["tungsten-carbide"] = true,
    ["glass"] = true,
    ["kr-rare-metals"] = true,
    ["kr-silicon"] = true,
    ["kr-quartz"] = true,
    ["kr-lithium"] = true,

}

local memoized_values = {
    ["iron-plate"]      = { fluids = { ["molten-iron"] = 10 }, time = 1.6 },
    ["copper-plate"]    = { fluids = { ["molten-copper"] = 10 }, time = 1.6 },
    ["steel-plate"]     = { fluids = { ["molten-iron"] = 20 }, time = 3.2 },
    ["iron-gear-wheel"] = { fluids = { ["molten-iron"] = 5 }, time = 1.0 },
    ["copper-cable"]    = { fluids = { ["molten-copper"] = 2.5 }, time = 0.5 },
    ["iron-stick"]      = { fluids = { ["molten-iron"] = 5 }, time = 0.25 },
    ["kr-iron-beam"]    = { fluids = { ["molten-iron"] = 20 }, time = 1.0 },
    ["kr-steel-beam"]   = { fluids = { ["molten-iron"] = 40 }, time = 1.0 },
    ["kr-steel-gear"]   = { fluids = { ["molten-iron"] = 20 }, time = 1.0 },
    ["aluminum-plate"]  = { fluids = { ["molten-aluminum"] = 10 }, time = 1.6 },
}

local function get_recipe_result_count(recipe, target_product)
    if recipe.results then
        for _, res in pairs(recipe.results) do
            local r_name = res.name or res[1]
            if r_name == target_product then
                local amt = res.amount or res[2]
                if amt then return amt end
                if res.amount_min and res.amount_max then return (res.amount_min + res.amount_max) / 2 end
                return 1
            end
        end
    end
    if recipe.result and recipe.result == target_product then return recipe.result_count or 1 end
    return 1
end

local function get_item_cost(item_name, visited)
    visited = visited or {}

    if solid_blacklist[item_name] then return nil end
    if memoized_values[item_name] then return memoized_values[item_name] end
    if data.raw.fluid[item_name] then return nil end
    if visited[item_name] then return nil end

    visited[item_name] = true

    local recipe = data.raw.recipe[item_name]
    if not recipe then
        visited[item_name] = nil; return nil
    end

    local ingredients = recipe.ingredients
    if not ingredients then
        visited[item_name] = nil; return nil
    end

    local result_count = get_recipe_result_count(recipe, item_name)
    if result_count <= 0 then result_count = 1 end

    local base_time = recipe.energy_required or 0.5

    local total_fluids = {}
    local total_items = {}
    local accumulated_time = 0

    for _, ing in pairs(ingredients) do
        local i_name = ing.name or ing[1]
        local i_amount = ing.amount or ing[2] or 1
        local i_type = ing.type or (data.raw.fluid[i_name] and "fluid" or "item")

        local sub_cost = get_item_cost(i_name, visited)

        if sub_cost then
            for f_name, f_amt in pairs(sub_cost.fluids or {}) do
                total_fluids[f_name] = (total_fluids[f_name] or 0) + (f_amt * i_amount)
            end
            for s_name, s_amt in pairs(sub_cost.items or {}) do
                total_items[s_name] = (total_items[s_name] or 0) + (s_amt * i_amount)
            end
            accumulated_time = accumulated_time + (sub_cost.time * i_amount * CONFIG.time_accumulation_ratio)
        else
            if i_type == "fluid" then
                total_fluids[i_name] = (total_fluids[i_name] or 0) + i_amount
            else
                total_items[i_name] = (total_items[i_name] or 0) + i_amount
            end
        end
    end

    local final_cost = { fluids = {}, items = total_items, time = (base_time + accumulated_time) / result_count }
    for f_name, f_amount in pairs(total_fluids) do
        final_cost.fluids[f_name] = f_amount / result_count
    end

    memoized_values[item_name] = final_cost
    visited[item_name] = nil
    return final_cost
end

local function auto_balance_casting_recipe(target_casting_recipe_name, original_recipe_name, product_name)
    if ignore_list[target_casting_recipe_name] then return end

    local cast_recipe = data.raw.recipe[target_casting_recipe_name]
    local orig_recipe = data.raw.recipe[original_recipe_name]
    if not cast_recipe or not orig_recipe then return end

    local orig_ingredients = orig_recipe.ingredients
    local cast_ingredients = cast_recipe.ingredients
    if not orig_ingredients or not cast_ingredients then return end

    local orig_time = orig_recipe.energy_required or 0.5
    local cast_time = cast_recipe.energy_required or 0.5

    local has_lava = false
    for _, ing in pairs(cast_ingredients) do
        local name = ing.name or ing[1]
        if name == "lava" then
            has_lava = true; break
        end
    end

    local orig_count = get_recipe_result_count(orig_recipe, product_name)
    if orig_count <= 0 then orig_count = 1 end
    local cast_count = get_recipe_result_count(cast_recipe, product_name)
    local multiplier = cast_count / orig_count

    local final_fluids, final_items = {}, {}
    local final_time = orig_time * multiplier

    for _, ing in pairs(orig_ingredients) do
        local i_name = ing.name or ing[1]
        local i_amount = (ing.amount or ing[2] or 1) * multiplier
        local i_type = ing.type or (data.raw.fluid[i_name] and "fluid" or "item")
        local cost = get_item_cost(i_name)

        if cost then
            for f_name, f_amt in pairs(cost.fluids or {}) do
                final_fluids[f_name] = (final_fluids[f_name] or 0) + (f_amt * i_amount)
            end
            for s_name, s_amt in pairs(cost.items or {}) do
                final_items[s_name] = (final_items[s_name] or 0) + (s_amt * i_amount)
            end
            final_time = final_time + (cost.time * i_amount * CONFIG.time_accumulation_ratio)
        else
            if i_type == "fluid" then
                final_fluids[i_name] = (final_fluids[i_name] or 0) + i_amount
            else
                final_items[i_name] = (final_items[i_name] or 0) + i_amount
            end
        end
    end

    local new_ingredients = {}
    if has_lava then
        final_time = cast_time
        local target_metals = { ["molten-iron"] = true, ["molten-copper"] = true, ["molten-aluminum"] = true }
        for _, ing in pairs(cast_ingredients) do
            local name = ing.name or ing[1]
            local type = ing.type or (data.raw.fluid[name] and "fluid" or "item")
            local amount = ing.amount or ing[2] or 1
            if target_metals[name] then
                if final_fluids[name] and final_fluids[name] > 0 then
                    amount = math.ceil(final_fluids[name])
                    if amount > 65535 then amount = 65535 end
                    -- 修复：只给流体加乘数
                    table.insert(new_ingredients, {
                        type = type,
                        name = name,
                        amount = amount,
                        fluidbox_multiplier = string.find(name, "molten") and 10 or nil
                    })
                    final_fluids[name] = nil
                end
            else
                if amount > 65535 then amount = 65535 end
                table.insert(new_ingredients, {
                    type = type,
                    name = name,
                    amount = amount,
                    fluidbox_multiplier = (type == "fluid" and string.find(name, "molten")) and 10 or nil
                })
            end
        end
        for f_name, f_amt in pairs(final_fluids) do
            if target_metals[f_name] and f_amt > 0 then
                local amt = math.ceil(f_amt)
                if amt > 65535 then amt = 65535 end
                table.insert(new_ingredients, {
                    type = "fluid",
                    name = f_name,
                    amount = amt,
                    fluidbox_multiplier = string.find(f_name, "molten") and 10 or nil
                })
            end
        end
    else
        for f_name, f_amount in pairs(final_fluids) do
            local amt = math.ceil(f_amount)
            if amt > 65535 then amt = 65535 end
            -- 修复：正确添加流体乘数，去掉了导致报错的 }))
            table.insert(new_ingredients, {
                type = "fluid",
                name = f_name,
                amount = amt,
                fluidbox_multiplier = string.find(f_name, "molten") and 10 or nil
            })
        end
        for s_name, s_amount in pairs(final_items) do
            local amt = math.ceil(s_amount)
            if amt > 65535 then amt = 65535 end
            -- 修复：移除了错误加在物品上的流体乘数
            table.insert(new_ingredients, {
                type = "item",
                name = s_name,
                amount = amt
            })
        end
        if final_time < CONFIG.min_crafting_time then final_time = CONFIG.min_crafting_time end
    end

    if cast_recipe.ingredients then
        cast_recipe.ingredients = new_ingredients
        cast_recipe.energy_required = final_time

        -- 👉 核心修改：动态判定产能插件权限
        -- 修复：直接继承原配方的值。如果原配方是 nil（采用引擎默认），那么新配方也应保持 nil，而不是强行设为 false。
        -- 👉 Core change: Dynamic determination of production capacity plugin permissions
        -- Fixed: Values are now directly inherited from the original recipe. If the original recipe is nil (using the engine’s default), the new recipe should also remain nil, rather than being forcibly set to false.
        cast_recipe.allow_productivity = orig_recipe.allow_productivity
    end


    local target_name_fallback = {
        "?", { "recipe-name." .. target_casting_recipe_name }, { "item-name." .. product_name },
        { "entity-name." .. product_name }, { "fluid-name." .. product_name },
        { "equipment-name." .. product_name }, { "recipe-name." .. product_name }, product_name
    }
    cast_recipe.localised_name = { "recipe-name.dynamic-casting-prefix", target_name_fallback }
end

-- 特例白名单
-- Exceptions Whitelist
local special_mapping = {
    ["oc-casting-barrel"] = "barrel",
    ["casting-low-density-structure"] = "low-density-structure",
    ["casting-low-density-structure-aluminum"] = "low-density-structure-from-aluminum",
    ["oc-casting-kr-automation-core-aluminum"] = "kr-automation-core-from-aluminum",
    ["vgal-molten-copper-carbon-fiber-low-density-structure"] = "vgal-carbon-fiber-low-density-structure"
}

for cast_name, orig_name in pairs(special_mapping) do
    auto_balance_casting_recipe(cast_name, orig_name, orig_name)
end

-- 全局动态扫描配平
-- Global dynamic scanning and balancing
local keyword_ignore_list = { "armour-plating", "science-pack", "holmium", "imersium", "tungsten", "rare-metals" }

-- 新增：允许自动平衡的配方前缀列表
-- New: List of recipe prefixes that allow automatic balancing
local allowed_prefixes = {
    "oc%-", -- 使用 %- 来转义横杠 -- Use %- to escape the hyphen
    "kr%-",
    "belt",
    "pipe",
    "EMfoundryexp%-"
}

for recipe_name, recipe in pairs(data.raw.recipe) do
    if not special_mapping[recipe_name] and not ignore_list[recipe_name] then
        -- 检查配方名称是否包含允许的前缀
        -- Check whether the formula name contains an permitted prefix
        local is_allowed = false
        for _, prefix in ipairs(allowed_prefixes) do
            if string.find(recipe_name, prefix) then
                is_allowed = true
                break
            end
        end

        -- 只有匹配了前缀，才进行后续的自动平衡计算
        -- Subsequent automatic balancing calculations are only performed once a prefix has been matched
        if is_allowed then
            local has_ignored_keyword = false
            for _, keyword in pairs(keyword_ignore_list) do
                if string.find(recipe_name, keyword, 1, true) then
                    has_ignored_keyword = true
                    break
                end
            end

            if not has_ignored_keyword then
                local cat = recipe.category or "crafting"
                if string.find(recipe_name, "cast") or cat == "metallurgy" or cat == "castra-metallurgy" then
                    local product_name = get_primary_result_name(recipe)

                    if product_name and not memoized_values[product_name] then
                        local orig_recipe = data.raw.recipe[product_name]
                        if orig_recipe and orig_recipe.name ~= recipe_name then
                            local orig_cat = orig_recipe.category or "crafting"
                            local orig_is_casting = string.find(orig_recipe.name, "cast") or orig_cat == "metallurgy"
                            if not orig_is_casting then
                                auto_balance_casting_recipe(recipe_name, orig_recipe.name, product_name)
                            end
                        end
                    end
                end
            end
        end
    end
end

--------------------------------------------------------------------------------
-- 手动指定的其他需要平衡的配方 (针对不带上述前缀的配方)
-- Other recipes requiring manual balancing (for recipes without the prefix mentioned above)
--------------------------------------------------------------------------------
local manual_additional_recipes = {
    -- 在这里单独列出你需要修改平衡的配方
    -- 格式: ["铸造配方名称"] = "原配方/产物名称"
    -- 示例: ["othermod-casting-iron-gear"] = "iron-gear-wheel",
    -- List the recipes you wish to modify here
    -- Format: [‘Casting recipe name’] = ‘Original recipe/product name’
    -- Example: [‘othermod-casting-iron-gear’] = ‘iron-gear-wheel’,
}

for cast_name, orig_name in pairs(manual_additional_recipes) do
    if data.raw.recipe[cast_name] and data.raw.recipe[orig_name] then
        auto_balance_casting_recipe(cast_name, orig_name, orig_name)
    end
end

--------------------------------------------------------------------------------
--强制开启特定铸造配方的产能插件权限
--Force the activation of the production capacity add-on for specific brewing recipes
--------------------------------------------------------------------------------
local recipes_to_allow_productivity = {
    "oc-casting-motor",
    "oc-casting-engine-unit",
    "oc-casting-kr-automation-core"
}

for _, recipe_name in ipairs(recipes_to_allow_productivity) do
    if data.raw.recipe[recipe_name] then
        data.raw.recipe[recipe_name].allow_productivity = true
    end
end

--------------------------------------------------------------------------------
-- 修复配方，禁止其在铸造厂中直接使用
-- Fixed the recipe to prevent it from being used directly in the foundry
--------------------------------------------------------------------------------
-- 强制将配方分类改回组装机，脱离铸造厂的加工范围
-- Force the recipe category to revert to ‘Assembly Machine’, removing it from the foundry’s scope of processing
if data.raw.recipe["engine-unit"] then
    -- 原版引擎通常属于需要流体或较多材料的高级制造
    -- Original engines are typically used in advanced manufacturing processes that require fluids or large quantities of materials
    data.raw.recipe["engine-unit"].category = "advanced-crafting"
end

if data.raw.recipe["motor"] then
    -- 马达通常属于基础制造
    -- Motors are generally classified as basic manufacturing
    data.raw.recipe["motor"].category = "crafting"
end
