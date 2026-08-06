execute if block ~ ~ ~ minecraft:bell[powered=true] run function bacaphd:detect/ct_bell
execute if block ~ ~ ~ minecraft:daylight_detector run scoreboard players add @s bacaphd_dets 1
execute if block ~ ~ ~ minecraft:daylight_detector[power=0] run scoreboard players remove @s bacaphd_dets 1
execute if block ~ ~ ~ minecraft:daylight_detector unless block ~ ~ ~ minecraft:daylight_detector[power=0] run function bacaphd:detect/ct_det
execute if block ~ ~ ~ minecraft:redstone_wire run scoreboard players add @s bacaphd_wire 1
execute if block ~ ~ ~ minecraft:repeater run scoreboard players add @s bacaphd_wire 1
execute if block ~ ~ ~ minecraft:comparator run scoreboard players add @s bacaphd_wire 1
scoreboard players add @s bacaphd_sz 1
execute if score @s bacaphd_sz matches ..8 positioned ~ ~ ~1 run function bacaphd:detect/ct_z
