scoreboard players set @s bacaphd_soul 0
scoreboard players set @s bacaphd_ss_prev 0
# Grants BOTH criteria. Granting only 'distance' would leave soul_speed revoked
# by the line at the top of this same execution and the advancement incomplete.
advancement grant @s only bacaphd:nether/soul_speed_demon
