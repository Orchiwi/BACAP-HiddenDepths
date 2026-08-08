# Arms ONCE per run. This used to re-baseline the damage mirror on every pass, so a
# second Trial Spawner still sitting in waiting_for_players anywhere in the 7x3x7 probe
# re-forgave every point of damage each tick and the player could be beaten to one heart
# and still be paid when the first spawner ejected. -1 means "damaged during this run"
# and blocks re-arming; bucket_slow lifts that lock once the run is over.
execute if score @s bacaphd_sc_ok matches 0 run scoreboard players operation @s bacaphd_sc_dmg = @s bacaphd_dmg
execute if score @s bacaphd_sc_ok matches 0 run scoreboard players set @s bacaphd_sc_ok 1
