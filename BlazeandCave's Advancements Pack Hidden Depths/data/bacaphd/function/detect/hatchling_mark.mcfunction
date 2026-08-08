# Hatchling. Runs as one chicken that has never been sampled before.
# The score is zeroed first so a chicken without an Age tag leaves a harmless 0
# behind instead of whatever the previous holder of this objective had. A baby
# spawns at Age -24000 and gains 1 per tick, so -24000..-23995 is "born in the last
# five ticks" - naturally spawned adults sit at 0 and are excluded outright.
scoreboard players set @s bacaphd_hatch 0
execute store result score @s bacaphd_hatch run data get entity @s Age
execute if score @s bacaphd_hatch matches -24000..-23995 run tag @s add bacaphd.newchick
tag @s add bacaphd.hatch
