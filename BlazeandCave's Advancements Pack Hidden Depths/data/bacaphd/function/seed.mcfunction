# Every per-player mirror and flag is seeded HERE, before any detector runs.
# These calls used to sit inside the dispatch buckets, which meant a detector
# could run first: on a player whose mirror was still unset,
# `unless score @s <stat> = @s <mirror>` is true, so the detector fired and read
# a whole lifetime statistic as one fresh event. Each line is self-gating, so
# this costs one failed score check per player per tick once seeded.
execute as @a[tag=!bacaphd.om_init] run function bacaphd:detect/ominous_init
execute as @a[gamemode=!spectator] unless score @s bacaphd_init matches 1 run function bacaphd:detect/init
execute as @a unless score @s bacaphd_init_b2 matches 1 run function bacaphd:detect/init_b2
execute as @a unless score @s bacaphd_init_b4 matches 1 run function bacaphd:detect/init_b4
