# Within 128 blocks of a Wither. Is the carried kit exactly a sword, a bow and at most one
# stack of arrows? Armour and the offhand are NOT checked here: at this pack format they
# live outside the Inventory list, so the advancement criteria test them directly instead.
scoreboard players set @s bacaphd_fw_kit 0
execute store result score @s bacaphd_fw_inv run data get entity @s Inventory
execute store result score @s bacaphd_fw_sword run clear @s #blazeandcave:swords 0
execute store result score @s bacaphd_fw_bow run clear @s minecraft:bow 0
execute store result score @s bacaphd_fw_arrow run clear @s minecraft:arrow 0
# Expected number of occupied stacks: the sword, the bow, plus one stack of arrows if any.
scoreboard players set @s bacaphd_fw_want 2
execute if score @s bacaphd_fw_arrow matches 1..64 run scoreboard players set @s bacaphd_fw_want 3
# More than one stack of arrows is more than the advertised kit: make it unmatchable.
execute if score @s bacaphd_fw_arrow matches 65.. run scoreboard players set @s bacaphd_fw_want -1
execute if score @s bacaphd_fw_sword matches 1 if score @s bacaphd_fw_bow matches 1 if score @s bacaphd_fw_inv = @s bacaphd_fw_want run scoreboard players set @s bacaphd_fw_kit 1
