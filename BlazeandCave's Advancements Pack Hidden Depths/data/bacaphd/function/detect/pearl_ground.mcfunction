# Runs only for players with a live pearl chain.
function bacaphd:detect/pearl_grounded
execute if score @s bacaphd_pearl_grd matches 1 run scoreboard players set @s bacaphd_pearl_chain 0
