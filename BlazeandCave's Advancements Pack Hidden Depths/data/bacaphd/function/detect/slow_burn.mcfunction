# Slow Burn. One step along the run, in the direction of the execution rotation.
# The caller stands this at the CENTRE of the anchor block and sets `rotated` to one of
# the four horizontal axes, so `^ ^ ^1` is an exact one-block step from block centre to
# block centre and cannot drift off the line however long the run is. Rotation and
# position are both inherited by the recursive call, so the walk keeps its direction.
# Recursion stops at sixteen, which is all the advancement asks for.
execute positioned ^ ^ ^1 if block ~ ~ ~ minecraft:repeater[delay=4,powered=true] run scoreboard players set @s bacaphd_slowburn_p 1
execute positioned ^ ^ ^1 if block ~ ~ ~ minecraft:repeater[delay=4] run scoreboard players add @s bacaphd_slowburn 1
execute if score @s bacaphd_slowburn matches ..15 positioned ^ ^ ^1 if block ~ ~ ~ minecraft:repeater[delay=4] run function bacaphd:detect/slow_burn
