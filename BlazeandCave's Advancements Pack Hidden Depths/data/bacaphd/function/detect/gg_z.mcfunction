execute if block ~ ~ ~ minecraft:glass run scoreboard players add @s bacaphd_gg_glass 1
scoreboard players add @s bacaphd_sz 1
execute if score @s bacaphd_sz matches ..12 positioned ~ ~ ~1 run function bacaphd:detect/gg_z
