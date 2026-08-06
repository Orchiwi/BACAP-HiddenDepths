# B50 Gateway Tourist. Position is sampled in whole blocks; a 200+ block jump
# between two samples half a second apart, both inside the End, is a gateway.
scoreboard players set @s bacaphd_gw_now 0
execute if dimension minecraft:the_end run scoreboard players set @s bacaphd_gw_now 1
execute store result score @s bacaphd_gw_x run data get entity @s Pos[0] 1
execute store result score @s bacaphd_gw_z run data get entity @s Pos[2] 1
execute if score @s bacaphd_gw_now matches 1 if score @s bacaphd_gw_in matches 1 run function bacaphd:detect/gateway_tourist_check
scoreboard players operation @s bacaphd_gw_px = @s bacaphd_gw_x
scoreboard players operation @s bacaphd_gw_pz = @s bacaphd_gw_z
scoreboard players operation @s bacaphd_gw_in = @s bacaphd_gw_now
