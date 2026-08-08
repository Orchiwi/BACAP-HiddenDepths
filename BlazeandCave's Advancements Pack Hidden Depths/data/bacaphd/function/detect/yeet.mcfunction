# Yeet. Runs as/at the player, per tick, only while a hit window is open.
# bacaphd_yeet_x / _z hold the player's block position at the moment of the hit,
# and the mob that was struck carries the bacaphd.yeet tag.
#
# The measurement is gated on the tagged mob still existing. `execute store result`
# does NOT leave the score untouched when the inner command fails - Brigadier calls
# the result callback with (false, 0) and the store writes that 0 unconditionally.
# Reading a missing mob as Pos 0,0 made the delta the player's own distance from the
# world origin, so any hit landed more than 100 blocks from spawn granted this the
# moment the mob died, despawned or was never in range to be tagged at all.
scoreboard players remove @s bacaphd_yeet_t 1
scoreboard players set @s bacaphd_yeet_m 0
execute if entity @e[tag=bacaphd.yeet,distance=..400,limit=1] run scoreboard players set @s bacaphd_yeet_m 1
execute if score @s bacaphd_yeet_m matches 1 store result score @s bacaphd_dx run data get entity @e[tag=bacaphd.yeet,distance=..400,limit=1,sort=furthest] Pos[0]
execute if score @s bacaphd_yeet_m matches 1 store result score @s bacaphd_dz run data get entity @e[tag=bacaphd.yeet,distance=..400,limit=1,sort=furthest] Pos[2]
execute if score @s bacaphd_yeet_m matches 1 run scoreboard players operation @s bacaphd_dx -= @s bacaphd_yeet_x
execute if score @s bacaphd_yeet_m matches 1 run scoreboard players operation @s bacaphd_dz -= @s bacaphd_yeet_z
execute if score @s bacaphd_yeet_m matches 1 run function bacaphd:detect/step
execute if score @s bacaphd_yeet_m matches 1 if score @s bacaphd_hi matches 100.. run advancement grant @s only bacaphd:weaponry/yeet
# Window closed: drop the tag again so the next hit starts from a clean slate.
execute if score @s bacaphd_yeet_t matches ..0 run tag @e[tag=bacaphd.yeet,distance=..400] remove bacaphd.yeet
