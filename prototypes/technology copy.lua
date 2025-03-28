-- alternative recipes for basic science packs in foundry, em-plant and biochamber
if settings.startup["allow-alt-science-packs"].value then
  data:extend({
    { -- foundry sciences early-tech sciences
      type = "technology",
      name = "foundry-science-packs-tech",
      icon = "__OCs_foundary_expansion__/graphics/technology/casting-science-packs2.png",
      icon_size = 256, icon_mipmaps = 4,
      prerequisites = {"metallurgic-science-pack","space-science-pack","production-science-pack","military-science-pack"}, --some are indirect prereqs (red, green, blue))
      unit = {
        ingredients = { -- cast-able science packs are used twice as the rest
          {"automation-science-pack", 2},
          {"logistic-science-pack", 2},
          {"chemical-science-pack", 1},
          {"military-science-pack", 2},
          {"production-science-pack", 1},
          {"utility-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 2},
        },
        time = 60,
        count = 500
        },
        effects = {
          {type = "unlock-recipe", recipe = "casting-automation-science-pack"},
          {type = "unlock-recipe", recipe = "casting-logistic-science-pack"},
          {type = "unlock-recipe", recipe = "casting-military-science-pack"},
          {type = "unlock-recipe", recipe = "lava-to-military-science-pack"}, -- Vulcanus/old version
          -- {type = "unlock-recipe", recipe = "casting-production-science-pack"},
          -- {type = "unlock-recipe", recipe = "casting-rail"}, -- needed to make some sense for the production science
        },
    },
    { -- em-plant sciences mid-tech sciences
    type = "technology",
    name = "emp-science-packs-tech",
    icon = "__OCs_foundary_expansion__/graphics/technology/em-science-packs2.png",
    icon_size = 256, icon_mipmaps = 4,
    prerequisites = {"electromagnetic-science-pack","space-science-pack","utility-science-pack","production-science-pack"}, --some are indirect prereqs (red, green, blue))
    unit = {
      ingredients = { -- em-able science packs are used twice as the rest
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 2},
        {"utility-science-pack", 2},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 2},
      },
      time = 60,
      count = 500
      },
      effects = {
        {type = "unlock-recipe", recipe = "em-utility-science-pack"},
        {type = "unlock-recipe", recipe = "em-production-science-pack"},
        -- {type = "unlock-recipe", recipe = "em-electromagnetic-science-pack"}, -- already there
      },
    },
    { -- biochamber sciences early-midtech sciences
    type = "technology",
    name = "biochamber-science-packs-tech",
    icon = "__OCs_foundary_expansion__/graphics/technology/biochamber-science-packs.png",
    icon_size = 256, icon_mipmaps = 4,
    prerequisites = {"agricultural-science-pack","space-science-pack","chemical-science-pack",}, --some are indirect prereqs (biochamber, chemical-science-pack))
    unit = {
      ingredients = { -- biochamber-able science packs are used twice as the rest
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 2},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 2},
        {"agricultural-science-pack", 2},
      },
      time = 60,
      count = 1000
      },
      effects = {
        {type = "unlock-recipe", recipe = "biochamber-chemical-science-pack"},
        {type = "unlock-recipe", recipe = "biochamber-space-science-pack"},
        -- {type = "unlock-recipe", recipe = "biochamber-agricultural-science-pack"}, -- already there
      },
    },
    -- { -- cryogenic-plant sciences late-game sciences
    -- type = "technology",
    -- name = "cryo-science-packs-tech",
    -- icon = "__OCs_foundary_expansion__/graphics/technology/cryo-science-packs.png",
    -- icon_size = 256, icon_mipmaps = 4,
    -- prerequisites = {"em-science-packs-tech","casting-science-packs-tech","biochamber-science-pack"}, --some are indirect prereqs (yellow, purple, blue))
    -- unit = {
    --   ingredients = { -- cryo-able science packs are used twice as the rest
    --     {"automation-science-pack", 1},
    --     {"logistic-science-pack", 1},
    --     {"chemical-science-pack", 1},
    --     {"production-science-pack", 1},
    --     {"utility-science-pack", 1},
    --     {"space-science-pack", 1},
    --     {"cryogenic-science-pack", 2},
    --     {"promethium-science-pack", 2},
    --   },
    --   time = 90,
    --   count = 2000
    --   },
    --   effects = {
    --       -- {type = "unlock-recipe", recipe = "cryo-cryogenic-science-pack"}, -- already there
    --       -- {type = "unlock-recipe", recipe = "cryo-promethium-science-pack"}, -- already there
    --   },
    -- },
  })
end

-- add casting rails to the stone-casting tech from my other mod
if mods["OCs_stone_casting"] and data.raw["technology"]["lava-to-stone-tech"] then
  table.insert(data.raw["technology"]["lava-to-stone-tech"].effects, {
    type = "unlock-recipe",
    recipe = "casting-rail"
  })
