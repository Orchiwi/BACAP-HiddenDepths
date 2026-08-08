# B5 Wide Awake. Called once every hundred ticks, only inside the night band, only
# for players who do not hold it yet - the same shape as this pack's Cold Blooded.
# Breaking a Creaking Heart CLEARS the accumulator rather than pausing it: the
# promise is a whole night with none broken, so a night split around one smashed
# heart must not add up. bacaphd_wa_hb is this advancement's private mirror of
# minecraft.mined:minecraft.creaking_heart and is seeded in seed.mcfunction, before
# any sample can read it - an unset mirror would read a whole save's mined hearts
# as one fresh break.
scoreboard players set #b5_awake bacaphd_tmp 0
execute if biome ~ ~ ~ minecraft:pale_garden run scoreboard players set #b5_awake bacaphd_tmp 1
execute if score @s bacaphd_wa_heart > @s bacaphd_wa_hb run scoreboard players set #b5_awake bacaphd_tmp 0
scoreboard players operation @s bacaphd_wa_hb = @s bacaphd_wa_heart
execute if score #b5_awake bacaphd_tmp matches 0 run scoreboard players set @s bacaphd_wa 0
execute if score #b5_awake bacaphd_tmp matches 1 run scoreboard players add @s bacaphd_wa 100
execute if score @s bacaphd_wa matches 8000.. run advancement grant @s only bacaphd:biomes/wide_awake
execute if score @s bacaphd_wa matches 8000.. run scoreboard players reset @s bacaphd_wa
