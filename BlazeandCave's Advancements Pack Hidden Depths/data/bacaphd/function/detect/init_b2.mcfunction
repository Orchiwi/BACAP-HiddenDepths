# One-time per-player seeding for this batch. Every statistic mirror must start equal to
# the live statistic, or the very first tick reads a lifetime total as a fresh event.
# This runs from the FIRST line of bucket_fast and every delta line in this batch is
# gated on bacaphd_init_b2, so no delta can be evaluated before the seeding has happened.
scoreboard players set @s bacaphd_init_b2 1
scoreboard players add @s bacaphd_pearls 0
scoreboard players operation @s bacaphd_pearl_seen = @s bacaphd_pearls
scoreboard players add @s bacaphd_dragon_kills 0
scoreboard players operation @s bacaphd_dragon_seen = @s bacaphd_dragon_kills
scoreboard players add @s bacaphd_kills 0
scoreboard players operation @s bacaphd_kills_seen = @s bacaphd_kills
# -1 can never equal a sum of statistics, so the first herbivore sweep is always a reset.
scoreboard players set @s bacaphd_meat_seen -1
scoreboard players set @s bacaphd_herb_ticks 0
scoreboard players set @s bacaphd_pac_ticks 0
scoreboard players set @s bacaphd_pearl_chain 0
scoreboard players set @s bacaphd_slime_chain 0
scoreboard players set @s bacaphd_slime_peak 0
scoreboard players set @s bacaphd_untouched 0
scoreboard players set @s bacaphd_vl_t 0
scoreboard players set @s bacaphd_fw_kit 0
scoreboard players set @s bacaphd_fs_on 0
scoreboard players set @s bacaphd_fs_climb 0
scoreboard players set @s bacaphd_bd_n 0
scoreboard players set @s bacaphd_bd_top 0
scoreboard players set @s bacaphd_bd_seed 1
scoreboard players set @s bacaphd_ice_dist 0
scoreboard players set @s bacaphd_ice_seed 1
tag @s remove bacaphd.on_slime
