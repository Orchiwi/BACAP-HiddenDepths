# B38 Cake Hoarder. Called whenever the cake placement statistic moves.
# The chunk is read exactly: a marker summoned at the block-aligned position carries an
# integral Pos, so dividing it by 16 with the scoreboard's /= (which floors) is correct on
# both sides of x=0 and z=0, and no assumption is needed about how `data get`'s scale
# argument rounds.
kill @e[type=minecraft:marker,tag=bacaphd_chunkref]
execute at @s align xz run summon minecraft:marker ~ ~ ~ {Tags:["bacaphd_chunkref"]}
execute store result score @s bacaphd_chunk_x run data get entity @e[type=minecraft:marker,tag=bacaphd_chunkref,limit=1] Pos[0]
execute store result score @s bacaphd_chunk_z run data get entity @e[type=minecraft:marker,tag=bacaphd_chunkref,limit=1] Pos[2]
kill @e[type=minecraft:marker,tag=bacaphd_chunkref]
scoreboard players operation @s bacaphd_chunk_x /= #16 bacaphd_calc
scoreboard players operation @s bacaphd_chunk_z /= #16 bacaphd_calc
# Take the delta and consume it before anything can bail out, so it can never bank up.
scoreboard players operation @s bacaphd_calc = @s bacaphd_cakes_used
scoreboard players operation @s bacaphd_calc -= @s bacaphd_cakes_seen
scoreboard players operation @s bacaphd_cakes_seen = @s bacaphd_cakes_used
# Creative placements are discarded and also end whatever run was in progress, so they
# cannot be stockpiled and cashed in after switching back to survival.
execute if entity @s[gamemode=creative] run scoreboard players set @s bacaphd_calc 0
execute if entity @s[gamemode=creative] run scoreboard players set @s bacaphd_cakes_chunk 0
execute unless score @s bacaphd_chunk_x = @s bacaphd_chunk_x_last run scoreboard players set @s bacaphd_cakes_chunk 0
execute unless score @s bacaphd_chunk_z = @s bacaphd_chunk_z_last run scoreboard players set @s bacaphd_cakes_chunk 0
scoreboard players operation @s bacaphd_chunk_x_last = @s bacaphd_chunk_x
scoreboard players operation @s bacaphd_chunk_z_last = @s bacaphd_chunk_z
scoreboard players operation @s bacaphd_cakes_chunk += @s bacaphd_calc
execute if score @s bacaphd_cakes_chunk matches 64.. run function bacaphd:detect/cake_hoarder_grant
