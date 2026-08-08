# Layer Cake. There is no item sub-predicate that counts banner layers, but
# `data get` on a LIST returns its length, so this reads the layer count of the
# held banner directly. The `if data` guard is load-bearing: `data get` on a
# missing path is a command failure and this runs twice a second for every
# ungranted player. No item-type test is needed - only a banner can carry six
# layers, a Shield tops out at one.
scoreboard players set @s bacaphd_lc 0
execute if data entity @s SelectedItem.components."minecraft:banner_patterns" store result score @s bacaphd_lc run data get entity @s SelectedItem.components."minecraft:banner_patterns"
execute if score @s bacaphd_lc matches 6.. run advancement grant @s only bacaphd:building/layer_cake
