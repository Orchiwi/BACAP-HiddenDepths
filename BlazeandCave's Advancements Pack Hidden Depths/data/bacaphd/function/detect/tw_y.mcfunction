scoreboard players set @s bacaphd_sz 0
function bacaphd:detect/tw_z
scoreboard players add @s bacaphd_sy 1
execute if score @s bacaphd_sy matches ..3 positioned ~ ~1 ~ run function bacaphd:detect/tw_y
