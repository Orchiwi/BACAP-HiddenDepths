# S8 Assembly Line. Runs as an ungranted non-spectator, at that player, every five seconds.
#
# The anchor is the block the player is STANDING ON, which must be the first Crafter; from
# there the chain runs Crafter, Hopper, Crafter, Hopper, ... for five Crafters and four
# Hoppers in one straight horizontal line. Four fixed chained executes, one per horizontal
# direction - no region scan, no recursion, nine `if block` tests each. The pattern is
# palindromic, so standing on either end of the line works.
#
# `if items block ~2 ~ ~ container.* *` on the second Crafter is the liveness test: it only
# passes once material has actually travelled through the first Hopper into the next
# machine, so a decorative row of blocks does not count. Because the scan repeats every
# five seconds, a working chain that is momentarily empty between crafts still passes on a
# later sample.
#
# Stated plainly: block FACING is not verified. A Crafter's orientation is a compound
# blockstate and a strict facing test would reject perfectly good builds, so the check is
# geometry plus proven contents rather than a proof of redstone direction.
execute positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:crafter if block ~1 ~ ~ minecraft:hopper if block ~2 ~ ~ minecraft:crafter if block ~3 ~ ~ minecraft:hopper if block ~4 ~ ~ minecraft:crafter if block ~5 ~ ~ minecraft:hopper if block ~6 ~ ~ minecraft:crafter if block ~7 ~ ~ minecraft:hopper if block ~8 ~ ~ minecraft:crafter if items block ~2 ~ ~ container.* * run advancement grant @s only bacaphd:redstone/assembly_line
execute positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:crafter if block ~-1 ~ ~ minecraft:hopper if block ~-2 ~ ~ minecraft:crafter if block ~-3 ~ ~ minecraft:hopper if block ~-4 ~ ~ minecraft:crafter if block ~-5 ~ ~ minecraft:hopper if block ~-6 ~ ~ minecraft:crafter if block ~-7 ~ ~ minecraft:hopper if block ~-8 ~ ~ minecraft:crafter if items block ~-2 ~ ~ container.* * run advancement grant @s only bacaphd:redstone/assembly_line
execute positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:crafter if block ~ ~ ~1 minecraft:hopper if block ~ ~ ~2 minecraft:crafter if block ~ ~ ~3 minecraft:hopper if block ~ ~ ~4 minecraft:crafter if block ~ ~ ~5 minecraft:hopper if block ~ ~ ~6 minecraft:crafter if block ~ ~ ~7 minecraft:hopper if block ~ ~ ~8 minecraft:crafter if items block ~ ~ ~2 container.* * run advancement grant @s only bacaphd:redstone/assembly_line
execute positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:crafter if block ~ ~ ~-1 minecraft:hopper if block ~ ~ ~-2 minecraft:crafter if block ~ ~ ~-3 minecraft:hopper if block ~ ~ ~-4 minecraft:crafter if block ~ ~ ~-5 minecraft:hopper if block ~ ~ ~-6 minecraft:crafter if block ~ ~ ~-7 minecraft:hopper if block ~ ~ ~-8 minecraft:crafter if items block ~ ~ ~-2 container.* * run advancement grant @s only bacaphd:redstone/assembly_line
