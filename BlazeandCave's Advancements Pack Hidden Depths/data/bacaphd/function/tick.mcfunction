scoreboard players add #hb_tick bacaphd_sys 1
function bacaphd:seed
# Dispatch buckets. Every check inside them is gated on players who do not yet
# hold the advancement, and multiplayer checks exit early when too few are online.
scoreboard players add $t10 bacaphd_sys 1
scoreboard players add $t100 bacaphd_sys 1
function bacaphd:bucket_fast
execute if score $t10 bacaphd_sys matches 10.. run function bacaphd:bucket_medium
execute if score $t10 bacaphd_sys matches 10.. run scoreboard players set $t10 bacaphd_sys 0
execute if score $t100 bacaphd_sys matches 100.. run function bacaphd:bucket_slow
execute if score $t100 bacaphd_sys matches 100.. run scoreboard players set $t100 bacaphd_sys 0
