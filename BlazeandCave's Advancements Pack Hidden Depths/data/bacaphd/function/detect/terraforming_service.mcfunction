# Terraforming Service. Count the Endermen in range that are actually CARRYING a block.
# `execute store result ... if entity` is used rather than `if entity @e[limit=3]`, which
# would only test for at least one match. The NBT key was renamed from carriedBlockState
# to carried_block_state, so both spellings are counted and added: an Enderman can only
# ever hold one of the two, so nothing is double counted and the check works whichever
# name this server's version writes. An empty compound partial-matches any block state,
# so this asks only that the key is present at all.
execute store result score @s bacaphd_ender if entity @e[type=minecraft:enderman,distance=..8,nbt={carried_block_state:{}},limit=3]
execute store result score @s bacaphd_ender2 if entity @e[type=minecraft:enderman,distance=..8,nbt={carriedBlockState:{}},limit=3]
scoreboard players operation @s bacaphd_ender += @s bacaphd_ender2
execute if score @s bacaphd_ender matches 3.. run advancement grant @s only bacaphd:monsters/terraforming_service
