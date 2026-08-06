# B40 Chunk Miner, the cheap gate. Five samples straight up the player's own column.
# minecraft:cave_air counts as empty exactly like minecraft:air: a carver cave or ravine
# leaves cave_air behind, a distinct block state that a player stripping the chunk never
# touches and cannot break, so a finished chunk is full of it. The old gate only accepted
# air and would have rejected a legitimately finished chunk whose column crossed a cave.
# `if block` has no OR, so each height is tested twice and the hits are counted; a block
# cannot be both, so five hits means five empty samples.
# y -59 exists only in the Overworld (the Nether and the End both start at y 0), so that
# sample doubles as the dimension check.
scoreboard players set @s bacaphd_calc 0
execute if block ~ -59 ~ minecraft:air run scoreboard players add @s bacaphd_calc 1
execute if block ~ -59 ~ minecraft:cave_air run scoreboard players add @s bacaphd_calc 1
execute if block ~ 5 ~ minecraft:air run scoreboard players add @s bacaphd_calc 1
execute if block ~ 5 ~ minecraft:cave_air run scoreboard players add @s bacaphd_calc 1
execute if block ~ 100 ~ minecraft:air run scoreboard players add @s bacaphd_calc 1
execute if block ~ 100 ~ minecraft:cave_air run scoreboard players add @s bacaphd_calc 1
execute if block ~ 200 ~ minecraft:air run scoreboard players add @s bacaphd_calc 1
execute if block ~ 200 ~ minecraft:cave_air run scoreboard players add @s bacaphd_calc 1
execute if block ~ 319 ~ minecraft:air run scoreboard players add @s bacaphd_calc 1
execute if block ~ 319 ~ minecraft:cave_air run scoreboard players add @s bacaphd_calc 1
execute if score @s bacaphd_calc matches 5 run function bacaphd:detect/chunk_miner
