# Evel Knievel - one Camel leap that clears seven blocks.
# @s is the riding player and the Camel is @s's vehicle; the bucket line proved both.
# $ek_air is pre-set to 1 so a failed NBT read can never be mistaken for being airborne.
scoreboard players set $ek_air bacaphd_ek 1
execute on vehicle store result score $ek_air bacaphd_ek run data get entity @s OnGround
# --- Grounded: settle the leap that just ended, then re-latch the take-off point.
# The landing must be no more than one block below the take-off, which is what makes
# this a gap crossed rather than a cliff fallen off.
execute if score $ek_air bacaphd_ek matches 1 store result score @s bacaphd_ek_dy run data get entity @s Pos[1]
execute if score $ek_air bacaphd_ek matches 1 run scoreboard players add @s bacaphd_ek_dy 1
execute if score $ek_air bacaphd_ek matches 1 if score @s bacaphd_ek_best matches 7.. if score @s bacaphd_ek_dy >= @s bacaphd_ek_y run advancement grant @s only bacaphd:animal/evel_knievel
execute if score $ek_air bacaphd_ek matches 1 store result score @s bacaphd_ek_x run data get entity @s Pos[0]
execute if score $ek_air bacaphd_ek matches 1 store result score @s bacaphd_ek_y run data get entity @s Pos[1]
execute if score $ek_air bacaphd_ek matches 1 store result score @s bacaphd_ek_z run data get entity @s Pos[2]
execute if score $ek_air bacaphd_ek matches 1 run scoreboard players set @s bacaphd_ek_best 0
# --- Airborne: |dx| and |dz| from the take-off block, the larger of the two, and the
# --- best value reached anywhere in this leap.
execute if score $ek_air bacaphd_ek matches 0 store result score @s bacaphd_ek_dx run data get entity @s Pos[0]
execute if score $ek_air bacaphd_ek matches 0 run scoreboard players operation @s bacaphd_ek_dx -= @s bacaphd_ek_x
execute if score $ek_air bacaphd_ek matches 0 run scoreboard players operation @s bacaphd_ek_tmp = @s bacaphd_ek_dx
execute if score $ek_air bacaphd_ek matches 0 run scoreboard players operation @s bacaphd_ek_tmp *= $neg1 bacaphd_ek
execute if score $ek_air bacaphd_ek matches 0 run scoreboard players operation @s bacaphd_ek_dx > @s bacaphd_ek_tmp
execute if score $ek_air bacaphd_ek matches 0 store result score @s bacaphd_ek_dz run data get entity @s Pos[2]
execute if score $ek_air bacaphd_ek matches 0 run scoreboard players operation @s bacaphd_ek_dz -= @s bacaphd_ek_z
execute if score $ek_air bacaphd_ek matches 0 run scoreboard players operation @s bacaphd_ek_tmp = @s bacaphd_ek_dz
execute if score $ek_air bacaphd_ek matches 0 run scoreboard players operation @s bacaphd_ek_tmp *= $neg1 bacaphd_ek
execute if score $ek_air bacaphd_ek matches 0 run scoreboard players operation @s bacaphd_ek_dz > @s bacaphd_ek_tmp
execute if score $ek_air bacaphd_ek matches 0 run scoreboard players operation @s bacaphd_ek_dx > @s bacaphd_ek_dz
execute if score $ek_air bacaphd_ek matches 0 run scoreboard players operation @s bacaphd_ek_best > @s bacaphd_ek_dx
