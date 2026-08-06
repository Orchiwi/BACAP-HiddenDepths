# An Ender Pearl was just thrown (used-statistic delta). The mirror is refreshed first and
# unconditionally, so a spell in creative or spectator cannot bank a delta for later.
scoreboard players operation @s bacaphd_pearl_seen = @s bacaphd_pearls
execute if entity @s[gamemode=!spectator,gamemode=!creative] run function bacaphd:detect/pearl_air
