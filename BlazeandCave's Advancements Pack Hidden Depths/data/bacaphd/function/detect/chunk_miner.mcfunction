# B40 Chunk Miner. Only reached once detect/chunk_gate's five air-or-cave-air samples have
# passed. Work out the chunk corner from a marker summoned at the block-aligned position:
# its Pos is an exact integer, so the floor division by 16 is right on both sides of the
# origin without guessing how `data get` scaling rounds.
kill @e[type=minecraft:marker,tag=bacaphd_chunkref]
execute at @s align xz run summon minecraft:marker ~ ~ ~ {Tags:["bacaphd_chunkref"]}
execute store result score @s bacaphd_scan_x run data get entity @e[type=minecraft:marker,tag=bacaphd_chunkref,limit=1] Pos[0]
execute store result score @s bacaphd_scan_z run data get entity @e[type=minecraft:marker,tag=bacaphd_chunkref,limit=1] Pos[2]
kill @e[type=minecraft:marker,tag=bacaphd_chunkref]
scoreboard players operation @s bacaphd_scan_x /= #16 bacaphd_calc
scoreboard players operation @s bacaphd_scan_z /= #16 bacaphd_calc
scoreboard players operation @s bacaphd_scan_x *= #16 bacaphd_calc
scoreboard players operation @s bacaphd_scan_z *= #16 bacaphd_calc
execute store result storage bacaphd:chunk x0 int 1 run scoreboard players get @s bacaphd_scan_x
execute store result storage bacaphd:chunk z0 int 1 run scoreboard players get @s bacaphd_scan_z
function bacaphd:detect/chunk_scan with storage bacaphd:chunk
