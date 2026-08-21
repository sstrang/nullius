require("prototypes.override_final")
require("prototypes.override_final_only")
require("prototypes.override_mod_final")
require("prototypes.item.module_limitation")
require("prototypes.item.box_icons")
require("prototypes.custom_tooltip_fields")
require("legacyMirror")

-- Factorio 2.1 migration: convert recipe.category (string) to recipe.categories (array)
for _, recipe in pairs(data.raw.recipe) do
  if recipe.category ~= nil then
    if recipe.categories == nil then
      recipe.categories = { recipe.category }
    else
      table.insert(recipe.categories, recipe.category)
    end
    recipe.category = nil
  end
  -- Remove properties moved to ItemProductPrototype in 2.1
  recipe.show_amount_in_title = nil
  recipe.always_show_products = nil
end

-- Factorio 2.1 migration: move FluidBox.hide_connection_info to PipeConnectionDefinition
-- In 2.1, FluidBox::hide_connection_info was removed; the property moved to
-- PipeConnectionDefinition::hide_connection_info on each pipe_connection entry.
for _, proto_list in pairs(data.raw) do
  for _, proto in pairs(proto_list) do
    if type(proto) == "table" then
      if proto.fluid_box ~= nil and type(proto.fluid_box) == "table" then
        if proto.fluid_box.hide_connection_info ~= nil then
          local hide = proto.fluid_box.hide_connection_info
          proto.fluid_box.hide_connection_info = nil
          if proto.fluid_box.pipe_connections ~= nil then
            for _, conn in pairs(proto.fluid_box.pipe_connections) do
              conn.hide_connection_info = hide
            end
          end
        end
      end
      -- Also handle fluid_boxes (array form, used by assembling-machine/furnace)
      if proto.fluid_boxes ~= nil and type(proto.fluid_boxes) == "table" then
        for _, fbox in pairs(proto.fluid_boxes) do
          if type(fbox) == "table" and fbox.hide_connection_info ~= nil then
            local hide = fbox.hide_connection_info
            fbox.hide_connection_info = nil
            if fbox.pipe_connections ~= nil then
              for _, conn in pairs(fbox.pipe_connections) do
                conn.hide_connection_info = hide
              end
            end
          end
        end
      end
    end
  end
end

if mods["GCKI"] == nil then
    for _, recipe in pairs(data.raw.recipe) do
        if recipe.GCKI_ignore ~= nil then
            recipe.GCKI_ignore = nil
        end
    end
end


require("clutterpedia")

if settings.startup["nullius-hide-recipe-signals"].value then
    for _,recipe in pairs(data.raw.recipe) do
        --recipe.hide_from_signal_gui = true
        if recipe.hide_from_signal_gui == false then
            recipe.hide_from_signal_gui = nil
        end
    end
else
    for _,recipe in pairs(data.raw.recipe) do
        if string.sub(recipe.name, 1, 14) == "nullius-boxed-" or string.sub(recipe.name, 1, 14) == "nullius-unbox-" then
            recipe.hide_from_signal_gui = false
        end
    end
end

data.raw["utility-constants"]["default"].main_menu_simulations = require("menu-simulations.menu-simulations")
