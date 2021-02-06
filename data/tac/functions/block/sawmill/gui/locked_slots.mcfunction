#> tac:block/sawmill/gui/locked_slots

# DEBUG
#tellraw @a ["Locked slots count is ",{"score":{"name":"#locked_slots_count", "objective":"tac.temp"}}, ", updating locked slots."]

# Get inserted items
data modify storage tac:temp insertedItems set from storage tac:temp inventory


# Reset locked slots

## Filter items that should not be dropped

### Slot lockers
data remove storage tac:temp insertedItems[{tag:{lockedSlot:1b}}]

### Input slot
data remove storage tac:temp insertedItems[{Slot:9b}]


## Drop items if there's at least one
execute if data storage tac:temp insertedItems[0] at @a[sort=nearest,limit=1,distance=..8] run function tac:block/sawmill/gui/drop_items

## Set dummy items
replaceitem block ~ ~ ~ container.0 barrier{lockedSlot:1b}
replaceitem block ~ ~ ~ container.1 barrier{lockedSlot:1b}
replaceitem block ~ ~ ~ container.10 barrier{lockedSlot:1b}
replaceitem block ~ ~ ~ container.18 barrier{lockedSlot:1b}
replaceitem block ~ ~ ~ container.19 barrier{lockedSlot:1b}


# Check recipe slots

## Get grid length(Amount of recipes being displayed)
execute store result score #grid_length tac.temp if data storage tac:temp savedData.recipes[]

##  If grid length is equal to or bigger than 1, then run function 
### to check if anyslot was removed.
execute if score #grid_length tac.temp matches 1.. run function tac:block/sawmill/gui/check_craftings


# Kill dropped items and clear items from players
kill @e[type=item,nbt={Item:{tag:{lockedSlot:1b}}}]
clear @a #tac:all_items{lockedSlot:1b}


# Update inventory
data modify storage tac:temp inventory set from block ~ ~ ~ Items

# To avoid possible bugs, let's force our system to check
# the recipes by setting '#input_changed' score to 1.
scoreboard players set #input_changed tac.temp 1