#> tac:core/register/generate_display

# Copy output item to display item
data modify storage tac:data recipes[-1].display set from storage tac:data recipes[-1].output
execute store result score #produces tac.temp run data get storage tac:data recipes[-1].display.Count

setblock 1 0 0 oak_sign{Text2:'[{"text":"Cost: ","italic":false,"color":"gray"},{"text":"x", "color":"white"},{"score":{"name":"#material_cost","objective":"tac.io"},"color":"white","italic":false}]', Text3:'[{"text":"Produces: ","italic":false,"color":"gray"},{"text":"x", "color":"white"},{"score":{"name":"#produces","objective":"tac.temp"},"color":"white","italic":false}]'}
data modify storage tac:data recipes[-1].display.tag.display.Lore append from block 1 0 0 Text2
data modify storage tac:data recipes[-1].display.tag.display.Lore append from block 1 0 0 Text3

# Reset sign
setblock 1 0 0 air