# Greenhouse Gases. Reached on the tick a Wheat crop is broken (mined mirror moved).
# Five probes straight up cost almost nothing and stop the 845-position scan dead
# for every farm that has no Glass overhead at all.
scoreboard players set @s bacaphd_gg_ok 0
execute if block ~ ~1 ~ minecraft:glass run scoreboard players set @s bacaphd_gg_ok 1
execute if block ~ ~2 ~ minecraft:glass run scoreboard players set @s bacaphd_gg_ok 1
execute if block ~ ~3 ~ minecraft:glass run scoreboard players set @s bacaphd_gg_ok 1
execute if block ~ ~4 ~ minecraft:glass run scoreboard players set @s bacaphd_gg_ok 1
execute if block ~ ~5 ~ minecraft:glass run scoreboard players set @s bacaphd_gg_ok 1
execute if score @s bacaphd_gg_ok matches 1 run function bacaphd:detect/gg_scan
