scoreboard players operation @s bacaphd_dx = @s bacaphd_ps_x
scoreboard players operation @s bacaphd_dx -= @s bacaphd_ps_nx
scoreboard players operation @s bacaphd_dz = @s bacaphd_ps_z
scoreboard players operation @s bacaphd_dz -= @s bacaphd_ps_nz
function bacaphd:detect/step
scoreboard players operation @s bacaphd_ps_far > @s bacaphd_hi
