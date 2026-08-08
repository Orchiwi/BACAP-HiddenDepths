# 13 x 5 x 13 around the player, only while the window opened by the player's own
# shot is still running. A Target is 'powered' when it IS a target and is NOT in
# power=0 - two block tests, instead of fifteen one per signal strength.
scoreboard players remove @s bacaphd_cr_win 1
scoreboard players set @s bacaphd_ctgt 0
scoreboard players set @s bacaphd_disp 0
scoreboard players set @s bacaphd_sx 0
execute positioned ~-6 ~-2 ~-6 run function bacaphd:detect/cr_x
execute if score @s bacaphd_ctgt matches 3.. if score @s bacaphd_disp matches 3.. run scoreboard players set @s bacaphd_cr_win 0
execute if score @s bacaphd_ctgt matches 3.. if score @s bacaphd_disp matches 3.. run advancement grant @s only bacaphd:redstone/chain_reaction
