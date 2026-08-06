# B62 Parrot Choir - count the Parrots first, the block scan is only worth doing at five or more.
# The gate is 8 blocks, not 5: a Parrot may sit 3 blocks from a Jukebox that is itself a block
# and a half away from the player, and it still counts.
execute store result score #h5_parrots bacaphd_tmp if entity @e[type=minecraft:parrot,distance=..8]
execute if score #h5_parrots bacaphd_tmp matches 5.. run function bacaphd:detect/parrot_choir_jukebox
