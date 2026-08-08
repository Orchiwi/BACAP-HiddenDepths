# Hunting Party - a Hoglin brought down by a Piglin pack.
# DeathTime reads 1 for exactly one tick, which is why this lives in bucket_fast.
# DeathTime is a short: the literal must be 1s, an int would silently never match.
# `on attacker` resolves to the entity that last damaged the Hoglin, so it proves the
# Piglins made the kill AND rules out the player claiming their own - no kill-statistic
# mirror is involved anywhere, and therefore no seeding hazard.
# The player carries a tag for two lines only, so the grant can find its way back out
# of the Hoglin's execution context.
execute store result score #hp_pigs bacaphd_hp if entity @e[type=minecraft:piglin,distance=..16,limit=3]
tag @s add bacaphd.hp_here
execute if score #hp_pigs bacaphd_hp matches 3 as @e[type=minecraft:hoglin,distance=..16,limit=1,nbt={DeathTime:1s}] on attacker if entity @s[type=minecraft:piglin] run advancement grant @a[tag=bacaphd.hp_here,limit=1] only bacaphd:nether/hunting_party
tag @s remove bacaphd.hp_here
