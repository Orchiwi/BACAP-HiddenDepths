# Runs at the player. Eight cheap block lookups, no NBT unless actually climbing.
scoreboard players set @s bacaphd_fs_ok 0
execute if block ~ ~ ~ minecraft:ladder run scoreboard players set @s bacaphd_fs_ok 1
execute if block ~ ~ ~ minecraft:vine run scoreboard players set @s bacaphd_fs_ok 1
execute if block ~ ~ ~ minecraft:cave_vines run scoreboard players set @s bacaphd_fs_ok 1
execute if block ~ ~ ~ minecraft:cave_vines_plant run scoreboard players set @s bacaphd_fs_ok 1
execute if block ~ ~ ~ minecraft:twisting_vines run scoreboard players set @s bacaphd_fs_ok 1
execute if block ~ ~ ~ minecraft:twisting_vines_plant run scoreboard players set @s bacaphd_fs_ok 1
execute if block ~ ~ ~ minecraft:weeping_vines run scoreboard players set @s bacaphd_fs_ok 1
execute if block ~ ~ ~ minecraft:weeping_vines_plant run scoreboard players set @s bacaphd_fs_ok 1
execute if score @s bacaphd_fs_ok matches 1 run function bacaphd:detect/free_solo_on
execute if score @s bacaphd_fs_ok matches 0 run function bacaphd:detect/free_solo_off
