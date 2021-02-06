#> tac:block/sawmill/gui/recipes/add

# DEBUG
#tellraw @a ["-- Matched --"]


# Append recipe to list
data modify storage tac:temp matchedRecipes append from storage tac:temp recipes[-1]

# Store the slot to the display item
execute store result storage tac:temp matchedRecipes[-1].display.Slot byte 1 run scoreboard players get #slot tac.temp


# Increase slot index
scoreboard players add #slot tac.temp 1

## Reached first row end
execute if score #slot tac.temp matches 9..10 run scoreboard players set #slot tac.temp 11

## Reached second row end
execute if score #slot tac.temp matches 18..19 run scoreboard players set #slot tac.temp 20