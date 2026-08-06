function bacaphd:detect/pearl_grounded
execute if score @s bacaphd_pearl_grd matches 1 run scoreboard players set @s bacaphd_pearl_chain 0
execute if score @s bacaphd_pearl_grd matches 0 run scoreboard players add @s bacaphd_pearl_chain 1
execute if score @s bacaphd_pearl_chain matches 5.. run function bacaphd:detect/pearl_done
