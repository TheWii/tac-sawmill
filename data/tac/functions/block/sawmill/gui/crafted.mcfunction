#> tac:block/sawmill/gui/crafted

# Get correct recipe
execute if score #index tac.temp matches 0 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[0]
execute if score #index tac.temp matches 1 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[1]
execute if score #index tac.temp matches 2 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[2]
execute if score #index tac.temp matches 3 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[3]
execute if score #index tac.temp matches 4 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[4]
execute if score #index tac.temp matches 5 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[5]
execute if score #index tac.temp matches 6 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[6]
execute if score #index tac.temp matches 7 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[7]
execute if score #index tac.temp matches 8 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[8]
execute if score #index tac.temp matches 9 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[9]
execute if score #index tac.temp matches 10 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[10]
execute if score #index tac.temp matches 11 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[11]
execute if score #index tac.temp matches 12 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[12]
execute if score #index tac.temp matches 13 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[13]
execute if score #index tac.temp matches 14 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[14]
execute if score #index tac.temp matches 15 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[15]
execute if score #index tac.temp matches 16 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[16]
execute if score #index tac.temp matches 17 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[17]
execute if score #index tac.temp matches 18 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[18]
execute if score #index tac.temp matches 19 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[19]
execute if score #index tac.temp matches 20 run data modify storage tac:temp recipe set from storage tac:temp savedData.recipes[20]


# Drop output item

## At the player, summon item
execute at @s run summon item ~ ~ ~ {Item:{id:"minecraft:barrier", Count:1b}, Tags:["tac.new_item"]}

## Set nbt and remove tag
data modify entity @e[type=item,limit=1,tag=tac.new_item] Item set from storage tac:temp recipe.output
tag @e[type=item,tag=tac.new_item,limit=1] remove tac.new_item


# Discount input
execute store result score #input_count tac.temp run data get storage tac:temp inventory[{Slot:9b}].Count
execute store result score #recipe_count tac.temp run data get storage tac:temp recipe.cost
execute store result block ~ ~ ~ Items[{Slot:9b}].Count byte 1 run scoreboard players operation #input_count tac.temp -= #recipe_count tac.temp