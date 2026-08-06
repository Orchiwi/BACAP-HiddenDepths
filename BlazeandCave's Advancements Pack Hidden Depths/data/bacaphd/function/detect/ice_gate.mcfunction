# Same one-call-per-player gate as Boat Drop.
scoreboard players set @s bacaphd_in_boat 0
execute store result score @s bacaphd_in_boat run execute on vehicle if entity @s[type=#minecraft:boat]
execute if score @s bacaphd_in_boat matches 1 run function bacaphd:detect/ice_road
execute if score @s bacaphd_in_boat matches 0 run function bacaphd:detect/ice_reset
