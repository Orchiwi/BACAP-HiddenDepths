execute if block ~ ~ ~ minecraft:copper_block if block ~1 ~ ~ minecraft:exposed_copper if block ~2 ~ ~ minecraft:weathered_copper if block ~3 ~ ~ minecraft:oxidized_copper run scoreboard players set @s bacaphd_whh 1
execute if block ~ ~ ~ minecraft:oxidized_copper if block ~1 ~ ~ minecraft:weathered_copper if block ~2 ~ ~ minecraft:exposed_copper if block ~3 ~ ~ minecraft:copper_block run scoreboard players set @s bacaphd_whh 1
execute if block ~ ~ ~ minecraft:copper_block if block ~ ~ ~1 minecraft:exposed_copper if block ~ ~ ~2 minecraft:weathered_copper if block ~ ~ ~3 minecraft:oxidized_copper run scoreboard players set @s bacaphd_whh 1
execute if block ~ ~ ~ minecraft:oxidized_copper if block ~ ~ ~1 minecraft:weathered_copper if block ~ ~ ~2 minecraft:exposed_copper if block ~ ~ ~3 minecraft:copper_block run scoreboard players set @s bacaphd_whh 1
scoreboard players add @s bacaphd_whz 1
execute if score @s bacaphd_whz matches ..10 positioned ~ ~ ~1 run function bacaphd:detect/wh_z
