# Distance from the centre of the End. Each banked city has to be at least 1000
# blocks FURTHER out than the last one, so the radius can only ever rise: a city
# can never be banked twice, and two cities cannot be ping-ponged. The run is
# twenty cities spread over at least twenty thousand blocks of outward travel.
execute store result score @s bacaphd_dx run data get entity @s Pos[0] 1
execute store result score @s bacaphd_dz run data get entity @s Pos[2] 1
function bacaphd:detect/step
scoreboard players operation @s bacaphd_cp_next = @s bacaphd_cp_lr
scoreboard players add @s bacaphd_cp_next 1000
execute if score @s bacaphd_hi >= @s bacaphd_cp_next run function bacaphd:detect/city_planner_add
