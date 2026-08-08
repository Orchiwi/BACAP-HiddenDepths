# Batch-5 seeding. sleep_in_bed is a LIFETIME counter: if breakfast_in_bed's wake
# detector ran before this line, `unless score @s bacaphd_sleeps = @s bacaphd_sleeps_seen`
# would be true on an unset mirror and every night already slept in the save would
# look like one fresh wake. Called from bacaphd:seed, before any bucket runs.
scoreboard players operation @s bacaphd_sleeps_seen = @s bacaphd_sleeps
scoreboard players set @s bacaphd_bib 0
scoreboard players set @s bacaphd_chem 0
scoreboard players set @s bacaphd_init_b5 1
