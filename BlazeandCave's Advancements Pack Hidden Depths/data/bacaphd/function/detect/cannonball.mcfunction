# Runs on the tick AFTER the fall_after_explosion criterion completed. #minecraft:tick
# functions run at the top of tickChildren, before the levels tick, so by now the health
# objective has been rewritten with the health the player was left with once the landing
# damage had been applied. Inside the criterion the same score still held the PRE-landing
# value (the trigger fires from checkFallDamage, before the damage is dealt), which is why
# the survival test cannot live there.
execute if score @s bacaphd_health matches 1.. run advancement grant @s only bacaphd:redstone/cannonball
# Died on impact: revoke, which re-arms the criterion for the next attempt.
execute unless score @s bacaphd_health matches 1.. run advancement revoke @s only bacaphd:redstone/cannonball
