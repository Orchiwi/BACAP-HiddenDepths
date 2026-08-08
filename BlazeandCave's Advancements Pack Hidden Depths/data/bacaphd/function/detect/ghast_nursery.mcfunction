# Ghast Nursery. @s is the player and the position is already the player's, so the
# distance filter is anchored on them. limit=8 caps the iteration on top of the
# radius; a Ghastling is a baby happy_ghast, which is how BACAP's Snow Cone? finds one.
scoreboard players set #gn bacaphd_gn 0
execute at @s as @e[type=minecraft:happy_ghast,distance=..8,limit=8] run function bacaphd:detect/gn_count
execute if score #gn bacaphd_gn matches 3.. run advancement grant @s only bacaphd:nether/ghast_nursery
