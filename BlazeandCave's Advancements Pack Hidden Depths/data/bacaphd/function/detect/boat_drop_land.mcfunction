# The descent stopped. A single sample is not a fall, it is a stale previous position.
execute if score @s bacaphd_bd_n matches 2.. run function bacaphd:detect/boat_drop_check
scoreboard players set @s bacaphd_bd_n 0
