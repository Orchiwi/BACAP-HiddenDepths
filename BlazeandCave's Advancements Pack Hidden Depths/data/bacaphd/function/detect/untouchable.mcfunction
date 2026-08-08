# The Ender Dragon kill count just moved. Refresh this advancement's own mirror first.
scoreboard players operation @s bacaphd_dragon_seen = @s bacaphd_dragon_kills
execute if score @s bacaphd_untouched matches 1 if entity @s[gamemode=!spectator,gamemode=!creative] run advancement grant @s only bacaphd:challenges/untouchable
# The fight is over either way. Release the latch so a crystal-respawned dragon is a
# genuinely fresh chance, and drop the armed flag so the next run must arm again.
scoreboard players set @s bacaphd_untouched 0
