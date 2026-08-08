# air / cave_air short-circuit first: on a floor that is not carpeted the 16 colour
# tests are never reached at all.
execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air run function bacaphd:detect/w2w_hit
scoreboard players add @s bacaphd_w2z 1
execute if score @s bacaphd_w2z matches ..18 positioned ~ ~ ~1 run function bacaphd:detect/w2w_z
