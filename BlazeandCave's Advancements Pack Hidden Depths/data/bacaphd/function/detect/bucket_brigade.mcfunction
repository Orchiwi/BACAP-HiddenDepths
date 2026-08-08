# Bucket Brigade. Runs every 10 ticks, as and at a player already confirmed by bucket_medium
# to be holding a Bucket of Tropical Fish. All that is left to check is the escort.
# The Axolotl's UUID is deliberately not pinned. Two hundred blocks is an unbroken chain of
# four hundred half-second samples, each of which must contain an Axolotl inside 8 blocks;
# nothing but the bucket keeps one at heel that long, so in practice it is the same animal,
# and tracking a UUID would cost a second function for no real gain.
scoreboard players set #bb_ok bacaphd_tmp 0
execute if entity @e[type=minecraft:axolotl,distance=..8,limit=1] run scoreboard players set #bb_ok bacaphd_tmp 1
# Horizontal step since the previous sample, in decimetres.
scoreboard players operation @s bacaphd_bb_dx = @s bacaphd_bb_x
scoreboard players operation @s bacaphd_bb_dz = @s bacaphd_bb_z
execute store result score @s bacaphd_bb_x run data get entity @s Pos[0] 10
execute store result score @s bacaphd_bb_z run data get entity @s Pos[2] 10
scoreboard players operation @s bacaphd_bb_dx -= @s bacaphd_bb_x
scoreboard players operation @s bacaphd_bb_dz -= @s bacaphd_bb_z
execute if score @s bacaphd_bb_seed matches 1 run scoreboard players set @s bacaphd_bb_dx 0
execute if score @s bacaphd_bb_seed matches 1 run scoreboard players set @s bacaphd_bb_dz 0
scoreboard players set @s bacaphd_bb_seed 0
execute if score @s bacaphd_bb_dx matches ..-1 run scoreboard players operation @s bacaphd_bb_dx *= $neg bacaphd_const
execute if score @s bacaphd_bb_dz matches ..-1 run scoreboard players operation @s bacaphd_bb_dz *= $neg bacaphd_const
# Octagonal distance approximation: max + 3/8 * min
scoreboard players operation #bb_hi bacaphd_tmp = @s bacaphd_bb_dx
scoreboard players operation #bb_hi bacaphd_tmp > @s bacaphd_bb_dz
scoreboard players operation #bb_lo bacaphd_tmp = @s bacaphd_bb_dx
scoreboard players operation #bb_lo bacaphd_tmp < @s bacaphd_bb_dz
scoreboard players operation #bb_lo bacaphd_tmp *= $three bacaphd_const
scoreboard players operation #bb_lo bacaphd_tmp /= $eight bacaphd_const
scoreboard players operation #bb_hi bacaphd_tmp += #bb_lo bacaphd_tmp
# An Axolotl cannot keep up with a teleport, so anything that fast ends the escort.
execute if score #bb_hi bacaphd_tmp matches 301.. run scoreboard players set #bb_ok bacaphd_tmp 0
execute if score #bb_ok bacaphd_tmp matches 1 run scoreboard players operation @s bacaphd_bb_dist += #bb_hi bacaphd_tmp
execute if score #bb_ok bacaphd_tmp matches 0 run scoreboard players set @s bacaphd_bb_dist 0
execute if score #bb_ok bacaphd_tmp matches 0 run scoreboard players set @s bacaphd_bb_seed 1
execute if score @s bacaphd_bb_dist matches 2000.. run advancement grant @s only bacaphd:animal/bucket_brigade
execute if score @s bacaphd_bb_dist matches 2000.. run scoreboard players reset @s bacaphd_bb_dist
