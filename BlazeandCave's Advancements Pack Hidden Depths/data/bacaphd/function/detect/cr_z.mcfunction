execute if block ~ ~ ~ minecraft:dispenser run scoreboard players add @s bacaphd_disp 1
execute if block ~ ~ ~ minecraft:target unless block ~ ~ ~ minecraft:target[power=0] run scoreboard players add @s bacaphd_ctgt 1
scoreboard players add @s bacaphd_sz 1
execute if score @s bacaphd_sz matches ..12 positioned ~ ~ ~1 run function bacaphd:detect/cr_z
