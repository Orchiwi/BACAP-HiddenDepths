scoreboard players add #hb_slow bacaphd_sys 1
# --- Torchbearer (B5): sixty-four Copper Torches placed ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/torchbearer=false},scores={bacaphd_ctorch=64..}] run advancement grant @s only bacaphd:mining/torchbearer

# --- Copper Stable (B9): a kilometre ridden in one go on a horse in Copper Horse Armor ---
# Flag everyone holding an anchor, let the detector clear the flag for riders who are
# still on a copper-armoured horse, and drop the anchor for whoever is left over.
tag @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/copper_stable=false},tag=bacaphd.cstable] add bacaphd.cs_off
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/copper_stable=false}] on vehicle if entity @s[type=minecraft:horse] if items entity @s armor.body minecraft:copper_horse_armor on passengers if entity @s[type=player] run function bacaphd:detect/copper_stable
execute as @a[tag=bacaphd.cs_off] run function bacaphd:detect/copper_stable_off

# --- Armada (B11): twenty Nautiluses in Nautilus Armor within twenty blocks ---
execute as @a[gamemode=!spectator,advancements={bacaphd:biomes/armada=false}] at @s store result score @s bacaphd_naut if entity @e[type=minecraft:nautilus,distance=..20,limit=20]
execute as @a[gamemode=!spectator,advancements={bacaphd:biomes/armada=false},scores={bacaphd_naut=20}] at @s run function bacaphd:detect/armada

# --- Key Master (B14): count keys across the whole inventory, not one stack ---
execute as @a[gamemode=!spectator,advancements={bacaphd:adventure/key_master=false}] run function bacaphd:detect/key_master
execute store result score #now bacaphd_gametime run time query gametime
execute as @a[gamemode=!spectator] unless score @s bacaphd_cakes_used = @s bacaphd_cakes_seen run function bacaphd:detect/cake_hoarder
execute as @a[gamemode=!spectator] unless score @s bacaphd_ore_diamond = @s bacaphd_ore_diamond_seen run function bacaphd:detect/vein_miner
execute as @a[gamemode=!spectator] unless score @s bacaphd_ore_deepslate = @s bacaphd_ore_deepslate_seen run function bacaphd:detect/vein_miner
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/chunk_miner=false}] at @s run function bacaphd:detect/chunk_gate
execute as @a[gamemode=!spectator,advancements={bacaphd:farming/herbivore=false},scores={bacaphd_init_b2=1}] run function bacaphd:detect/herbivore
execute as @a[gamemode=!spectator,advancements={bacaphd:monsters/pacifist_streak=false},scores={bacaphd_init_b2=1}] run function bacaphd:detect/pacifist
# B44 Book Worm - a full inventory of Enchanted Books
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/book_worm=false}] run function bacaphd:detect/book_worm
# B51 City Planner - End City sites, each one further out than the last
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/city_planner=false}] at @s if dimension minecraft:the_end run function bacaphd:detect/city_planner
# B57 Cartographer's Wall - entity count, no block scan needed
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/cartographers_wall=false}] at @s run function bacaphd:detect/cartographers_wall
# B58 Skyscraper - four cheap probes gate the 384-block column walk
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/skyscraper=false}] at @s if dimension minecraft:overworld run function bacaphd:detect/skyscraper
# Bounded region scans. @r picks at most ONE candidate player per 5s cycle, so the
# cost of each of these is capped no matter how many players still lack them.
# B53 Sorting Facility - 16x7x16
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/sorting_facility=false}] at @s run function bacaphd:detect/sorting_facility
# B54 Clock Tower - 9x11x9, tall enough to measure Detector-above-Bell separation
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/clock_tower=false}] at @s run function bacaphd:detect/clock_tower
# B56 Copper Counter - 13x5x13 with an air short-circuit
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/copper_counter=false}] at @s run function bacaphd:detect/copper_counter
# B59 Monochrome - 9x9x9 directly BELOW the player, macro-driven single-block-id count
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/monochrome=false}] at @s run function bacaphd:detect/monochrome
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/full_kennel={kennel=false}}] at @s if entity @e[type=minecraft:wolf,distance=..16,limit=1] run function bacaphd:detect/full_kennel
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/herding_cats=false}] at @s if entity @e[type=minecraft:cat,distance=..8,limit=1] run function bacaphd:detect/herding_cats
# 'time query daytime' does not parse here - daytime is not a minecraft:timeline element.
# gametime is, and the time of day is just gametime within the current day.
scoreboard players set #day_len bacaphd_const 24000
execute store result score #h5_daytime bacaphd_tmp run time query gametime
scoreboard players operation #h5_daytime bacaphd_tmp %= #day_len bacaphd_const
execute if score #h5_daytime bacaphd_tmp matches 13000..22999 as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/cold_blooded=false}] at @s run function bacaphd:detect/cold_blooded
execute unless score #h5_daytime bacaphd_tmp matches 13000..22999 run scoreboard players set @a bacaphd_cold 0
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/copper_baron=false}] run function bacaphd:detect/copper_baron
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/spear_master=false}] run function bacaphd:detect/spear_master
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/golem_foreman={hundred=false}},scores={bacaphd_pumpkin=100..}] run advancement grant @s only bacaphd:statistics/golem_foreman hundred
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/harness_hours=false}] at @s if entity @e[type=minecraft:happy_ghast,distance=..8,limit=1] run function bacaphd:detect/harness_hours
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/wind_walker=false},scores={bacaphd_wind=1000..}] run advancement grant @s only bacaphd:statistics/wind_walker
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/shelf_stocker=false}] run function bacaphd:detect/shelf_stocker
