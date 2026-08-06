# B71 Spear Master - every Spear tier counts towards the same twenty-five.
# minecraft.broken is Stats.ITEM_BROKEN, and a Spear (WEAPON component, 1 damage per attack)
# only loses durability when it strikes, so this is a hit counter weighted by tier.
scoreboard players set @s bacaphd_spb_sum 0
execute if score @s bacaphd_spb_wood matches 1.. run scoreboard players operation @s bacaphd_spb_sum += @s bacaphd_spb_wood
execute if score @s bacaphd_spb_stone matches 1.. run scoreboard players operation @s bacaphd_spb_sum += @s bacaphd_spb_stone
execute if score @s bacaphd_spb_copper matches 1.. run scoreboard players operation @s bacaphd_spb_sum += @s bacaphd_spb_copper
execute if score @s bacaphd_spb_iron matches 1.. run scoreboard players operation @s bacaphd_spb_sum += @s bacaphd_spb_iron
execute if score @s bacaphd_spb_gold matches 1.. run scoreboard players operation @s bacaphd_spb_sum += @s bacaphd_spb_gold
execute if score @s bacaphd_spb_dia matches 1.. run scoreboard players operation @s bacaphd_spb_sum += @s bacaphd_spb_dia
execute if score @s bacaphd_spb_neth matches 1.. run scoreboard players operation @s bacaphd_spb_sum += @s bacaphd_spb_neth
execute if score @s bacaphd_spb_sum matches 25.. run advancement grant @s only bacaphd:statistics/spear_master
execute if score @s bacaphd_spb_sum matches 25.. run scoreboard players reset @s bacaphd_spb_sum
