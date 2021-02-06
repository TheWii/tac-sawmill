#> tac:block/sawmill/gui/recipes/main

# DEBUG
#say Input changed.

# Reset variables

#  This is the list of recipes that will be displayed in the GUI later on.
## Obviously it'll start as an empty list.
data modify storage tac:temp matchedRecipes set value []

#  2b is the first slot in the grid, the recipes will be displayed from
## slot 2b to 8b in the first row, then it'll ignore 9b and 10b and continue
## in the next row.
## NOTE: In the way it is righy now, if it reaches the last slot 27b it'll
## simply break the system, unless a functionality to add 'pages' is added.
scoreboard players set #slot tac.temp 2



# Get input from block inventory
data modify storage tac:temp input set value {}
data modify storage tac:temp input set from storage tac:temp inventory[{Slot:9b}]
#DEBUG
#tellraw @a ["Comparing input:\n Previous: ", {"nbt":"savedData.input", "storage":"tac:temp"}, "\n Current: ", {"nbt":"input", "storage":"tac:temp"}]

## Save this input to 'savedData'
data modify storage tac:temp savedData.input set from storage tac:temp input

##  We'll save 'input.Count' to '#input_count' score instead(better to compare
### numbers using scores). 
execute store result score #input_count tac.temp run data get storage tac:temp input.Count

## Remove 'Slot' and 'Count' nbt
data remove storage tac:temp input.Slot
data remove storage tac:temp input.Count


#  Get recipe list
## 'tac:data recipes' here is the recipe registry(a list), 'tac:data' is a
## storage that must keep data(a.k.a important data that must not be deleted
## and should be restored on '#minecraft:load').
data modify storage tac:temp recipes set from storage tac:data recipes


# Loop through recipes(If there's an input, and if there's at least one recipe, just in case)
# DEBUG
#tellraw @a [" - Input: ", {"nbt":"input", "storage":"tac:temp"}, "\n - Count: ", {"score":{"name":"#input_count", "objective":"tac.temp"}}]
execute if data storage tac:temp input.id if data storage tac:temp recipes[0] run function tac:block/sawmill/gui/recipes/loop

#  At this point, all matched recipes are present in 'matchedRecipes', let's
## update the grid now.

#  First we'll reset the grid slots(Empty slots are actually filled with
## dummy items to prevent shift clicked items from entering unwanted slots
## and go to the input slot instead.
replaceitem block ~ ~ ~ container.2 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.3 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.4 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.5 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.6 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.7 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.8 barrier{lockedSlot:1b, isRecipeItem:0b}

replaceitem block ~ ~ ~ container.11 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.12 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.13 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.14 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.15 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.16 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.17 barrier{lockedSlot:1b, isRecipeItem:0b}

replaceitem block ~ ~ ~ container.20 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.21 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.22 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.23 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.24 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.25 barrier{lockedSlot:1b, isRecipeItem:0b}
replaceitem block ~ ~ ~ container.26 barrier{lockedSlot:1b, isRecipeItem:0b}

#  Now we'll append the matched recipe display items to the container.
## 'append matchedRecipes[].display' basically means "from each element in list, get
## the child 'display' and append it to 'Items'". The recipe items will overwrite
## the dummy items we set above.
data modify block ~ ~ ~ Items append from storage tac:temp matchedRecipes[].display
# DEBUG
#tellraw @a ["----------\nMatched recipes: ", {"nbt":"matchedRecipes", "storage":"tac:temp"}]

# Save the matched recipes to 'savedData' and set tell our system to save this data
data modify storage tac:temp savedData.recipes set from storage tac:temp matchedRecipes
scoreboard players set #save_data tac.temp 1