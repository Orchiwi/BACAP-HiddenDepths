# B5 The Big Picture. Armed by the advancement's own `hung` criterion, an
# item_used_on_block with a match_tool on minecraft:painting, held behind an
# impossible guard so it cannot complete the advancement on its own.
# The revoke stays first for the same reason as Zoom and Enhance: the grant below
# awards every criterion and a later revoke would undo it. If the painting that
# went up was not a 4x4 one, `hung` is simply gone again and the player hangs
# another.
# Reading the painting entity's variant out of NBT is BACAP's own Art Gallery
# check, command for command. pigscene, pointer, burning_skull, orb and unpacked
# are the 4x4 variants; every other placeable painting is smaller.
advancement revoke @s only bacaphd:building/the_big_picture hung
execute if entity @e[type=minecraft:painting,distance=..8,nbt={variant:"minecraft:pigscene"},limit=1] run advancement grant @s only bacaphd:building/the_big_picture
execute if entity @e[type=minecraft:painting,distance=..8,nbt={variant:"minecraft:pointer"},limit=1] run advancement grant @s only bacaphd:building/the_big_picture
execute if entity @e[type=minecraft:painting,distance=..8,nbt={variant:"minecraft:burning_skull"},limit=1] run advancement grant @s only bacaphd:building/the_big_picture
execute if entity @e[type=minecraft:painting,distance=..8,nbt={variant:"minecraft:orb"},limit=1] run advancement grant @s only bacaphd:building/the_big_picture
execute if entity @e[type=minecraft:painting,distance=..8,nbt={variant:"minecraft:unpacked"},limit=1] run advancement grant @s only bacaphd:building/the_big_picture
