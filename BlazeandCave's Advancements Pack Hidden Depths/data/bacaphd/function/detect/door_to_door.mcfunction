# Run as/at a player who does not hold Door to Door and has a door-breaking Zombie
# within 24 blocks.
#
# There is no `execute if difficulty`, so Hard is enforced by the Zombie's own
# CanBreakDoors NBT byte — vanilla only sets it on Hard, and it is the exact flag that
# permits the behaviour being watched for.
#
# 1. A tracked door that has gone, with its breaker still standing in the gap.
execute at @s as @e[type=minecraft:marker,tag=bacaphd.dd,distance=..24] at @s unless block ~ ~ ~ #minecraft:wooden_doors if entity @e[type=minecraft:zombie,distance=..3,nbt={CanBreakDoors:1b},limit=1] run tag @s add bacaphd.dd_done
execute at @s if entity @e[type=minecraft:marker,tag=bacaphd.dd_done,distance=..24] run advancement grant @s only bacaphd:monsters/door_to_door
execute at @s as @e[type=minecraft:marker,tag=bacaphd.dd_done,distance=..24] run kill @s
# 2. Mark the wooden door each breaker is stood against. `align xyz` then a half-block
# offset puts the test — and the marker — dead centre of the candidate block, and the
# `unless entity` guard keeps it to one marker per door.
execute at @s as @e[type=minecraft:zombie,distance=..24,nbt={CanBreakDoors:1b}] at @s align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~1 ~ ~ if block ~ ~ ~ #minecraft:wooden_doors unless entity @e[type=minecraft:marker,tag=bacaphd.dd,distance=..0.9] run summon minecraft:marker ~ ~ ~ {Tags:["bacaphd.dd"]}
execute at @s as @e[type=minecraft:zombie,distance=..24,nbt={CanBreakDoors:1b}] at @s align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~-1 ~ ~ if block ~ ~ ~ #minecraft:wooden_doors unless entity @e[type=minecraft:marker,tag=bacaphd.dd,distance=..0.9] run summon minecraft:marker ~ ~ ~ {Tags:["bacaphd.dd"]}
execute at @s as @e[type=minecraft:zombie,distance=..24,nbt={CanBreakDoors:1b}] at @s align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~ ~ ~1 if block ~ ~ ~ #minecraft:wooden_doors unless entity @e[type=minecraft:marker,tag=bacaphd.dd,distance=..0.9] run summon minecraft:marker ~ ~ ~ {Tags:["bacaphd.dd"]}
execute at @s as @e[type=minecraft:zombie,distance=..24,nbt={CanBreakDoors:1b}] at @s align xyz positioned ~0.5 ~0.5 ~0.5 positioned ~ ~ ~-1 if block ~ ~ ~ #minecraft:wooden_doors unless entity @e[type=minecraft:marker,tag=bacaphd.dd,distance=..0.9] run summon minecraft:marker ~ ~ ~ {Tags:["bacaphd.dd"]}
