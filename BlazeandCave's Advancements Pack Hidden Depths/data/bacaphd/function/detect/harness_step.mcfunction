# B73 Harness Hours - a hovering Ghast must not pay out, so credit the five seconds only when
# the horizontal step since the previous sample is real travel.
execute store result score @s bacaphd_gx run data get entity @s Pos[0] 1
execute store result score @s bacaphd_gz run data get entity @s Pos[2] 1
scoreboard players operation #h5_dx bacaphd_tmp = @s bacaphd_gx
scoreboard players operation #h5_dx bacaphd_tmp -= @s bacaphd_gpx
scoreboard players operation #h5_dz bacaphd_tmp = @s bacaphd_gz
scoreboard players operation #h5_dz bacaphd_tmp -= @s bacaphd_gpz
scoreboard players set #h5_neg bacaphd_tmp -1
execute if score #h5_dx bacaphd_tmp matches ..-1 run scoreboard players operation #h5_dx bacaphd_tmp *= #h5_neg bacaphd_tmp
execute if score #h5_dz bacaphd_tmp matches ..-1 run scoreboard players operation #h5_dz bacaphd_tmp *= #h5_neg bacaphd_tmp
scoreboard players operation #h5_dx bacaphd_tmp += #h5_dz bacaphd_tmp
execute if score @s bacaphd_gseen matches 1 if score #h5_dx bacaphd_tmp matches 10.. run scoreboard players add @s bacaphd_ghast 100
# Remember this sample; bacaphd_gseen keeps a fresh mount from cashing in a teleport.
scoreboard players operation @s bacaphd_gpx = @s bacaphd_gx
scoreboard players operation @s bacaphd_gpz = @s bacaphd_gz
scoreboard players set @s bacaphd_gseen 1
execute if score @s bacaphd_ghast matches 240000.. run advancement grant @s only bacaphd:statistics/harness_hours
execute if score @s bacaphd_ghast matches 240000.. run scoreboard players reset @s bacaphd_ghast
