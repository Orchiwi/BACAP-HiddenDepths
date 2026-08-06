# B64 Armadillo Roller - count distinct roll-ups, latched so one long roll counts once.
scoreboard players set #h5_rolled bacaphd_tmp 0
execute if entity @e[type=minecraft:armadillo,distance=..8,nbt={state:"scared"},limit=1] run scoreboard players set #h5_rolled bacaphd_tmp 1
execute if entity @e[type=minecraft:armadillo,distance=..8,nbt={state:"rolling"},limit=1] run scoreboard players set #h5_rolled bacaphd_tmp 1
execute if score #h5_rolled bacaphd_tmp matches 0 run scoreboard players set @s bacaphd_roll_lock 0
execute if score #h5_rolled bacaphd_tmp matches 1 unless score @s bacaphd_roll_lock matches 1 run scoreboard players add @s bacaphd_roll 1
execute if score #h5_rolled bacaphd_tmp matches 1 run scoreboard players set @s bacaphd_roll_lock 1
execute if score @s bacaphd_roll matches 5.. run advancement grant @s only bacaphd:animal/armadillo_roller
# Consume the counters on the granting path so nothing leaks. Lock first: resetting the
# counter first would make the next line's guard fail.
execute if score @s bacaphd_roll matches 5.. run scoreboard players reset @s bacaphd_roll_lock
execute if score @s bacaphd_roll matches 5.. run scoreboard players reset @s bacaphd_roll
