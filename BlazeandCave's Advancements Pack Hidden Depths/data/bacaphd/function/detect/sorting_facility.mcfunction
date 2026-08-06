# B53 Sorting Facility. 16 x 7 x 16 around the player - a chunk footprint,
# seven blocks tall. Reached at most once every 5s for one player (@r).
scoreboard players set @s bacaphd_hoppers 0
scoreboard players set @s bacaphd_chests 0
scoreboard players set @s bacaphd_sx 0
execute positioned ~-8 ~-3 ~-8 run function bacaphd:detect/sf_x
execute if score @s bacaphd_hoppers matches 27.. if score @s bacaphd_chests matches 27.. run advancement grant @s only bacaphd:redstone/sorting_facility
