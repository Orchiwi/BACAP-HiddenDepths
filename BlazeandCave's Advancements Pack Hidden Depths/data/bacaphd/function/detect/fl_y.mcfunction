scoreboard players set @s bacaphd_sz 0
function bacaphd:detect/fl_z
scoreboard players add @s bacaphd_sy 1
execute if score @s bacaphd_sy matches ..4 positioned ~ ~1 ~ run function bacaphd:detect/fl_y
