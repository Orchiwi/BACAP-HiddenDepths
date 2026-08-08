# Yeet. Runs as/at the player, per tick, only while a hit window is open.
# bacaphd_yeet_x / _z hold the player's block position at the moment of the hit,
# and the mob that was struck carries the bacaphd.yeet tag.
scoreboard players remove @s bacaphd_yeet_t 1
# Seed the delta with the anchor itself first. If the tagged mob has despawned or
# unloaded, the `data get` below fails and leaves the score untouched - which then
# reads as a displacement of exactly zero instead of a stale value from an earlier
# window granting the advancement for nothing.
scoreboard players operation @s bacaphd_dx = @s bacaphd_yeet_x
scoreboard players operation @s bacaphd_dz = @s bacaphd_yeet_z
execute store result score @s bacaphd_dx run data get entity @e[tag=bacaphd.yeet,distance=..400,limit=1,sort=furthest] Pos[0]
execute store result score @s bacaphd_dz run data get entity @e[tag=bacaphd.yeet,distance=..400,limit=1,sort=furthest] Pos[2]
scoreboard players operation @s bacaphd_dx -= @s bacaphd_yeet_x
scoreboard players operation @s bacaphd_dz -= @s bacaphd_yeet_z
function bacaphd:detect/step
execute if score @s bacaphd_hi matches 100.. run advancement grant @s only bacaphd:weaponry/yeet
# Window closed: drop the tag again so the next hit starts from a clean slate.
execute if score @s bacaphd_yeet_t matches ..0 run tag @e[tag=bacaphd.yeet,distance=..400] remove bacaphd.yeet
