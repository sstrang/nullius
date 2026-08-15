local nullius_non_productivity_categories = {
  ["nullius-liquid-void"] = true,
  ["nullius-gas-void"] = true,
  ["nullius-burn"] = true,
  ["nullius-greenhouse"] = true,
  ["seawater-pumping"] = true,
  ["combustion"] = true,
  ["boiling"] = true,
  ["pressure-boiling"] = true,
  ["turbine-open"] = true,
  ["turbine-closed"] = true
}

-- Recipe category may be the 2.0 string form (category) or the 2.1 array form
-- (categories) depending on the data stage this runs in; check both.
local function in_non_productivity_category(recipe)
  if (recipe.category ~= nil and
      nullius_non_productivity_categories[recipe.category] == true) then
    return true
  end
  if (recipe.categories ~= nil and
      nullius_non_productivity_categories[recipe.categories[1]] == true) then
    return true
  end
  return false
end

for _,recipe in pairs(data.raw.recipe) do
  if (((string.sub(recipe.name, 1, 8) == "nullius-") or ((recipe.order ~= nil) and
        (string.sub(recipe.order, 1, 8) == "nullius-"))) and
      (recipe.no_productivity ~= true) and
      (not in_non_productivity_category(recipe))) then
    recipe.allow_productivity = true
  end
  recipe.no_productivity = nil
end
