# B73 Harness Hours - the clock only runs while the player's own vehicle is a Happy Ghast.
scoreboard players set #h5_riding bacaphd_tmp 0
execute on vehicle if entity @s[type=minecraft:happy_ghast] run scoreboard players set #h5_riding bacaphd_tmp 1
execute if score #h5_riding bacaphd_tmp matches 0 run scoreboard players set @s bacaphd_gseen 0
execute if score #h5_riding bacaphd_tmp matches 1 run function bacaphd:detect/harness_step
