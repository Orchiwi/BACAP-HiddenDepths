# Proof 3: 100 separately lit candle BLOCKS in the 16 x 3 x 16 volume standing on the
# floor the player is standing on. Counting blocks and not candle units means the
# hundred really are a hundred placements spread through the hall.
scoreboard players set @s bacaphd_fbc 0
scoreboard players set @s bacaphd_fbx 0
execute positioned ~-8 ~ ~-8 run function bacaphd:detect/fb_cx
execute if score @s bacaphd_fbc matches 100.. run advancement grant @s only bacaphd:building/flying_buttress
