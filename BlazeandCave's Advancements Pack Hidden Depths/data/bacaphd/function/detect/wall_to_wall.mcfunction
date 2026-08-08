# 19 x 19 at the player's FEET level - a player standing on carpet has their feet
# block inside the carpet itself, so that is the plane the carpet occupies. 256 of the
# 361 positions must be carpet, which is exactly a full 16 x 16 floor with three
# blocks of slack on where the player happens to be standing when it is sampled.
# Reached at most once every 5 s, for at most one player (@r).
scoreboard players set @s bacaphd_w2c 0
scoreboard players set @s bacaphd_w2x 0
execute positioned ~-9 ~ ~-9 run function bacaphd:detect/w2w_x
execute if score @s bacaphd_w2c matches 256.. run advancement grant @s only bacaphd:building/wall_to_wall
