#!/bin/bash
# Compare removed-API counts HEAD vs current worktree for files upstream touched
for f in nullius/prototypes/entity/energy.lua nullius/prototypes/entity/furnace.lua nullius/prototypes/item/landfill.lua; do
  h=$(git show HEAD:$f | grep -c 'forced_symmetry')
  n=$(grep -c 'forced_symmetry' $f)
  hp=$(git show HEAD:$f | grep -cE '^\s+probability = ')
  np=$(grep -cE '^\s+probability = ' $f)
  echo "$f: forced_symmetry HEAD=$h NOW=$n | probability= HEAD=$hp NOW=$np"
done
echo
echo "=== forced_symmetry context in energy.lua:"
grep -n -B12 'forced_symmetry = "horizontal"' nullius/prototypes/entity/energy.lua | grep 'name = "nullius\|forced_symmetry' | head -20
echo
echo "=== furnace.lua forced_symmetry context:"
grep -n -B12 'forced_symmetry = "horizontal"' nullius/prototypes/entity/furnace.lua | grep 'name = "nullius\|forced_symmetry' | head
