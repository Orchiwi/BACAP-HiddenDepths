scoreboard players set @s bacaphd_sz 0
function bacaphd:detect/mono_z with storage bacaphd:mono
scoreboard players add @s bacaphd_sy 1
execute if score @s bacaphd_sy matches ..8 positioned ~ ~1 ~ run function bacaphd:detect/mono_y
