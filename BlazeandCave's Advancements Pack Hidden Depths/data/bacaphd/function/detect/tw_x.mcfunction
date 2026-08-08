scoreboard players set @s bacaphd_sy 0
function bacaphd:detect/tw_y
scoreboard players add @s bacaphd_sx 1
execute if score @s bacaphd_sx matches ..15 positioned ~1 ~ ~ run function bacaphd:detect/tw_x
