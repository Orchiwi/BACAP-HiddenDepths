# Hatchling. Runs as, and positioned at, a player who does not hold the advancement.
# Every chicken is sampled exactly once, ever: bacaphd.hatch is permanent, so the
# Age read below happens on the first tick this pack ever sees that bird. A chick
# that has just hatched out of a thrown egg is still at its spawn Age; a chick the
# player merely walked up to aged past the window long ago, which is what stops a
# pen full of babies from ever granting this.
execute as @e[type=minecraft:chicken,distance=..32,tag=!bacaphd.hatch] run function bacaphd:detect/hatchling_mark
scoreboard players set #best bacaphd_hatch 0
execute as @e[type=minecraft:chicken,distance=..32,tag=bacaphd.newchick] at @s run function bacaphd:detect/hatchling_count
execute if score #best bacaphd_hatch matches 4.. run advancement grant @s only bacaphd:animal/hatchling
# Cleared over a wider radius than it is set, so a chick that drifts out of the
# sampling range in the same tick cannot keep a stale newchick tag.
tag @e[type=minecraft:chicken,distance=..64,tag=bacaphd.newchick] remove bacaphd.newchick
