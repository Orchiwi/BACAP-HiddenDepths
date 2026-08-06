# cave_air and void_air are distinct blocks from air, and underground - which is
# where these builds live - every empty position is cave_air. Skipping all three
# is what makes the short-circuit actually short-circuit.
execute unless block ~ ~ ~ minecraft:air unless block ~ ~ ~ minecraft:cave_air unless block ~ ~ ~ minecraft:void_air run function bacaphd:detect/cc_hit
scoreboard players add @s bacaphd_sz 1
execute if score @s bacaphd_sz matches ..12 positioned ~ ~ ~1 run function bacaphd:detect/cc_z
