# Mind the Gap. Runs every tick as the rider, positioned at the minecart itself, so the
# block test is the block the cart occupies rather than the one at the player's feet.
execute store result score @s bacaphd_s6cx run data get entity @s Pos[0]
execute store result score @s bacaphd_s6cz run data get entity @s Pos[2]
scoreboard players set #rail bacaphd_s6t 0
execute if block ~ ~ ~ minecraft:rail run scoreboard players set #rail bacaphd_s6t 1
execute if block ~ ~ ~ minecraft:powered_rail run scoreboard players set #rail bacaphd_s6t 1
execute if block ~ ~ ~ minecraft:detector_rail run scoreboard players set #rail bacaphd_s6t 1
execute if block ~ ~ ~ minecraft:activator_rail run scoreboard players set #rail bacaphd_s6t 1
# On the track and not mid-jump: this is the take-off point, kept up to date.
execute if score #rail bacaphd_s6t matches 1 unless score @s bacaphd_s6mf matches 1 run scoreboard players operation @s bacaphd_s6mx = @s bacaphd_s6cx
execute if score #rail bacaphd_s6t matches 1 unless score @s bacaphd_s6mf matches 1 run scoreboard players operation @s bacaphd_s6mz = @s bacaphd_s6cz
# No rail under the cart: airborne.
execute if score #rail bacaphd_s6t matches 0 run scoreboard players set @s bacaphd_s6mf 1
# Back on rails after a jump: square the horizontal distance covered since take-off.
execute if score #rail bacaphd_s6t matches 1 if score @s bacaphd_s6mf matches 1 run scoreboard players operation @s bacaphd_s6cx -= @s bacaphd_s6mx
execute if score #rail bacaphd_s6t matches 1 if score @s bacaphd_s6mf matches 1 run scoreboard players operation @s bacaphd_s6cz -= @s bacaphd_s6mz
execute if score #rail bacaphd_s6t matches 1 if score @s bacaphd_s6mf matches 1 run scoreboard players operation @s bacaphd_s6cx *= @s bacaphd_s6cx
execute if score #rail bacaphd_s6t matches 1 if score @s bacaphd_s6mf matches 1 run scoreboard players operation @s bacaphd_s6cz *= @s bacaphd_s6cz
execute if score #rail bacaphd_s6t matches 1 if score @s bacaphd_s6mf matches 1 run scoreboard players operation @s bacaphd_s6cx += @s bacaphd_s6cz
execute if score #rail bacaphd_s6t matches 1 if score @s bacaphd_s6mf matches 1 if score @s bacaphd_s6cx matches 100.. run advancement grant @s only bacaphd:redstone/mind_the_gap
execute if score #rail bacaphd_s6t matches 1 run scoreboard players set @s bacaphd_s6mf 0
