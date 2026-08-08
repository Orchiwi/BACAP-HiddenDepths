# Three independent proofs, cheapest first, each one gating the next. A player who is
# not standing in a tall roofed hall costs 21 block tests and stops there.
# Proof 1: 19 clear blocks above the feet (fb_up) plus a solid lid at +20, so
# bacaphd_fbk reaches exactly 20 for a 20-block interior and can reach it no other way.
scoreboard players set @s bacaphd_fbk 0
scoreboard players set @s bacaphd_fby 0
execute positioned ~ ~1 ~ run function bacaphd:detect/fb_up
execute unless block ~ ~20 ~ minecraft:air unless block ~ ~20 ~ minecraft:cave_air run scoreboard players add @s bacaphd_fbk 1
execute if score @s bacaphd_fbk matches 20 run function bacaphd:detect/fb_walls
