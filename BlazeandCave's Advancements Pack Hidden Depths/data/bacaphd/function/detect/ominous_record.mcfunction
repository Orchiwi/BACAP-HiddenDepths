# B13 Ominous Marathon. A chamber that is far from every one already credited.
# Store its position in the next free slot and count it.
scoreboard players add @s bacaphd_omc 1
execute if score @s bacaphd_omc matches 1 run scoreboard players operation @s bacaphd_lx1 = @s bacaphd_px
execute if score @s bacaphd_omc matches 1 run scoreboard players operation @s bacaphd_lz1 = @s bacaphd_pz
execute if score @s bacaphd_omc matches 2 run scoreboard players operation @s bacaphd_lx2 = @s bacaphd_px
execute if score @s bacaphd_omc matches 2 run scoreboard players operation @s bacaphd_lz2 = @s bacaphd_pz
execute if score @s bacaphd_omc matches 3 run scoreboard players operation @s bacaphd_lx3 = @s bacaphd_px
execute if score @s bacaphd_omc matches 3 run scoreboard players operation @s bacaphd_lz3 = @s bacaphd_pz
execute if score @s bacaphd_omc matches 4 run scoreboard players operation @s bacaphd_lx4 = @s bacaphd_px
execute if score @s bacaphd_omc matches 4 run scoreboard players operation @s bacaphd_lz4 = @s bacaphd_pz
execute if score @s bacaphd_omc matches 5 run scoreboard players operation @s bacaphd_lx5 = @s bacaphd_px
execute if score @s bacaphd_omc matches 5 run scoreboard players operation @s bacaphd_lz5 = @s bacaphd_pz
execute if score @s bacaphd_omc matches 5.. run advancement grant @s only bacaphd:adventure/ominous_marathon
