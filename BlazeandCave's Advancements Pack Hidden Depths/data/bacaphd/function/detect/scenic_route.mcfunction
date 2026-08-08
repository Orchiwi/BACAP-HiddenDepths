# The Scenic Route. Octagonal distance from the world origin: max + 3/8 * min, exact on
# either axis and under-reading by 2.8% on the diagonal. World spawn sits within a few
# hundred blocks of the origin, and there is no command that queries it into a score, so
# the origin is what this measures from.
# bacaphd_srdq is the disqualification flag. It is set by the four probes in bucket_fast
# and is only ever cleared HERE, by standing back at the origin. It is seeded to 1, so a
# player who was already ten thousand blocks out when the pack was installed has to walk
# home once before a run can count.
execute store result score @s bacaphd_srx run data get entity @s Pos[0] 1
execute store result score @s bacaphd_srz run data get entity @s Pos[2] 1
execute if score @s bacaphd_srx matches ..-1 run scoreboard players operation @s bacaphd_srx *= $s7neg bacaphd_const
execute if score @s bacaphd_srz matches ..-1 run scoreboard players operation @s bacaphd_srz *= $s7neg bacaphd_const
scoreboard players operation @s bacaphd_srhi = @s bacaphd_srx
scoreboard players operation @s bacaphd_srhi > @s bacaphd_srz
scoreboard players operation @s bacaphd_srlo = @s bacaphd_srx
scoreboard players operation @s bacaphd_srlo < @s bacaphd_srz
scoreboard players operation @s bacaphd_srlo *= $s7three bacaphd_const
scoreboard players operation @s bacaphd_srlo /= $s7eight bacaphd_const
scoreboard players operation @s bacaphd_srhi += @s bacaphd_srlo
execute if score @s bacaphd_srhi matches ..64 run scoreboard players set @s bacaphd_srdq 0
execute if score @s bacaphd_srhi matches 10000.. if score @s bacaphd_srdq matches 0 run advancement grant @s only bacaphd:biomes/the_scenic_route
