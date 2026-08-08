# Two "what is that mob holding?" detections share this one file because they are the
# same shape: flag the mob's state on one sample, grant on the sample where it flips.
# Run as, and positioned at, a player who is still missing at least one of the two;
# each half re-checks the specific advancement so a player who already has one of them
# cannot be granted it twice or have the other's work done for them.
# The tags are cleared in bucket_medium AFTER every player's call, so on a shared world
# one player's sweep cannot wipe the evidence before another player's sweep reads it.

# --- Landscape Gardener: an Enderman that was carrying a block no longer is.
# carriedBlockState is only written to an Enderman's NBT while it is actually carrying
# something - the same field BACAP's monsters/basketblock_championship keys off - so
# `unless data` is the empty-handed test. The tag is only ever applied inside the
# player's 24-block radius, so the player was there for the carrying half too.
execute if entity @s[advancements={bacaphd:monsters/landscape_gardener=false}] as @e[type=minecraft:enderman,distance=..24,tag=bacaphd.lg_carry] unless data entity @s carriedBlockState run tag @s add bacaphd.lg_placed
execute if entity @s[advancements={bacaphd:monsters/landscape_gardener=false}] if entity @e[type=minecraft:enderman,distance=..24,tag=bacaphd.lg_placed] run advancement grant @s only bacaphd:monsters/landscape_gardener
execute if entity @s[advancements={bacaphd:monsters/landscape_gardener=false}] as @e[type=minecraft:enderman,distance=..24] if data entity @s carriedBlockState run tag @s add bacaphd.lg_carry

# --- Reverse Logistics: a Copper Golem that had empty hands now holds something.
# A golem's hand only ever fills from a Copper Chest, so the empty-to-full flip IS the
# withdrawal. Both weapon.mainhand and container.0 are tested for the same reason
# detect/golem_courier tests both: no installed pack attests which slot a Copper Golem
# uses, and an entity without a given slot simply fails that test instead of erroring.
execute if entity @s[advancements={bacaphd:mining/reverse_logistics=false}] as @e[type=minecraft:copper_golem,distance=..24,tag=bacaphd.rl_empty] if items entity @s weapon.mainhand * run tag @s add bacaphd.rl_took
execute if entity @s[advancements={bacaphd:mining/reverse_logistics=false}] as @e[type=minecraft:copper_golem,distance=..24,tag=bacaphd.rl_empty] if items entity @s container.0 * run tag @s add bacaphd.rl_took
execute if entity @s[advancements={bacaphd:mining/reverse_logistics=false}] if entity @e[type=minecraft:copper_golem,distance=..24,tag=bacaphd.rl_took] run advancement grant @s only bacaphd:mining/reverse_logistics
execute if entity @s[advancements={bacaphd:mining/reverse_logistics=false}] as @e[type=minecraft:copper_golem,distance=..24] unless items entity @s weapon.mainhand * unless items entity @s container.0 * run tag @s add bacaphd.rl_empty
