# B42 Vein Miner. Nine Diamond Ore inside 1200 game ticks, timed from the FIRST ore of the
# run. Safe to reach twice in one slow tick (both ore statistics moved): the second pass
# sees a zero delta and leaves the run alone.
scoreboard players operation @s bacaphd_calc = @s bacaphd_ore_diamond
scoreboard players operation @s bacaphd_calc -= @s bacaphd_ore_diamond_seen
scoreboard players operation @s bacaphd_ore_diamond_seen = @s bacaphd_ore_diamond
scoreboard players operation @s bacaphd_calc2 = @s bacaphd_ore_deepslate
scoreboard players operation @s bacaphd_calc2 -= @s bacaphd_ore_deepslate_seen
scoreboard players operation @s bacaphd_ore_deepslate_seen = @s bacaphd_ore_deepslate
scoreboard players operation @s bacaphd_calc += @s bacaphd_calc2
# Ore broken in creative is discarded and also ends the run in progress.
execute if entity @s[gamemode=creative] run scoreboard players set @s bacaphd_calc 0
execute if entity @s[gamemode=creative] run scoreboard players set @s bacaphd_vein 0
# Expire a run whose first ore is more than a minute old.
scoreboard players operation @s bacaphd_calc2 = #now bacaphd_gametime
scoreboard players operation @s bacaphd_calc2 -= @s bacaphd_vein_start
execute if score @s bacaphd_calc2 matches 1201.. run scoreboard players set @s bacaphd_vein 0
# An empty run is only started - and only stamped - by an ore that actually landed.
execute if score @s bacaphd_vein matches 0 if score @s bacaphd_calc matches 1.. run scoreboard players operation @s bacaphd_vein_start = #now bacaphd_gametime
scoreboard players operation @s bacaphd_vein += @s bacaphd_calc
execute if score @s bacaphd_vein matches 9.. run function bacaphd:detect/vein_miner_grant
