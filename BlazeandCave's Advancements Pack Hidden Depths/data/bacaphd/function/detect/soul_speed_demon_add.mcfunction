scoreboard players operation @s bacaphd_dx = @s bacaphd_ss_x
scoreboard players operation @s bacaphd_dx -= @s bacaphd_ss_px
scoreboard players operation @s bacaphd_dz = @s bacaphd_ss_z
scoreboard players operation @s bacaphd_dz -= @s bacaphd_ss_pz
function bacaphd:detect/step
# Samples are now about a second apart (the criterion has to be re-earned), and
# nothing on soul sand moves faster than roughly 12 blocks a second, so 250
# decimetres is a generous teleport cap.
execute if score @s bacaphd_hi matches 1..250 run scoreboard players operation @s bacaphd_soul += @s bacaphd_hi
execute if score @s bacaphd_soul matches 50000.. run function bacaphd:detect/soul_speed_demon_done
