execute if block ~ ~ ~ minecraft:hopper run scoreboard players add @s bacaphd_hoppers 1
execute if block ~ ~ ~ minecraft:chest run scoreboard players add @s bacaphd_chests 1
scoreboard players add @s bacaphd_sz 1
execute if score @s bacaphd_sz matches ..15 positioned ~ ~ ~1 run function bacaphd:detect/sf_z
