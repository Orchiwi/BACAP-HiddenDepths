# @s is a happy_ghast here. Age is negative for a Ghastling and zero or positive
# for a grown one; the explicit reset covers the case where the tag is missing and
# the store writes nothing meaningful.
scoreboard players set #gn_age bacaphd_gn_age 0
execute store result score #gn_age bacaphd_gn_age run data get entity @s Age
execute if score #gn_age bacaphd_gn_age matches ..-1 run scoreboard players add #gn bacaphd_gn 1
