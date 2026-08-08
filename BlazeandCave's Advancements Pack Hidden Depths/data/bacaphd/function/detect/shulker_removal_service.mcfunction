# Shulker Removal Service. Runs every 100 ticks as, and at, a player in the End who
# has not got this yet.
# The count is taken with `store result ... if entity`, never `if entity @e[limit=N]`,
# which would only test for one.
# Arming needs five live Shulkers within 64 blocks - that is a populated End City, not
# a stray one - and records the player's Shulker kill total at that instant, so only
# kills made after arriving can ever count towards it.
# The last test is the important one: the kill total must have RISEN since the previous
# sample. Without it, a player who simply flies away from a half-cleared city sees the
# surrounding count fall to zero as the chunks unload and would be handed the grant.
# bacaphd_shulk_last is seeded in bacaphd:seed, and an unset score fails `if score`
# outright, so neither the mirror nor the base can ever read a lifetime total as a kill.
scoreboard players add @s bacaphd_shulk_kills 0
execute store result score @s bacaphd_shulk_n if entity @e[type=minecraft:shulker,distance=..64]
execute if score @s bacaphd_shulk_n matches 5.. unless score @s bacaphd_shulk_arm matches 1 run scoreboard players operation @s bacaphd_shulk_base = @s bacaphd_shulk_kills
execute if score @s bacaphd_shulk_n matches 5.. run scoreboard players set @s bacaphd_shulk_arm 1
scoreboard players operation @s bacaphd_shulk_prog = @s bacaphd_shulk_kills
scoreboard players operation @s bacaphd_shulk_prog -= @s bacaphd_shulk_base
execute if score @s bacaphd_shulk_arm matches 1 if score @s bacaphd_shulk_n matches 0 if score @s bacaphd_shulk_prog matches 5.. if score @s bacaphd_shulk_kills > @s bacaphd_shulk_last run advancement grant @s only bacaphd:end/shulker_removal_service
scoreboard players operation @s bacaphd_shulk_last = @s bacaphd_shulk_kills
execute if score @s bacaphd_shulk_n matches 0 run scoreboard players set @s bacaphd_shulk_arm 0
