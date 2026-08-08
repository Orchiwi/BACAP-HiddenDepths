# 13 x 5 x 13 starting one block above the player's feet.
scoreboard players set @s bacaphd_gg_glass 0
scoreboard players set @s bacaphd_sx 0
execute positioned ~-6 ~1 ~-6 run function bacaphd:detect/gg_x
execute if score @s bacaphd_gg_glass matches 100.. run advancement grant @s only bacaphd:farming/greenhouse_gases
