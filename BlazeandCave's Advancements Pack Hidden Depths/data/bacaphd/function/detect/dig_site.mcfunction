# B5 Dig Site. Reached only when a Sniffer is within sixteen blocks of the player, and run
# as and at that player, so every `distance=` below is measured from the player.
#
# The evidence of a dig is a Torchflower Seed or a Pitcher Pod with NO Thrower tag: an item
# a player drops or throws carries that player's UUID in Thrower for the rest of its life,
# and neither seed has any vanilla source but a Sniffer dig.
#
# The substrate is latched on to the ITEM, once, and never re-read. The old version read
# the block under the SNIFFER at scan time, which was wrong in both directions: a Sniffer
# walks off after digging, so the block beneath it was usually not the block it dug (missed
# digs), and one seed left lying on the ground could be cashed in three times over by
# walking the Sniffer from moss to mud to rooted dirt (false credit). A tag can only be
# added once, so one dig can now only ever credit one substrate.
#
# Each line carries all three `tag=!` guards, so an item is only sampled while it is still
# unlatched. That also makes an airborne item harmless: reading `~ ~-1 ~` while it is still
# falling matches nothing, and the next sweep tries again once it has settled.
execute as @e[type=minecraft:item,distance=..16,tag=!bacaphd.ds_m,tag=!bacaphd.ds_d,tag=!bacaphd.ds_r,nbt={Item:{id:"minecraft:torchflower_seeds"}}] unless data entity @s Thrower at @s if block ~ ~-1 ~ minecraft:moss_block run tag @s add bacaphd.ds_m
execute as @e[type=minecraft:item,distance=..16,tag=!bacaphd.ds_m,tag=!bacaphd.ds_d,tag=!bacaphd.ds_r,nbt={Item:{id:"minecraft:torchflower_seeds"}}] unless data entity @s Thrower at @s if block ~ ~-1 ~ minecraft:mud run tag @s add bacaphd.ds_d
execute as @e[type=minecraft:item,distance=..16,tag=!bacaphd.ds_m,tag=!bacaphd.ds_d,tag=!bacaphd.ds_r,nbt={Item:{id:"minecraft:torchflower_seeds"}}] unless data entity @s Thrower at @s if block ~ ~-1 ~ minecraft:rooted_dirt run tag @s add bacaphd.ds_r
execute as @e[type=minecraft:item,distance=..16,tag=!bacaphd.ds_m,tag=!bacaphd.ds_d,tag=!bacaphd.ds_r,nbt={Item:{id:"minecraft:pitcher_pod"}}] unless data entity @s Thrower at @s if block ~ ~-1 ~ minecraft:moss_block run tag @s add bacaphd.ds_m
execute as @e[type=minecraft:item,distance=..16,tag=!bacaphd.ds_m,tag=!bacaphd.ds_d,tag=!bacaphd.ds_r,nbt={Item:{id:"minecraft:pitcher_pod"}}] unless data entity @s Thrower at @s if block ~ ~-1 ~ minecraft:mud run tag @s add bacaphd.ds_d
execute as @e[type=minecraft:item,distance=..16,tag=!bacaphd.ds_m,tag=!bacaphd.ds_d,tag=!bacaphd.ds_r,nbt={Item:{id:"minecraft:pitcher_pod"}}] unless data entity @s Thrower at @s if block ~ ~-1 ~ minecraft:rooted_dirt run tag @s add bacaphd.ds_r
# Credit the player from the latched item, not from wherever the Sniffer is standing now.
execute if entity @e[type=minecraft:item,tag=bacaphd.ds_m,distance=..16,limit=1] run scoreboard players set @s bacaphd_ds_moss 1
execute if entity @e[type=minecraft:item,tag=bacaphd.ds_d,distance=..16,limit=1] run scoreboard players set @s bacaphd_ds_mud 1
execute if entity @e[type=minecraft:item,tag=bacaphd.ds_r,distance=..16,limit=1] run scoreboard players set @s bacaphd_ds_root 1
execute if score @s bacaphd_ds_moss matches 1 if score @s bacaphd_ds_mud matches 1 if score @s bacaphd_ds_root matches 1 run advancement grant @s only bacaphd:farming/dig_site