else -- should not be the case because of dependencies, vanilla fallback
  table.insert(data.raw["technology"]["railway"].effects, {
    type = "unlock-recipe",
    recipe = "casting-rail"
  })
end

-- add casting heat-pipe to the adjacent techs
local technology_names = {"heating-tower","nuclear-power"}
local recipe_name = "casting-heat-pipe"
for _, technology_name in pairs(technology_names) do
  local tech = data.raw["technology"][technology_name]
  if tech then
    tech.effects = tech.effects or {} -- Ensure the effects table exists
    table.insert(tech.effects, {type = "unlock-recipe", recipe = recipe_name})
    log("Added recipe '" .. recipe_name .. "' to technology '" .. technology_name .. "'.")
  else
    log("Technology '" .. technology_name .. "' does not exist.")
  end
end

-- Conditionally included military technologies
if settings.startup["allow-heavy-military-tech"].value then
data:extend({
  { -- heavy armor plating
    type = "technology",
    name = "heavy-armor-plating-tech",
    -- order = "hka"
    icons = {
      {
        icon = "__OCs_foundary_expansion__/graphics/technology/casting-heavy-armor-plating-tech.png",
        icon_size = 64,
        icon_mipmaps = 1,
        scale = 4,
      },
      {
        icon = "__OCs_foundary_expansion__/graphics/technology/overlayer-tech-molten-iron.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    icon_size = 256, icon_mipmaps = 4,
    prerequisites = {"foundary","military-4"},
    unit = {
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"millitary-science-pack", 2}, -- duh!
        {"utility-science-pack", 1},
        {"production-science-pack", 2}, -- duh-hu!
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 2},
      },
      time = 30,
      count = 100
      },
      effects = { -- not impemented yet
        {type = "unlock-recipe", recipe = "casting-heavy-armor-plating"},
        -- {type = "unlock-recipe", recipe = "casting-heat-shield"},
      },
  },
})
end

-- Conditionally included productivity technologies for alternate science packs
if settings.startup["allow-alt-science-productivity"].value and settings.startup["allow-alt-science-packs"].value then

  local function create_productivity_bonus_tech(name, prereq, recipes)
    -- Get icon details from the prerequisite tech
    local base_icon = data.raw["technology"][prereq].icon
    -- Collect all recipes from the prerequisite tech
    local productivity_effects = {}
    for _, effect in pairs(data.raw["technology"][prereq].effects) do
      if effect.type == "unlock-recipe" and effect.recipe then
        table.insert(productivity_effects, {
          type = "change-recipe-productivity",
          recipe = effect.recipe,
          change = 0.05,  -- +5% productivity per level
          effect_description = {"technology-description." .. name}
        })
      end
    end

    -- Add additional recipes for productivity bonus
    local effects = {}
    for _, recipe in pairs(recipes) do
      table.insert(productivity_effects, {
        type = "change-recipe-productivity",
        recipe = recipe,
        change = 0.05, -- +5% productivity per level
        effect_description = {"technology-description." .. name}
      })
    end

    local max_level_setting = settings.startup["science-productivity-max-level"].value
    log("Science productivity max level setting: " .. max_level_setting)
    local max_level
    if max_level_setting == -1 then
      max_level = "infinite"
    elseif max_level_setting == 0 then
      return -- Skip defining the technology entirely
    else
      max_level = max_level_setting
    end
    log("Science productivity max level: " .. max_level)

    return {
      type = "technology",
      name = name,
      icons = util.technology_icon_constant_recipe_productivity(base_icon), --reusing the vanilla prod icon as overlayer
      prerequisites = {prereq},
      effects = effects,
      unit = {
        ingredients = data.raw["technology"][prereq].unit.ingredients,
        count_formula = "1000*2^(L/2)", -- Exponential scaling
        time = data.raw["technology"][prereq].unit.time
      },
      upgrade = true,
      max_level = max_level,
      order = "z-" .. name
    }
  end

  -- Create three separate techs for the alternative recipes
  data:extend({
    create_productivity_bonus_tech("foundry-science-packs-productivity-tech", "foundry-science-packs-tech", {"metallurgic-science-pack"}),
    create_productivity_bonus_tech("emp-science-packs-productivity-tech", "emp-science-packs-tech", {"electromagnetic-science-pack"}),
    create_productivity_bonus_tech("biochamber-science-packs-productivity-tech", "biochamber-science-packs-tech", {"agricultural-science-pack"}),
    -- create_productivity_bonus_tech("cryoplant-science-packs-productivity-tech", "cryoplant-science-packs-tech", {"cryogenic-science-pack"})
    -- create_productivity_bonus_tech("cryoplant-science-productivity",
    --   {"foundry-science-productivity-1", "emp-science-productivity-1", "biochamber-science-productivity-1"},
    --   {"cryogenic-science-pack", "promethium-science-pack"}
    -- )
  })
end
