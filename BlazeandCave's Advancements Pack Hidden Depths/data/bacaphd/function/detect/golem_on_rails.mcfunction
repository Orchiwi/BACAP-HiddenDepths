# Golem on Rails. Executed as, and positioned at, a player who does not yet hold the
# advancement and has a Minecart within sixteen blocks. No trigger exists for a mob
# boarding a vehicle, so this is the batch's single detection function.
# The four rail IDs are written out one per line rather than matched against
# #minecraft:rails: detect/gc_z in this pack already enumerates them, and an
# unattested block tag is not a risk worth taking.
scoreboard players set #gor bacaphd_gor 0
execute as @e[type=minecraft:minecart,distance=..16,limit=8,sort=nearest,nbt={Passengers:[{id:"minecraft:copper_golem"}]}] at @s if block ~ ~ ~ minecraft:rail run scoreboard players set #gor bacaphd_gor 1
execute as @e[type=minecraft:minecart,distance=..16,limit=8,sort=nearest,nbt={Passengers:[{id:"minecraft:copper_golem"}]}] at @s if block ~ ~ ~ minecraft:powered_rail run scoreboard players set #gor bacaphd_gor 1
execute as @e[type=minecraft:minecart,distance=..16,limit=8,sort=nearest,nbt={Passengers:[{id:"minecraft:copper_golem"}]}] at @s if block ~ ~ ~ minecraft:detector_rail run scoreboard players set #gor bacaphd_gor 1
execute as @e[type=minecraft:minecart,distance=..16,limit=8,sort=nearest,nbt={Passengers:[{id:"minecraft:copper_golem"}]}] at @s if block ~ ~ ~ minecraft:activator_rail run scoreboard players set #gor bacaphd_gor 1
# Every command in a function starts from the function's own context, so @s here is
# still the player even though the lines above ran `as` the minecart.
execute if score #gor bacaphd_gor matches 1 run advancement grant @s only bacaphd:redstone/golem_on_rails
scoreboard players reset #gor bacaphd_gor
