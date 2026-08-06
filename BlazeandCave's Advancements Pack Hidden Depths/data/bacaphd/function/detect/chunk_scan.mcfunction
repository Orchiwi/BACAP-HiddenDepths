# B40 Chunk Miner, the corner short-circuit. Executed `positioned` at the chunk's
# north-west corner so every offset is relative and the macro only carries the two corner
# coordinates. The macro values are integers read out of a scoreboard, never text.
# Normalise the two diagonally opposite corner columns first: `fill ... replace` swaps
# minecraft:cave_air for minecraft:air, which is a no-op for the world because the two
# states behave identically, and it is what lets the `if blocks` induction below compare
# carved voxels against mined ones at all. 379 blocks per column, so this is cheap enough
# to run on the slow bucket.
# Only if BOTH corner columns are then entirely air do we pay for the whole-chunk pass.
# A 1x1 shaft dug to bedrock cannot get past this.
$execute positioned $(x0) 0 $(z0) run fill ~ -59 ~ ~ 319 ~ minecraft:air replace minecraft:cave_air
$execute positioned $(x0) 0 $(z0) run fill ~15 -59 ~15 ~15 319 ~15 minecraft:air replace minecraft:cave_air
$execute positioned $(x0) 0 $(z0) if block ~ -59 ~ minecraft:air if block ~15 -59 ~15 minecraft:air if blocks ~ -59 ~ ~ 318 ~ ~ -58 ~ all if blocks ~15 -59 ~15 ~15 318 ~15 ~15 -58 ~15 all run function bacaphd:detect/chunk_scan_full with storage bacaphd:chunk
