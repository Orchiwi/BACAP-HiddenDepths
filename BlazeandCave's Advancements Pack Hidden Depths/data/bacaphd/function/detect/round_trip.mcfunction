# Round Trip. Ten-tick position sampling, the same probe HD's Gateway Tourist already
# runs: an End Gateway is the only thing that moves a player two hundred blocks between
# two samples, and both samples have to be inside the End for the pair to count at all.
# bacaphd_rt_st is the state machine:
#   0 -> 1  first hop out to the outer islands; the ARRIVAL point is stored
#   1 -> 2  a hop that lands back inside 500 blocks of the centre
#   2 -> granted, on a second hop out that lands 128+ blocks from the first landing
# ARRIVAL points, not departure points, are what tell the two gateways apart. The
# twenty gateways sit on a ring of radius 96 around the centre, so their departure
# points are only about thirty blocks apart - less than the distance a player covers
# in the ten ticks between samples, which is why comparing them proved nothing. Their
# exits are on the 1024-block ring instead, three hundred blocks apart, and the arrival
# sample is taken on the tick the teleport lands, so 128 sits well clear of both the
# sampling error and the closest pair of exits.
scoreboard players add @s bacaphd_rt_x 0
scoreboard players add @s bacaphd_rt_z 0
scoreboard players add @s bacaphd_rt_gx 0
scoreboard players add @s bacaphd_rt_gz 0
scoreboard players add @s bacaphd_rt_st 0
scoreboard players set @s bacaphd_rt_now 0
execute if dimension minecraft:the_end run scoreboard players set @s bacaphd_rt_now 1
scoreboard players operation @s bacaphd_rt_px = @s bacaphd_rt_x
scoreboard players operation @s bacaphd_rt_pz = @s bacaphd_rt_z
execute store result score @s bacaphd_rt_x run data get entity @s Pos[0] 1
execute store result score @s bacaphd_rt_z run data get entity @s Pos[2] 1
# size of the jump between the two samples
scoreboard players operation @s bacaphd_rt_j = @s bacaphd_rt_x
scoreboard players operation @s bacaphd_rt_j -= @s bacaphd_rt_px
execute if score @s bacaphd_rt_j matches ..-1 run scoreboard players operation @s bacaphd_rt_j *= $s7neg bacaphd_const
scoreboard players operation @s bacaphd_rt_k = @s bacaphd_rt_z
scoreboard players operation @s bacaphd_rt_k -= @s bacaphd_rt_pz
execute if score @s bacaphd_rt_k matches ..-1 run scoreboard players operation @s bacaphd_rt_k *= $s7neg bacaphd_const
scoreboard players operation @s bacaphd_rt_j > @s bacaphd_rt_k
# how far the arrival is from the centre of the End
scoreboard players operation @s bacaphd_rt_r = @s bacaphd_rt_x
execute if score @s bacaphd_rt_r matches ..-1 run scoreboard players operation @s bacaphd_rt_r *= $s7neg bacaphd_const
scoreboard players operation @s bacaphd_rt_s = @s bacaphd_rt_z
execute if score @s bacaphd_rt_s matches ..-1 run scoreboard players operation @s bacaphd_rt_s *= $s7neg bacaphd_const
scoreboard players operation @s bacaphd_rt_r > @s bacaphd_rt_s
# how far THIS arrival point is from the one already stored
scoreboard players operation @s bacaphd_rt_d = @s bacaphd_rt_x
scoreboard players operation @s bacaphd_rt_d -= @s bacaphd_rt_gx
execute if score @s bacaphd_rt_d matches ..-1 run scoreboard players operation @s bacaphd_rt_d *= $s7neg bacaphd_const
scoreboard players operation @s bacaphd_rt_e = @s bacaphd_rt_z
scoreboard players operation @s bacaphd_rt_e -= @s bacaphd_rt_gz
execute if score @s bacaphd_rt_e matches ..-1 run scoreboard players operation @s bacaphd_rt_e *= $s7neg bacaphd_const
scoreboard players operation @s bacaphd_rt_d > @s bacaphd_rt_e
# Kill the jump unless BOTH ends of the sample pair were inside the End. This is what
# stops the hop from an Overworld position into the End reading as a gateway.
execute unless score @s bacaphd_rt_in matches 1 run scoreboard players set @s bacaphd_rt_j 0
execute unless score @s bacaphd_rt_now matches 1 run scoreboard players set @s bacaphd_rt_j 0
execute if score @s bacaphd_rt_st matches 0 if score @s bacaphd_rt_j matches 200.. if score @s bacaphd_rt_r matches 800.. run scoreboard players operation @s bacaphd_rt_gx = @s bacaphd_rt_x
execute if score @s bacaphd_rt_st matches 0 if score @s bacaphd_rt_j matches 200.. if score @s bacaphd_rt_r matches 800.. run scoreboard players operation @s bacaphd_rt_gz = @s bacaphd_rt_z
execute if score @s bacaphd_rt_st matches 0 if score @s bacaphd_rt_j matches 200.. if score @s bacaphd_rt_r matches 800.. run scoreboard players set @s bacaphd_rt_st 1
execute if score @s bacaphd_rt_st matches 1 if score @s bacaphd_rt_j matches 200.. if score @s bacaphd_rt_r matches ..500 run scoreboard players set @s bacaphd_rt_st 2
execute if score @s bacaphd_rt_st matches 2 if score @s bacaphd_rt_j matches 200.. if score @s bacaphd_rt_r matches 800.. if score @s bacaphd_rt_d matches 128.. run advancement grant @s only bacaphd:end/round_trip
scoreboard players operation @s bacaphd_rt_in = @s bacaphd_rt_now
