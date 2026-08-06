# B33 Bee Movie. A Bee has just stung this player. Re-arm the criterion, then count the
# Bees in melee range that have already left their stinger somewhere. Twenty of them
# around a player who is still standing is twenty stings survived. limit=20 bounds the
# NBT scan, and `at @s` makes distance relative to the player rather than to the origin.
advancement revoke @s only bacaphd:animal/bee_movie stung
execute at @s store result score @s bacaphd_bee_count if entity @e[type=minecraft:bee,distance=..6,nbt={HasStung:1b},limit=20]
execute if score @s bacaphd_bee_count matches 20.. if score @s bacaphd_health matches 1.. run function bacaphd:detect/bee_movie_grant
