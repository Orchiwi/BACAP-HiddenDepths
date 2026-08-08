execute if block ~ ~ ~ minecraft:rail run scoreboard players set @s bacaphd_gc_r 1
execute if block ~ ~ ~ minecraft:powered_rail run scoreboard players set @s bacaphd_gc_p 1
execute if block ~ ~ ~ minecraft:detector_rail run scoreboard players set @s bacaphd_gc_d 1
execute if block ~ ~ ~ minecraft:activator_rail run scoreboard players set @s bacaphd_gc_a 1
scoreboard players add @s bacaphd_s2z 1
execute if score @s bacaphd_s2z matches ..8 positioned ~ ~ ~1 run function bacaphd:detect/gc_z
