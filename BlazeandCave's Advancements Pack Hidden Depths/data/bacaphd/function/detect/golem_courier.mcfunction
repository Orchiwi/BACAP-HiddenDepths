# B6 Golem Courier. Runs as, and positioned at, a player with at least five Copper
# Golems within sixteen blocks. A golem holding something is a golem mid-delivery;
# five of them holding something at the same instant is a working sorting network.
# The carried item is looked for in both weapon.mainhand and container.0 on purpose:
# no installed pack attests which slot a Copper Golem uses, and an entity without a
# given slot simply fails that test instead of erroring.
execute as @e[type=minecraft:copper_golem,distance=..16,limit=32,sort=nearest] if items entity @s weapon.mainhand * run tag @s add bacaphd.carrying
execute as @e[type=minecraft:copper_golem,distance=..16,limit=32,sort=nearest] unless entity @s[tag=bacaphd.carrying] if items entity @s container.0 * run tag @s add bacaphd.carrying
execute store result score #carrying bacaphd_gol if entity @e[type=minecraft:copper_golem,distance=..16,tag=bacaphd.carrying,limit=5]
execute if score #carrying bacaphd_gol matches 5 run advancement grant @s only bacaphd:mining/golem_courier
tag @e[type=minecraft:copper_golem,distance=..16,tag=bacaphd.carrying] remove bacaphd.carrying
scoreboard players reset #carrying bacaphd_gol
