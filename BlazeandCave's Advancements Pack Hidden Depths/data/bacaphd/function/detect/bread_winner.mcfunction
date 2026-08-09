# Run as/at a player who does not hold Bread Winner and has at least one Villager
# within 48 blocks. Villager breeding is not an Animal breed, so minecraft:bred_animals
# never fires for it and there is no criterion that can see a village grow.
#
# A tag alone cannot tell a birth from a cub that was already standing there, and both
# a lived-in village and a freshly generated one come with babies of their own. So the
# per-villager pass below reads Age as well: only a Villager whose first sighting finds
# it inside one sample of its own birth is banked. Walking into a ready-made village is
# worth nothing, which is the whole point of the advancement.
scoreboard players set #bwnew bacaphd_sys 0
execute at @s as @e[type=minecraft:villager,distance=..48,predicate=blazeandcave:is_baby,tag=!bacaphd.bw] run function bacaphd:detect/bread_winner_mark
scoreboard players operation @s bacaphd_bw += #bwnew bacaphd_sys
# Eighteen births on top of the founding pair, AND the village has to actually be that
# size at this moment. Counted on a scoreboard: `if entity @e[...,limit=20]` would only
# ever test that at least one Villager exists.
scoreboard players set #bwpop bacaphd_sys 0
execute if score @s bacaphd_bw matches 18.. at @s as @e[type=minecraft:villager,distance=..48] run scoreboard players add #bwpop bacaphd_sys 1
execute if score @s bacaphd_bw matches 18.. if score #bwpop bacaphd_sys matches 20.. run advancement grant @s only bacaphd:adventure/bread_winner
