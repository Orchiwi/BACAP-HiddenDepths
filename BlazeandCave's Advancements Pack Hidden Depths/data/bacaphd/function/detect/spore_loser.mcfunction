# Spore Loser. Reached only on the tick after a Spore Blossom is placed, because
# the bucket line selects on the `placed` criterion being complete while the
# impossible guard is not. 9 x 6 x 9 around the player.
scoreboard players set @s bacaphd_spore 0
scoreboard players set @s bacaphd_sx 0
execute positioned ~-4 ~-1 ~-4 run function bacaphd:detect/sl_x
execute if score @s bacaphd_spore matches 5.. run advancement grant @s only bacaphd:building/spore_loser
# Short of five: revoke, which clears `placed` and re-arms the criterion for the
# next blossom. Without this the selector would stay true and the scan would run
# every tick forever for anyone who placed one blossom and stopped.
execute unless score @s bacaphd_spore matches 5.. run advancement revoke @s only bacaphd:building/spore_loser
