# Bread Winner, one Villager. Runs as each baby Villager the pack has never sampled.
# The tag is permanent, so this Age read happens on the first tick this pack ever sees
# that Villager: a newborn starts at -24000 and climbs one per tick, so anything at or
# below -23900 was born within the last hundred ticks - the width of one bucket_slow
# sample. A cub that was already in the village when the player walked up aged past
# that window long before it was first sampled, and banks nothing.
# #bwage is SET before the read: `data get` on a missing path fails silently and would
# otherwise leave the previous Villager's value standing.
tag @s add bacaphd.bw
scoreboard players set #bwage bacaphd_sys 0
execute store result score #bwage bacaphd_sys run data get entity @s Age
execute if score #bwage bacaphd_sys matches ..-23900 run scoreboard players add #bwnew bacaphd_sys 1
