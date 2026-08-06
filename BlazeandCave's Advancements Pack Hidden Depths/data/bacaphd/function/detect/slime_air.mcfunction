# Only for a player with a live chain who is off the slime, so this is a rare path.
# Track the apex of the hop, and end the chain if they came down on anything else --
# that is the 'without touching another block' clause.
execute store result score @s bacaphd_slime_y run data get entity @s Pos[1] 10
scoreboard players operation @s bacaphd_slime_peak > @s bacaphd_slime_y
scoreboard players set @s bacaphd_slime_grd 0
execute store result score @s bacaphd_slime_grd run data get entity @s OnGround
execute if score @s bacaphd_slime_grd matches 1 run scoreboard players set @s bacaphd_slime_chain 0
