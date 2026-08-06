# B49 Roof Runner. The Nether bedrock ceiling tops out at y 127, so there is
# nowhere at y 128 or 129 except standing on the roof or at the apex of a jump
# from it - which makes the old 'unless block ~ ~-1 ~ air' test redundant. That
# test was also useless: at feet y 128 the block below IS the bedrock roof, so
# it was always true and elytra cruising at y 130 sailed through it. The band is
# now two blocks tall and the per-sample step is capped in roof_runner_add, so
# rocket flight and gliding contribute nothing while foot travel counts in full.
scoreboard players set @s bacaphd_rr_ok 0
execute store result score @s bacaphd_rr_y run data get entity @s Pos[1] 1
execute if dimension minecraft:the_nether if score @s bacaphd_rr_y matches 128..129 run scoreboard players set @s bacaphd_rr_ok 1
execute store result score @s bacaphd_rr_x run data get entity @s Pos[0] 10
execute store result score @s bacaphd_rr_z run data get entity @s Pos[2] 10
execute if score @s bacaphd_rr_ok matches 1 if score @s bacaphd_rr_prev matches 1 run function bacaphd:detect/roof_runner_add
scoreboard players operation @s bacaphd_rr_px = @s bacaphd_rr_x
scoreboard players operation @s bacaphd_rr_pz = @s bacaphd_rr_z
scoreboard players operation @s bacaphd_rr_prev = @s bacaphd_rr_ok
