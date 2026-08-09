# Executed POSITIONED ON THE CHEST. The 5x5x5 centred here holds 125 positions;
# 124 of them - everything except the chest itself - must be obsidian, so the
# threshold is an exact count and not a fill percentage. The inner loop uses its
# own index objectives because it runs inside the outer probe.
scoreboard players set @s bacaphd_fk 0
scoreboard players set @s bacaphd_fk_i 0
execute positioned ~-2 ~ ~-2 run function bacaphd:detect/fk_vx
execute if score @s bacaphd_fk matches 124.. run scoreboard players set @s bacaphd_fk_done 1
execute if score @s bacaphd_fk matches 124.. run advancement grant @s only bacaphd:building/fort_knox
