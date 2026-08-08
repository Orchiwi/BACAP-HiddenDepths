execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air run function bacaphd:detect/fb_candle_hit
scoreboard players add @s bacaphd_fbz 1
execute if score @s bacaphd_fbz matches ..15 positioned ~ ~ ~1 run function bacaphd:detect/fb_cz
