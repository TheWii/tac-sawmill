#> tac:block/sawmill/gui/locked_slots

# Get inserted items
data modify storage tac:temp insertedItems set from storage tac:temp inventory


# Reset locked slots

## Filter items that should not be dropped

### Slot lockers
data remove storage tac:temp insertedItems[{tag:{lockedSlot:1b}}]

### Input slot
data remove storage tac:temp insertedItems[{Slot:9b}]


# Attempt to move slot 0 to input slot
execute if entity @s[tag=!tac.has_input] if data storage tac:temp insertedItems[{Slot:0b}] run function tac:block/sawmill/gui/insert_input

## Drop items if there's at least one
execute if data storage tac:temp insertedItems[0] at @a[sort=nearest,limit=1,distance=..8] run function tac:block/sawmill/gui/drop_items

## Reset slots
loot replace block ~ ~ ~ container.0 loot tac:air
loot replace block ~ ~ ~ container.1 loot tac:air
loot replace block ~ ~ ~ container.10 loot tac:air
loot replace block ~ ~ ~ container.18 loot tac:air
loot replace block ~ ~ ~ container.19 loot tac:air


# Check recipe slots

## Check recipe grid slots if there's at least one recipe displayed
execute if data storage tac:temp savedData.recipes[0] run function tac:block/sawmill/gui/check_craftings

# Kill dropped items and clear items from players
kill @e[type=item,nbt={Item:{tag:{lockedSlot:1b}}}]
clear @a #tac:all_items{lockedSlot:1b}


# Update inventory
data modify storage tac:temp inventory set from block ~ ~ ~ Items

# Reset has input tag
tag @s remove tac.has_input
execute if data storage tac:temp inventory[{Slot:9b}] run tag @s add tac.has_input

# To avoid possible bugs, let's force our system to check
# the recipes by setting '#input_changed' score to 1.
scoreboard players set #input_changed tac.temp 1