execute if block ~ ~ ~ minecraft:tripwire[attached=true] run scoreboard players add @s bacaphd_tw_wire 1
execute if block ~ ~ ~ minecraft:tripwire_hook[attached=true] run scoreboard players add @s bacaphd_tw_hook 1
scoreboard players add @s bacaphd_sz 1
execute if score @s bacaphd_sz matches ..15 positioned ~ ~ ~1 run function bacaphd:detect/tw_z
