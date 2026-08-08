# Golem Foundry - a village that grew large enough to spawn its own Iron Golem.
# Villagers are COUNTED with `store result ... if entity`, never tested with a
# limit=N selector, and every selector is bounded by both distance and limit.
# PlayerCreated is 1b on a Golem built from blocks, so 0b is a natural village spawn.
execute store result score #gf_villagers bacaphd_gfv if entity @e[type=minecraft:villager,distance=..48,limit=10]
execute if score #gf_villagers bacaphd_gfv matches 10 if entity @e[type=minecraft:iron_golem,distance=..48,limit=1,nbt={PlayerCreated:0b}] run advancement grant @s only bacaphd:adventure/golem_foundry
