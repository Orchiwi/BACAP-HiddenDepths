# @s is a Happy Ghast standing beside the player who fed a Ghastling. Age is negative
# while it is still a Ghastling and zero or positive once it has grown up, exactly as
# detect/gn_count reads it; the explicit reset covers a missing tag, where the store
# writes nothing meaningful.
# A Ghastling in range gets marked. The grant only ever fires on a mob that still
# carries that mark AND has since turned adult, so an already-grown wild Happy Ghast
# can never satisfy it - it was never a Ghastling while this player stood next to it.
scoreboard players set #gp_age bacaphd_gn_age 0
execute store result score #gp_age bacaphd_gn_age run data get entity @s Age
execute if score #gp_age bacaphd_gn_age matches ..-1 run tag @s add bacaphd.gp_raised
execute if score #gp_age bacaphd_gn_age matches 0.. if entity @s[tag=bacaphd.gp_raised] run advancement grant @a[tag=bacaphd.gp_self,limit=1] only bacaphd:nether/growing_pains grown
