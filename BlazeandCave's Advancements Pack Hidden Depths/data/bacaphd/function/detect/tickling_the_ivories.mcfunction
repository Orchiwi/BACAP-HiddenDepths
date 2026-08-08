# Tickling the Ivories. Twenty-five Note Blocks in a straight line, tuned 0 to 24 in
# order, read from the block the player is STANDING ON and followed in each of the four
# horizontal directions at once, so a keyboard laid out in any direction passes.
#
# Each direction COUNTS the note blocks that match and grants only on a full 25. It used
# to start every flag at 1 and clear it on any block that was not the note it should be,
# which is fail-open: `execute if block` on a position the server cannot read ERRORS
# rather than returning false, and an erroring command does not stop the function. Every
# clear silently no-opped, all four flags survived, and the advancement was handed to two
# players sitting on the death screen with no note block anywhere near them. Counting up
# fails closed - a check that cannot run contributes nothing to the total.
scoreboard players set @s bacaphd_key_e 0
scoreboard players set @s bacaphd_key_w 0
scoreboard players set @s bacaphd_key_s 0
scoreboard players set @s bacaphd_key_n 0
execute if block ~ ~-1 ~ minecraft:note_block[note=0] run scoreboard players add @s bacaphd_key_e 1
execute if block ~1 ~-1 ~ minecraft:note_block[note=1] run scoreboard players add @s bacaphd_key_e 1
execute if block ~2 ~-1 ~ minecraft:note_block[note=2] run scoreboard players add @s bacaphd_key_e 1
execute if block ~3 ~-1 ~ minecraft:note_block[note=3] run scoreboard players add @s bacaphd_key_e 1
execute if block ~4 ~-1 ~ minecraft:note_block[note=4] run scoreboard players add @s bacaphd_key_e 1
execute if block ~5 ~-1 ~ minecraft:note_block[note=5] run scoreboard players add @s bacaphd_key_e 1
execute if block ~6 ~-1 ~ minecraft:note_block[note=6] run scoreboard players add @s bacaphd_key_e 1
execute if block ~7 ~-1 ~ minecraft:note_block[note=7] run scoreboard players add @s bacaphd_key_e 1
execute if block ~8 ~-1 ~ minecraft:note_block[note=8] run scoreboard players add @s bacaphd_key_e 1
execute if block ~9 ~-1 ~ minecraft:note_block[note=9] run scoreboard players add @s bacaphd_key_e 1
execute if block ~10 ~-1 ~ minecraft:note_block[note=10] run scoreboard players add @s bacaphd_key_e 1
execute if block ~11 ~-1 ~ minecraft:note_block[note=11] run scoreboard players add @s bacaphd_key_e 1
execute if block ~12 ~-1 ~ minecraft:note_block[note=12] run scoreboard players add @s bacaphd_key_e 1
execute if block ~13 ~-1 ~ minecraft:note_block[note=13] run scoreboard players add @s bacaphd_key_e 1
execute if block ~14 ~-1 ~ minecraft:note_block[note=14] run scoreboard players add @s bacaphd_key_e 1
execute if block ~15 ~-1 ~ minecraft:note_block[note=15] run scoreboard players add @s bacaphd_key_e 1
execute if block ~16 ~-1 ~ minecraft:note_block[note=16] run scoreboard players add @s bacaphd_key_e 1
execute if block ~17 ~-1 ~ minecraft:note_block[note=17] run scoreboard players add @s bacaphd_key_e 1
execute if block ~18 ~-1 ~ minecraft:note_block[note=18] run scoreboard players add @s bacaphd_key_e 1
execute if block ~19 ~-1 ~ minecraft:note_block[note=19] run scoreboard players add @s bacaphd_key_e 1
execute if block ~20 ~-1 ~ minecraft:note_block[note=20] run scoreboard players add @s bacaphd_key_e 1
execute if block ~21 ~-1 ~ minecraft:note_block[note=21] run scoreboard players add @s bacaphd_key_e 1
execute if block ~22 ~-1 ~ minecraft:note_block[note=22] run scoreboard players add @s bacaphd_key_e 1
execute if block ~23 ~-1 ~ minecraft:note_block[note=23] run scoreboard players add @s bacaphd_key_e 1
execute if block ~24 ~-1 ~ minecraft:note_block[note=24] run scoreboard players add @s bacaphd_key_e 1
execute if block ~ ~-1 ~ minecraft:note_block[note=0] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-1 ~-1 ~ minecraft:note_block[note=1] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-2 ~-1 ~ minecraft:note_block[note=2] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-3 ~-1 ~ minecraft:note_block[note=3] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-4 ~-1 ~ minecraft:note_block[note=4] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-5 ~-1 ~ minecraft:note_block[note=5] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-6 ~-1 ~ minecraft:note_block[note=6] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-7 ~-1 ~ minecraft:note_block[note=7] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-8 ~-1 ~ minecraft:note_block[note=8] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-9 ~-1 ~ minecraft:note_block[note=9] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-10 ~-1 ~ minecraft:note_block[note=10] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-11 ~-1 ~ minecraft:note_block[note=11] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-12 ~-1 ~ minecraft:note_block[note=12] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-13 ~-1 ~ minecraft:note_block[note=13] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-14 ~-1 ~ minecraft:note_block[note=14] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-15 ~-1 ~ minecraft:note_block[note=15] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-16 ~-1 ~ minecraft:note_block[note=16] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-17 ~-1 ~ minecraft:note_block[note=17] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-18 ~-1 ~ minecraft:note_block[note=18] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-19 ~-1 ~ minecraft:note_block[note=19] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-20 ~-1 ~ minecraft:note_block[note=20] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-21 ~-1 ~ minecraft:note_block[note=21] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-22 ~-1 ~ minecraft:note_block[note=22] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-23 ~-1 ~ minecraft:note_block[note=23] run scoreboard players add @s bacaphd_key_w 1
execute if block ~-24 ~-1 ~ minecraft:note_block[note=24] run scoreboard players add @s bacaphd_key_w 1
execute if block ~ ~-1 ~ minecraft:note_block[note=0] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~1 minecraft:note_block[note=1] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~2 minecraft:note_block[note=2] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~3 minecraft:note_block[note=3] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~4 minecraft:note_block[note=4] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~5 minecraft:note_block[note=5] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~6 minecraft:note_block[note=6] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~7 minecraft:note_block[note=7] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~8 minecraft:note_block[note=8] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~9 minecraft:note_block[note=9] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~10 minecraft:note_block[note=10] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~11 minecraft:note_block[note=11] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~12 minecraft:note_block[note=12] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~13 minecraft:note_block[note=13] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~14 minecraft:note_block[note=14] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~15 minecraft:note_block[note=15] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~16 minecraft:note_block[note=16] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~17 minecraft:note_block[note=17] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~18 minecraft:note_block[note=18] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~19 minecraft:note_block[note=19] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~20 minecraft:note_block[note=20] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~21 minecraft:note_block[note=21] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~22 minecraft:note_block[note=22] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~23 minecraft:note_block[note=23] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~24 minecraft:note_block[note=24] run scoreboard players add @s bacaphd_key_s 1
execute if block ~ ~-1 ~ minecraft:note_block[note=0] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-1 minecraft:note_block[note=1] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-2 minecraft:note_block[note=2] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-3 minecraft:note_block[note=3] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-4 minecraft:note_block[note=4] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-5 minecraft:note_block[note=5] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-6 minecraft:note_block[note=6] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-7 minecraft:note_block[note=7] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-8 minecraft:note_block[note=8] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-9 minecraft:note_block[note=9] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-10 minecraft:note_block[note=10] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-11 minecraft:note_block[note=11] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-12 minecraft:note_block[note=12] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-13 minecraft:note_block[note=13] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-14 minecraft:note_block[note=14] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-15 minecraft:note_block[note=15] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-16 minecraft:note_block[note=16] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-17 minecraft:note_block[note=17] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-18 minecraft:note_block[note=18] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-19 minecraft:note_block[note=19] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-20 minecraft:note_block[note=20] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-21 minecraft:note_block[note=21] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-22 minecraft:note_block[note=22] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-23 minecraft:note_block[note=23] run scoreboard players add @s bacaphd_key_n 1
execute if block ~ ~-1 ~-24 minecraft:note_block[note=24] run scoreboard players add @s bacaphd_key_n 1
execute if score @s bacaphd_key_e matches 25 run advancement grant @s only bacaphd:redstone/tickling_the_ivories
execute if score @s bacaphd_key_w matches 25 run advancement grant @s only bacaphd:redstone/tickling_the_ivories
execute if score @s bacaphd_key_s matches 25 run advancement grant @s only bacaphd:redstone/tickling_the_ivories
execute if score @s bacaphd_key_n matches 25 run advancement grant @s only bacaphd:redstone/tickling_the_ivories
