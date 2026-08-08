# Run as/at a Sniffer-dropped seed the first time it is ever seen. bacaphd.ds is added
# FIRST, so the substrate under the item is read exactly once and the item can never be
# re-read after it - or the Sniffer - has moved. A seed that lands on something the
# Sniffer cannot dig picks up no substrate tag at all and is simply spent.
tag @s add bacaphd.ds
execute if block ~ ~-1 ~ minecraft:moss_block run tag @s add bacaphd.ds_moss
execute if block ~ ~-1 ~ minecraft:mud run tag @s add bacaphd.ds_mud
execute if block ~ ~-1 ~ minecraft:rooted_dirt run tag @s add bacaphd.ds_root
