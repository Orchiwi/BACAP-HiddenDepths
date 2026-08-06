# Total lifetime uses of every animal-derived food.
scoreboard players set @s bacaphd_meat 0
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_beef
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_cooked_beef
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_porkchop
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_cooked_porkchop
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_chicken
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_cooked_chicken
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_mutton
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_cooked_mutton
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_rabbit
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_cooked_rabbit
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_rabbit_stew
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_cod
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_cooked_cod
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_salmon
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_cooked_salmon
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_tropical_fish
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_pufferfish
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_rotten_flesh
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_spider_eye
scoreboard players operation @s bacaphd_meat += @s bacaphd_eat_milk_bucket
# Unchanged since the last sweep: five more seconds of virtue. Changed: back to zero.
execute if score @s bacaphd_meat = @s bacaphd_meat_seen run scoreboard players add @s bacaphd_herb_ticks 100
execute unless score @s bacaphd_meat = @s bacaphd_meat_seen run scoreboard players set @s bacaphd_herb_ticks 0
scoreboard players operation @s bacaphd_meat_seen = @s bacaphd_meat
execute if score @s bacaphd_herb_ticks matches 240000.. run function bacaphd:detect/herbivore_done
