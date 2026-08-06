# B40 Chunk Miner, the proof. Normalise the rest of the chunk's cave_air to air in three
# y-slices - 16 x 127 x 16 = 32512, 32512 and 16 x 125 x 16 = 32000 blocks, each under the
# 32768 fill limit - then run the induction on a chunk whose empty voxels are now all the
# same block state.
# Conditions are evaluated left to right and short-circuit:
#   1. three y-slices proving block(x,y,z) == block(x+1,y,z) for x = x0..x0+14
#   2. three y-slices proving block(x,y,z) == block(x,y,z+1) for z = z0..z0+14
# detect/chunk_scan has already proved the corner block is air and the corner column is
# uniform, so every block in the chunk equals the all-air corner column. y -59..319 skips
# the unbreakable bedrock shell, and each compared region is 30480 blocks.
$execute positioned $(x0) 0 $(z0) run fill ~ -59 ~ ~15 67 ~15 minecraft:air replace minecraft:cave_air
$execute positioned $(x0) 0 $(z0) run fill ~ 68 ~ ~15 194 ~15 minecraft:air replace minecraft:cave_air
$execute positioned $(x0) 0 $(z0) run fill ~ 195 ~ ~15 319 ~15 minecraft:air replace minecraft:cave_air
$execute positioned $(x0) 0 $(z0) if blocks ~ -59 ~ ~14 67 ~15 ~1 -59 ~ all if blocks ~ 68 ~ ~14 194 ~15 ~1 68 ~ all if blocks ~ 195 ~ ~14 319 ~15 ~1 195 ~ all if blocks ~ -59 ~ ~15 67 ~14 ~ -59 ~1 all if blocks ~ 68 ~ ~15 194 ~14 ~ 68 ~1 all if blocks ~ 195 ~ ~15 319 ~14 ~ 195 ~1 all run advancement grant @s only bacaphd:mining/chunk_miner
