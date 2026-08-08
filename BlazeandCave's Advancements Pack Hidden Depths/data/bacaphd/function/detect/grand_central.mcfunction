# Grand Central. Reached only from the four gate lines in bucket_slow, so the
# player is already standing in a rail block. Flags, not counts: one flag per rail
# type found anywhere in the 9x9 square at this Y level, all four required.
# Deliberately flat - 'one nine-by-nine square' is a layout, not a volume.
scoreboard players set @s bacaphd_gc_r 0
scoreboard players set @s bacaphd_gc_p 0
scoreboard players set @s bacaphd_gc_d 0
scoreboard players set @s bacaphd_gc_a 0
scoreboard players set @s bacaphd_s2x 0
execute positioned ~-4 ~ ~-4 run function bacaphd:detect/gc_x
execute if score @s bacaphd_gc_r matches 1 if score @s bacaphd_gc_p matches 1 if score @s bacaphd_gc_d matches 1 if score @s bacaphd_gc_a matches 1 run advancement grant @s only bacaphd:redstone/grand_central
