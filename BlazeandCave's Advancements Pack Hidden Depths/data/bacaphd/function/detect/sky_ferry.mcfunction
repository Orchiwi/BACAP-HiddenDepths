# Sky Ferry. @s is a player sitting on a Happy Ghast. The payload has to be hanging
# UNDER the ghast, so the count is taken from a box that starts sixteen blocks below
# the saddle and stops one block short of it, and every mob in it must be off the
# ground - four sheep leashed to fence posts on the floor no longer count just because
# the rider drifted overhead. The key was renamed from Leash to leash, so both
# spellings are summed; a mob can hold only one of them, so nothing is double counted.
# Four leashed mobs dangling below plus open air four and eight blocks down is a ghast
# in flight with a full payload; the leads are the hard part. The 'four DIFFERENT
# species' clause of the idea is deliberately not enforced - see the description,
# which asks only for four leashed mobs.
execute at @s positioned ~-8 ~-16 ~-8 store result score @s bacaphd_ferry if entity @e[type=!minecraft:player,dx=16,dy=15,dz=16,nbt={leash:{},OnGround:0b},limit=4]
execute at @s positioned ~-8 ~-16 ~-8 store result score @s bacaphd_ferry2 if entity @e[type=!minecraft:player,dx=16,dy=15,dz=16,nbt={Leash:{},OnGround:0b},limit=4]
scoreboard players operation @s bacaphd_ferry += @s bacaphd_ferry2
execute if score @s bacaphd_ferry matches 4.. at @s if block ~ ~-4 ~ minecraft:air if block ~ ~-8 ~ minecraft:air run advancement grant @s only bacaphd:nether/sky_ferry
