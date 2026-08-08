# Pod Cast - five Dolphins within twelve blocks of a player standing in water,
# held for 120 consecutive medium ticks (1200 game ticks, one minute).
# The count is a scoreboard count, bounded by distance and limit; the streak is
# only ever written with add/set, so an unset score cannot manufacture a grant.
scoreboard players set #pc_n bacaphd_pcn 0
execute if block ~ ~ ~ minecraft:water store result score #pc_n bacaphd_pcn if entity @e[type=minecraft:dolphin,distance=..12,limit=5]
execute if score #pc_n bacaphd_pcn matches 5 run scoreboard players add @s bacaphd_pct 1
execute unless score #pc_n bacaphd_pcn matches 5 run scoreboard players set @s bacaphd_pct 0
execute if score @s bacaphd_pct matches 120.. run advancement grant @s only bacaphd:biomes/pod_cast
