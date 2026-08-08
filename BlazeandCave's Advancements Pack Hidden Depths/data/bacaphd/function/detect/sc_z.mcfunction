# The three y offsets are unrolled here rather than given their own loop, so the
# whole probe costs three function files instead of four.
# Arming is only possible while the spawner is still counting the player in, before
# the wave exists. Once it is active it can no longer be armed, so a player who is
# hit halfway through a wave cannot wash that away by re-arming on the same spawner.
execute if block ~ ~-1 ~ minecraft:trial_spawner[trial_spawner_state=waiting_for_players] run function bacaphd:detect/sc_arm
execute if block ~ ~ ~ minecraft:trial_spawner[trial_spawner_state=waiting_for_players] run function bacaphd:detect/sc_arm
execute if block ~ ~1 ~ minecraft:trial_spawner[trial_spawner_state=waiting_for_players] run function bacaphd:detect/sc_arm
execute if score @s bacaphd_sc_ok matches 1 if block ~ ~-1 ~ minecraft:trial_spawner[trial_spawner_state=ejecting_reward] run advancement grant @s only bacaphd:adventure/spawner_camper
execute if score @s bacaphd_sc_ok matches 1 if block ~ ~ ~ minecraft:trial_spawner[trial_spawner_state=ejecting_reward] run advancement grant @s only bacaphd:adventure/spawner_camper
execute if score @s bacaphd_sc_ok matches 1 if block ~ ~1 ~ minecraft:trial_spawner[trial_spawner_state=ejecting_reward] run advancement grant @s only bacaphd:adventure/spawner_camper
scoreboard players add @s bacaphd_s2z 1
execute if score @s bacaphd_s2z matches ..6 positioned ~ ~ ~1 run function bacaphd:detect/sc_z
