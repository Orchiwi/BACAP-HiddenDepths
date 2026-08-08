scoreboard players set @s bacaphd_s2z 0
function bacaphd:detect/sc_z
scoreboard players add @s bacaphd_s2x 1
execute if score @s bacaphd_s2x matches ..6 positioned ~1 ~ ~ run function bacaphd:detect/sc_x
