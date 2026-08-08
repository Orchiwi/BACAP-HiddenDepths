# Ship of Theseus, phase 1. Runs as, and positioned at, an item frame that is holding
# an Elytra and that the pack has never sampled before. An item frame sits in the air
# block in front of the block it hangs on, so one of its six neighbours IS that block;
# on an End Ship every one of them is purpur. This is what stops a frame nailed to a
# hand-placed block in the End from ever arming.
scoreboard players set #arm bacaphd_sys 0
execute if block ~1 ~ ~ minecraft:purpur_block run scoreboard players set #arm bacaphd_sys 1
execute if block ~1 ~ ~ minecraft:purpur_pillar run scoreboard players set #arm bacaphd_sys 1
execute if block ~1 ~ ~ minecraft:purpur_slab run scoreboard players set #arm bacaphd_sys 1
execute if block ~1 ~ ~ minecraft:purpur_stairs run scoreboard players set #arm bacaphd_sys 1
execute if block ~-1 ~ ~ minecraft:purpur_block run scoreboard players set #arm bacaphd_sys 1
execute if block ~-1 ~ ~ minecraft:purpur_pillar run scoreboard players set #arm bacaphd_sys 1
execute if block ~-1 ~ ~ minecraft:purpur_slab run scoreboard players set #arm bacaphd_sys 1
execute if block ~-1 ~ ~ minecraft:purpur_stairs run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~1 ~ minecraft:purpur_block run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~1 ~ minecraft:purpur_pillar run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~1 ~ minecraft:purpur_slab run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~1 ~ minecraft:purpur_stairs run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~-1 ~ minecraft:purpur_block run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~-1 ~ minecraft:purpur_pillar run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~-1 ~ minecraft:purpur_slab run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~-1 ~ minecraft:purpur_stairs run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~ ~1 minecraft:purpur_block run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~ ~1 minecraft:purpur_pillar run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~ ~1 minecraft:purpur_slab run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~ ~1 minecraft:purpur_stairs run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~ ~-1 minecraft:purpur_block run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~ ~-1 minecraft:purpur_pillar run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~ ~-1 minecraft:purpur_slab run scoreboard players set #arm bacaphd_sys 1
execute if block ~ ~ ~-1 minecraft:purpur_stairs run scoreboard players set #arm bacaphd_sys 1
execute if score #arm bacaphd_sys matches 1 run tag @s add bacaphd.ship_armed
