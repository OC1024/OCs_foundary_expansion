require ("__base__.prototypes.entity.pipecovers") -- for pipe covers
local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
require ("__space-age__.prototypes.entity.circuit-network")
require ("circuit-connector-sprites")

data:extend({
  { -- advanced foundry
    type = "assembling-machine",
    name = "advanced-foundry",
    group = "production",
    subgroup = "smelting-machine",
    order = "d[foundry]-a",
    icon = "__OCs_foundary_expansion__/graphics/icons/advanced-foundry-icon.png", -- by Hurricane
    icon_size = 64,
    icon_draw_specification = {scale = 2.5, shift = {0, 0}},
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1.0, result = "advanced-foundry"},
    fast_replaceable_group = "advanced-foundry",
    max_health = 640, -- 350 for normal foundry
    corpse = "foundry-remnants",
    dying_explosion = "foundry-explosion",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["foundry"],
    collision_box = {{-3.25, -3.25}, {3.25, 3.25}}, -- 7x7 building
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    -- collision_box = {{-3.7, -3.7}, {3.7, 3.7}}, -- 8x8 building
    -- selection_box = {{-4, -4}, {4, 4}},
    crafting_categories = {"metallurgy"}, -- no crafting
    crafting_speed = 8, -- 4 for normal foundry
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = { pollution = 16 },-- 6 for normal foundry
    },
    energy_usage = "8MW", -- 2.5MW for normal foundry
    heating_energy = "400kW", -- 300kW for normal foundry
    ingredient_count = 6, -- Maximum number of ingredients for recipes
    graphics_set = -- graphics by Hurricane
    {
      animation =
      {
        layers = {
          {
            priority = "high",
            width = 530/2,
            height = 530/2,
            frame_count = 120,
            animation_speed = 0.05,
            scale = 7/8, -- for 7x7 instead of the 8x8 buidling
            stripes = {
              {
                filename = "__OCs_foundary_expansion__/graphics/entity/advanced-foundry-sr-animation-1.png",
                width_in_frames = 8,
                height_in_frames = 8,
              },
              {
                filename = "__OCs_foundary_expansion__/graphics/entity/advanced-foundry-sr-animation-2.png",
                width_in_frames = 8,
                height_in_frames = 7,
              },
            },
          },
          {
            filename = "__OCs_foundary_expansion__/graphics/entity/advanced-foundry-sr-shadow.png",
            priority = "high",
            width = 900/2,
            height = 800/2,
            frame_count = 1,
            repeat_count = 120,
            animation_speed = 0.05,
            draw_as_shadow = true,
            scale = 7/8, -- for 7x7 instead of the 8x8 buidling
          },
        },
      },
      working_visualisations = {
        {
          fadeout = true,
          animation = {
            priority = "high",
            width = 530/2,
            height = 530/2,
            -- shift = util.by_pixel_hr(0, 92),
          shift = {0, 0},
            frame_count = 120,
            animation_speed = 0.05,
            scale = 7/8, -- for 7x7 instead of the 8x8 buidling
            draw_as_light = true,
            blend_mode = "additive",
            stripes = {
              {
                filename = "__OCs_foundary_expansion__/graphics/entity/advanced-foundry-sr-emission-1.png",
                width_in_frames = 8,
                height_in_frames = 8,
              },
              {
                filename = "__OCs_foundary_expansion__/graphics/entity/advanced-foundry-sr-emission-2.png",
                width_in_frames = 8,
                height_in_frames = 7,
              },
            },
          },
          reset_animation_when_frozen = true,
        },
      }
    },
    working_sound = {
        sound = {filename = "__space-age__/sound/entity/foundry/foundry.ogg", volume = 0.5,},
        apparent_volume = 1.5,
        fade_in_ticks = 4,
        fade_out_ticks = 20,
        sound_accents =
        {
          { sound = { filename = "__space-age__/sound/entity/foundry/foundry-pipe-out.ogg", volume = 0.9 }, frame = 2, audible_distance_modifier = 0.4 },
          { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-close.ogg", volume = 0.65 }, frame = 18, audible_distance_modifier = 0.3 },
          { sound = { filename = "__space-age__/sound/entity/foundry/foundry-clamp.ogg", volume = 0.45 }, frame = 39, audible_distance_modifier = 0.3 },
          { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-stop.ogg", volume = 0.7 }, frame = 43, audible_distance_modifier = 0.4 },
          { sound = { variations = sound_variations("__space-age__/sound/entity/foundry/foundry-fire-whoosh", 3, 0.8 )}, frame = 64, audible_distance_modifier = 0.3 },
          { sound = { filename = "__space-age__/sound/entity/foundry/foundry-metal-clunk.ogg", volume = 0.65 }, frame = 64, audible_distance_modifier = 0.4 },
          { sound = { filename = "__space-age__/sound/entity/foundry/foundry-slide-open.ogg", volume = 0.65 }, frame = 74, audible_distance_modifier = 0.3 },
          { sound = { filename = "__space-age__/sound/entity/foundry/foundry-pipe-in.ogg", volume = 0.75 }, frame = 106, audible_distance_modifier = 0.4 },
          { sound = { filename = "__space-age__/sound/entity/foundry/foundry-smoke-puff.ogg", volume = 0.8 }, frame = 106, audible_distance_modifier = 0.3 },
          { sound = { variations = sound_variations("__space-age__/sound/entity/foundry/foundry-pour", 2, 0.7 )}, frame = 110 },
          { sound = { filename = "__space-age__/sound/entity/foundry/foundry-rocks.ogg", volume = 0.65 }, frame = 120, audible_distance_modifier = 0.3 },
          { sound = { filename = "__space-age__/sound/entity/foundry/foundry-blade.ogg", volume = 0.7 }, frame = 126 },
        },
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    open_sound = {filename = "__base__/sound/machine-open.ogg", volume = 0.85},
    close_sound = {filename = "__base__/sound/machine-close.ogg", volume = 0.75},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        -- enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        render_layer = "lower-object-above-shadow",
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {0, 3} }}
      },
      {
        production_type = "input",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        -- enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        render_layer = "lower-object-above-shadow",
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {2, 3} }}
      },
      {
        production_type = "input",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        -- enable_working_visualisations = { "input-pipe" },
        volume = 1000,
        render_layer = "lower-object-above-shadow",
        pipe_connections = {{ flow_direction="input", direction = defines.direction.south, position = {-2, 3} }}
      },
      {
        production_type = "output",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        -- enable_working_visualisations = { "output-pipe" },
        volume = 100,
        render_layer = "lower-object-above-shadow",
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {0, -3} }}
      },
      {
        production_type = "output",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        -- enable_working_visualisations = { "output-pipe" },
        volume = 100,
        render_layer = "lower-object-above-shadow",
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {2, -3} }}
      },
      {
        production_type = "output",
        pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
        pipe_covers = pipecoverspictures(),
        always_draw_covers = false,
        -- enable_working_visualisations = { "output-pipe" },
        volume = 100,
        render_layer = "lower-object-above-shadow",
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-2, -3} }}
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    module_slots = 6,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    effect_receiver = { base_effect = { productivity = 0.75 }},
  },
})
if data.raw["recipe-category"]["metallurgy-or-quality-assembling"] then
  table.insert(crafting_categories, "metallurgy-or-quality-assembling")
  log("crafting_categories updated with 'metallurgy-or-quality-assembling'. IDK which mod it was")
end
if data.raw["recipe-category"]["metallurgy-or-assembling-or-quality-assembling"] then
  table.insert(crafting_categories, "metallurgy-or-assembling-or-quality-assembling")
  log("crafting_categories updated with 'metallurgy-or-assembling-or-quality-assembling'. IDK which mod it was")
end