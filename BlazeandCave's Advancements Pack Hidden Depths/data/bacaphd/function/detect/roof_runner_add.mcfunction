scoreboard players operation @s bacaphd_dx = @s bacaphd_rr_x
scoreboard players operation @s bacaphd_dx -= @s bacaphd_rr_px
scoreboard players operation @s bacaphd_dz = @s bacaphd_rr_z
scoreboard players operation @s bacaphd_dz -= @s bacaphd_rr_pz
function bacaphd:detect/step
# 60 decimetres per half second is 12 blocks a second. Sprinting is 5.6 and
# sprint-jumping about 7.1, so walking the roof counts in full; unassisted
# gliding is 15 to 25 and rocket flight 30 plus, so neither banks anything.
execute if score @s bacaphd_hi matches ..60 run scoreboard players operation @s bacaphd_roof += @s bacaphd_hi
execute if score @s bacaphd_roof matches 20000.. run function bacaphd:detect/roof_runner_done
