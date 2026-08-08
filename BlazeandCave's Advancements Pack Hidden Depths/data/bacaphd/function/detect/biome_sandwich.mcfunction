# Biome Sandwich. Five samples: the player's own position and four corners five
# blocks out on each diagonal, which is 7.1 blocks away - inside the eight the
# description promises. bacaphd_bi is cleared before every call because
# detect/biome_id only ever writes into a zero.
scoreboard players set @s bacaphd_bi 0
function bacaphd:detect/biome_id
scoreboard players operation @s bacaphd_bs1 = @s bacaphd_bi
scoreboard players set @s bacaphd_bi 0
execute positioned ~-5 ~ ~-5 run function bacaphd:detect/biome_id
scoreboard players operation @s bacaphd_bs2 = @s bacaphd_bi
scoreboard players set @s bacaphd_bi 0
execute positioned ~5 ~ ~-5 run function bacaphd:detect/biome_id
scoreboard players operation @s bacaphd_bs3 = @s bacaphd_bi
scoreboard players set @s bacaphd_bi 0
execute positioned ~-5 ~ ~5 run function bacaphd:detect/biome_id
scoreboard players operation @s bacaphd_bs4 = @s bacaphd_bi
scoreboard players set @s bacaphd_bi 0
execute positioned ~5 ~ ~5 run function bacaphd:detect/biome_id
scoreboard players operation @s bacaphd_bs5 = @s bacaphd_bi
# Count distinct non-zero indices: each sample scores only if it differs from
# every sample before it. A 0 means 'not a listed Overworld biome' and never counts.
scoreboard players set @s bacaphd_bsn 0
execute if score @s bacaphd_bs1 matches 1.. run scoreboard players add @s bacaphd_bsn 1
execute if score @s bacaphd_bs2 matches 1.. unless score @s bacaphd_bs2 = @s bacaphd_bs1 run scoreboard players add @s bacaphd_bsn 1
execute if score @s bacaphd_bs3 matches 1.. unless score @s bacaphd_bs3 = @s bacaphd_bs1 unless score @s bacaphd_bs3 = @s bacaphd_bs2 run scoreboard players add @s bacaphd_bsn 1
execute if score @s bacaphd_bs4 matches 1.. unless score @s bacaphd_bs4 = @s bacaphd_bs1 unless score @s bacaphd_bs4 = @s bacaphd_bs2 unless score @s bacaphd_bs4 = @s bacaphd_bs3 run scoreboard players add @s bacaphd_bsn 1
execute if score @s bacaphd_bs5 matches 1.. unless score @s bacaphd_bs5 = @s bacaphd_bs1 unless score @s bacaphd_bs5 = @s bacaphd_bs2 unless score @s bacaphd_bs5 = @s bacaphd_bs3 unless score @s bacaphd_bs5 = @s bacaphd_bs4 run scoreboard players add @s bacaphd_bsn 1
execute if score @s bacaphd_bsn matches 3.. run advancement grant @s only bacaphd:biomes/biome_sandwich
