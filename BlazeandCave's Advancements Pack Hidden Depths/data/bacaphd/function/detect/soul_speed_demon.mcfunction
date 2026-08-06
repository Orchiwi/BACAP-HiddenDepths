# B47 Soul Speed Demon. The Soul Speed III proof is a real advancement criterion
# evaluated by the game (equipment.feet enchantments soul_speed min 3 while
# stepping on a soul block, BACAP's own nether/soul_runnings shape) and the tick
# bucket only selects players who currently hold it. The FIRST line here revokes
# it again, so the game has to re-award it - on its once-per-second location
# poll - before the next sample can bank anything. Take the boots off and
# accumulation stops within a second, instead of the criterion latching forever
# after one instant. This is Enhanced Discoveries' own revoke-to-re-prove idiom
# (bacaped:1sec_timer camel_adventure / intergalactic_journey; the criterion-level
# form is bacaped:flap_dont_fall_reset).
# The revoke MUST stay first: the completion path below grants both criteria, and
# a revoke running after it would leave the advancement incomplete.
advancement revoke @s only bacaphd:nether/soul_speed_demon soul_speed
scoreboard players set @s bacaphd_ss_ok 0
execute if block ~ ~-1 ~ minecraft:soul_sand run scoreboard players set @s bacaphd_ss_ok 1
execute if block ~ ~-1 ~ minecraft:soul_soil run scoreboard players set @s bacaphd_ss_ok 1
execute store result score @s bacaphd_ss_x run data get entity @s Pos[0] 10
execute store result score @s bacaphd_ss_z run data get entity @s Pos[2] 10
execute if score @s bacaphd_ss_ok matches 1 if score @s bacaphd_ss_prev matches 1 run function bacaphd:detect/soul_speed_demon_add
scoreboard players operation @s bacaphd_ss_px = @s bacaphd_ss_x
scoreboard players operation @s bacaphd_ss_pz = @s bacaphd_ss_z
scoreboard players operation @s bacaphd_ss_prev = @s bacaphd_ss_ok
