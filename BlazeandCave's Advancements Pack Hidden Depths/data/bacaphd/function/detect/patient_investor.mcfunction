# Patient Investor. Called as (not at) a player whose Copper Block placement criterion has
# fired and who does not yet hold the advancement, so every line positions itself.
#
# The marker carries the id of the player who pinned it. It used to be anonymous and found
# only by proximity, so ANY player the bucket dispatched this for who wandered within 64
# blocks of a matured marker both ripened it and cashed it - and line 4 then killed it, so
# the player who actually pinned the block never got paid. The one-run-per-neighbourhood
# guard made that worse: on a shared base a second player could not start a run at all,
# only harvest the first player's.
scoreboard players operation #pi_cur bacaphd_pi_own = @s bacaphd_pi_own
#
# 1. Pin the block. The run starts the first time the player is stood ON a Copper Block:
#    a marker goes into that exact block and carries the world day it was pinned in its own
#    bacaphd_pi_day score. `align xyz` then a half-block offset puts the marker dead centre
#    of the block under the player's feet, the idiom detect/door_to_door already uses. One
#    watched block per 64-block neighbourhood PER PLAYER, so a copper build cannot spawn a
#    marker per block; when a run is cancelled the slot frees up again immediately.
scoreboard players set #pi_have bacaphd_pi_own 0
execute at @s as @e[type=minecraft:marker,tag=bacaphd.pi_blk,distance=..64] if score @s bacaphd_pi_own = #pi_cur bacaphd_pi_own run scoreboard players set #pi_have bacaphd_pi_own 1
execute at @s align xyz positioned ~0.5 ~-0.5 ~0.5 if block ~ ~ ~ minecraft:copper_block if score #pi_have bacaphd_pi_own matches 0 run summon minecraft:marker ~ ~ ~ {Tags:["bacaphd.pi_blk"]}
# Claim only the marker in the block underfoot, which is the one just summoned - never an
# unowned marker somewhere else in the radius.
execute at @s align xyz positioned ~0.5 ~-0.5 ~0.5 as @e[type=minecraft:marker,tag=bacaphd.pi_blk,distance=..0.1] unless score @s bacaphd_pi_own matches -2147483648.. run scoreboard players operation @s bacaphd_pi_own = #pi_cur bacaphd_pi_own
execute at @s as @e[type=minecraft:marker,tag=bacaphd.pi_blk,distance=..64] if score @s bacaphd_pi_own = #pi_cur bacaphd_pi_own unless score @s bacaphd_pi_day matches -2147483648.. run scoreboard players operation @s bacaphd_pi_day = #hd12_day bacaphd_day
# 2. Waxing, scraping or mining the pinned block ends that run. A block that is no longer
#    one of the four UNWAXED oxidation stages loses its marker - the waxed ids are four
#    different blocks, so `unless block` on all four is exactly the "never waxed" clause -
#    and the player is free to start a fresh run by standing on another Copper Block.
execute at @s as @e[type=minecraft:marker,tag=bacaphd.pi_blk,distance=..64] if score @s bacaphd_pi_own = #pi_cur bacaphd_pi_own at @s unless block ~ ~ ~ minecraft:copper_block unless block ~ ~ ~ minecraft:exposed_copper unless block ~ ~ ~ minecraft:weathered_copper unless block ~ ~ ~ minecraft:oxidized_copper run kill @s
# 3. Age the pinned block. #hd12_day is written by bucket_slow immediately above this call,
#    so it is never read unset, and thirty in-game days is longer than a full natural
#    oxidation run. The block itself has to read green at the moment it is measured.
execute at @s as @e[type=minecraft:marker,tag=bacaphd.pi_blk,distance=..64] if score @s bacaphd_pi_own = #pi_cur bacaphd_pi_own at @s if block ~ ~ ~ minecraft:oxidized_copper run scoreboard players operation @s bacaphd_pi_age = #hd12_day bacaphd_day
execute at @s as @e[type=minecraft:marker,tag=bacaphd.pi_blk,distance=..64] if score @s bacaphd_pi_own = #pi_cur bacaphd_pi_own at @s if block ~ ~ ~ minecraft:oxidized_copper run scoreboard players operation @s bacaphd_pi_age -= @s bacaphd_pi_day
execute at @s as @e[type=minecraft:marker,tag=bacaphd.pi_blk,distance=..64] if score @s bacaphd_pi_own = #pi_cur bacaphd_pi_own if score @s bacaphd_pi_age matches 30.. run tag @s add bacaphd.pi_done
# 4. Only the owner is paid, and only the owner's marker is retired, so nothing this pack
#    summons outlives its use and no passer-by can cash somebody else's thirty days.
tag @s add bacaphd.pi_me
execute at @s as @e[type=minecraft:marker,tag=bacaphd.pi_done,distance=..64] if score @s bacaphd_pi_own = #pi_cur bacaphd_pi_own run advancement grant @a[tag=bacaphd.pi_me,limit=1] only bacaphd:mining/patient_investor
execute at @s as @e[type=minecraft:marker,tag=bacaphd.pi_done,distance=..64] if score @s bacaphd_pi_own = #pi_cur bacaphd_pi_own run kill @s
tag @s remove bacaphd.pi_me
