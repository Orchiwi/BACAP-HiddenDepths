# B48 Portal Sniper. 0 = Overworld, 1 = Nether, 2 = anything else.
scoreboard players set @s bacaphd_ps_dim 2
execute if dimension minecraft:overworld run scoreboard players set @s bacaphd_ps_dim 0
execute if dimension minecraft:the_nether run scoreboard players set @s bacaphd_ps_dim 1
execute store result score @s bacaphd_ps_x run data get entity @s Pos[0] 1
execute store result score @s bacaphd_ps_z run data get entity @s Pos[2] 1
# Overworld -> Nether freezes the anchor and starts measuring how deep you go.
execute if score @s bacaphd_ps_dim matches 1 if score @s bacaphd_ps_pdim matches 0 if score @s bacaphd_ps_has matches 1 run function bacaphd:detect/portal_sniper_enter
# Every armed Nether sample updates the furthest you have been from the portal
# you came in by. This is a running maximum, not a path length, so pacing about
# next to the portal banks nothing.
execute if score @s bacaphd_ps_dim matches 1 if score @s bacaphd_ps_arm matches 1 run function bacaphd:detect/portal_sniper_depth
# Nether -> Overworld while armed measures the return.
execute if score @s bacaphd_ps_dim matches 0 if score @s bacaphd_ps_pdim matches 1 if score @s bacaphd_ps_arm matches 1 run function bacaphd:detect/portal_sniper_check
# Otherwise keep the anchor riding along with the player in the Overworld.
execute if score @s bacaphd_ps_dim matches 0 if score @s bacaphd_ps_arm matches 0 run function bacaphd:detect/portal_sniper_anchor
scoreboard players operation @s bacaphd_ps_pdim = @s bacaphd_ps_dim
