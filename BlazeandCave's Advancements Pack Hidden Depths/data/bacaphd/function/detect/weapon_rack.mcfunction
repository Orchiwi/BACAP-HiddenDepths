# Weapon Rack. Runs as, and positioned at, a player standing within twelve blocks of
# an Item Frame who does not hold the advancement. One global flag per weapon class,
# cleared at the top of every run, so a frame that was emptied stops counting.
scoreboard players set $s6_sword bacaphd_s6t 0
scoreboard players set $s6_axe bacaphd_s6t 0
scoreboard players set $s6_spear bacaphd_s6t 0
scoreboard players set $s6_bow bacaphd_s6t 0
scoreboard players set $s6_cross bacaphd_s6t 0
scoreboard players set $s6_trident bacaphd_s6t 0
scoreboard players set $s6_mace bacaphd_s6t 0
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:wooden_sword"}}] run scoreboard players set $s6_sword bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:stone_sword"}}] run scoreboard players set $s6_sword bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:copper_sword"}}] run scoreboard players set $s6_sword bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:iron_sword"}}] run scoreboard players set $s6_sword bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:golden_sword"}}] run scoreboard players set $s6_sword bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:diamond_sword"}}] run scoreboard players set $s6_sword bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:netherite_sword"}}] run scoreboard players set $s6_sword bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:wooden_axe"}}] run scoreboard players set $s6_axe bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:stone_axe"}}] run scoreboard players set $s6_axe bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:copper_axe"}}] run scoreboard players set $s6_axe bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:iron_axe"}}] run scoreboard players set $s6_axe bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:golden_axe"}}] run scoreboard players set $s6_axe bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:diamond_axe"}}] run scoreboard players set $s6_axe bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:netherite_axe"}}] run scoreboard players set $s6_axe bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:wooden_spear"}}] run scoreboard players set $s6_spear bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:stone_spear"}}] run scoreboard players set $s6_spear bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:copper_spear"}}] run scoreboard players set $s6_spear bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:iron_spear"}}] run scoreboard players set $s6_spear bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:golden_spear"}}] run scoreboard players set $s6_spear bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:diamond_spear"}}] run scoreboard players set $s6_spear bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:netherite_spear"}}] run scoreboard players set $s6_spear bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:bow"}}] run scoreboard players set $s6_bow bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:crossbow"}}] run scoreboard players set $s6_cross bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:trident"}}] run scoreboard players set $s6_trident bacaphd_s6t 1
execute if entity @e[type=minecraft:item_frame,distance=..12,limit=1,nbt={Item:{id:"minecraft:mace"}}] run scoreboard players set $s6_mace bacaphd_s6t 1
execute if score $s6_sword bacaphd_s6t matches 1 if score $s6_axe bacaphd_s6t matches 1 if score $s6_spear bacaphd_s6t matches 1 if score $s6_bow bacaphd_s6t matches 1 if score $s6_cross bacaphd_s6t matches 1 if score $s6_trident bacaphd_s6t matches 1 if score $s6_mace bacaphd_s6t matches 1 run advancement grant @s only bacaphd:weaponry/weapon_rack
