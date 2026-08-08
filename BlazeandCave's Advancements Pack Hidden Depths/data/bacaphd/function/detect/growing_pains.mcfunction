# Growing Pains. @s is a player who has fed a Ghastling a Snowball and has not yet
# been credited with raising one. The gc_self idiom carries this player's identity
# across the hop to the ghast, because the sampler below runs AS the ghast and the
# grant has to land back on the player. The function runs one player at a time, so
# the tag is only ever on a single player, and it is removed again on the last line.
tag @s add bacaphd.gp_self
execute at @s as @e[type=minecraft:happy_ghast,distance=..8,limit=4] run function bacaphd:detect/gp_sample
tag @s remove bacaphd.gp_self
