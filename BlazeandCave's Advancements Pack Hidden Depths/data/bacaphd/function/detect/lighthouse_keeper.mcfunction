# Lighthouse Keeper. Entered as, and positioned at, the aligned block a player is
# standing in, having already proven that ~ ~-1 ~ is a Sea Lantern. Wants the coast
# - an ocean or beach biome - and thirty unbroken solid blocks under the lantern,
# which is the tower itself. Air, cave air and water all break the column, so a
# lantern floated on a pillar of water or dropped on a hillside does not count.
execute unless biome ~ ~ ~ #minecraft:is_ocean unless biome ~ ~ ~ #minecraft:is_beach run return 0
scoreboard players set @s bacaphd_light 0
execute unless block ~ ~-2 ~ minecraft:air unless block ~ ~-2 ~ minecraft:cave_air unless block ~ ~-2 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-3 ~ minecraft:air unless block ~ ~-3 ~ minecraft:cave_air unless block ~ ~-3 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-4 ~ minecraft:air unless block ~ ~-4 ~ minecraft:cave_air unless block ~ ~-4 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-5 ~ minecraft:air unless block ~ ~-5 ~ minecraft:cave_air unless block ~ ~-5 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-6 ~ minecraft:air unless block ~ ~-6 ~ minecraft:cave_air unless block ~ ~-6 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-7 ~ minecraft:air unless block ~ ~-7 ~ minecraft:cave_air unless block ~ ~-7 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-8 ~ minecraft:air unless block ~ ~-8 ~ minecraft:cave_air unless block ~ ~-8 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-9 ~ minecraft:air unless block ~ ~-9 ~ minecraft:cave_air unless block ~ ~-9 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-10 ~ minecraft:air unless block ~ ~-10 ~ minecraft:cave_air unless block ~ ~-10 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-11 ~ minecraft:air unless block ~ ~-11 ~ minecraft:cave_air unless block ~ ~-11 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-12 ~ minecraft:air unless block ~ ~-12 ~ minecraft:cave_air unless block ~ ~-12 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-13 ~ minecraft:air unless block ~ ~-13 ~ minecraft:cave_air unless block ~ ~-13 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-14 ~ minecraft:air unless block ~ ~-14 ~ minecraft:cave_air unless block ~ ~-14 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-15 ~ minecraft:air unless block ~ ~-15 ~ minecraft:cave_air unless block ~ ~-15 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-16 ~ minecraft:air unless block ~ ~-16 ~ minecraft:cave_air unless block ~ ~-16 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-17 ~ minecraft:air unless block ~ ~-17 ~ minecraft:cave_air unless block ~ ~-17 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-18 ~ minecraft:air unless block ~ ~-18 ~ minecraft:cave_air unless block ~ ~-18 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-19 ~ minecraft:air unless block ~ ~-19 ~ minecraft:cave_air unless block ~ ~-19 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-20 ~ minecraft:air unless block ~ ~-20 ~ minecraft:cave_air unless block ~ ~-20 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-21 ~ minecraft:air unless block ~ ~-21 ~ minecraft:cave_air unless block ~ ~-21 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-22 ~ minecraft:air unless block ~ ~-22 ~ minecraft:cave_air unless block ~ ~-22 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-23 ~ minecraft:air unless block ~ ~-23 ~ minecraft:cave_air unless block ~ ~-23 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-24 ~ minecraft:air unless block ~ ~-24 ~ minecraft:cave_air unless block ~ ~-24 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-25 ~ minecraft:air unless block ~ ~-25 ~ minecraft:cave_air unless block ~ ~-25 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-26 ~ minecraft:air unless block ~ ~-26 ~ minecraft:cave_air unless block ~ ~-26 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-27 ~ minecraft:air unless block ~ ~-27 ~ minecraft:cave_air unless block ~ ~-27 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-28 ~ minecraft:air unless block ~ ~-28 ~ minecraft:cave_air unless block ~ ~-28 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-29 ~ minecraft:air unless block ~ ~-29 ~ minecraft:cave_air unless block ~ ~-29 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-30 ~ minecraft:air unless block ~ ~-30 ~ minecraft:cave_air unless block ~ ~-30 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute unless block ~ ~-31 ~ minecraft:air unless block ~ ~-31 ~ minecraft:cave_air unless block ~ ~-31 ~ minecraft:water run scoreboard players add @s bacaphd_light 1
execute if score @s bacaphd_light matches 30 run advancement grant @s only bacaphd:building/lighthouse_keeper
