# B32 Own Goal, the displacement test. The player died where the pearl put them, so the
# death position must be at least eight blocks from the position the pearl was thrown
# from, on x or on z. Absolute value: copy the difference, negate the copy, keep the
# larger of the two with the scoreboard's `>` (max assignment).
execute store result score @s bacaphd_calc run data get entity @s Pos[0] 1
scoreboard players operation @s bacaphd_calc -= @s bacaphd_pearl_x
scoreboard players operation @s bacaphd_calc2 = @s bacaphd_calc
scoreboard players operation @s bacaphd_calc2 *= #neg bacaphd_calc
scoreboard players operation @s bacaphd_calc > @s bacaphd_calc2
execute if score @s bacaphd_calc matches 8.. run function bacaphd:detect/own_goal_grant
execute store result score @s bacaphd_calc run data get entity @s Pos[2] 1
scoreboard players operation @s bacaphd_calc -= @s bacaphd_pearl_z
scoreboard players operation @s bacaphd_calc2 = @s bacaphd_calc
scoreboard players operation @s bacaphd_calc2 *= #neg bacaphd_calc
scoreboard players operation @s bacaphd_calc > @s bacaphd_calc2
execute if score @s bacaphd_calc matches 8.. run function bacaphd:detect/own_goal_grant
