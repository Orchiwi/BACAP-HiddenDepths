# B57 Cartographer's Wall. Item frames are entities, so this is four commands,
# not a block scan. Both frame types count.
execute store result score @s bacaphd_maps run execute if entity @e[type=minecraft:item_frame,distance=..6,nbt={Item:{id:"minecraft:filled_map"}}]
execute store result score @s bacaphd_hi run execute if entity @e[type=minecraft:glow_item_frame,distance=..6,nbt={Item:{id:"minecraft:filled_map"}}]
scoreboard players operation @s bacaphd_maps += @s bacaphd_hi
execute if score @s bacaphd_maps matches 9.. run advancement grant @s only bacaphd:building/cartographers_wall
