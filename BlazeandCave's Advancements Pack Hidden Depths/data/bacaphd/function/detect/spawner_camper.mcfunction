# Spawner Camper. Runs once every 20 ticks for a player who is inside a Trial
# Chamber RIGHT NOW: the advancement's own in_chamber criterion is the gate and
# bucket_fast revokes it again on the same pass, so minecraft:location has to
# re-prove the player's position before the next sample. Nobody outside a chamber
# ever pays for the 7 x 3 x 7 probe below.
scoreboard players set @s bacaphd_s2x 0
execute positioned ~-3 ~ ~-3 run function bacaphd:detect/sc_x
