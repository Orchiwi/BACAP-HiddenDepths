# Hatchling. Runs as, and positioned at, one chick born in the last few ticks.
# An egg that hatches four spawns all four at the same point, so they are counted
# with a scoreboard store rather than `if entity @e[...,limit=4]`, which succeeds on
# a single match and would grant on any hatch at all. #best keeps the biggest
# cluster seen anywhere around the player this tick.
execute store result score #cluster bacaphd_hatch if entity @e[type=minecraft:chicken,tag=bacaphd.newchick,distance=..2,limit=4]
scoreboard players operation #best bacaphd_hatch > #cluster bacaphd_hatch
