# Run as the player, at the player, only inside the post-sleep window. The gift lands
# on the ground AT the cat, so the item test is anchored to the cat rather than to the
# player. `unless data ... Thrower` is BACAP's own discriminator for "this item entity
# was not thrown by a player" - the same guard detect/sniffer_watch uses - so dropping
# a rabbit's foot next to your cat cannot stand in for the gift.
execute at @e[type=minecraft:cat,distance=..8,limit=1] if entity @e[type=minecraft:item,distance=..3,limit=1,nbt={Item:{id:"minecraft:rabbit_foot"}}] unless data entity @e[type=minecraft:item,distance=..3,limit=1,nbt={Item:{id:"minecraft:rabbit_foot"}}] Thrower run advancement grant @s only bacaphd:animal/breakfast_in_bed
execute at @e[type=minecraft:cat,distance=..8,limit=1] if entity @e[type=minecraft:item,distance=..3,limit=1,nbt={Item:{id:"minecraft:rabbit_hide"}}] unless data entity @e[type=minecraft:item,distance=..3,limit=1,nbt={Item:{id:"minecraft:rabbit_hide"}}] Thrower run advancement grant @s only bacaphd:animal/breakfast_in_bed
execute at @e[type=minecraft:cat,distance=..8,limit=1] if entity @e[type=minecraft:item,distance=..3,limit=1,nbt={Item:{id:"minecraft:phantom_membrane"}}] unless data entity @e[type=minecraft:item,distance=..3,limit=1,nbt={Item:{id:"minecraft:phantom_membrane"}}] Thrower run advancement grant @s only bacaphd:animal/breakfast_in_bed
