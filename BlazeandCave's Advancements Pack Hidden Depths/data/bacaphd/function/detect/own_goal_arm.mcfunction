# B32 Own Goal. An Ender Pearl was just thrown. Consume the statistic delta first so it
# can never bank up, then open a six second window and latch where the throw was made
# from. The latched position is what separates a real pearl teleport from stepping off an
# eight block ledge: both deal exactly 5.0 fall damage, but only one of them moves you.
scoreboard players operation @s bacaphd_pearls_seen = @s bacaphd_pearls_used
execute if score @s bacaphd_init matches 1 run scoreboard players set @s bacaphd_pearl_window 120
execute store result score @s bacaphd_pearl_x run data get entity @s Pos[0] 1
execute store result score @s bacaphd_pearl_z run data get entity @s Pos[2] 1
