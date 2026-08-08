# The damage mirror is written on the same pass that raises the flag, and the
# comparison in bucket_fast is gated on the flag, so bacaphd_sc_dmg can never be
# read while unset - which is how a lifetime damage total would otherwise be
# mistaken for one hit. bacaphd:seed initialises both anyway, ahead of every
# detector, so the invariant does not depend on this function running first.
scoreboard players set @s bacaphd_sc_ok 1
scoreboard players operation @s bacaphd_sc_dmg = @s bacaphd_dmg
