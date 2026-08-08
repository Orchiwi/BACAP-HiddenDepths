# Pearl Portal. The ender_pearl use statistic has just moved while the player is in
# the End: anchor the throw position and open a three second window. The mirror is
# NOT resynced here - that happens on its own ungated line in the fast bucket, after
# this one, so exactly one arming is taken per pearl spent and a pearl thrown in any
# other dimension still consumes its delta instead of banking it for later.
execute store result score @s bacaphd_pp_x run data get entity @s Pos[0] 1
execute store result score @s bacaphd_pp_z run data get entity @s Pos[2] 1
scoreboard players set @s bacaphd_pp_win 60
