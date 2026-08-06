# B46 Magma Marathon. Standing in lava and taking no damage since the last
# sample means the player is under Fire Resistance - inferred from behaviour,
# which is version-proof, rather than read out of an effect component.
# The description promises 'without taking a single point of damage', so damage
# CLEARS the accumulator rather than merely pausing it - otherwise five hundred
# blocks spread across a dozen separate burns would have counted.
# bacaphd_mm_dmg is this advancement's private mirror, seeded by detect/init_b4.
scoreboard players set @s bacaphd_mm_ok 0
execute if block ~ ~ ~ minecraft:lava if score @s bacaphd_dmg = @s bacaphd_mm_dmg run scoreboard players set @s bacaphd_mm_ok 1
execute if score @s bacaphd_dmg > @s bacaphd_mm_dmg run scoreboard players set @s bacaphd_lava 0
execute store result score @s bacaphd_mm_x run data get entity @s Pos[0] 10
execute store result score @s bacaphd_mm_z run data get entity @s Pos[2] 10
execute if score @s bacaphd_mm_ok matches 1 if score @s bacaphd_mm_prev matches 1 run function bacaphd:detect/magma_marathon_add
scoreboard players operation @s bacaphd_mm_px = @s bacaphd_mm_x
scoreboard players operation @s bacaphd_mm_pz = @s bacaphd_mm_z
scoreboard players operation @s bacaphd_mm_prev = @s bacaphd_mm_ok
scoreboard players operation @s bacaphd_mm_dmg = @s bacaphd_dmg
