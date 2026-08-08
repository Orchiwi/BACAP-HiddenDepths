scoreboard players set @s bacaphd_fk_k 0
function bacaphd:detect/fk_vz
scoreboard players add @s bacaphd_fk_i 1
execute if score @s bacaphd_fk_i matches ..4 positioned ~1 ~ ~ run function bacaphd:detect/fk_vx
