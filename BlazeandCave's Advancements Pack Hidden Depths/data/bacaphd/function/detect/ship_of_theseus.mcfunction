# Ship of Theseus. Two-phase, because an empty item frame on its own proves nothing:
# five frames carried to the End and stuck on a wall used to pay out the pack's most
# expensive End advancement in a single sample.
#
# Phase 1 ARM. A frame is only ever a candidate on the FIRST sample the pack sees it,
# and only if it is already holding an Elytra and is hung on the ship's purpur. A frame
# the player places is empty on the sample after it is placed, so it is marked seen and
# can never be armed afterwards - and a ship that was already stripped before this pack
# was installed has an empty frame the first time it is seen, so it pays nothing either.
# Phase 2 CREDIT. An armed frame that has gone empty is an Elytra that came out of a
# ship while this player was stood next to it. The armed tag is removed as it pays, so
# no frame can ever be counted twice.
scoreboard players set #ship bacaphd_sys 0
execute at @s as @e[type=minecraft:item_frame,distance=..12,tag=!bacaphd.ship_seen,nbt={Item:{id:"minecraft:elytra"}}] at @s run function bacaphd:detect/ship_arm
execute at @s as @e[type=minecraft:item_frame,distance=..12,tag=!bacaphd.ship_seen] run tag @s add bacaphd.ship_seen
execute at @s as @e[type=minecraft:item_frame,distance=..12,tag=bacaphd.ship_armed] unless data entity @s Item run scoreboard players add #ship bacaphd_sys 1
execute at @s as @e[type=minecraft:item_frame,distance=..12,tag=bacaphd.ship_armed] unless data entity @s Item run tag @s remove bacaphd.ship_armed
scoreboard players operation @s bacaphd_ship += #ship bacaphd_sys
execute if score @s bacaphd_ship matches 5.. run advancement grant @s only bacaphd:end/ship_of_theseus
