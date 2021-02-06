#> tac:block/sawmill/gui/identify_player

# Detect item
execute store success score #clicked tac.temp run clear @s #tac:all_items{isRecipeItem:1b}

# If this player has the item, then proceed
execute if score #clicked tac.temp matches 1 run function tac:block/sawmill/gui/crafted