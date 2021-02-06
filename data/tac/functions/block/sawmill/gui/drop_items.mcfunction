#> tac:block/sawmill/gui/drop_items

# Summon item
summon item ~ ~ ~ {Item:{id:"minecraft:barrier", Count:1b}, Tags:["tac.new_item"]}

# Set nbt and remove tag
data modify entity @e[type=item,limit=1,tag=tac.new_item] Item set from storage tac:temp insertedItems[-1]
tag @e[type=item,tag=tac.new_item,limit=1] remove tac.new_item


# Loop
data remove storage tac:temp insertedItems[-1]
execute if data storage tac:temp insertedItems[-1] run function tac:block/sawmill/gui/drop_items