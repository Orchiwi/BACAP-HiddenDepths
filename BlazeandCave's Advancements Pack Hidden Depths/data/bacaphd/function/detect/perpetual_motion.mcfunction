# Perpetual Motion. Runs every tick as, and at, a player standing on a Redstone Lamp who
# does not hold the advancement. The run only survives while the lamp keeps switching.
scoreboard players add @s bacaphd_s6pm 1
scoreboard players add @s bacaphd_s6pmg 1
scoreboard players set #lit bacaphd_s6t 0
execute if block ~ ~-1 ~ minecraft:redstone_lamp[lit=true] run scoreboard players set #lit bacaphd_s6t 1
# Any change of the lamp's state is one tick of the clock.
execute unless score @s bacaphd_s6pml = #lit bacaphd_s6t run scoreboard players set @s bacaphd_s6pmg 0
scoreboard players operation @s bacaphd_s6pml = #lit bacaphd_s6t
# Five seconds with no flip is not a running clock, so the run starts again from zero.
execute if score @s bacaphd_s6pmg matches 101.. run scoreboard players set @s bacaphd_s6pm 0
execute if score @s bacaphd_s6pmg matches 101.. run scoreboard players set @s bacaphd_s6pmg 0
execute if score @s bacaphd_s6pm matches 24000.. run advancement grant @s only bacaphd:redstone/perpetual_motion
