scoreboard players set @s bacaphd_why 0
function bacaphd:detect/wh_y
scoreboard players add @s bacaphd_whx 1
execute if score @s bacaphd_whx matches ..10 positioned ~1 ~ ~ run function bacaphd:detect/wh_x
