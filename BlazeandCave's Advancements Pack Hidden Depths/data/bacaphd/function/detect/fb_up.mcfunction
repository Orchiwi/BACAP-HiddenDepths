execute if block ~ ~ ~ minecraft:air run scoreboard players add @s bacaphd_fbk 1
execute if block ~ ~ ~ minecraft:cave_air run scoreboard players add @s bacaphd_fbk 1
scoreboard players add @s bacaphd_fby 1
execute if score @s bacaphd_fby matches ..18 positioned ~ ~1 ~ run function bacaphd:detect/fb_up
