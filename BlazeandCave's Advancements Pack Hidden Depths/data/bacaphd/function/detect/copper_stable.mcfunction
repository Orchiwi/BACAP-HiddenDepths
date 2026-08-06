# B9 Copper Stable. Runs as a player currently riding a horse wearing Copper Horse
# Armor. Clearing bacaphd.cs_off tells the bucket this ride is still going. The
# anchor is taken on the first sample of the ride and dropped again by
# detect/copper_stable_off the moment the ride stops, so the delta is distance
# ridden on THIS horse, not lifetime horse distance.
tag @s remove bacaphd.cs_off
execute unless entity @s[tag=bacaphd.cstable] run scoreboard players operation @s bacaphd_hbase = @s bacaphd_hcm
tag @s add bacaphd.cstable
scoreboard players operation @s bacaphd_hdiff = @s bacaphd_hcm
scoreboard players operation @s bacaphd_hdiff -= @s bacaphd_hbase
execute if score @s bacaphd_hdiff matches 100000.. run advancement grant @s only bacaphd:animal/copper_stable
