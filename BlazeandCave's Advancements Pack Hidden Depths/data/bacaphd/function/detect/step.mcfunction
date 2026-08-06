# Shared step helper. Caller sets bacaphd_dx / bacaphd_dz to the signed delta;
# this leaves an octagonal approximation of the distance in bacaphd_hi:
#   max + 3/8 * min
# which is exact on either axis and under-reads by 2.8% at dx == dz. The old
# max + min/2 form over-read by 6.07% there, which made every '<= N' test
# quietly stricter than advertised.
execute if score @s bacaphd_dx matches ..-1 run scoreboard players operation @s bacaphd_dx *= $neg1 bacaphd_const
execute if score @s bacaphd_dz matches ..-1 run scoreboard players operation @s bacaphd_dz *= $neg1 bacaphd_const
scoreboard players operation @s bacaphd_hi = @s bacaphd_dx
scoreboard players operation @s bacaphd_hi > @s bacaphd_dz
scoreboard players operation @s bacaphd_lo = @s bacaphd_dx
scoreboard players operation @s bacaphd_lo < @s bacaphd_dz
scoreboard players operation @s bacaphd_lo *= $three bacaphd_const
scoreboard players operation @s bacaphd_lo /= $eight bacaphd_const
scoreboard players operation @s bacaphd_hi += @s bacaphd_lo
