# The Ender Dragon kill count just moved. Refresh this advancement's own mirror first.
scoreboard players operation @s bacaphd_dragon_seen = @s bacaphd_dragon_kills
execute if score @s bacaphd_untouched matches 1 if entity @s[gamemode=!spectator,gamemode=!creative] run advancement grant @s only bacaphd:challenges/untouchable
