# 9 x 9 x 9 = 729 positions, of which 500 must be the one block id - a 69% fill,
# so the result really is a solid mass of one colour.
# The cube sits ENTIRELY BELOW the player: ~-9 to ~-1, so its top layer is the
# very block the player is standing on - the same block that named the colour.
# Centring it on the player (the old ~-4 ~-4 ~-4) meant standing on top of your
# own structure could only ever reach four full layers, 4 x 81 = 324 of 729,
# under the threshold: the intended way to earn it could not fire at all.
scoreboard players set @s bacaphd_mono 0
scoreboard players set @s bacaphd_sx 0
execute positioned ~-4 ~-9 ~-4 run function bacaphd:detect/mono_x
execute if score @s bacaphd_mono matches 500.. run advancement grant @s only bacaphd:building/monochrome
