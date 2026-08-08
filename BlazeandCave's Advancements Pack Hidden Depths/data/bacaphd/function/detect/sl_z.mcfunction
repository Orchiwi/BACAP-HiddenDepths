execute if block ~ ~ ~ minecraft:spore_blossom run scoreboard players add @s bacaphd_spore 1
scoreboard players add @s bacaphd_sz 1
execute if score @s bacaphd_sz matches ..8 positioned ~ ~ ~1 run function bacaphd:detect/sl_z
