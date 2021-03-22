#> tac:block/sawmill/gui/insert_input

data modify storage tac:temp insertedInput set from storage tac:temp insertedItems[{Slot:0b}]
data modify storage tac:temp insertedInput.Slot set value 9b
data modify block ~ ~ ~ Items append from storage tac:temp insertedInput
data remove storage tac:temp insertedItems[{Slot:0b}]