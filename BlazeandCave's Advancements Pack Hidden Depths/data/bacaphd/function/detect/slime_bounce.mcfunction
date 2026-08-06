# The CONTACT tick with a Slime Block: the bucket line carries tag=!bacaphd.on_slime, so
# this runs once per landing, not once per tick of standing there.
tag @s add bacaphd.on_slime
execute store result score @s bacaphd_slime_y run data get entity @s Pos[1] 10
# A chain is already live: this contact only counts if the hop that led here was real.
execute if score @s bacaphd_slime_chain matches 1.. run function bacaphd:detect/slime_hop
# Either the very first contact, or the hop was too small and reset the chain to 0.
# Either way this contact becomes the new first bounce of a fresh chain.
execute unless score @s bacaphd_slime_chain matches 1.. run scoreboard players set @s bacaphd_slime_chain 1
# Arm the apex tracker for the next hop at the height of the slime surface.
scoreboard players operation @s bacaphd_slime_peak = @s bacaphd_slime_y
