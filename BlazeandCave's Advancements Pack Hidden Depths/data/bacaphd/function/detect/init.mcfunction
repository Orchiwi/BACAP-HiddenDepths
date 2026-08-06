# One-time per-player initialisation, driven from the fast bucket so a joining player is
# rebased within a single tick rather than up to five seconds later. Every statistic
# mirror starts equal to the live statistic, so a lifetime total collected before the
# pack was installed can never read as a fresh event.
scoreboard players set @s bacaphd_init 1
scoreboard players add @s bacaphd_health 0
scoreboard players add @s bacaphd_wither_kills 0
scoreboard players operation @s bacaphd_wither_seen_pv = @s bacaphd_wither_kills
scoreboard players add @s bacaphd_pearls_used 0
scoreboard players operation @s bacaphd_pearls_seen = @s bacaphd_pearls_used
scoreboard players set @s bacaphd_pearl_window 0
scoreboard players set @s bacaphd_pearl_x 0
scoreboard players set @s bacaphd_pearl_z 0
scoreboard players set @s bacaphd_boomerang 0
scoreboard players set @s bacaphd_bee_count 0
scoreboard players set @s bacaphd_committee -1
scoreboard players add @s bacaphd_cakes_used 0
scoreboard players operation @s bacaphd_cakes_seen = @s bacaphd_cakes_used
scoreboard players set @s bacaphd_cakes_chunk 0
scoreboard players set @s bacaphd_chunk_x 0
scoreboard players set @s bacaphd_chunk_z 0
scoreboard players set @s bacaphd_chunk_x_last 2000000
scoreboard players set @s bacaphd_chunk_z_last 2000000
scoreboard players set @s bacaphd_scan_x 0
scoreboard players set @s bacaphd_scan_z 0
# The two Sniffer day stamps start unequal, so an uninitialised player can never match.
scoreboard players set @s bacaphd_torch_day -1
scoreboard players set @s bacaphd_pitcher_day -2
scoreboard players add @s bacaphd_ore_diamond 0
scoreboard players operation @s bacaphd_ore_diamond_seen = @s bacaphd_ore_diamond
scoreboard players add @s bacaphd_ore_deepslate 0
scoreboard players operation @s bacaphd_ore_deepslate_seen = @s bacaphd_ore_deepslate
scoreboard players set @s bacaphd_vein 0
scoreboard players set @s bacaphd_vein_start 0
scoreboard players set @s bacaphd_calc 0
scoreboard players set @s bacaphd_calc2 0
