# B5 Zoom and Enhance. The advancement's own `extend` criterion is a vanilla
# minecraft:recipe_crafted on minecraft:map_extending, and requirements is
# AND-of-groups against an impossible guard, so holding that criterion can never
# finish the advancement by itself.
# The revoke MUST stay first: the completion path below grants every criterion,
# and a revoke running after it would leave the advancement incomplete. Revoking
# also forces the game to prove a fresh craft before the next count, which is the
# revoke-to-re-prove idiom this pack already uses for Soul Speed Demon.
# The count is four extends, not four extends OF ONE MAP: nothing in recipe_crafted
# names the map that came out, and a filled map's scale lives in the level's saved map
# data, not in any item component a predicate can read. The description says "Extend Maps
# four times over" for exactly that reason - it promises what this actually measures.
advancement revoke @s only bacaphd:adventure/zoom_and_enhance extend
scoreboard players add @s bacaphd_ze 1
execute if score @s bacaphd_ze matches 4.. run advancement grant @s only bacaphd:adventure/zoom_and_enhance
execute if score @s bacaphd_ze matches 4.. run scoreboard players reset @s bacaphd_ze
