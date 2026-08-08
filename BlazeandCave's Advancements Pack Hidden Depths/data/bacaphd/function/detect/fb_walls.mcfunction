# Proof 2: four horizontal rays out of the player at chest height. `rotated` sets the
# yaw so ONE ray function serves all four directions and `^ ^ ^1` always means "one
# block further out". A ray that runs its full 16 blocks without hitting anything
# scores nothing, so a hall left open on any side can never pass.
scoreboard players set @s bacaphd_fbg 0
execute rotated 0 0 positioned ~ ~2 ~ run function bacaphd:detect/fb_ray_start
execute rotated 90 0 positioned ~ ~2 ~ run function bacaphd:detect/fb_ray_start
execute rotated 180 0 positioned ~ ~2 ~ run function bacaphd:detect/fb_ray_start
execute rotated 270 0 positioned ~ ~2 ~ run function bacaphd:detect/fb_ray_start
execute if score @s bacaphd_fbg matches 4 run function bacaphd:detect/fb_candles
