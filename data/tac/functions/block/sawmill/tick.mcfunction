#> tac:block/sawmill/tick

# Block destroyed
execute unless block ~ ~ ~ barrel run kill @s

# Operate GUI if barrel is open
execute if block ~ ~ ~ barrel[open=true] run function tac:block/sawmill/gui/main