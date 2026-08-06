# Runs as the player riding a boat, once per player, every 10 ticks.
# The only fork is `on vehicle`, which resolves to exactly one boat: is it on Blue Ice?
scoreboard players set @s bacaphd_on_ice 0
execute store result score @s bacaphd_on_ice run execute on vehicle at @s if block ~ ~-0.1 ~ minecraft:blue_ice
# Horizontal step since the last sample, in decimetres.
scoreboard players operation @s bacaphd_ice_dx = @s bacaphd_ice_x
scoreboard players operation @s bacaphd_ice_dz = @s bacaphd_ice_z
execute store result score @s bacaphd_ice_x run data get entity @s Pos[0] 10
execute store result score @s bacaphd_ice_z run data get entity @s Pos[2] 10
scoreboard players operation @s bacaphd_ice_dx -= @s bacaphd_ice_x
scoreboard players operation @s bacaphd_ice_dz -= @s bacaphd_ice_z
# The first sample after boarding has no valid previous position: discard the step.
execute if score @s bacaphd_ice_seed matches 1 run scoreboard players set @s bacaphd_ice_dx 0
execute if score @s bacaphd_ice_seed matches 1 run scoreboard players set @s bacaphd_ice_dz 0
scoreboard players set @s bacaphd_ice_seed 0
execute if score @s bacaphd_on_ice matches 1 run function bacaphd:detect/ice_road_step
execute unless score @s bacaphd_on_ice matches 1 run scoreboard players set @s bacaphd_ice_dist 0
