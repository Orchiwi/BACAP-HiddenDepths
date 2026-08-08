# Bottom Feeder. Distance covered with water at both foot and head level and
# something solid underfoot - trudging along the sea floor, not swimming above it.
# Sampled every half second like the pack's other travel meters. Measured live
# rather than read off a lifetime statistic, so a save that has already walked the
# sea bed for hours still starts this one from zero.
# minecraft.custom:minecraft.walk_under_water_one_cm is NOT used: it is unattested
# here, and one unknown scoreboard criterion stops a whole file loading.
scoreboard players set @s bacaphd_bf_ok 0
execute if block ~ ~ ~ minecraft:water if block ~ ~1 ~ minecraft:water unless block ~ ~-1 ~ minecraft:water unless block ~ ~-1 ~ minecraft:air run scoreboard players set @s bacaphd_bf_ok 1
execute store result score @s bacaphd_bf_x run data get entity @s Pos[0] 10
execute store result score @s bacaphd_bf_z run data get entity @s Pos[2] 10
scoreboard players operation @s bacaphd_dx = @s bacaphd_bf_x
scoreboard players operation @s bacaphd_dx -= @s bacaphd_bf_px
scoreboard players operation @s bacaphd_dz = @s bacaphd_bf_z
scoreboard players operation @s bacaphd_dz -= @s bacaphd_bf_pz
function bacaphd:detect/step
# 400 decimetres in half a second is faster than any legitimate travel: teleport.
execute if score @s bacaphd_bf_ok matches 1 if score @s bacaphd_bf_prev matches 1 if score @s bacaphd_hi matches ..400 run scoreboard players operation @s bacaphd_bf += @s bacaphd_hi
scoreboard players operation @s bacaphd_bf_px = @s bacaphd_bf_x
scoreboard players operation @s bacaphd_bf_pz = @s bacaphd_bf_z
scoreboard players operation @s bacaphd_bf_prev = @s bacaphd_bf_ok
# 50000 decimetres = 5000 blocks = five kilometres.
execute if score @s bacaphd_bf matches 50000.. run advancement grant @s only bacaphd:statistics/bottom_feeder
