# B69 Cold Blooded - only called during the night, for players who do not hold it yet.
scoreboard players set #h5_cold_ok bacaphd_tmp 0
execute if biome ~ ~ ~ minecraft:frozen_peaks unless items entity @s armor.* * run scoreboard players set #h5_cold_ok bacaphd_tmp 1
execute if score #h5_cold_ok bacaphd_tmp matches 0 run scoreboard players set @s bacaphd_cold 0
execute if score #h5_cold_ok bacaphd_tmp matches 1 run scoreboard players add @s bacaphd_cold 100
execute if score @s bacaphd_cold matches 8000.. run advancement grant @s only bacaphd:biomes/cold_blooded
execute if score @s bacaphd_cold matches 8000.. run scoreboard players reset @s bacaphd_cold
