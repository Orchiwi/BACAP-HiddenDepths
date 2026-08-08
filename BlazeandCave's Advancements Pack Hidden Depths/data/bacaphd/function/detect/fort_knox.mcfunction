# Fort Knox. Gated in bucket_slow on the player standing on obsidian, so the 25
# probes below only run for someone on top of a block of obsidian.
# A 5x5x5 cube with a chest at its centre puts that chest exactly three blocks
# under the feet of anyone standing on the cube's top face, and the 25 columns of
# that face are the only places worth looking - so no search loop is needed, just
# 25 explicit offsets. bacaphd_fk_done short-circuits the rest once one vault has
# been verified, so a room full of chests cannot multiply the cost.
scoreboard players set @s bacaphd_fk_done 0
execute if score @s bacaphd_fk_done matches 0 positioned ~-2 ~-3 ~-2 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~-2 ~-3 ~-1 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~-2 ~-3 ~ if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~-2 ~-3 ~1 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~-2 ~-3 ~2 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~-1 ~-3 ~-2 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~-1 ~-3 ~-1 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~-1 ~-3 ~ if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~-1 ~-3 ~1 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~-1 ~-3 ~2 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~ ~-3 ~-2 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~ ~-3 ~-1 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~ ~-3 ~ if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~ ~-3 ~1 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~ ~-3 ~2 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~1 ~-3 ~-2 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~1 ~-3 ~-1 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~1 ~-3 ~ if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~1 ~-3 ~1 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~1 ~-3 ~2 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~2 ~-3 ~-2 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~2 ~-3 ~-1 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~2 ~-3 ~ if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~2 ~-3 ~1 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
execute if score @s bacaphd_fk_done matches 0 positioned ~2 ~-3 ~2 if block ~ ~ ~ minecraft:chest run function bacaphd:detect/fk_found
