# Urban Decay. Only reached while the player is standing in an Ancient City: the bucket
# line selects on the advancement's own `city` criterion being true and its impossible
# guard being false, so this stops running the instant it is granted.
# bacaphd_ud_p is a snapshot of the count taken before any branch runs. Without it the
# first-city branch would set the count to 1 and the second-city branch would then fire in
# the same invocation, crediting one visit twice.
scoreboard players add @s bacaphd_ud_n 0
scoreboard players add @s bacaphd_ud_1x 0
scoreboard players add @s bacaphd_ud_1z 0
scoreboard players add @s bacaphd_ud_2x 0
scoreboard players add @s bacaphd_ud_2z 0
scoreboard players operation @s bacaphd_ud_p = @s bacaphd_ud_n
# Re-arm the location criterion so the next city can fire it again.
advancement revoke @s only bacaphd:mining/urban_decay city
execute store result score @s bacaphd_ud_x run data get entity @s Pos[0] 1
execute store result score @s bacaphd_ud_z run data get entity @s Pos[2] 1
# Chebyshev distance to city 1. Ancient Cities generate far more than 512 blocks apart,
# and 512 is far larger than one city, so this splits sites without splitting a site.
scoreboard players operation @s bacaphd_ud_a = @s bacaphd_ud_x
scoreboard players operation @s bacaphd_ud_a -= @s bacaphd_ud_1x
execute if score @s bacaphd_ud_a matches ..-1 run scoreboard players operation @s bacaphd_ud_a *= $s7neg bacaphd_const
scoreboard players operation @s bacaphd_ud_b = @s bacaphd_ud_z
scoreboard players operation @s bacaphd_ud_b -= @s bacaphd_ud_1z
execute if score @s bacaphd_ud_b matches ..-1 run scoreboard players operation @s bacaphd_ud_b *= $s7neg bacaphd_const
scoreboard players operation @s bacaphd_ud_a > @s bacaphd_ud_b
# and to city 2
scoreboard players operation @s bacaphd_ud_c = @s bacaphd_ud_x
scoreboard players operation @s bacaphd_ud_c -= @s bacaphd_ud_2x
execute if score @s bacaphd_ud_c matches ..-1 run scoreboard players operation @s bacaphd_ud_c *= $s7neg bacaphd_const
scoreboard players operation @s bacaphd_ud_d = @s bacaphd_ud_z
scoreboard players operation @s bacaphd_ud_d -= @s bacaphd_ud_2z
execute if score @s bacaphd_ud_d matches ..-1 run scoreboard players operation @s bacaphd_ud_d *= $s7neg bacaphd_const
scoreboard players operation @s bacaphd_ud_c > @s bacaphd_ud_d
execute if score @s bacaphd_ud_p matches 0 run scoreboard players operation @s bacaphd_ud_1x = @s bacaphd_ud_x
execute if score @s bacaphd_ud_p matches 0 run scoreboard players operation @s bacaphd_ud_1z = @s bacaphd_ud_z
execute if score @s bacaphd_ud_p matches 0 run scoreboard players set @s bacaphd_ud_n 1
execute if score @s bacaphd_ud_p matches 1 if score @s bacaphd_ud_a matches 512.. run scoreboard players operation @s bacaphd_ud_2x = @s bacaphd_ud_x
execute if score @s bacaphd_ud_p matches 1 if score @s bacaphd_ud_a matches 512.. run scoreboard players operation @s bacaphd_ud_2z = @s bacaphd_ud_z
execute if score @s bacaphd_ud_p matches 1 if score @s bacaphd_ud_a matches 512.. run scoreboard players set @s bacaphd_ud_n 2
# The third site must be clear of BOTH of the first two, so shuttling between two cities
# can never pay for a third.
execute if score @s bacaphd_ud_p matches 2 if score @s bacaphd_ud_a matches 512.. if score @s bacaphd_ud_c matches 512.. run advancement grant @s only bacaphd:mining/urban_decay
