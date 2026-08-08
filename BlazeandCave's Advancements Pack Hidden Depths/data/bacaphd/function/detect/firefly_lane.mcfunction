# Firefly Lane. 17 x 5 x 17 around the player, reached at most once every 5s for
# one candidate player (@r in the slow bucket). One walk feeds two counters: the
# Firefly Bushes and the Dirt Path they are supposed to be lining. Requiring both
# is what stops a patch of bushes in a field from passing as a lane.
scoreboard players set @s bacaphd_ffb 0
scoreboard players set @s bacaphd_fpath 0
scoreboard players set @s bacaphd_sx 0
execute positioned ~-8 ~-2 ~-8 run function bacaphd:detect/fl_x
execute if score @s bacaphd_ffb matches 20.. if score @s bacaphd_fpath matches 20.. run advancement grant @s only bacaphd:building/firefly_lane
