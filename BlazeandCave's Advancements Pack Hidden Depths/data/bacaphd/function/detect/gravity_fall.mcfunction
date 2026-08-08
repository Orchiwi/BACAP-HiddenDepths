# Gravity Always Wins. FallDistance is a live value vanilla zeroes the moment a fall ends,
# so the only way to bank a fall is to watch for the drop to zero and add the LAST
# non-zero sample - which is why this has to be per tick rather than in a slower bucket.
# It is a fresh counter that starts when the pack is installed, not a lifetime statistic.
scoreboard players add @s bacaphd_fall_tot 0
scoreboard players add @s bacaphd_fall_prev 0
execute store result score @s bacaphd_fall_now run data get entity @s FallDistance 1
# Three blocks is the floor. Below that this would bank every staircase step and ten
# kilometres would become a walking advancement.
execute if score @s bacaphd_fall_now matches 0 if score @s bacaphd_fall_prev matches 3.. run scoreboard players operation @s bacaphd_fall_tot += @s bacaphd_fall_prev
scoreboard players operation @s bacaphd_fall_prev = @s bacaphd_fall_now
execute if score @s bacaphd_fall_tot matches 10000.. run advancement grant @s only bacaphd:statistics/gravity_always_wins
