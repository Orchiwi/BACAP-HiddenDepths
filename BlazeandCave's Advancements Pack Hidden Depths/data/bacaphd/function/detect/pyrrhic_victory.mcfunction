# B30 Pyrrhic Victory. Reached the tick a Wither kill is credited to this player.
# The player counts as caught in the same blast if they are already dead (health 0).
# bacaphd_wither_seen_pv belongs to this advancement alone, so no other Wither check can
# consume the delta before this one sees it, or have its delta consumed by this one.
execute if score @s bacaphd_init matches 1 if score @s bacaphd_health matches 0 run advancement grant @s only bacaphd:monsters/pyrrhic_victory
scoreboard players operation @s bacaphd_wither_seen_pv = @s bacaphd_wither_kills
