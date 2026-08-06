# B62 Parrot Choir - executed at the centre of a playing Jukebox block, with @s still the player.
# 3 blocks is inside the 3.46 the game itself uses to decide a Parrot is dancing.
execute store result score #h5_parrots bacaphd_tmp if entity @e[type=minecraft:parrot,distance=..3]
execute if score #h5_parrots bacaphd_tmp matches 5.. run scoreboard players set #h5_jukebox bacaphd_tmp 1
