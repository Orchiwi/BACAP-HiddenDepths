# Solo batch 3 seeding. Called from bacaphd:seed, which runs before any bucket, and every
# line this batch puts in a bucket is gated on bacaphd_init_s3 being 1. That ordering is
# the whole point: a detector that samples before its mirror exists reads a lifetime total
# as a fresh event. The gate is a scoreboard, so it survives relog and this runs once ever.
scoreboard players set @s bacaphd_init_s3 1
# Breaking Bad counts brews made AFTER install. There is no potions-brewed statistic to
# mirror, so this starts honestly at zero rather than inheriting a save's history.
scoreboard players set @s bacaphd_brews 0
# The Floor Is Lava
scoreboard players set @s bacaphd_fl_dist 0
scoreboard players set @s bacaphd_fl_x 0
scoreboard players set @s bacaphd_fl_z 0
scoreboard players set @s bacaphd_fl_dx 0
scoreboard players set @s bacaphd_fl_dz 0
# seed=1 makes the first sample of a run discard its step: there is no valid previous
# position yet, and the difference against zero would read as a 400-block teleport.
scoreboard players set @s bacaphd_fl_seed 1
# Bucket Brigade
scoreboard players set @s bacaphd_bb_dist 0
scoreboard players set @s bacaphd_bb_x 0
scoreboard players set @s bacaphd_bb_z 0
scoreboard players set @s bacaphd_bb_dx 0
scoreboard players set @s bacaphd_bb_dz 0
scoreboard players set @s bacaphd_bb_seed 1
# Alt+F4 is the one score in this batch read absolutely, on purpose - see bucket_slow.
# This only materialises the objective for the player; it never rebases it.
scoreboard players add @s bacaphd_quit 0
