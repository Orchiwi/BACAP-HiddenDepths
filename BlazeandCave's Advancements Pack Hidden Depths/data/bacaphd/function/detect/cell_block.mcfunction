# Cell Block. Runs as, and positioned at, at most ONE candidate player per five-second
# cycle - bucket_slow picks it with @r, the same bound the other block scans in this pack
# use - and looks at exactly one mob, the nearest tagged candidate.
# Only mobs that fit a one-wide two-tall cell are candidates. A Spider is 1.4 blocks wide
# and an Enderman 2.9 tall; neither could ever be sealed into the cell this tests for, so
# including them would only ever produce a scan that cannot pass.
tag @e[type=minecraft:zombie,distance=..12] add bacaphd.cell
tag @e[type=minecraft:husk,distance=..12] add bacaphd.cell
tag @e[type=minecraft:drowned,distance=..12] add bacaphd.cell
tag @e[type=minecraft:zombie_villager,distance=..12] add bacaphd.cell
tag @e[type=minecraft:zombified_piglin,distance=..12] add bacaphd.cell
tag @e[type=minecraft:skeleton,distance=..12] add bacaphd.cell
tag @e[type=minecraft:stray,distance=..12] add bacaphd.cell
tag @e[type=minecraft:bogged,distance=..12] add bacaphd.cell
tag @e[type=minecraft:creeper,distance=..12] add bacaphd.cell
tag @e[type=minecraft:witch,distance=..12] add bacaphd.cell
tag @e[type=minecraft:pillager,distance=..12] add bacaphd.cell
tag @e[type=minecraft:vindicator,distance=..12] add bacaphd.cell
# Start FAILED. An empty scan must never grant, and it would if the flag started clean and
# no face test ran because there was no mob to run them against.
scoreboard players set #cell_fail bacaphd_tmp 1
execute if entity @e[tag=bacaphd.cell,distance=..12,limit=1,sort=nearest] run scoreboard players set #cell_fail bacaphd_tmp 0
# Ten faces of a 1x2x1 cell: four walls at foot level, four at head level, floor, ceiling.
# Each is ONE execute with eight chained `unless block` clauses, one per Copper Bar
# oxidation stage waxed and unwaxed. Every clause has to miss for the flag to be raised, so
# a face that is any kind of Copper Bar leaves it alone. sort=nearest makes all ten lines
# resolve to the same mob within the tick, since nothing moves while a function runs.
execute at @e[tag=bacaphd.cell,distance=..12,limit=1,sort=nearest] unless block ~1 ~ ~ minecraft:copper_bars unless block ~1 ~ ~ minecraft:exposed_copper_bars unless block ~1 ~ ~ minecraft:weathered_copper_bars unless block ~1 ~ ~ minecraft:oxidized_copper_bars unless block ~1 ~ ~ minecraft:waxed_copper_bars unless block ~1 ~ ~ minecraft:waxed_exposed_copper_bars unless block ~1 ~ ~ minecraft:waxed_weathered_copper_bars unless block ~1 ~ ~ minecraft:waxed_oxidized_copper_bars run scoreboard players set #cell_fail bacaphd_tmp 1
execute at @e[tag=bacaphd.cell,distance=..12,limit=1,sort=nearest] unless block ~-1 ~ ~ minecraft:copper_bars unless block ~-1 ~ ~ minecraft:exposed_copper_bars unless block ~-1 ~ ~ minecraft:weathered_copper_bars unless block ~-1 ~ ~ minecraft:oxidized_copper_bars unless block ~-1 ~ ~ minecraft:waxed_copper_bars unless block ~-1 ~ ~ minecraft:waxed_exposed_copper_bars unless block ~-1 ~ ~ minecraft:waxed_weathered_copper_bars unless block ~-1 ~ ~ minecraft:waxed_oxidized_copper_bars run scoreboard players set #cell_fail bacaphd_tmp 1
execute at @e[tag=bacaphd.cell,distance=..12,limit=1,sort=nearest] unless block ~ ~ ~1 minecraft:copper_bars unless block ~ ~ ~1 minecraft:exposed_copper_bars unless block ~ ~ ~1 minecraft:weathered_copper_bars unless block ~ ~ ~1 minecraft:oxidized_copper_bars unless block ~ ~ ~1 minecraft:waxed_copper_bars unless block ~ ~ ~1 minecraft:waxed_exposed_copper_bars unless block ~ ~ ~1 minecraft:waxed_weathered_copper_bars unless block ~ ~ ~1 minecraft:waxed_oxidized_copper_bars run scoreboard players set #cell_fail bacaphd_tmp 1
execute at @e[tag=bacaphd.cell,distance=..12,limit=1,sort=nearest] unless block ~ ~ ~-1 minecraft:copper_bars unless block ~ ~ ~-1 minecraft:exposed_copper_bars unless block ~ ~ ~-1 minecraft:weathered_copper_bars unless block ~ ~ ~-1 minecraft:oxidized_copper_bars unless block ~ ~ ~-1 minecraft:waxed_copper_bars unless block ~ ~ ~-1 minecraft:waxed_exposed_copper_bars unless block ~ ~ ~-1 minecraft:waxed_weathered_copper_bars unless block ~ ~ ~-1 minecraft:waxed_oxidized_copper_bars run scoreboard players set #cell_fail bacaphd_tmp 1
execute at @e[tag=bacaphd.cell,distance=..12,limit=1,sort=nearest] unless block ~1 ~1 ~ minecraft:copper_bars unless block ~1 ~1 ~ minecraft:exposed_copper_bars unless block ~1 ~1 ~ minecraft:weathered_copper_bars unless block ~1 ~1 ~ minecraft:oxidized_copper_bars unless block ~1 ~1 ~ minecraft:waxed_copper_bars unless block ~1 ~1 ~ minecraft:waxed_exposed_copper_bars unless block ~1 ~1 ~ minecraft:waxed_weathered_copper_bars unless block ~1 ~1 ~ minecraft:waxed_oxidized_copper_bars run scoreboard players set #cell_fail bacaphd_tmp 1
execute at @e[tag=bacaphd.cell,distance=..12,limit=1,sort=nearest] unless block ~-1 ~1 ~ minecraft:copper_bars unless block ~-1 ~1 ~ minecraft:exposed_copper_bars unless block ~-1 ~1 ~ minecraft:weathered_copper_bars unless block ~-1 ~1 ~ minecraft:oxidized_copper_bars unless block ~-1 ~1 ~ minecraft:waxed_copper_bars unless block ~-1 ~1 ~ minecraft:waxed_exposed_copper_bars unless block ~-1 ~1 ~ minecraft:waxed_weathered_copper_bars unless block ~-1 ~1 ~ minecraft:waxed_oxidized_copper_bars run scoreboard players set #cell_fail bacaphd_tmp 1
execute at @e[tag=bacaphd.cell,distance=..12,limit=1,sort=nearest] unless block ~ ~1 ~1 minecraft:copper_bars unless block ~ ~1 ~1 minecraft:exposed_copper_bars unless block ~ ~1 ~1 minecraft:weathered_copper_bars unless block ~ ~1 ~1 minecraft:oxidized_copper_bars unless block ~ ~1 ~1 minecraft:waxed_copper_bars unless block ~ ~1 ~1 minecraft:waxed_exposed_copper_bars unless block ~ ~1 ~1 minecraft:waxed_weathered_copper_bars unless block ~ ~1 ~1 minecraft:waxed_oxidized_copper_bars run scoreboard players set #cell_fail bacaphd_tmp 1
execute at @e[tag=bacaphd.cell,distance=..12,limit=1,sort=nearest] unless block ~ ~1 ~-1 minecraft:copper_bars unless block ~ ~1 ~-1 minecraft:exposed_copper_bars unless block ~ ~1 ~-1 minecraft:weathered_copper_bars unless block ~ ~1 ~-1 minecraft:oxidized_copper_bars unless block ~ ~1 ~-1 minecraft:waxed_copper_bars unless block ~ ~1 ~-1 minecraft:waxed_exposed_copper_bars unless block ~ ~1 ~-1 minecraft:waxed_weathered_copper_bars unless block ~ ~1 ~-1 minecraft:waxed_oxidized_copper_bars run scoreboard players set #cell_fail bacaphd_tmp 1
execute at @e[tag=bacaphd.cell,distance=..12,limit=1,sort=nearest] unless block ~ ~-1 ~ minecraft:copper_bars unless block ~ ~-1 ~ minecraft:exposed_copper_bars unless block ~ ~-1 ~ minecraft:weathered_copper_bars unless block ~ ~-1 ~ minecraft:oxidized_copper_bars unless block ~ ~-1 ~ minecraft:waxed_copper_bars unless block ~ ~-1 ~ minecraft:waxed_exposed_copper_bars unless block ~ ~-1 ~ minecraft:waxed_weathered_copper_bars unless block ~ ~-1 ~ minecraft:waxed_oxidized_copper_bars run scoreboard players set #cell_fail bacaphd_tmp 1
execute at @e[tag=bacaphd.cell,distance=..12,limit=1,sort=nearest] unless block ~ ~2 ~ minecraft:copper_bars unless block ~ ~2 ~ minecraft:exposed_copper_bars unless block ~ ~2 ~ minecraft:weathered_copper_bars unless block ~ ~2 ~ minecraft:oxidized_copper_bars unless block ~ ~2 ~ minecraft:waxed_copper_bars unless block ~ ~2 ~ minecraft:waxed_exposed_copper_bars unless block ~ ~2 ~ minecraft:waxed_weathered_copper_bars unless block ~ ~2 ~ minecraft:waxed_oxidized_copper_bars run scoreboard players set #cell_fail bacaphd_tmp 1
execute if score #cell_fail bacaphd_tmp matches 0 run advancement grant @s only bacaphd:monsters/cell_block
# Leave nothing tagged behind: the next cycle re-tags from scratch, and a stale tag on a
# mob that has since wandered off would be picked as 'nearest' by the wrong player.
tag @e[tag=bacaphd.cell,distance=..12] remove bacaphd.cell
