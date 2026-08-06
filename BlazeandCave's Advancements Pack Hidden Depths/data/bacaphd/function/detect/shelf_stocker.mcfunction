# B75 Shelf Stocker - every wood type of Shelf counts towards the same thousand.
scoreboard players set @s bacaphd_sh_sum 0
execute if score @s bacaphd_sh_acacia matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_acacia
execute if score @s bacaphd_sh_bamboo matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_bamboo
execute if score @s bacaphd_sh_birch matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_birch
execute if score @s bacaphd_sh_cherry matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_cherry
execute if score @s bacaphd_sh_crimson matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_crimson
execute if score @s bacaphd_sh_darkoak matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_darkoak
execute if score @s bacaphd_sh_jungle matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_jungle
execute if score @s bacaphd_sh_mangrove matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_mangrove
execute if score @s bacaphd_sh_oak matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_oak
execute if score @s bacaphd_sh_paleoak matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_paleoak
execute if score @s bacaphd_sh_spruce matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_spruce
execute if score @s bacaphd_sh_warped matches 1.. run scoreboard players operation @s bacaphd_sh_sum += @s bacaphd_sh_warped
execute if score @s bacaphd_sh_sum matches 1000.. run advancement grant @s only bacaphd:statistics/shelf_stocker
execute if score @s bacaphd_sh_sum matches 1000.. run scoreboard players reset @s bacaphd_sh_sum
