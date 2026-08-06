scoreboard players operation @s bacaphd_cp_lr = @s bacaphd_hi
scoreboard players add @s bacaphd_cpcount 1
execute if score @s bacaphd_cpcount matches 20.. run function bacaphd:detect/city_planner_done
