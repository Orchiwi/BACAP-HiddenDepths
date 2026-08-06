# B62 Parrot Choir - a playing Jukebox anywhere in the 3x3 column at or just below the player's
# feet. Parrots only dance while the Jukebox is closerToCenterThan(pos, 3.46), so each hit snaps
# to that block's centre and counts the Parrots from THERE, not from the player.
# #h5_jukebox short-circuits the scan and there is a single grant at the end.
scoreboard players set #h5_jukebox bacaphd_tmp 0
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~-1 ~ ~-1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~-1 ~ ~ align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~-1 ~ ~1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~ ~ ~-1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~ ~ ~ align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~ ~ ~1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~1 ~ ~-1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~1 ~ ~ align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~1 ~ ~1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~-1 ~-1 ~-1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~-1 ~-1 ~ align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~-1 ~-1 ~1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~ ~-1 ~-1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~ ~-1 ~ align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~ ~-1 ~1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~1 ~-1 ~-1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~1 ~-1 ~ align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute unless score #h5_jukebox bacaphd_tmp matches 1 positioned ~1 ~-1 ~1 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:jukebox[has_record=true] run function bacaphd:detect/parrot_choir_count
execute if score #h5_jukebox bacaphd_tmp matches 1 run advancement grant @s only bacaphd:animal/parrot_choir choir
