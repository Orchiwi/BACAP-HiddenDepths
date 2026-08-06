# B31 Boomerang Bones. A Skeleton's arrow just landed on this player. Re-arm the
# criterion and open the return-fire window.
# The window starts at 21, not 20, on purpose. bucket_medium evaluates this line before
# the arrow_kill line and the decrement line after both, so a kill that happened in the
# same 0.5 s sample sees 21 and is rejected by detect/boomerang_kill's `matches 1..20`.
# The decrement brings it to 20 at the end of this same sample, so the player still gets
# a full twenty medium ticks - ten seconds - to shoot back.
advancement revoke @s only bacaphd:weaponry/boomerang_bones shot_by_skeleton
scoreboard players set @s bacaphd_boomerang 21
