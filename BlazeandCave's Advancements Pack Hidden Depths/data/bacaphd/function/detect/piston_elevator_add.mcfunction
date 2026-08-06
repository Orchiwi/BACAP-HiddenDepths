scoreboard players operation @s bacaphd_hi = @s bacaphd_pe_y
scoreboard players operation @s bacaphd_hi -= @s bacaphd_pe_py
execute if score @s bacaphd_hi matches 1..400 run scoreboard players operation @s bacaphd_pe_rise += @s bacaphd_hi
execute if score @s bacaphd_pe_rise matches 1000.. run function bacaphd:detect/piston_elevator_done
