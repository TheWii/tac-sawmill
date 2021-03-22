#> tac:recipes

# Executed at: 0 0 0 (You can use ~ ~ ~ as well)

# Items
## [block] ~ ~ ~ container.0 = material
## [block] ~ ~ ~ container.1 = output
## [block] ~ ~ ~ container.2 = display item
# Numbers
## [score] #display_row tac.io = In which row the item should be display(Accepts: 0, 1 and 2) (Default: 0)
## [score] #material_cost tac.io = The amount of item material it needs to be crafted (Accepts: 1 or bigger) (Default: 1)

# To finish, call 'tac:core/register', the system will add the recipe, clear the container and reset the scores.
# [function] tac:core/register


## 10 Oak Planks -> 6 Oak Fences
loot replace block ~ ~ ~ container.0 loot tac:materials/oak_planks
loot replace block ~ ~ ~ container.1 loot tac:outputs/six_oak_fences
#loot replace block ~ ~ ~ container.2 loot tac:displays/six_oak_fences
scoreboard players set #display_row tac.io 1
scoreboard players set #material_cost tac.io 10
function tac:core/register

## 1 Oak Log -> 4 Oak Planks
loot replace block ~ ~ ~ container.0 loot tac:materials/oak_log
loot replace block ~ ~ ~ container.1 loot tac:outputs/four_oak_planks
#loot replace block ~ ~ ~ container.2 loot tac:displays/four_oak_planks
scoreboard players set #display_row tac.io 0
scoreboard players set #material_cost tac.io 1
function tac:core/register