# B54 Clock Tower. 9 x 11 x 9 around the player - narrower than before and five
# blocks taller, because the check is now VERTICAL. Counting loose redstone in
# one flat room proved nothing: a lever on a bell, a detector on the ground and
# eight dust sprinkled five blocks away satisfied it. The loop's own y index
# doubles as an altitude reading, so bacaphd_ct_by ends up as the lowest layer
# holding a POWERED Bell and bacaphd_ct_dy as the highest layer holding an
# EMITTING Daylight Detector, and the Detector has to sit at least five layers
# above the Bell. A two-block stack cannot do that and neither can a flat room;
# a tower with the sensor on the roof and the bell below it can, which is the
# whole point of the name. The seeds 99 / -99 make a missing Bell or Detector
# produce a negative separation, so the check fails closed.
scoreboard players set @s bacaphd_bells 0
scoreboard players set @s bacaphd_dets 0
scoreboard players set @s bacaphd_wire 0
scoreboard players set @s bacaphd_ct_by 99
scoreboard players set @s bacaphd_ct_dy -99
scoreboard players set @s bacaphd_sx 0
execute positioned ~-4 ~-5 ~-4 run function bacaphd:detect/ct_x
scoreboard players operation @s bacaphd_ct_sep = @s bacaphd_ct_dy
scoreboard players operation @s bacaphd_ct_sep -= @s bacaphd_ct_by
execute if score @s bacaphd_bells matches 1.. if score @s bacaphd_dets matches 1.. if score @s bacaphd_wire matches 8.. if score @s bacaphd_ct_sep matches 5.. run advancement grant @s only bacaphd:redstone/clock_tower
