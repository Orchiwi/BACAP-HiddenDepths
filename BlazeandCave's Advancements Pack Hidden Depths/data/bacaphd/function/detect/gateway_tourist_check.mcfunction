scoreboard players operation @s bacaphd_dx = @s bacaphd_gw_x
scoreboard players operation @s bacaphd_dx -= @s bacaphd_gw_px
scoreboard players operation @s bacaphd_dz = @s bacaphd_gw_z
scoreboard players operation @s bacaphd_dz -= @s bacaphd_gw_pz
function bacaphd:detect/step
execute if score @s bacaphd_hi matches 200.. run scoreboard players add @s bacaphd_gwcount 1
execute if score @s bacaphd_gwcount matches 10.. run function bacaphd:detect/gateway_tourist_done
