# B32 Own Goal. Criterion pearl_fall fired: exactly 5.0 raw damage of a #minecraft:is_fall
# type, which is what an Ender Pearl teleport deals. Re-arm the criterion, then hand on
# only if that blow was lethal and one of this player's pearls is still inside its window.
advancement revoke @s only bacaphd:weaponry/own_goal pearl_fall
execute if score @s bacaphd_pearl_window matches 1.. if score @s bacaphd_health matches 0 run function bacaphd:detect/own_goal_check
