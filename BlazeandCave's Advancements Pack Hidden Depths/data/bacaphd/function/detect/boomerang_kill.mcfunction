# B31 Boomerang Bones. A Skeleton just died to one of this player's arrows. That only
# counts as returning fire if a Skeleton's arrow hit the player in an EARLIER sample:
# 1..20 accepts a window that has been decremented at least once, and rejects the 21 that
# detect/boomerang_shot writes when the arrow landed in this same sample.
advancement revoke @s only bacaphd:weaponry/boomerang_bones arrow_kill
execute if score @s bacaphd_boomerang matches 1..20 run function bacaphd:detect/boomerang_grant
