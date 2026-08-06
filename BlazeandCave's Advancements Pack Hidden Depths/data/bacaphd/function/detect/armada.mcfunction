# B11 Armada. Runs as, and positioned at, a player with at least twenty Nautiluses
# within twenty blocks. The body slot of a Nautilus only ever holds Nautilus Armor,
# so one `if items` test per animal separates a fitted-out fleet from a wild school
# without guessing at any NBT field.
execute as @e[type=minecraft:nautilus,distance=..20] if items entity @s armor.body * run tag @s add bacaphd.armoured
execute store result score #armoured bacaphd_naut if entity @e[type=minecraft:nautilus,distance=..20,tag=bacaphd.armoured,limit=20]
execute if score #armoured bacaphd_naut matches 20 run advancement grant @s only bacaphd:biomes/armada
tag @e[type=minecraft:nautilus,distance=..20,tag=bacaphd.armoured] remove bacaphd.armoured
scoreboard players reset #armoured bacaphd_naut
