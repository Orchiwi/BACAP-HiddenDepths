# B37 Sniffer Sommelier. Reached only when a Sniffer is within sixteen blocks of the
# player - a type-filtered lookup with no NBT, cheap enough for every medium tick and
# rare enough that the item scans below almost never run.
# This watches the DIG, not the pickup. Watching the pickup statistic was the round-2
# design and it could be beaten by dropping two hoarded seeds at the Sniffer's feet and
# picking them straight back up. A Torchflower Seed or Pitcher Pod has no vanilla source
# other than a Sniffer dig, and an item a player drops or throws carries that player's
# UUID in Thrower for the rest of its life - so a seed lying within five blocks of a
# Sniffer with NO Thrower tag was dug up, not put there.
# Each `if entity` runs before its `unless data entity`, so a missing item can never be
# read as a missing Thrower; both selectors are limit=1 nearest and resolve to the same
# entity in the same tick. A player-dropped seed lying nearer than a dug one only ever
# costs a credit, never grants one.
execute at @e[type=minecraft:sniffer,distance=..16,limit=1] if entity @e[type=minecraft:item,distance=..5,nbt={Item:{id:"minecraft:torchflower_seeds"}},limit=1] unless data entity @e[type=minecraft:item,distance=..5,nbt={Item:{id:"minecraft:torchflower_seeds"}},limit=1] Thrower run scoreboard players operation @s bacaphd_torch_day = #today bacaphd_day
execute at @e[type=minecraft:sniffer,distance=..16,limit=1] if entity @e[type=minecraft:item,distance=..5,nbt={Item:{id:"minecraft:pitcher_pod"}},limit=1] unless data entity @e[type=minecraft:item,distance=..5,nbt={Item:{id:"minecraft:pitcher_pod"}},limit=1] Thrower run scoreboard players operation @s bacaphd_pitcher_day = #today bacaphd_day
execute if score @s bacaphd_init matches 1 if score @s bacaphd_torch_day = @s bacaphd_pitcher_day run advancement grant @s only bacaphd:farming/sniffer_sommelier
