local core_extractor_recipes = {
    {name = "Recipe 1", localised_name = {"recipe-name.basic-core-drilling"}},
    {name = "Recipe 2", localised_name = {"recipe-name.core-drilling"}},
    {name = "Recipe 3", localised_name = {"recipe-name.advanced-core-drilling"}}
}

-- Function to create the GUI for the core extractor
local function create_gui(player, entity)
    -- Clear any existing GUI
    if player.gui.left.core_extractor_gui then
        player.gui.left.core_extractor_gui.destroy()
    end

    -- Create the GUI structure
    local gui = player.gui.left.add {type = "frame", name = "core_extractor_gui", caption = {"gui.core_extractor_title"}, direction = "vertical"}
    gui.add {type = "label", caption = {"gui.recipe_selection"}}

    -- Recipe selector dropdown
    gui.add {type = "label", caption = {"gui.recipe_selection"}}
    local recipe_selector = gui.add {type = "drop-down", name = "recipe_selector"}

    -- Populate recipe selector with localised names
    for _, recipe in ipairs(core_extractor_recipes) do
        recipe_selector.add_item(recipe.localised_name)
    end

    -- Input slots
    gui.add {type = "label", caption = {"gui.input_slots"}}
    local input_flow = gui.add {type = "flow", name = "input_flow", direction = "horizontal"}
    for i = 1, 2 do
        input_flow.add {type = "sprite-button", name = "input_slot_" .. i, sprite = "item/iron-ore"}
    end

    -- Output slots
    gui.add {type = "label", caption = {"gui.output_slots"}}
    local output_flow = gui.add {type = "flow", name = "output_flow", direction = "horizontal"}
    for i = 1, 2 do
        output_flow.add {type = "sprite-button", name = "output_slot_" .. i, sprite = "item/iron-plate"}
    end

    -- Fuel slot
    gui.add {type = "label", caption = {"gui.fuel_slot"}}
    local fuel_slot = gui.add {type = "sprite-button", name = "fuel_slot", sprite = "item/coal"}

    -- Close button
    gui.add {type = "button", name = "close_gui", caption = {"gui.close"}}
end

local function close_gui(player)
    if player.gui.left.core_extractor_gui then
        player.gui.left.core_extractor_gui.destroy()
    end
end

script.on_event(defines.events.on_gui_click, function(event)
    local player = game.players[event.player_index]
    if event.element.name == "close_gui" then
        close_gui(player)
    elseif event.element.name == "recipe_selector" then
        local selected_index = event.element.selected_index
        if selected_index > 0 then
            local selected_recipe = core_extractor_recipes[selected_index].name
            player.print({"gui.selected_recipe", selected_recipe})
        end
    end
end)

script.on_event(defines.events.on_gui_opened, function(event)
    if event.entity and event.entity.name == "core_extractor" then
        local player = game.players[event.player_index]
        create_gui(player, event.entity)
    end
end)

script.on_event(defines.events.on_gui_closed, function(event)
    local player = game.players[event.player_index]
    close_gui(player)
end)
