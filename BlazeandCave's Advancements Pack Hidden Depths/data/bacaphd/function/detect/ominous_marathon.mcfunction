# B13 Ominous Marathon. Runs as, and positioned at, a player whose
# minecraft.used:minecraft.ominous_trial_key statistic rose THIS TICK, i.e. who has
# just unlocked an Ominous Vault. Because the credit is taken one tick after the key
# is spent rather than up to five seconds later, the player cannot have moved off the
# vault, so this position IS the chamber. Credit it only if it is at least 256 blocks
# away, on X or on Z, from EVERY chamber already credited.
execute store result score @s bacaphd_px run data get entity @s Pos[0]
execute store result score @s bacaphd_pz run data get entity @s Pos[2]
scoreboard players set @s bacaphd_ok 1
execute if score @s bacaphd_omc matches 1.. run function bacaphd:detect/ominous_far1
execute if score @s bacaphd_omc matches 2.. run function bacaphd:detect/ominous_far2
execute if score @s bacaphd_omc matches 3.. run function bacaphd:detect/ominous_far3
execute if score @s bacaphd_omc matches 4.. run function bacaphd:detect/ominous_far4
execute if score @s bacaphd_ok matches 1 run function bacaphd:detect/ominous_record
