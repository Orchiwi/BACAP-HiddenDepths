# Entrapment. 16 x 4 x 16 around the player, one candidate per 5 s cycle.
# attached=true is what 'armed' means for both halves of a tripwire run, and it is
# the same state BACAP's Tripping Over keys on. 32 wire + 16 hooks is eight
# complete hook-to-hook runs of at least four blocks each.
scoreboard players set @s bacaphd_tw_wire 0
scoreboard players set @s bacaphd_tw_hook 0
scoreboard players set @s bacaphd_sx 0
execute positioned ~-8 ~-1 ~-8 run function bacaphd:detect/tw_x
execute if score @s bacaphd_tw_wire matches 32.. if score @s bacaphd_tw_hook matches 16.. run advancement grant @s only bacaphd:redstone/entrapment
