# B13 Ominous Marathon. Reject this credit if it is within 256 blocks of chamber 1.
scoreboard players operation @s bacaphd_dx = @s bacaphd_px
scoreboard players operation @s bacaphd_dx -= @s bacaphd_lx1
execute if score @s bacaphd_dx matches ..-1 run scoreboard players operation @s bacaphd_dx *= #neg1 bacaphd_const
scoreboard players operation @s bacaphd_dz = @s bacaphd_pz
scoreboard players operation @s bacaphd_dz -= @s bacaphd_lz1
execute if score @s bacaphd_dz matches ..-1 run scoreboard players operation @s bacaphd_dz *= #neg1 bacaphd_const
execute if score @s bacaphd_dx matches ..255 if score @s bacaphd_dz matches ..255 run scoreboard players set @s bacaphd_ok 0
