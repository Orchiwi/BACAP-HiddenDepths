# Resync first, then open the window. The resync is deliberately ungated by
# advancement state so the mirror can never drift, and it happens exactly once per
# sleep. 40 medium ticks is 400 game ticks - far more than the ~100 ticks between
# climbing into bed and the cat dropping its gift.
scoreboard players operation @s bacaphd_sleeps_seen = @s bacaphd_sleeps
scoreboard players set @s bacaphd_bib 40
