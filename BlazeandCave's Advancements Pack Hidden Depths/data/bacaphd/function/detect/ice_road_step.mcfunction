# |dx| and |dz|
execute if score @s bacaphd_ice_dx matches ..-1 run scoreboard players operation @s bacaphd_ice_dx *= $neg bacaphd_const
execute if score @s bacaphd_ice_dz matches ..-1 run scoreboard players operation @s bacaphd_ice_dz *= $neg bacaphd_const
# Octagonal distance approximation: max + 3/8 * min
scoreboard players operation @s bacaphd_ice_hi = @s bacaphd_ice_dx
scoreboard players operation @s bacaphd_ice_hi > @s bacaphd_ice_dz
scoreboard players operation @s bacaphd_ice_lo = @s bacaphd_ice_dx
scoreboard players operation @s bacaphd_ice_lo < @s bacaphd_ice_dz
scoreboard players operation @s bacaphd_ice_lo *= $three bacaphd_const
scoreboard players operation @s bacaphd_ice_lo /= $eight bacaphd_const
scoreboard players operation @s bacaphd_ice_hi += @s bacaphd_ice_lo
# Under 3 blocks per half second is stopped; over 50 is a teleport. Either resets.
execute unless score @s bacaphd_ice_hi matches 30..500 run scoreboard players set @s bacaphd_ice_dist 0
execute if score @s bacaphd_ice_hi matches 30..500 run scoreboard players operation @s bacaphd_ice_dist += @s bacaphd_ice_hi
execute if score @s bacaphd_ice_dist matches 5000.. run function bacaphd:detect/ice_road_done
