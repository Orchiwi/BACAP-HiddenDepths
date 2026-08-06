$execute if block ~ ~ ~ $(id) run scoreboard players add @s bacaphd_mono 1
scoreboard players add @s bacaphd_sz 1
execute if score @s bacaphd_sz matches ..8 positioned ~ ~ ~1 run function bacaphd:detect/mono_z with storage bacaphd:mono
