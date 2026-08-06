# B55 Piston Elevator. Altitude gained while standing on the moving parts of a
# lift; stepping off anything else zeroes the climb.
scoreboard players set @s bacaphd_pe_ok 0
execute if block ~ ~-1 ~ minecraft:slime_block run scoreboard players set @s bacaphd_pe_ok 1
execute if block ~ ~-1 ~ minecraft:honey_block run scoreboard players set @s bacaphd_pe_ok 1
execute if block ~ ~-1 ~ minecraft:piston run scoreboard players set @s bacaphd_pe_ok 1
execute if block ~ ~-1 ~ minecraft:sticky_piston run scoreboard players set @s bacaphd_pe_ok 1
execute store result score @s bacaphd_pe_y run data get entity @s Pos[1] 10
execute if score @s bacaphd_pe_ok matches 1 if score @s bacaphd_pe_prev matches 1 run function bacaphd:detect/piston_elevator_add
execute unless score @s bacaphd_pe_ok matches 1 run scoreboard players set @s bacaphd_pe_rise 0
scoreboard players operation @s bacaphd_pe_py = @s bacaphd_pe_y
scoreboard players operation @s bacaphd_pe_prev = @s bacaphd_pe_ok
