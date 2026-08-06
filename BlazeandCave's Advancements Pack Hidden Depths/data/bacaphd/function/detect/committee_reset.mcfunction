# The window closed, or the player died. Either way the run is over: clear every criterion
# collected so far and idle at -1 until the next hit re-arms it.
advancement revoke @s only bacaphd:monsters/death_by_committee
scoreboard players set @s bacaphd_committee -1
