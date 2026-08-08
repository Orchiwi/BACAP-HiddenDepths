# totalKillCount unchanged since the last sweep: five more seconds of peace.
execute if score @s bacaphd_kills = @s bacaphd_kills_seen run scoreboard players add @s bacaphd_pac_ticks 100
execute if score @s bacaphd_kills matches 0.. if score @s bacaphd_kills_seen matches 0.. unless score @s bacaphd_kills = @s bacaphd_kills_seen run scoreboard players set @s bacaphd_pac_ticks 0
scoreboard players operation @s bacaphd_kills_seen = @s bacaphd_kills
execute if score @s bacaphd_pac_ticks matches 120000.. run function bacaphd:detect/pacifist_done
