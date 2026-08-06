execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air unless block ~ ~ ~ minecraft:water unless block ~ ~ ~ minecraft:lava run scoreboard players add @s bacaphd_col 1
scoreboard players add @s bacaphd_sy 1
execute if score @s bacaphd_sy matches ..383 positioned ~ ~1 ~ run function bacaphd:detect/skyscraper_y
