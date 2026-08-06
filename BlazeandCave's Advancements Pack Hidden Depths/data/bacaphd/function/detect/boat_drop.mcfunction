# Runs as the player riding a boat, once per player, every 10 ticks.
execute store result score @s bacaphd_bd_y run data get entity @s Pos[1] 1
execute if score @s bacaphd_bd_seed matches 1 run scoreboard players operation @s bacaphd_bd_prev = @s bacaphd_bd_y
scoreboard players set @s bacaphd_bd_seed 0
scoreboard players operation @s bacaphd_bd_d = @s bacaphd_bd_prev
scoreboard players operation @s bacaphd_bd_d -= @s bacaphd_bd_y
# 4..200 blocks of descent in half a second is a fall; anything else ends it.
execute if score @s bacaphd_bd_d matches 4..200 run function bacaphd:detect/boat_fall
execute unless score @s bacaphd_bd_d matches 4..200 run function bacaphd:detect/boat_drop_land
scoreboard players operation @s bacaphd_bd_prev = @s bacaphd_bd_y
