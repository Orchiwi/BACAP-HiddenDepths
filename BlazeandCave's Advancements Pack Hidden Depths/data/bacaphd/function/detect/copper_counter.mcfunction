# B56 Copper Counter. 13 x 5 x 13 around the player. Empty positions cost a
# single check, so only real blocks pay for the sixteen-variant test.
scoreboard players set @s bacaphd_bulbs_on 0
scoreboard players set @s bacaphd_bulbs_off 0
scoreboard players set @s bacaphd_sx 0
execute positioned ~-6 ~-2 ~-6 run function bacaphd:detect/cc_x
scoreboard players operation @s bacaphd_bulbs = @s bacaphd_bulbs_on
scoreboard players operation @s bacaphd_bulbs += @s bacaphd_bulbs_off
execute if score @s bacaphd_bulbs matches 16.. if score @s bacaphd_bulbs_on matches 4.. if score @s bacaphd_bulbs_off matches 4.. run advancement grant @s only bacaphd:redstone/copper_counter
