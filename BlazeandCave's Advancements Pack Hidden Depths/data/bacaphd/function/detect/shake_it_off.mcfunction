# Shake It Off. Runs as an ungranted player, positioned at themselves.
# bacaphd.sio_self carries this player's identity across the `on owner` hop, which moves
# the executor from the wolf to its tamer. Without it, anyone who happened to be standing
# nearby would be granted for someone else's dog. `on owner` resolves to no entity at all
# for an untamed wolf, so a wild one can never grant this - that is the whole "tamed" test.
tag @s add bacaphd.sio_self
# Mark nearby wolves standing in water. Ownership is deliberately NOT filtered here: it is
# checked at grant time instead, which is one hop cheaper per wolf and cannot be fooled by
# a wolf that changes hands mid-swim.
execute as @e[type=minecraft:wolf,distance=..16,tag=!bacaphd.sio_wet] at @s if block ~ ~ ~ minecraft:water run tag @s add bacaphd.sio_wet
# A wolf that was in water and is now on dry ground is shaking itself off.
execute as @e[type=minecraft:wolf,distance=..16,tag=bacaphd.sio_wet] at @s unless block ~ ~ ~ minecraft:water if entity @s[nbt={OnGround:1b}] on owner run advancement grant @s[tag=bacaphd.sio_self] only bacaphd:animal/shake_it_off
execute as @e[type=minecraft:wolf,distance=..16,tag=bacaphd.sio_wet] at @s unless block ~ ~ ~ minecraft:water if entity @s[nbt={OnGround:1b}] run tag @s remove bacaphd.sio_wet
tag @s remove bacaphd.sio_self
