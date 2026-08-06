# B70 Copper Baron - copper ore mined in both stone and deepslate.
# bacaphd_cu_ore and bacaphd_cu_deep are live statistic objectives, not saved mirrors,
# so there is nothing to initialise and no delta to share with another advancement.
scoreboard players set @s bacaphd_cu_sum 0
execute if score @s bacaphd_cu_ore matches 1.. run scoreboard players operation @s bacaphd_cu_sum += @s bacaphd_cu_ore
execute if score @s bacaphd_cu_deep matches 1.. run scoreboard players operation @s bacaphd_cu_sum += @s bacaphd_cu_deep
execute if score @s bacaphd_cu_sum matches 10000.. run advancement grant @s only bacaphd:statistics/copper_baron
execute if score @s bacaphd_cu_sum matches 10000.. run scoreboard players reset @s bacaphd_cu_sum
