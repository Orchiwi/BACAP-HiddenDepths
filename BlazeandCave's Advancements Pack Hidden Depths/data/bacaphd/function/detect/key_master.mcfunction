# B14 Key Master. `clear <player> <item> 0` counts every matching item across the
# whole inventory without removing any, so two half stacks read the same as one full
# stack — which an inventory_changed count predicate cannot do.
# bacaphd_okeys is zeroed first so a stale value can never grant on its own.
scoreboard players set @s bacaphd_okeys 0
execute store result score @s bacaphd_tkeys run clear @s minecraft:trial_key 0
execute if score @s bacaphd_tkeys matches 16.. store result score @s bacaphd_okeys run clear @s minecraft:ominous_trial_key 0
execute if score @s bacaphd_okeys matches 16.. run advancement grant @s only bacaphd:adventure/key_master
