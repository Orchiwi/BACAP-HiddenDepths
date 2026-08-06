# How far above the slime did the player actually get since the last contact?
# A standing jump peaks about 1.25 blocks up and fails; a real Slime Block rebound (the
# block reflects nearly the whole fall velocity) clears 3 blocks easily. Without this the
# advancement was five ordinary jumps on a single slime block.
scoreboard players operation @s bacaphd_slime_peak -= @s bacaphd_slime_y
execute if score @s bacaphd_slime_peak matches 30.. run scoreboard players add @s bacaphd_slime_chain 1
execute unless score @s bacaphd_slime_peak matches 30.. run scoreboard players set @s bacaphd_slime_chain 0
execute if score @s bacaphd_slime_chain matches 5.. run function bacaphd:detect/slime_done
