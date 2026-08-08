scoreboard players set @s bacaphd_w2z 0
function bacaphd:detect/w2w_z
scoreboard players add @s bacaphd_w2x 1
execute if score @s bacaphd_w2x matches ..18 positioned ~1 ~ ~ run function bacaphd:detect/w2w_x
