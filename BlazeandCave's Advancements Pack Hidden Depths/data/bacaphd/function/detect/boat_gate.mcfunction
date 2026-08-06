# Am I riding a boat? Resolved WITHOUT leaving the player context: the old
# `on vehicle ... on passengers` round trip fanned back out over every rider, so the
# sampler ran once per passenger and the duplicate call always saw a zero delta.
scoreboard players set @s bacaphd_in_boat 0
execute store result score @s bacaphd_in_boat run execute on vehicle if entity @s[type=#minecraft:boat]
execute if score @s bacaphd_in_boat matches 1 run function bacaphd:detect/boat_drop
execute if score @s bacaphd_in_boat matches 0 run function bacaphd:detect/boat_reset
