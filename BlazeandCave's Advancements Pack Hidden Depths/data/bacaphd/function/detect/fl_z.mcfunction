execute if block ~ ~ ~ minecraft:firefly_bush run scoreboard players add @s bacaphd_ffb 1
execute if block ~ ~ ~ minecraft:dirt_path run scoreboard players add @s bacaphd_fpath 1
scoreboard players add @s bacaphd_sz 1
execute if score @s bacaphd_sz matches ..16 positioned ~ ~ ~1 run function bacaphd:detect/fl_z
