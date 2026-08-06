scoreboard players set @s bacaphd_ps_arm 0
scoreboard players operation @s bacaphd_dx = @s bacaphd_ps_x
scoreboard players operation @s bacaphd_dx -= @s bacaphd_ps_ax
scoreboard players operation @s bacaphd_dz = @s bacaphd_ps_z
scoreboard players operation @s bacaphd_dz -= @s bacaphd_ps_az
function bacaphd:detect/step
# 200 blocks away from the entry portal at some point down there, AND back out
# within ten blocks of the spot you left. Stepping in and straight back out
# leaves bacaphd_ps_far at 0 and grants nothing.
execute if score @s bacaphd_ps_far matches 200.. if score @s bacaphd_hi matches ..10 run function bacaphd:detect/portal_sniper_done
