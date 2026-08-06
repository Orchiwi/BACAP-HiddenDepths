scoreboard players operation @s bacaphd_dx = @s bacaphd_mm_x
scoreboard players operation @s bacaphd_dx -= @s bacaphd_mm_px
scoreboard players operation @s bacaphd_dz = @s bacaphd_mm_z
scoreboard players operation @s bacaphd_dz -= @s bacaphd_mm_pz
function bacaphd:detect/step
# 400 decimetres in half a second is faster than any legitimate travel: teleport.
execute if score @s bacaphd_hi matches ..400 run scoreboard players operation @s bacaphd_lava += @s bacaphd_hi
execute if score @s bacaphd_lava matches 5000.. run function bacaphd:detect/magma_marathon_done
