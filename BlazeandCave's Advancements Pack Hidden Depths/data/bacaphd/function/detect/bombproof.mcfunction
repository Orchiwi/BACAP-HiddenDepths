# Bombproof. Runs once per tick as a player whose blast criterion is set and whose
# impossible guard is not, positioned at that player by the bucket line's `at @s`.
# The criterion has already proved the creeper, the unblocked explosion and the survival.
# All this has to settle is whether a rolled-up Armadillo was standing next to them for it.
# Revoke FIRST. A second creeper on the very next tick has to find the doorbell un-pressed;
# crediting first and revoking after would silently drop back-to-back blasts.
advancement revoke @s only bacaphd:animal/bombproof blast
# `state` is the Armadillo's saved NBT string. This is not a guess: Enhanced Discoveries'
# Scared Box matches nbt "{state: \"scared\"}" on a looked-at armadillo, so the field name,
# the type and the lower-case value are all verified against a shipping pack.
# "rolling" is the wind-up frame of the same animation and counts too - a creeper that goes
# off while the armadillo is still curling up is exactly the moment this is about.
# The scan is bounded three ways: type, distance and limit. Never an open @e.
execute if entity @e[type=minecraft:armadillo,distance=..5,limit=1,nbt={state:"scared"}] run advancement grant @s only bacaphd:animal/bombproof
execute if entity @e[type=minecraft:armadillo,distance=..5,limit=1,nbt={state:"rolling"}] run advancement grant @s only bacaphd:animal/bombproof
