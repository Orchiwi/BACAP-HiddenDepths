execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air run function bacaphd:detect/fb_hit
execute if score @s bacaphd_fbr matches ..15 if block ~ ~ ~ minecraft:air run function bacaphd:detect/fb_ray
execute if score @s bacaphd_fbr matches ..15 if block ~ ~ ~ minecraft:cave_air run function bacaphd:detect/fb_ray
