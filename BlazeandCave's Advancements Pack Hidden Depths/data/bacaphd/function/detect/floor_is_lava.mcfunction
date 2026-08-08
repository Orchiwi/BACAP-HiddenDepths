# The Floor Is Lava. Sampled every 10 ticks from bucket_medium, in the Nether, as a player
# who is neither spectator nor creative and does not hold the advancement.
# A sample only earns distance when all of these hold: feet on the ground, not standing in
# lava, a solid block directly underfoot (that block is the bridge), and lava two to four
# blocks below it. That is what walking a self-laid causeway across a lava sea looks like,
# and it is false for swimming, elytra and levitation, all of which clear OnGround.
scoreboard players set #fl_ok bacaphd_tmp 0
execute if entity @s[nbt={OnGround:1b}] unless block ~ ~ ~ minecraft:lava unless block ~ ~-1 ~ minecraft:lava if block ~ ~-2 ~ minecraft:lava run scoreboard players set #fl_ok bacaphd_tmp 1
execute if entity @s[nbt={OnGround:1b}] unless block ~ ~ ~ minecraft:lava unless block ~ ~-1 ~ minecraft:lava if block ~ ~-3 ~ minecraft:lava run scoreboard players set #fl_ok bacaphd_tmp 1
execute if entity @s[nbt={OnGround:1b}] unless block ~ ~ ~ minecraft:lava unless block ~ ~-1 ~ minecraft:lava if block ~ ~-4 ~ minecraft:lava run scoreboard players set #fl_ok bacaphd_tmp 1
# On foot means on foot. `on vehicle` resolves to nothing at all when the player is not
# riding, so this line is free for walkers and fatal for a Strider commuter.
execute on vehicle run scoreboard players set #fl_ok bacaphd_tmp 0
# Horizontal step since the previous sample, in decimetres.
scoreboard players operation @s bacaphd_fl_dx = @s bacaphd_fl_x
scoreboard players operation @s bacaphd_fl_dz = @s bacaphd_fl_z
execute store result score @s bacaphd_fl_x run data get entity @s Pos[0] 10
execute store result score @s bacaphd_fl_z run data get entity @s Pos[2] 10
scoreboard players operation @s bacaphd_fl_dx -= @s bacaphd_fl_x
scoreboard players operation @s bacaphd_fl_dz -= @s bacaphd_fl_z
# The first sample after any reset has no valid previous position: discard that one step.
execute if score @s bacaphd_fl_seed matches 1 run scoreboard players set @s bacaphd_fl_dx 0
execute if score @s bacaphd_fl_seed matches 1 run scoreboard players set @s bacaphd_fl_dz 0
scoreboard players set @s bacaphd_fl_seed 0
# |dx| and |dz|
execute if score @s bacaphd_fl_dx matches ..-1 run scoreboard players operation @s bacaphd_fl_dx *= $neg bacaphd_const
execute if score @s bacaphd_fl_dz matches ..-1 run scoreboard players operation @s bacaphd_fl_dz *= $neg bacaphd_const
# Octagonal distance approximation: max + 3/8 * min, the same one ice_road_step uses.
scoreboard players operation #fl_hi bacaphd_tmp = @s bacaphd_fl_dx
scoreboard players operation #fl_hi bacaphd_tmp > @s bacaphd_fl_dz
scoreboard players operation #fl_lo bacaphd_tmp = @s bacaphd_fl_dx
scoreboard players operation #fl_lo bacaphd_tmp < @s bacaphd_fl_dz
scoreboard players operation #fl_lo bacaphd_tmp *= $three bacaphd_const
scoreboard players operation #fl_lo bacaphd_tmp /= $eight bacaphd_const
scoreboard players operation #fl_hi bacaphd_tmp += #fl_lo bacaphd_tmp
# Over 30 blocks in half a second is a portal or a teleport, not a bridge.
execute if score #fl_hi bacaphd_tmp matches 301.. run scoreboard players set #fl_ok bacaphd_tmp 0
execute if score #fl_ok bacaphd_tmp matches 1 run scoreboard players operation @s bacaphd_fl_dist += #fl_hi bacaphd_tmp
# One bad sample throws the whole crossing away, and re-arms the seed so the restart
# cannot bank the gap it just moved through.
execute if score #fl_ok bacaphd_tmp matches 0 run scoreboard players set @s bacaphd_fl_dist 0
execute if score #fl_ok bacaphd_tmp matches 0 run scoreboard players set @s bacaphd_fl_seed 1
execute if score @s bacaphd_fl_dist matches 2000.. run advancement grant @s only bacaphd:nether/the_floor_is_lava
execute if score @s bacaphd_fl_dist matches 2000.. run scoreboard players reset @s bacaphd_fl_dist
