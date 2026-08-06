# B51 City Planner. A site only counts as an End City if there is a Shulker
# nearby AND the player is standing on the city's own purpur or end stone brick
# floor. Either signal on its own is fakeable - a pocketful of purpur, or one
# Shulker hauled about - so both are required.
scoreboard players set @s bacaphd_cp_hit 0
execute if block ~ ~-1 ~ minecraft:purpur_block run scoreboard players set @s bacaphd_cp_hit 1
execute if block ~ ~-1 ~ minecraft:purpur_pillar run scoreboard players set @s bacaphd_cp_hit 1
execute if block ~ ~-1 ~ minecraft:purpur_slab run scoreboard players set @s bacaphd_cp_hit 1
execute if block ~ ~-1 ~ minecraft:purpur_stairs run scoreboard players set @s bacaphd_cp_hit 1
execute if block ~ ~-1 ~ minecraft:end_stone_bricks run scoreboard players set @s bacaphd_cp_hit 1
execute unless entity @e[type=minecraft:shulker,distance=..24,limit=1] run scoreboard players set @s bacaphd_cp_hit 0
execute if score @s bacaphd_cp_hit matches 1 run function bacaphd:detect/city_planner_count
