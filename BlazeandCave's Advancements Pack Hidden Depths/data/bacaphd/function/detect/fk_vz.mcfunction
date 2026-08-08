# The five y offsets are unrolled, so the cube spans -2..+2 on every axis around
# the chest with two loop files instead of three.
execute if block ~ ~-2 ~ minecraft:obsidian run scoreboard players add @s bacaphd_fk 1
execute if block ~ ~-1 ~ minecraft:obsidian run scoreboard players add @s bacaphd_fk 1
execute if block ~ ~ ~ minecraft:obsidian run scoreboard players add @s bacaphd_fk 1
execute if block ~ ~1 ~ minecraft:obsidian run scoreboard players add @s bacaphd_fk 1
execute if block ~ ~2 ~ minecraft:obsidian run scoreboard players add @s bacaphd_fk 1
scoreboard players add @s bacaphd_fk_k 1
execute if score @s bacaphd_fk_k matches ..4 positioned ~ ~ ~1 run function bacaphd:detect/fk_vz
