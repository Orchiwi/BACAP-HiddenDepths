scoreboard players set @s bacaphd_sz 0
function bacaphd:detect/ct_z
scoreboard players add @s bacaphd_sy 1
execute if score @s bacaphd_sy matches ..10 positioned ~ ~1 ~ run function bacaphd:detect/ct_y
