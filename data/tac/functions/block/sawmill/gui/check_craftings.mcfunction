#> tac:block/sawmill/gui/check_craftings

# Reset index
scoreboard players set #index tac.temp -1

# This is a mess :)
## Okay, here we start with '#index' being -1, this will identify
## which slot is missing(the one clicked) and we'll get the correct
## recipe just as 'savedData.recipes[#index]' later on. 
execute if score #grid_length tac.temp matches 1.. unless data storage tac:temp inventory[{Slot:2b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 0
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 2.. unless data storage tac:temp inventory[{Slot:3b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 1
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 3.. unless data storage tac:temp inventory[{Slot:4b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 2
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 4.. unless data storage tac:temp inventory[{Slot:5b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 3
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 5.. unless data storage tac:temp inventory[{Slot:6b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 4
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 6.. unless data storage tac:temp inventory[{Slot:7b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 5
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 7.. unless data storage tac:temp inventory[{Slot:8b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 6
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 8.. unless data storage tac:temp inventory[{Slot:11b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 7
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 9.. unless data storage tac:temp inventory[{Slot:12b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 8
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 10.. unless data storage tac:temp inventory[{Slot:13b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 9
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 11.. unless data storage tac:temp inventory[{Slot:14b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 10
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 12.. unless data storage tac:temp inventory[{Slot:15b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 11
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 13.. unless data storage tac:temp inventory[{Slot:16b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 12
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 14.. unless data storage tac:temp inventory[{Slot:17b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 13
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 15.. unless data storage tac:temp inventory[{Slot:20b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 14
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 16.. unless data storage tac:temp inventory[{Slot:21b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 15
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 17.. unless data storage tac:temp inventory[{Slot:22b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 16
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 18.. unless data storage tac:temp inventory[{Slot:23b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 17
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 19.. unless data storage tac:temp inventory[{Slot:24b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 18
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 20.. unless data storage tac:temp inventory[{Slot:25b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 29
execute if score #index tac.temp matches -1 if score #grid_length tac.temp matches 21.. unless data storage tac:temp inventory[{Slot:26b, tag:{isRecipeItem:1b}}] run scoreboard players set #index tac.temp 20

# DEBUG
#tellraw @a ["Index: ", {"score":{"name":"#index", "objective":"tac.temp"}}]

# If '#index' is 0.., then identify player
execute if score #index tac.temp matches 0.. as @a[distance=..8] run function tac:block/sawmill/gui/identify_player