# B5 Dead Reckoning. Runs from the hundred-tick bucket, as and at a player who
# currently holds the `gliding` criterion - a minecraft:location on flags.is_flying
# with an Elytra in the chest slot, which the game re-polls every twenty ticks.
# The revoke MUST stay first: the completion path grants every criterion and a
# revoke after it would leave the advancement incomplete. Revoking each sample also
# means gliding has to be re-proven within the next second or the bucket's reset
# line zeroes the run.
# Distance is measured from the player's own position, not from a statistic, using
# the octagonal max + 3/8 * min approximation this pack uses for its other distance
# work: exact on either axis, under-reading by 2.8% at dx == dz. Positions are read
# in decimetres, so a kilometre is 10000.
# A rocket ends the run outright. bacaphd_rockb mirrors
# minecraft.used:minecraft.firework_rocket and is seeded in seed.mcfunction; without
# that seeding the first sample would read a whole save's rockets as one launch,
# which is harmless here but is exactly the bug that has to stay fixed.
advancement revoke @s only bacaphd:end/dead_reckoning gliding
execute store result score @s bacaphd_gl_x run data get entity @s Pos[0] 10
execute store result score @s bacaphd_gl_z run data get entity @s Pos[2] 10
scoreboard players operation @s bacaphd_gl_dx = @s bacaphd_gl_x
scoreboard players operation @s bacaphd_gl_dx -= @s bacaphd_gl_px
scoreboard players operation @s bacaphd_gl_dz = @s bacaphd_gl_z
scoreboard players operation @s bacaphd_gl_dz -= @s bacaphd_gl_pz
execute if score @s bacaphd_gl_dx matches ..-1 run scoreboard players operation @s bacaphd_gl_dx *= $b5neg bacaphd_const
execute if score @s bacaphd_gl_dz matches ..-1 run scoreboard players operation @s bacaphd_gl_dz *= $b5neg bacaphd_const
scoreboard players operation @s bacaphd_gl_hi = @s bacaphd_gl_dx
scoreboard players operation @s bacaphd_gl_hi > @s bacaphd_gl_dz
scoreboard players operation @s bacaphd_gl_lo = @s bacaphd_gl_dx
scoreboard players operation @s bacaphd_gl_lo < @s bacaphd_gl_dz
scoreboard players operation @s bacaphd_gl_lo *= $b5three bacaphd_const
scoreboard players operation @s bacaphd_gl_lo /= $b5eight bacaphd_const
scoreboard players operation @s bacaphd_gl_hi += @s bacaphd_gl_lo
execute unless score @s bacaphd_rock = @s bacaphd_rockb run scoreboard players set @s bacaphd_glide 0
scoreboard players operation @s bacaphd_rockb = @s bacaphd_rock
# 2000 decimetres in five seconds is 40 blocks a second - faster than any glide.
# Anything above that is a teleport or a dimension change and banks nothing.
execute if score @s bacaphd_gl_prev matches 1 if score @s bacaphd_gl_hi matches ..2000 run scoreboard players operation @s bacaphd_glide += @s bacaphd_gl_hi
scoreboard players operation @s bacaphd_gl_px = @s bacaphd_gl_x
scoreboard players operation @s bacaphd_gl_pz = @s bacaphd_gl_z
scoreboard players set @s bacaphd_gl_prev 1
execute if score @s bacaphd_glide matches 10000.. run advancement grant @s only bacaphd:end/dead_reckoning
execute if score @s bacaphd_glide matches 10000.. run scoreboard players reset @s bacaphd_glide
