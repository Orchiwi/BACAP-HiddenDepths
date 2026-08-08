# 9 x 3 x 9 = 243 positions, ten of which must hold an open Eyeblossom. The three
# y offsets are unrolled so a terraced planting still counts.
execute if block ~ ~-1 ~ minecraft:open_eyeblossom run scoreboard players add @s bacaphd_eye 1
execute if block ~ ~ ~ minecraft:open_eyeblossom run scoreboard players add @s bacaphd_eye 1
execute if block ~ ~1 ~ minecraft:open_eyeblossom run scoreboard players add @s bacaphd_eye 1
scoreboard players add @s bacaphd_s2z 1
execute if score @s bacaphd_s2z matches ..8 positioned ~ ~ ~1 run function bacaphd:detect/aeom_z
