scoreboard players set @s bacaphd_whz 0
function bacaphd:detect/wh_z
scoreboard players add @s bacaphd_why 1
execute if score @s bacaphd_why matches ..4 positioned ~ ~1 ~ run function bacaphd:detect/wh_y
