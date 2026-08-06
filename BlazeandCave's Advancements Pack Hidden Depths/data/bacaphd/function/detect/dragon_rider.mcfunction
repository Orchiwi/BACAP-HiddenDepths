# B52 Dragon Rider. Selectors measure to the dragon's entity origin, not to its
# hitbox parts, and outside the perch phase that origin sits far above anything
# a player can reach - five blocks was very likely unreachable. Twelve is inside
# the wing sweep and inside the perch column. 120 clean half-second samples make
# the minute, and the minute has to be UNBROKEN: leaving the radius zeroes the
# timer just as taking damage does, so 120 separate fly-bys are worth nothing.
# bacaphd_dr_dmg is this advancement's private mirror, seeded by detect/init_b4.
execute if score @s bacaphd_dmg > @s bacaphd_dr_dmg run scoreboard players set @s bacaphd_drtimer 0
scoreboard players operation @s bacaphd_dr_dmg = @s bacaphd_dmg
execute unless entity @e[type=minecraft:ender_dragon,distance=..12,limit=1] run scoreboard players set @s bacaphd_drtimer 0
execute if entity @e[type=minecraft:ender_dragon,distance=..12,limit=1] run scoreboard players add @s bacaphd_drtimer 1
execute if score @s bacaphd_drtimer matches 120.. run function bacaphd:detect/dragon_rider_done
