# 11 x 5 x 11 around the player. Every position only ever asks whether it is the START
# of a four-block oxidation run, so all but a handful of positions fail on the first
# `if block` and cost nothing further. Both axes and both reading directions are
# accepted, so the gradient does not have to be laid out facing any particular way.
scoreboard players set @s bacaphd_whh 0
scoreboard players set @s bacaphd_whx 0
execute positioned ~-5 ~-2 ~-5 run function bacaphd:detect/wh_x
execute if score @s bacaphd_whh matches 1.. run advancement grant @s only bacaphd:mining/weathering_heights
