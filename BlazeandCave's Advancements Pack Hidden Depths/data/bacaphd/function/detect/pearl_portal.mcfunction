# A hand-thrown Ender Pearl never carries you more than about forty blocks. A 256
# block horizontal jump within three seconds of spending one, still inside the End,
# can only be a pearl that flew through an End Gateway and landed on the far side.
# Walking into a Gateway on foot does not spend a pearl, so the statistic gate above
# is what separates this from Gateway Tourist.
scoreboard players remove @s bacaphd_pp_win 1
execute store result score @s bacaphd_pp_dx run data get entity @s Pos[0] 1
execute store result score @s bacaphd_pp_dz run data get entity @s Pos[2] 1
scoreboard players operation @s bacaphd_pp_dx -= @s bacaphd_pp_x
scoreboard players operation @s bacaphd_pp_dz -= @s bacaphd_pp_z
scoreboard players set @s bacaphd_pp_far 0
execute if score @s bacaphd_pp_dx matches ..-256 run scoreboard players set @s bacaphd_pp_far 1
execute if score @s bacaphd_pp_dx matches 256.. run scoreboard players set @s bacaphd_pp_far 1
execute if score @s bacaphd_pp_dz matches ..-256 run scoreboard players set @s bacaphd_pp_far 1
execute if score @s bacaphd_pp_dz matches 256.. run scoreboard players set @s bacaphd_pp_far 1
execute if score @s bacaphd_pp_far matches 1 if dimension minecraft:the_end run advancement grant @s only bacaphd:end/pearl_portal
execute if score @s bacaphd_pp_far matches 1 run scoreboard players set @s bacaphd_pp_win 0
