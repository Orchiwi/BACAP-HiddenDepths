# Net displacement from the block the climb started on, so going back down gives the
# progress back. Summing positive steps let a five-block ladder be ridden to 200 blocks.
execute store result score @s bacaphd_fs_y run data get entity @s Pos[1] 10
execute unless score @s bacaphd_fs_on matches 1 run scoreboard players operation @s bacaphd_fs_start = @s bacaphd_fs_y
scoreboard players set @s bacaphd_fs_on 1
scoreboard players operation @s bacaphd_fs_climb = @s bacaphd_fs_y
scoreboard players operation @s bacaphd_fs_climb -= @s bacaphd_fs_start
execute if score @s bacaphd_fs_climb matches 2000.. run function bacaphd:detect/free_solo_done
