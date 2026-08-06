# 'On the ground' for the purposes of the chain. OnGround alone reads 0 on a ladder and
# in water, which would have let the whole chain be thrown from one ladder rung.
scoreboard players set @s bacaphd_pearl_grd 0
execute store result score @s bacaphd_pearl_grd run data get entity @s OnGround
execute at @s if block ~ ~ ~ #minecraft:climbable run scoreboard players set @s bacaphd_pearl_grd 1
execute at @s if block ~ ~ ~ minecraft:water run scoreboard players set @s bacaphd_pearl_grd 1
