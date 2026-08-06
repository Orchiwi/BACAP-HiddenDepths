# One call per 10 ticks for a player whose bedrock timer is still running: tick the timer
# down, then ask -- exactly -- whether the feet are at the build limit.
# A dx/dy/dz selector box matches on bounding-box INTERSECTION, so the old
# `positioned ~ 319 ~ if entity @s[dx=0,dy=2000,dz=0]` passed as soon as the player's HEAD
# crossed 319, i.e. with the feet at about y 317.2. (Note: Vec3Argument does not centre
# the Y coordinate -- WorldCoordinates.parseDouble passes centerCorrect=false for Y -- so
# the anchor itself was already exactly 319.0. The box, not the anchor, was the problem.)
scoreboard players remove @s bacaphd_vl_t 1
execute store result score @s bacaphd_vl_y run data get entity @s Pos[1] 1
execute if score @s bacaphd_vl_y matches 319.. run function bacaphd:detect/vertical_limit
