# All Eyes on Me. The bucket_slow gate is one block test - the player has to be
# standing IN an open Eyeblossom, which is the "standing among them" half of the
# idea and costs nothing for anyone else. No time-of-day test appears anywhere:
# an Eyeblossom is only in its OPEN form at night, so counting open ones IS the
# dusk condition, and 'time query daytime' would not have parsed here anyway.
scoreboard players set @s bacaphd_eye 0
scoreboard players set @s bacaphd_s2x 0
execute positioned ~-4 ~ ~-4 run function bacaphd:detect/aeom_x
execute if score @s bacaphd_eye matches 10.. run advancement grant @s only bacaphd:biomes/all_eyes_on_me
