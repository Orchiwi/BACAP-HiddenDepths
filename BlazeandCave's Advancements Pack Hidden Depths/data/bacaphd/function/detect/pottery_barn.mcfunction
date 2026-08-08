# Pottery Barn. Runs as, and at, a player whose Decorated Pot placement statistic just
# moved. The mirror is resynced FIRST so one call can never count two pots.
scoreboard players operation @s bacaphd_s6potm = @s bacaphd_s6pot
execute store result score @s bacaphd_s6px run data get entity @s Pos[0]
execute store result score @s bacaphd_s6py run data get entity @s Pos[1]
execute store result score @s bacaphd_s6pz run data get entity @s Pos[2]
# Largest per-axis distance from the anchor, each axis made absolute by negate-and-max.
scoreboard players operation #d bacaphd_s6t = @s bacaphd_s6px
scoreboard players operation #d bacaphd_s6t -= @s bacaphd_s6pax
scoreboard players operation #n bacaphd_s6t = #d bacaphd_s6t
scoreboard players operation #n bacaphd_s6t *= #neg1 bacaphd_s6t
scoreboard players operation #d bacaphd_s6t > #n bacaphd_s6t
scoreboard players operation #far bacaphd_s6t = #d bacaphd_s6t
scoreboard players operation #d bacaphd_s6t = @s bacaphd_s6py
scoreboard players operation #d bacaphd_s6t -= @s bacaphd_s6pay
scoreboard players operation #n bacaphd_s6t = #d bacaphd_s6t
scoreboard players operation #n bacaphd_s6t *= #neg1 bacaphd_s6t
scoreboard players operation #d bacaphd_s6t > #n bacaphd_s6t
scoreboard players operation #far bacaphd_s6t > #d bacaphd_s6t
scoreboard players operation #d bacaphd_s6t = @s bacaphd_s6pz
scoreboard players operation #d bacaphd_s6t -= @s bacaphd_s6paz
scoreboard players operation #n bacaphd_s6t = #d bacaphd_s6t
scoreboard players operation #n bacaphd_s6t *= #neg1 bacaphd_s6t
scoreboard players operation #d bacaphd_s6t > #n bacaphd_s6t
scoreboard players operation #far bacaphd_s6t > #d bacaphd_s6t
# Too far from the anchor, or nothing counted yet, starts a fresh display room here.
scoreboard players set #new bacaphd_s6t 0
execute if score #far bacaphd_s6t matches 17.. run scoreboard players set #new bacaphd_s6t 1
execute unless score @s bacaphd_s6potn matches 1.. run scoreboard players set #new bacaphd_s6t 1
execute if score #new bacaphd_s6t matches 1 run scoreboard players operation @s bacaphd_s6pax = @s bacaphd_s6px
execute if score #new bacaphd_s6t matches 1 run scoreboard players operation @s bacaphd_s6pay = @s bacaphd_s6py
execute if score #new bacaphd_s6t matches 1 run scoreboard players operation @s bacaphd_s6paz = @s bacaphd_s6pz
execute if score #new bacaphd_s6t matches 1 run scoreboard players set @s bacaphd_s6potn 1
execute if score #new bacaphd_s6t matches 0 run scoreboard players add @s bacaphd_s6potn 1
execute if score @s bacaphd_s6potn matches 25.. run advancement grant @s only bacaphd:building/pottery_barn
