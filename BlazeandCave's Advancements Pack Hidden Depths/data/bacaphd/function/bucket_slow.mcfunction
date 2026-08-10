scoreboard players add #hb_slow bacaphd_sys 1
# --- Torchbearer (B5): sixty-four Copper Torches placed SINCE THIS PACK WAS INSTALLED ---
# bacaphd_ctorch is the raw lifetime minecraft.used:minecraft.copper_torch statistic, so
# reading it directly handed the advancement to any save that had already placed 64 torches
# before the pack landed. bacaphd_ctorchb is the mirror seeded once per player in
# bacaphd:seed, ahead of every detector, and bacaphd_ctorchd is the delta measured against
# it - the same shape Sea to Shining Sea and Greenhouse Gases already use. The delta lines
# are gated on the seed tag so the subtraction can never run against an unset mirror.
execute as @a[gamemode=!spectator,gamemode=!creative,tag=bacaphd.ctorch_seed,advancements={bacaphd:mining/torchbearer=false}] run scoreboard players operation @s bacaphd_ctorchd = @s bacaphd_ctorch
execute as @a[gamemode=!spectator,gamemode=!creative,tag=bacaphd.ctorch_seed,advancements={bacaphd:mining/torchbearer=false}] run scoreboard players operation @s bacaphd_ctorchd -= @s bacaphd_ctorchb
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/torchbearer=false},scores={bacaphd_ctorchd=64..}] run advancement grant @s only bacaphd:mining/torchbearer

# --- Copper Stable (B9): a kilometre ridden in one go on a horse in Copper Horse Armor ---
# Flag everyone holding an anchor, let the detector clear the flag for riders who are
# still on a copper-armoured horse, and drop the anchor for whoever is left over.
tag @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/copper_stable=false},tag=bacaphd.cstable] add bacaphd.cs_off
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/copper_stable=false}] on vehicle if entity @s[type=minecraft:horse] if items entity @s armor.body minecraft:copper_horse_armor on passengers if entity @s[type=player] run function bacaphd:detect/copper_stable
execute as @a[tag=bacaphd.cs_off] run function bacaphd:detect/copper_stable_off

# --- Armada (B11): twenty Nautiluses in Nautilus Armor within twenty blocks ---
execute as @a[gamemode=!spectator,advancements={bacaphd:challenges/armada=false}] at @s store result score @s bacaphd_naut if entity @e[type=minecraft:nautilus,distance=..20,limit=20]
execute as @a[gamemode=!spectator,advancements={bacaphd:challenges/armada=false},scores={bacaphd_naut=20}] at @s run function bacaphd:detect/armada

# --- Key Master (B14): count keys across the whole inventory, not one stack ---
execute as @a[gamemode=!spectator,advancements={bacaphd:adventure/key_master=false}] run function bacaphd:detect/key_master
execute store result score #now bacaphd_gametime run time query gametime
execute as @a[gamemode=!spectator] if score @s bacaphd_cakes_used matches 0.. if score @s bacaphd_cakes_seen matches 0.. unless score @s bacaphd_cakes_used = @s bacaphd_cakes_seen run function bacaphd:detect/cake_hoarder
execute as @a[gamemode=!spectator] if score @s bacaphd_ore_diamond matches 0.. if score @s bacaphd_ore_diamond_seen matches 0.. unless score @s bacaphd_ore_diamond = @s bacaphd_ore_diamond_seen run function bacaphd:detect/vein_miner
execute as @a[gamemode=!spectator] if score @s bacaphd_ore_deepslate matches 0.. if score @s bacaphd_ore_deepslate_seen matches 0.. unless score @s bacaphd_ore_deepslate = @s bacaphd_ore_deepslate_seen run function bacaphd:detect/vein_miner
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:challenges/chunk_miner=false}] at @s run function bacaphd:detect/chunk_gate
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
# --- expansion ---
# --- Cell Block (solo3): a hostile mob bricked into a cell of Copper Bars ---
# @r caps this at one candidate player per five-second cycle, the same bound the other
# block scans in this pack use. The detector then looks at exactly one mob.
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/cell_block=false}] at @s run function bacaphd:detect/cell_block

# --- Alt+F4 (solo3): the lifetime leave_game statistic, deliberately unmirrored ---
# This is the one absolute statistic in the batch and it is meant to be. The Statistics
# tab counts a whole save's history; every other counter here starts from zero at install.
# The criterion is the one BACAP itself already tracks as bac_quit, so it is known to parse.
execute as @a[gamemode=!spectator,advancements={bacaphd:statistics/alt_f4=false},scores={bacaphd_quit=1000..}] run advancement grant @s only bacaphd:statistics/alt_f4
# --- Wall to Wall (solo4): 19x19 at feet level, 256 carpets needed. @r caps the cost
# --- at one candidate player per 5s cycle, as with the existing region scans.
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/wall_to_wall=false}] at @s run function bacaphd:detect/wall_to_wall
# --- Flying Buttress (solo4): a 21-block-check height gate sits in front of the
# --- expensive wall and candle passes, so the usual cost of this line is 21 checks.
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/flying_buttress=false}] at @s run function bacaphd:detect/flying_buttress
# --- Weathering Heights (solo4): 11x5x11, four short-circuiting run tests per position.
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/weathering_heights=false}] at @s run function bacaphd:detect/weathering_heights
# --- Butterfingers (solo4): a plain statistic threshold, no detection function.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/butterfingers=false},scores={bacaphd_drop=10000..}] run advancement grant @s only bacaphd:statistics/butterfingers
# --- Weapon Rack (solo6): seven weapon classes hung in Item Frames within twelve blocks ---
execute as @a[gamemode=!spectator,advancements={bacaphd:weaponry/weapon_rack=false}] at @s if entity @e[type=minecraft:item_frame,distance=..12,limit=1] run function bacaphd:detect/weapon_rack
# --- Wide Awake (B5). 'time query daytime' does not parse here; gametime does, and
# --- the time of day is gametime within the current day. 13000..22999 is the night.
execute store result score #b5_daytime bacaphd_tmp run time query gametime
scoreboard players operation #b5_daytime bacaphd_tmp %= #b5_daylen bacaphd_const
execute if score #b5_daytime bacaphd_tmp matches 13000..22999 as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/wide_awake=false},scores={bacaphd_init_b5=1}] at @s run function bacaphd:detect/wide_awake
execute unless score #b5_daytime bacaphd_tmp matches 13000..22999 run scoreboard players set @a bacaphd_wa 0

# --- Dead Reckoning (B5). The reset lines run BEFORE the detector: a player who is
# --- not currently proven to be gliding has landed, or never launched, and the run
# --- is over. The detector then revokes the criterion again for the next sample.
execute as @a[advancements={bacaphd:end/dead_reckoning=false}] unless entity @s[advancements={bacaphd:end/dead_reckoning={gliding=true}}] run scoreboard players set @s bacaphd_glide 0
execute as @a[advancements={bacaphd:end/dead_reckoning=false}] unless entity @s[advancements={bacaphd:end/dead_reckoning={gliding=true}}] run scoreboard players set @s bacaphd_gl_prev 0
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_b5=1},advancements={bacaphd:end/dead_reckoning={gliding=true}}] unless entity @s[advancements={bacaphd:end/dead_reckoning=true}] at @s run function bacaphd:detect/dead_reckoning

# --- Green Fingers (B5): a lifetime Statistics grind, so no detector and no mirror.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/green_fingers=false},scores={bacaphd_pot=250..}] run advancement grant @s only bacaphd:statistics/green_fingers
# All Eyes on Me - the one-block gate is also the 'standing among them' condition.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/all_eyes_on_me=false}] at @s if block ~ ~ ~ minecraft:open_eyeblossom run function bacaphd:detect/all_eyes_on_me
# Fort Knox - you have to be standing on obsidian before anything is scanned.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/fort_knox=false}] at @s if block ~ ~-1 ~ minecraft:obsidian run function bacaphd:detect/fort_knox
# Grand Central - four cheap gates, at most one of which can match, so the 9x9
# walk runs once and only for a player standing in a rail block.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/grand_central=false}] at @s if block ~ ~ ~ minecraft:rail run function bacaphd:detect/grand_central
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/grand_central=false}] at @s if block ~ ~ ~ minecraft:powered_rail run function bacaphd:detect/grand_central
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/grand_central=false}] at @s if block ~ ~ ~ minecraft:detector_rail run function bacaphd:detect/grand_central
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/grand_central=false}] at @s if block ~ ~ ~ minecraft:activator_rail run function bacaphd:detect/grand_central
# Bull in a China Shop - a plain statistic threshold, no detection function, the
# same shape as Wind Walker. Absolute lifetime count by design: Statistics tab.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/bull_in_a_china_shop=false},scores={bacaphd_pots=20..}] run advancement grant @s only bacaphd:statistics/bull_in_a_china_shop
# --- Lighthouse Keeper (solo1): one block test gates the thirty-block column walk ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/lighthouse_keeper=false}] at @s align xyz if block ~ ~-1 ~ minecraft:sea_lantern run function bacaphd:detect/lighthouse_keeper

# --- Shulker Removal Service (solo1): clearing one End City ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/shulker_removal_service=false},scores={bacaphd_solo1_init=1}] at @s if dimension minecraft:the_end run function bacaphd:detect/shulker_removal_service

# --- Fortress of Solitude (solo1): a full day inside the structure ---
execute as @a[gamemode=!spectator,advancements={bacaphd:nether/fortress_of_solitude=false}] run function bacaphd:detect/fortress_of_solitude

# --- Slow Burn (solo1): sixteen four-tick Repeaters in one straight powered line ---
# The player stands on the run. The anchor is the aligned block under their feet; the
# walk then counts contiguous four-tick Repeaters both ways along X, tests, resets to
# the anchor, and does the same along Z, so the two axes are never added together.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false}] run scoreboard players set @s bacaphd_slowburn 0
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false}] run scoreboard players set @s bacaphd_slowburn_p 0
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false}] at @s align xyz if block ~ ~ ~ minecraft:repeater[delay=4] run scoreboard players set @s bacaphd_slowburn 1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false}] at @s align xyz if block ~ ~ ~ minecraft:repeater[delay=4,powered=true] run scoreboard players set @s bacaphd_slowburn_p 1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false},scores={bacaphd_slowburn=1..}] at @s align xyz positioned ~0.5 ~0.5 ~0.5 rotated -90 0 run function bacaphd:detect/slow_burn
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false},scores={bacaphd_slowburn=1..}] at @s align xyz positioned ~0.5 ~0.5 ~0.5 rotated 90 0 run function bacaphd:detect/slow_burn
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false},scores={bacaphd_slowburn=16..,bacaphd_slowburn_p=1}] run advancement grant @s only bacaphd:redstone/slow_burn
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false}] run scoreboard players set @s bacaphd_slowburn 0
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false}] at @s align xyz if block ~ ~ ~ minecraft:repeater[delay=4] run scoreboard players set @s bacaphd_slowburn 1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false},scores={bacaphd_slowburn=1..}] at @s align xyz positioned ~0.5 ~0.5 ~0.5 rotated 0 0 run function bacaphd:detect/slow_burn
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false},scores={bacaphd_slowburn=1..}] at @s align xyz positioned ~0.5 ~0.5 ~0.5 rotated 180 0 run function bacaphd:detect/slow_burn
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slow_burn=false},scores={bacaphd_slowburn=16..,bacaphd_slowburn_p=1}] run advancement grant @s only bacaphd:redstone/slow_burn
# --- Palace Guard (S8): an Armour Stand holding a Spear and a Shield ---
# The tag both gates the scan and carries the executing player's identity across the
# `as @e` hop. `as` changes the executor but NOT the position, which is still the
# player's, so distance=..0.5 in the grant resolves back to exactly the player who ran
# the check rather than to whoever happens to be nearest the stand.
tag @a[gamemode=!spectator,advancements={bacaphd:building/palace_guard=false}] add bacaphd.pguard
execute as @a[tag=bacaphd.pguard] at @s as @e[type=minecraft:armor_stand,distance=..8,limit=8] if items entity @s weapon.mainhand #blazeandcave:spears if items entity @s weapon.offhand minecraft:shield run advancement grant @a[tag=bacaphd.pguard,distance=..0.5] only bacaphd:building/palace_guard
tag @a[tag=bacaphd.pguard] remove bacaphd.pguard

# --- Rotisserie (S8): a stack of Cooked Chicken you never cooked yourself ---
# The stack is a real inventory_changed criterion on the advancement; this line only
# releases the impossible guard, and only while the player's lifetime
# crafted:cooked_chicken count is still zero. `unless score ... matches 1..` rather
# than `scores={...=0}` on purpose: a player whose statistic score has never been
# written has no score entry at all and `scores=` would silently never match.
execute as @a[gamemode=!spectator,advancements={bacaphd:farming/rotisserie={stack=true}}] unless score @s bacaphd_ckcraft matches 1.. run advancement grant @s only bacaphd:farming/rotisserie

# --- Assembly Line (S8): five Crafters chained through four Hoppers ---
execute as @a[gamemode=!spectator,advancements={bacaphd:redstone/assembly_line=false}] at @s run function bacaphd:detect/assembly_line
# --- Bread Winner (solo9): births are counted once each, so a ready-made village pays nothing ---
execute as @a[gamemode=!spectator,advancements={bacaphd:adventure/bread_winner=false}] at @s if entity @e[type=minecraft:villager,distance=..48,limit=1] run function bacaphd:detect/bread_winner
# --- Door to Door marker sweep (solo9): deliberately NOT gated on the advancement, so markers cannot
# --- survive the grant and litter the world. A door with no breaker left on it is no longer tracked.
execute as @a[gamemode=!spectator] at @s as @e[type=minecraft:marker,tag=bacaphd.dd,distance=..48] at @s unless entity @e[type=minecraft:zombie,distance=..4,nbt={CanBreakDoors:1b},limit=1] run kill @s
# --- Golem Foundry: a natural Iron Golem inside a village of ten or more Villagers.
# --- gamemode=!creative because a creative spawn egg also produces PlayerCreated:0b.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/golem_foundry=false}] at @s if dimension minecraft:overworld run function bacaphd:detect/golem_foundry
# --- Crowd Scene: fifty Armour Stands placed. ItemStack.useOn awards ITEM_USED for
# --- any item successfully used on a block, which is how the pack's Copper Torch and
# --- Shelf counters already work. No mirror on purpose: this is a Statistics-tab
# --- grind goal, the one case where an absolute lifetime total is the right measure.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/crowd_scene=false},scores={bacaphd_astand=50..}] run advancement grant @s only bacaphd:statistics/crowd_scene
# --- Firefly Lane: 17 x 5 x 17 bounded walk, one candidate player per 5s cycle.
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/firefly_lane=false}] at @s run function bacaphd:detect/firefly_lane
# --- The Scenic Route (solo7): distance from the world origin, every five seconds.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/the_scenic_route=false}] run function bacaphd:detect/scenic_route
# --- Urban Decay (solo7): reached only while standing inside an Ancient City, and only
# --- until the impossible guard is granted along with the rest of the advancement.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/urban_decay={city=true,impossible=false}}] run function bacaphd:detect/urban_decay
# --- Patient Investor (B8): a Copper Block left alone until it turns green ---
# The world day is read ONCE per cycle into #hd12_day, before anything reads it, so no
# player's clock can ever be started from an unset value.
execute store result score #hd12_day bacaphd_day run time query day
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/patient_investor={placed=true}}] unless entity @s[advancements={bacaphd:mining/patient_investor=true}] run function bacaphd:detect/patient_investor
# --- Parrot-phrase (B4): a tamed Parrot with a monster inside its imitation radius ---
# The parrot is anchored first, so the twenty-block hostile check is measured from the
# BIRD, not from the player. `on owner` proves the parrot is tamed - an untamed one has
# no owner and the chain simply ends - and hands the grant to the player who tamed it.
execute as @a[gamemode=!spectator,advancements={bacaphd:animal/parrot_phrase=false}] at @s as @e[type=minecraft:parrot,distance=..8,limit=4] at @s if entity @e[type=#blazeandcave:hostile_monsters,distance=..20,limit=1] on owner run advancement grant @s[advancements={bacaphd:animal/parrot_phrase=false}] only bacaphd:animal/parrot_phrase
# --- Tickling the Ivories (B12): twenty-five tuned Note Blocks in a line ---
# @r picks at most ONE candidate player per cycle, the same cost cap the other region
# scans in this bucket already use.
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/tickling_the_ivories=false}] if data entity @s {DeathTime:0s} at @s run function bacaphd:detect/tickling_the_ivories
# --- Circular Reasoning (B13): a closed four-Observer ring.
# @r picks at most ONE candidate player per 5 s cycle, so the 36-chain block scan is
# capped no matter how many players still lack it - same discipline as Sorting
# Facility, Clock Tower, Copper Counter and Monochrome.
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/circular_reasoning=false}] at @s run function bacaphd:detect/circular_reasoning
# Bounded region scans. @r picks at most ONE candidate player per 5 s cycle, so the
# cost of each is capped no matter how many players still lack them.
# Biome Sandwich - 5 sample positions x 54 guarded biome tests, Overworld only.
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biome_sandwich=false}] at @s if dimension minecraft:overworld run function bacaphd:detect/biome_sandwich
# Entrapment - 16x4x16, the same shape as Sorting Facility.
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/entrapment=false}] at @s run function bacaphd:detect/entrapment
# Spawner Camper: lift the damaged lock once the run is over, so the next chamber
# starts clean. Five seconds is longer than the gap between probe passes, so it
# cannot lift mid-wave and re-forgive damage.
execute as @a[scores={bacaphd_sc_ok=..-1}] run scoreboard players set @s bacaphd_sc_ok 0
# --- ladder: adventure_pillager_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_pillager_kills_1=false},scores={bacaphd_l_adventure_pillager_kills=100..}] run advancement grant @s only bacaphd:adventure/adventure_pillager_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_pillager_kills_2=false},scores={bacaphd_l_adventure_pillager_kills=750..}] run advancement grant @s only bacaphd:adventure/adventure_pillager_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_pillager_kills_3=false},scores={bacaphd_l_adventure_pillager_kills=4000..}] run advancement grant @s only bacaphd:adventure/adventure_pillager_kills_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_pillager_kills_4=false},scores={bacaphd_l_adventure_pillager_kills=15000..}] run advancement grant @s only bacaphd:adventure/adventure_pillager_kills_4
# --- ladder: adventure_vindicator_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_vindicator_kills_1=false},scores={bacaphd_l_adventure_vindicator_kills=50..}] run advancement grant @s only bacaphd:adventure/adventure_vindicator_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_vindicator_kills_2=false},scores={bacaphd_l_adventure_vindicator_kills=400..}] run advancement grant @s only bacaphd:adventure/adventure_vindicator_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_vindicator_kills_3=false},scores={bacaphd_l_adventure_vindicator_kills=2000..}] run advancement grant @s only bacaphd:adventure/adventure_vindicator_kills_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_vindicator_kills_4=false},scores={bacaphd_l_adventure_vindicator_kills=8000..}] run advancement grant @s only bacaphd:adventure/adventure_vindicator_kills_4
# --- ladder: adventure_evoker_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_evoker_kills_1=false},scores={bacaphd_l_adventure_evoker_kills=10..}] run advancement grant @s only bacaphd:adventure/adventure_evoker_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_evoker_kills_2=false},scores={bacaphd_l_adventure_evoker_kills=75..}] run advancement grant @s only bacaphd:adventure/adventure_evoker_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_evoker_kills_3=false},scores={bacaphd_l_adventure_evoker_kills=300..}] run advancement grant @s only bacaphd:adventure/adventure_evoker_kills_3
# --- ladder: adventure_ravager_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_ravager_kills_1=false},scores={bacaphd_l_adventure_ravager_kills=10..}] run advancement grant @s only bacaphd:adventure/adventure_ravager_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_ravager_kills_2=false},scores={bacaphd_l_adventure_ravager_kills=75..}] run advancement grant @s only bacaphd:adventure/adventure_ravager_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_ravager_kills_3=false},scores={bacaphd_l_adventure_ravager_kills=350..}] run advancement grant @s only bacaphd:adventure/adventure_ravager_kills_3
# --- ladder: adventure_witch_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_witch_kills_1=false},scores={bacaphd_l_adventure_witch_kills=50..}] run advancement grant @s only bacaphd:adventure/adventure_witch_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_witch_kills_2=false},scores={bacaphd_l_adventure_witch_kills=400..}] run advancement grant @s only bacaphd:adventure/adventure_witch_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_witch_kills_3=false},scores={bacaphd_l_adventure_witch_kills=2000..}] run advancement grant @s only bacaphd:adventure/adventure_witch_kills_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_witch_kills_4=false},scores={bacaphd_l_adventure_witch_kills=8000..}] run advancement grant @s only bacaphd:adventure/adventure_witch_kills_4
# --- ladder: adventure_vex_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_vex_kills_1=false},scores={bacaphd_l_adventure_vex_kills=25..}] run advancement grant @s only bacaphd:adventure/adventure_vex_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_vex_kills_2=false},scores={bacaphd_l_adventure_vex_kills=200..}] run advancement grant @s only bacaphd:adventure/adventure_vex_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_vex_kills_3=false},scores={bacaphd_l_adventure_vex_kills=1000..}] run advancement grant @s only bacaphd:adventure/adventure_vex_kills_3
# --- ladder: adventure_ominous_bottles ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_ominous_bottles_1=false},scores={bacaphd_l_adventure_ominous_bottles=10..}] run advancement grant @s only bacaphd:adventure/adventure_ominous_bottles_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_ominous_bottles_2=false},scores={bacaphd_l_adventure_ominous_bottles=60..}] run advancement grant @s only bacaphd:adventure/adventure_ominous_bottles_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_ominous_bottles_3=false},scores={bacaphd_l_adventure_ominous_bottles=250..}] run advancement grant @s only bacaphd:adventure/adventure_ominous_bottles_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_ominous_bottles_4=false},scores={bacaphd_l_adventure_ominous_bottles=1000..}] run advancement grant @s only bacaphd:adventure/adventure_ominous_bottles_4
# --- ladder: adventure_emerald_blocks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_emerald_blocks_1=false},scores={bacaphd_l_adventure_emerald_blocks=16..}] run advancement grant @s only bacaphd:adventure/adventure_emerald_blocks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_emerald_blocks_2=false},scores={bacaphd_l_adventure_emerald_blocks=128..}] run advancement grant @s only bacaphd:adventure/adventure_emerald_blocks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_emerald_blocks_3=false},scores={bacaphd_l_adventure_emerald_blocks=640..}] run advancement grant @s only bacaphd:adventure/adventure_emerald_blocks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_emerald_blocks_4=false},scores={bacaphd_l_adventure_emerald_blocks=3000..}] run advancement grant @s only bacaphd:adventure/adventure_emerald_blocks_4
# --- ladder: adventure_iron_golem_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_iron_golem_kills_1=false},scores={bacaphd_l_adventure_iron_golem_kills=25..}] run advancement grant @s only bacaphd:adventure/adventure_iron_golem_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_iron_golem_kills_2=false},scores={bacaphd_l_adventure_iron_golem_kills=250..}] run advancement grant @s only bacaphd:adventure/adventure_iron_golem_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_iron_golem_kills_3=false},scores={bacaphd_l_adventure_iron_golem_kills=2500..}] run advancement grant @s only bacaphd:adventure/adventure_iron_golem_kills_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_iron_golem_kills_4=false},scores={bacaphd_l_adventure_iron_golem_kills=12500..}] run advancement grant @s only bacaphd:adventure/adventure_iron_golem_kills_4
# --- ladder: adventure_villager_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_villager_kills_1=false},scores={bacaphd_l_adventure_villager_kills=10..}] run advancement grant @s only bacaphd:adventure/adventure_villager_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_villager_kills_2=false},scores={bacaphd_l_adventure_villager_kills=60..}] run advancement grant @s only bacaphd:adventure/adventure_villager_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_villager_kills_3=false},scores={bacaphd_l_adventure_villager_kills=250..}] run advancement grant @s only bacaphd:adventure/adventure_villager_kills_3
# --- ladder: adventure_trader_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_trader_kills_1=false},scores={bacaphd_l_adventure_trader_kills=5..}] run advancement grant @s only bacaphd:adventure/adventure_trader_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_trader_kills_2=false},scores={bacaphd_l_adventure_trader_kills=30..}] run advancement grant @s only bacaphd:adventure/adventure_trader_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_trader_kills_3=false},scores={bacaphd_l_adventure_trader_kills=150..}] run advancement grant @s only bacaphd:adventure/adventure_trader_kills_3
# --- ladder: adventure_name_tags ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_name_tags_1=false},scores={bacaphd_l_adventure_name_tags=10..}] run advancement grant @s only bacaphd:adventure/adventure_name_tags_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_name_tags_2=false},scores={bacaphd_l_adventure_name_tags=75..}] run advancement grant @s only bacaphd:adventure/adventure_name_tags_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_name_tags_3=false},scores={bacaphd_l_adventure_name_tags=300..}] run advancement grant @s only bacaphd:adventure/adventure_name_tags_3
# --- ladder: adventure_trial_keys ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_trial_keys_1=false},scores={bacaphd_l_adventure_trial_keys=50..}] run advancement grant @s only bacaphd:adventure/adventure_trial_keys_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_trial_keys_2=false},scores={bacaphd_l_adventure_trial_keys=250..}] run advancement grant @s only bacaphd:adventure/adventure_trial_keys_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_trial_keys_3=false},scores={bacaphd_l_adventure_trial_keys=1000..}] run advancement grant @s only bacaphd:adventure/adventure_trial_keys_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_trial_keys_4=false},scores={bacaphd_l_adventure_trial_keys=4000..}] run advancement grant @s only bacaphd:adventure/adventure_trial_keys_4
# --- ladder: adventure_ominous_trial_keys ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_ominous_trial_keys_1=false},scores={bacaphd_l_adventure_ominous_trial_keys=10..}] run advancement grant @s only bacaphd:adventure/adventure_ominous_trial_keys_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_ominous_trial_keys_2=false},scores={bacaphd_l_adventure_ominous_trial_keys=75..}] run advancement grant @s only bacaphd:adventure/adventure_ominous_trial_keys_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_ominous_trial_keys_3=false},scores={bacaphd_l_adventure_ominous_trial_keys=350..}] run advancement grant @s only bacaphd:adventure/adventure_ominous_trial_keys_3
# --- ladder: adventure_wind_charges ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_wind_charges_1=false},scores={bacaphd_l_adventure_wind_charges=100..}] run advancement grant @s only bacaphd:adventure/adventure_wind_charges_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_wind_charges_2=false},scores={bacaphd_l_adventure_wind_charges=800..}] run advancement grant @s only bacaphd:adventure/adventure_wind_charges_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_wind_charges_3=false},scores={bacaphd_l_adventure_wind_charges=4000..}] run advancement grant @s only bacaphd:adventure/adventure_wind_charges_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_wind_charges_4=false},scores={bacaphd_l_adventure_wind_charges=15000..}] run advancement grant @s only bacaphd:adventure/adventure_wind_charges_4
# --- ladder: adventure_breeze_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_breeze_kills_1=false},scores={bacaphd_l_adventure_breeze_kills=25..}] run advancement grant @s only bacaphd:adventure/adventure_breeze_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_breeze_kills_2=false},scores={bacaphd_l_adventure_breeze_kills=150..}] run advancement grant @s only bacaphd:adventure/adventure_breeze_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_breeze_kills_3=false},scores={bacaphd_l_adventure_breeze_kills=750..}] run advancement grant @s only bacaphd:adventure/adventure_breeze_kills_3
# --- ladder: adventure_guardian_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_guardian_kills_1=false},scores={bacaphd_l_adventure_guardian_kills=100..}] run advancement grant @s only bacaphd:adventure/adventure_guardian_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_guardian_kills_2=false},scores={bacaphd_l_adventure_guardian_kills=1000..}] run advancement grant @s only bacaphd:adventure/adventure_guardian_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_guardian_kills_3=false},scores={bacaphd_l_adventure_guardian_kills=5000..}] run advancement grant @s only bacaphd:adventure/adventure_guardian_kills_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_guardian_kills_4=false},scores={bacaphd_l_adventure_guardian_kills=20000..}] run advancement grant @s only bacaphd:adventure/adventure_guardian_kills_4
# --- ladder: adventure_elder_guardian_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_elder_guardian_kills_1=false},scores={bacaphd_l_adventure_elder_guardian_kills=3..}] run advancement grant @s only bacaphd:adventure/adventure_elder_guardian_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_elder_guardian_kills_2=false},scores={bacaphd_l_adventure_elder_guardian_kills=20..}] run advancement grant @s only bacaphd:adventure/adventure_elder_guardian_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_elder_guardian_kills_3=false},scores={bacaphd_l_adventure_elder_guardian_kills=100..}] run advancement grant @s only bacaphd:adventure/adventure_elder_guardian_kills_3
# --- ladder: adventure_sponge_haul ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_sponge_haul_1=false},scores={bacaphd_l_adventure_sponge_haul=64..}] run advancement grant @s only bacaphd:adventure/adventure_sponge_haul_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_sponge_haul_2=false},scores={bacaphd_l_adventure_sponge_haul=384..}] run advancement grant @s only bacaphd:adventure/adventure_sponge_haul_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_sponge_haul_3=false},scores={bacaphd_l_adventure_sponge_haul=1536..}] run advancement grant @s only bacaphd:adventure/adventure_sponge_haul_3
# --- ladder: adventure_prismarine_haul ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_prismarine_haul_1=false},scores={bacaphd_l_adventure_prismarine_haul=1000..}] run advancement grant @s only bacaphd:adventure/adventure_prismarine_haul_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_prismarine_haul_2=false},scores={bacaphd_l_adventure_prismarine_haul=8000..}] run advancement grant @s only bacaphd:adventure/adventure_prismarine_haul_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_prismarine_haul_3=false},scores={bacaphd_l_adventure_prismarine_haul=40000..}] run advancement grant @s only bacaphd:adventure/adventure_prismarine_haul_3
# --- ladder: adventure_empty_maps ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_empty_maps_1=false},scores={bacaphd_l_adventure_empty_maps=16..}] run advancement grant @s only bacaphd:adventure/adventure_empty_maps_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_empty_maps_2=false},scores={bacaphd_l_adventure_empty_maps=128..}] run advancement grant @s only bacaphd:adventure/adventure_empty_maps_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_empty_maps_3=false},scores={bacaphd_l_adventure_empty_maps=640..}] run advancement grant @s only bacaphd:adventure/adventure_empty_maps_3
# --- ladder: adventure_filled_maps ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_filled_maps_1=false},scores={bacaphd_l_adventure_filled_maps=32..}] run advancement grant @s only bacaphd:adventure/adventure_filled_maps_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_filled_maps_2=false},scores={bacaphd_l_adventure_filled_maps=256..}] run advancement grant @s only bacaphd:adventure/adventure_filled_maps_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_filled_maps_3=false},scores={bacaphd_l_adventure_filled_maps=1024..}] run advancement grant @s only bacaphd:adventure/adventure_filled_maps_3
# --- ladder: adventure_spyglass_use ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_spyglass_use_1=false},scores={bacaphd_l_adventure_spyglass_use=100..}] run advancement grant @s only bacaphd:adventure/adventure_spyglass_use_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_spyglass_use_2=false},scores={bacaphd_l_adventure_spyglass_use=800..}] run advancement grant @s only bacaphd:adventure/adventure_spyglass_use_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_spyglass_use_3=false},scores={bacaphd_l_adventure_spyglass_use=4000..}] run advancement grant @s only bacaphd:adventure/adventure_spyglass_use_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_spyglass_use_4=false},scores={bacaphd_l_adventure_spyglass_use=15000..}] run advancement grant @s only bacaphd:adventure/adventure_spyglass_use_4
# --- ladder: adventure_brush_use ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_brush_use_1=false},scores={bacaphd_l_adventure_brush_use=100..}] run advancement grant @s only bacaphd:adventure/adventure_brush_use_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_brush_use_2=false},scores={bacaphd_l_adventure_brush_use=750..}] run advancement grant @s only bacaphd:adventure/adventure_brush_use_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_brush_use_3=false},scores={bacaphd_l_adventure_brush_use=3000..}] run advancement grant @s only bacaphd:adventure/adventure_brush_use_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_brush_use_4=false},scores={bacaphd_l_adventure_brush_use=10000..}] run advancement grant @s only bacaphd:adventure/adventure_brush_use_4
# --- ladder: adventure_decorated_pots ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_decorated_pots_1=false},scores={bacaphd_l_adventure_decorated_pots=16..}] run advancement grant @s only bacaphd:adventure/adventure_decorated_pots_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_decorated_pots_2=false},scores={bacaphd_l_adventure_decorated_pots=128..}] run advancement grant @s only bacaphd:adventure/adventure_decorated_pots_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_decorated_pots_3=false},scores={bacaphd_l_adventure_decorated_pots=512..}] run advancement grant @s only bacaphd:adventure/adventure_decorated_pots_3
# --- ladder: adventure_totem_pops ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_totem_pops_1=false},scores={bacaphd_l_adventure_totem_pops=5..}] run advancement grant @s only bacaphd:adventure/adventure_totem_pops_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_totem_pops_2=false},scores={bacaphd_l_adventure_totem_pops=30..}] run advancement grant @s only bacaphd:adventure/adventure_totem_pops_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_totem_pops_3=false},scores={bacaphd_l_adventure_totem_pops=150..}] run advancement grant @s only bacaphd:adventure/adventure_totem_pops_3
# --- ladder: adventure_goat_horns ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_goat_horns_1=false},scores={bacaphd_l_adventure_goat_horns=25..}] run advancement grant @s only bacaphd:adventure/adventure_goat_horns_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_goat_horns_2=false},scores={bacaphd_l_adventure_goat_horns=150..}] run advancement grant @s only bacaphd:adventure/adventure_goat_horns_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_goat_horns_3=false},scores={bacaphd_l_adventure_goat_horns=600..}] run advancement grant @s only bacaphd:adventure/adventure_goat_horns_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_goat_horns_4=false},scores={bacaphd_l_adventure_goat_horns=2000..}] run advancement grant @s only bacaphd:adventure/adventure_goat_horns_4
# --- ladder: adventure_zombie_villager_kills ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_zombie_villager_kills_1=false},scores={bacaphd_l_adventure_zombie_villager_kills=100..}] run advancement grant @s only bacaphd:adventure/adventure_zombie_villager_kills_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_zombie_villager_kills_2=false},scores={bacaphd_l_adventure_zombie_villager_kills=500..}] run advancement grant @s only bacaphd:adventure/adventure_zombie_villager_kills_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_zombie_villager_kills_3=false},scores={bacaphd_l_adventure_zombie_villager_kills=2000..}] run advancement grant @s only bacaphd:adventure/adventure_zombie_villager_kills_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_zombie_villager_kills_4=false},scores={bacaphd_l_adventure_zombie_villager_kills=6000..}] run advancement grant @s only bacaphd:adventure/adventure_zombie_villager_kills_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_zombie_villager_kills_5=false},scores={bacaphd_l_adventure_zombie_villager_kills=15000..}] run advancement grant @s only bacaphd:adventure/adventure_zombie_villager_kills_5
# --- ladder: adventure_chest_looting ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_chest_looting_1=false},scores={bacaphd_l_adventure_chest_looting=100..}] run advancement grant @s only bacaphd:adventure/adventure_chest_looting_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_chest_looting_2=false},scores={bacaphd_l_adventure_chest_looting=500..}] run advancement grant @s only bacaphd:adventure/adventure_chest_looting_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_chest_looting_3=false},scores={bacaphd_l_adventure_chest_looting=2000..}] run advancement grant @s only bacaphd:adventure/adventure_chest_looting_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_chest_looting_4=false},scores={bacaphd_l_adventure_chest_looting=6000..}] run advancement grant @s only bacaphd:adventure/adventure_chest_looting_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_chest_looting_5=false},scores={bacaphd_l_adventure_chest_looting=15000..}] run advancement grant @s only bacaphd:adventure/adventure_chest_looting_5
# --- ladder: adventure_spawner_breaks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_spawner_breaks_1=false},scores={bacaphd_l_adventure_spawner_breaks=10..}] run advancement grant @s only bacaphd:adventure/adventure_spawner_breaks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_spawner_breaks_2=false},scores={bacaphd_l_adventure_spawner_breaks=50..}] run advancement grant @s only bacaphd:adventure/adventure_spawner_breaks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_spawner_breaks_3=false},scores={bacaphd_l_adventure_spawner_breaks=150..}] run advancement grant @s only bacaphd:adventure/adventure_spawner_breaks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_spawner_breaks_4=false},scores={bacaphd_l_adventure_spawner_breaks=500..}] run advancement grant @s only bacaphd:adventure/adventure_spawner_breaks_4
# --- ladder: adventure_mossy_cobblestone ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_mossy_cobblestone_1=false},scores={bacaphd_l_adventure_mossy_cobblestone=200..}] run advancement grant @s only bacaphd:adventure/adventure_mossy_cobblestone_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_mossy_cobblestone_2=false},scores={bacaphd_l_adventure_mossy_cobblestone=1000..}] run advancement grant @s only bacaphd:adventure/adventure_mossy_cobblestone_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_mossy_cobblestone_3=false},scores={bacaphd_l_adventure_mossy_cobblestone=4000..}] run advancement grant @s only bacaphd:adventure/adventure_mossy_cobblestone_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_mossy_cobblestone_4=false},scores={bacaphd_l_adventure_mossy_cobblestone=10000..}] run advancement grant @s only bacaphd:adventure/adventure_mossy_cobblestone_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_mossy_cobblestone_5=false},scores={bacaphd_l_adventure_mossy_cobblestone=25000..}] run advancement grant @s only bacaphd:adventure/adventure_mossy_cobblestone_5
# --- ladder: adventure_sea_lanterns ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_sea_lanterns_1=false},scores={bacaphd_l_adventure_sea_lanterns=64..}] run advancement grant @s only bacaphd:adventure/adventure_sea_lanterns_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_sea_lanterns_2=false},scores={bacaphd_l_adventure_sea_lanterns=384..}] run advancement grant @s only bacaphd:adventure/adventure_sea_lanterns_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_sea_lanterns_3=false},scores={bacaphd_l_adventure_sea_lanterns=1536..}] run advancement grant @s only bacaphd:adventure/adventure_sea_lanterns_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/adventure_sea_lanterns_4=false},scores={bacaphd_l_adventure_sea_lanterns=5000..}] run advancement grant @s only bacaphd:adventure/adventure_sea_lanterns_4
# --- ladder: animal_cattle_cull ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_cattle_cull_1=false},scores={bacaphd_l_animal_cattle_cull=100..}] run advancement grant @s only bacaphd:animal/animal_cattle_cull_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_cattle_cull_2=false},scores={bacaphd_l_animal_cattle_cull=600..}] run advancement grant @s only bacaphd:animal/animal_cattle_cull_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_cattle_cull_3=false},scores={bacaphd_l_animal_cattle_cull=3000..}] run advancement grant @s only bacaphd:animal/animal_cattle_cull_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_cattle_cull_4=false},scores={bacaphd_l_animal_cattle_cull=15000..}] run advancement grant @s only bacaphd:animal/animal_cattle_cull_4
# --- ladder: animal_pork_barrel ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_pork_barrel_1=false},scores={bacaphd_l_animal_pork_barrel=200..}] run advancement grant @s only bacaphd:animal/animal_pork_barrel_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_pork_barrel_2=false},scores={bacaphd_l_animal_pork_barrel=1500..}] run advancement grant @s only bacaphd:animal/animal_pork_barrel_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_pork_barrel_3=false},scores={bacaphd_l_animal_pork_barrel=8000..}] run advancement grant @s only bacaphd:animal/animal_pork_barrel_3
# --- ladder: animal_mutton_market ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_mutton_market_1=false},scores={bacaphd_l_animal_mutton_market=200..}] run advancement grant @s only bacaphd:animal/animal_mutton_market_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_mutton_market_2=false},scores={bacaphd_l_animal_mutton_market=1500..}] run advancement grant @s only bacaphd:animal/animal_mutton_market_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_mutton_market_3=false},scores={bacaphd_l_animal_mutton_market=8000..}] run advancement grant @s only bacaphd:animal/animal_mutton_market_3
# --- ladder: animal_poultry_purge ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_poultry_purge_1=false},scores={bacaphd_l_animal_poultry_purge=150..}] run advancement grant @s only bacaphd:animal/animal_poultry_purge_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_poultry_purge_2=false},scores={bacaphd_l_animal_poultry_purge=900..}] run advancement grant @s only bacaphd:animal/animal_poultry_purge_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_poultry_purge_3=false},scores={bacaphd_l_animal_poultry_purge=4500..}] run advancement grant @s only bacaphd:animal/animal_poultry_purge_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_poultry_purge_4=false},scores={bacaphd_l_animal_poultry_purge=20000..}] run advancement grant @s only bacaphd:animal/animal_poultry_purge_4
# --- ladder: animal_hasenpfeffer ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_hasenpfeffer_1=false},scores={bacaphd_l_animal_hasenpfeffer=100..}] run advancement grant @s only bacaphd:animal/animal_hasenpfeffer_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_hasenpfeffer_2=false},scores={bacaphd_l_animal_hasenpfeffer=700..}] run advancement grant @s only bacaphd:animal/animal_hasenpfeffer_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_hasenpfeffer_3=false},scores={bacaphd_l_animal_hasenpfeffer=3500..}] run advancement grant @s only bacaphd:animal/animal_hasenpfeffer_3
# --- ladder: animal_goat_reckoning ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_goat_reckoning_1=false},scores={bacaphd_l_animal_goat_reckoning=50..}] run advancement grant @s only bacaphd:animal/animal_goat_reckoning_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_goat_reckoning_2=false},scores={bacaphd_l_animal_goat_reckoning=300..}] run advancement grant @s only bacaphd:animal/animal_goat_reckoning_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_goat_reckoning_3=false},scores={bacaphd_l_animal_goat_reckoning=1500..}] run advancement grant @s only bacaphd:animal/animal_goat_reckoning_3
# --- ladder: animal_cod_harvest ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_cod_harvest_1=false},scores={bacaphd_l_animal_cod_harvest=250..}] run advancement grant @s only bacaphd:animal/animal_cod_harvest_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_cod_harvest_2=false},scores={bacaphd_l_animal_cod_harvest=2000..}] run advancement grant @s only bacaphd:animal/animal_cod_harvest_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_cod_harvest_3=false},scores={bacaphd_l_animal_cod_harvest=10000..}] run advancement grant @s only bacaphd:animal/animal_cod_harvest_3
# --- ladder: animal_salmon_run ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_salmon_run_1=false},scores={bacaphd_l_animal_salmon_run=200..}] run advancement grant @s only bacaphd:animal/animal_salmon_run_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_salmon_run_2=false},scores={bacaphd_l_animal_salmon_run=1500..}] run advancement grant @s only bacaphd:animal/animal_salmon_run_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_salmon_run_3=false},scores={bacaphd_l_animal_salmon_run=8000..}] run advancement grant @s only bacaphd:animal/animal_salmon_run_3
# --- ladder: animal_reef_reaper ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_reef_reaper_1=false},scores={bacaphd_l_animal_reef_reaper=100..}] run advancement grant @s only bacaphd:animal/animal_reef_reaper_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_reef_reaper_2=false},scores={bacaphd_l_animal_reef_reaper=700..}] run advancement grant @s only bacaphd:animal/animal_reef_reaper_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_reef_reaper_3=false},scores={bacaphd_l_animal_reef_reaper=3500..}] run advancement grant @s only bacaphd:animal/animal_reef_reaper_3
# --- ladder: animal_ink_economy ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_ink_economy_1=false},scores={bacaphd_l_animal_ink_economy=250..}] run advancement grant @s only bacaphd:animal/animal_ink_economy_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_ink_economy_2=false},scores={bacaphd_l_animal_ink_economy=1750..}] run advancement grant @s only bacaphd:animal/animal_ink_economy_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_ink_economy_3=false},scores={bacaphd_l_animal_ink_economy=9000..}] run advancement grant @s only bacaphd:animal/animal_ink_economy_3
# --- ladder: animal_glowing_depths ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_glowing_depths_1=false},scores={bacaphd_l_animal_glowing_depths=250..}] run advancement grant @s only bacaphd:animal/animal_glowing_depths_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_glowing_depths_2=false},scores={bacaphd_l_animal_glowing_depths=1500..}] run advancement grant @s only bacaphd:animal/animal_glowing_depths_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_glowing_depths_3=false},scores={bacaphd_l_animal_glowing_depths=7500..}] run advancement grant @s only bacaphd:animal/animal_glowing_depths_3
# --- ladder: animal_steak_supper ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_steak_supper_1=false},scores={bacaphd_l_animal_steak_supper=250..}] run advancement grant @s only bacaphd:animal/animal_steak_supper_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_steak_supper_2=false},scores={bacaphd_l_animal_steak_supper=1500..}] run advancement grant @s only bacaphd:animal/animal_steak_supper_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_steak_supper_3=false},scores={bacaphd_l_animal_steak_supper=7500..}] run advancement grant @s only bacaphd:animal/animal_steak_supper_3
# --- ladder: animal_dairy_devotion ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_dairy_devotion_1=false},scores={bacaphd_l_animal_dairy_devotion=50..}] run advancement grant @s only bacaphd:animal/animal_dairy_devotion_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_dairy_devotion_2=false},scores={bacaphd_l_animal_dairy_devotion=300..}] run advancement grant @s only bacaphd:animal/animal_dairy_devotion_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_dairy_devotion_3=false},scores={bacaphd_l_animal_dairy_devotion=1500..}] run advancement grant @s only bacaphd:animal/animal_dairy_devotion_3
# --- ladder: animal_honey_habit ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_honey_habit_1=false},scores={bacaphd_l_animal_honey_habit=250..}] run advancement grant @s only bacaphd:animal/animal_honey_habit_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_honey_habit_2=false},scores={bacaphd_l_animal_honey_habit=1500..}] run advancement grant @s only bacaphd:animal/animal_honey_habit_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_honey_habit_3=false},scores={bacaphd_l_animal_honey_habit=7500..}] run advancement grant @s only bacaphd:animal/animal_honey_habit_3
# --- ladder: animal_egg_barrage ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_egg_barrage_1=false},scores={bacaphd_l_animal_egg_barrage=100..}] run advancement grant @s only bacaphd:animal/animal_egg_barrage_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_egg_barrage_2=false},scores={bacaphd_l_animal_egg_barrage=1000..}] run advancement grant @s only bacaphd:animal/animal_egg_barrage_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_egg_barrage_3=false},scores={bacaphd_l_animal_egg_barrage=6000..}] run advancement grant @s only bacaphd:animal/animal_egg_barrage_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_egg_barrage_4=false},scores={bacaphd_l_animal_egg_barrage=30000..}] run advancement grant @s only bacaphd:animal/animal_egg_barrage_4
# --- ladder: animal_rod_and_reel ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_rod_and_reel_1=false},scores={bacaphd_l_animal_rod_and_reel=500..}] run advancement grant @s only bacaphd:animal/animal_rod_and_reel_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_rod_and_reel_2=false},scores={bacaphd_l_animal_rod_and_reel=3500..}] run advancement grant @s only bacaphd:animal/animal_rod_and_reel_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_rod_and_reel_3=false},scores={bacaphd_l_animal_rod_and_reel=20000..}] run advancement grant @s only bacaphd:animal/animal_rod_and_reel_3
# --- ladder: animal_fish_fry ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_fish_fry_1=false},scores={bacaphd_l_animal_fish_fry=200..}] run advancement grant @s only bacaphd:animal/animal_fish_fry_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_fish_fry_2=false},scores={bacaphd_l_animal_fish_fry=1200..}] run advancement grant @s only bacaphd:animal/animal_fish_fry_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_fish_fry_3=false},scores={bacaphd_l_animal_fish_fry=6000..}] run advancement grant @s only bacaphd:animal/animal_fish_fry_3
# --- ladder: animal_pufferfish_roulette ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_pufferfish_roulette_1=false},scores={bacaphd_l_animal_pufferfish_roulette=16..}] run advancement grant @s only bacaphd:animal/animal_pufferfish_roulette_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_pufferfish_roulette_2=false},scores={bacaphd_l_animal_pufferfish_roulette=96..}] run advancement grant @s only bacaphd:animal/animal_pufferfish_roulette_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_pufferfish_roulette_3=false},scores={bacaphd_l_animal_pufferfish_roulette=500..}] run advancement grant @s only bacaphd:animal/animal_pufferfish_roulette_3
# --- ladder: animal_smokehouse ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_smokehouse_1=false},scores={bacaphd_l_animal_smokehouse=250..}] run advancement grant @s only bacaphd:animal/animal_smokehouse_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_smokehouse_2=false},scores={bacaphd_l_animal_smokehouse=1500..}] run advancement grant @s only bacaphd:animal/animal_smokehouse_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_smokehouse_3=false},scores={bacaphd_l_animal_smokehouse=8000..}] run advancement grant @s only bacaphd:animal/animal_smokehouse_3
# --- ladder: animal_hive_hoard ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_hive_hoard_1=false},scores={bacaphd_l_animal_hive_hoard=128..}] run advancement grant @s only bacaphd:animal/animal_hive_hoard_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_hive_hoard_2=false},scores={bacaphd_l_animal_hive_hoard=768..}] run advancement grant @s only bacaphd:animal/animal_hive_hoard_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_hive_hoard_3=false},scores={bacaphd_l_animal_hive_hoard=4000..}] run advancement grant @s only bacaphd:animal/animal_hive_hoard_3
# --- ladder: animal_saddlery ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_saddlery_1=false},scores={bacaphd_l_animal_saddlery=16..}] run advancement grant @s only bacaphd:animal/animal_saddlery_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_saddlery_2=false},scores={bacaphd_l_animal_saddlery=96..}] run advancement grant @s only bacaphd:animal/animal_saddlery_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_saddlery_3=false},scores={bacaphd_l_animal_saddlery=500..}] run advancement grant @s only bacaphd:animal/animal_saddlery_3
# --- ladder: animal_ropemaker ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_ropemaker_1=false},scores={bacaphd_l_animal_ropemaker=20..}] run advancement grant @s only bacaphd:animal/animal_ropemaker_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_ropemaker_2=false},scores={bacaphd_l_animal_ropemaker=120..}] run advancement grant @s only bacaphd:animal/animal_ropemaker_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_ropemaker_3=false},scores={bacaphd_l_animal_ropemaker=600..}] run advancement grant @s only bacaphd:animal/animal_ropemaker_3
# --- ladder: animal_kennel_smith ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_kennel_smith_1=false},scores={bacaphd_l_animal_kennel_smith=8..}] run advancement grant @s only bacaphd:animal/animal_kennel_smith_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_kennel_smith_2=false},scores={bacaphd_l_animal_kennel_smith=48..}] run advancement grant @s only bacaphd:animal/animal_kennel_smith_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_kennel_smith_3=false},scores={bacaphd_l_animal_kennel_smith=250..}] run advancement grant @s only bacaphd:animal/animal_kennel_smith_3
# --- ladder: animal_shear_supply ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_shear_supply_1=false},scores={bacaphd_l_animal_shear_supply=24..}] run advancement grant @s only bacaphd:animal/animal_shear_supply_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_shear_supply_2=false},scores={bacaphd_l_animal_shear_supply=150..}] run advancement grant @s only bacaphd:animal/animal_shear_supply_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_shear_supply_3=false},scores={bacaphd_l_animal_shear_supply=750..}] run advancement grant @s only bacaphd:animal/animal_shear_supply_3
# --- ladder: animal_frame_gallery ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_frame_gallery_1=false},scores={bacaphd_l_animal_frame_gallery=32..}] run advancement grant @s only bacaphd:animal/animal_frame_gallery_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_frame_gallery_2=false},scores={bacaphd_l_animal_frame_gallery=200..}] run advancement grant @s only bacaphd:animal/animal_frame_gallery_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_frame_gallery_3=false},scores={bacaphd_l_animal_frame_gallery=1000..}] run advancement grant @s only bacaphd:animal/animal_frame_gallery_3
# --- ladder: animal_bat_roost ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_bat_roost_1=false},scores={bacaphd_l_animal_bat_roost=100..}] run advancement grant @s only bacaphd:animal/animal_bat_roost_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_bat_roost_2=false},scores={bacaphd_l_animal_bat_roost=500..}] run advancement grant @s only bacaphd:animal/animal_bat_roost_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_bat_roost_3=false},scores={bacaphd_l_animal_bat_roost=2000..}] run advancement grant @s only bacaphd:animal/animal_bat_roost_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_bat_roost_4=false},scores={bacaphd_l_animal_bat_roost=8000..}] run advancement grant @s only bacaphd:animal/animal_bat_roost_4
# --- ladder: animal_horse_knacker ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_horse_knacker_1=false},scores={bacaphd_l_animal_horse_knacker=50..}] run advancement grant @s only bacaphd:animal/animal_horse_knacker_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_horse_knacker_2=false},scores={bacaphd_l_animal_horse_knacker=250..}] run advancement grant @s only bacaphd:animal/animal_horse_knacker_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_horse_knacker_3=false},scores={bacaphd_l_animal_horse_knacker=1200..}] run advancement grant @s only bacaphd:animal/animal_horse_knacker_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_horse_knacker_4=false},scores={bacaphd_l_animal_horse_knacker=5000..}] run advancement grant @s only bacaphd:animal/animal_horse_knacker_4
# --- ladder: animal_axolotl_cull ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_axolotl_cull_1=false},scores={bacaphd_l_animal_axolotl_cull=50..}] run advancement grant @s only bacaphd:animal/animal_axolotl_cull_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_axolotl_cull_2=false},scores={bacaphd_l_animal_axolotl_cull=250..}] run advancement grant @s only bacaphd:animal/animal_axolotl_cull_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_axolotl_cull_3=false},scores={bacaphd_l_animal_axolotl_cull=1000..}] run advancement grant @s only bacaphd:animal/animal_axolotl_cull_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_axolotl_cull_4=false},scores={bacaphd_l_animal_axolotl_cull=4000..}] run advancement grant @s only bacaphd:animal/animal_axolotl_cull_4
# --- ladder: animal_bee_smoker ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_bee_smoker_1=false},scores={bacaphd_l_animal_bee_smoker=50..}] run advancement grant @s only bacaphd:animal/animal_bee_smoker_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_bee_smoker_2=false},scores={bacaphd_l_animal_bee_smoker=300..}] run advancement grant @s only bacaphd:animal/animal_bee_smoker_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_bee_smoker_3=false},scores={bacaphd_l_animal_bee_smoker=1200..}] run advancement grant @s only bacaphd:animal/animal_bee_smoker_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_bee_smoker_4=false},scores={bacaphd_l_animal_bee_smoker=5000..}] run advancement grant @s only bacaphd:animal/animal_bee_smoker_4
# --- ladder: animal_shell_poacher ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_shell_poacher_1=false},scores={bacaphd_l_animal_shell_poacher=25..}] run advancement grant @s only bacaphd:animal/animal_shell_poacher_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_shell_poacher_2=false},scores={bacaphd_l_animal_shell_poacher=150..}] run advancement grant @s only bacaphd:animal/animal_shell_poacher_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_shell_poacher_3=false},scores={bacaphd_l_animal_shell_poacher=700..}] run advancement grant @s only bacaphd:animal/animal_shell_poacher_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_shell_poacher_4=false},scores={bacaphd_l_animal_shell_poacher=3000..}] run advancement grant @s only bacaphd:animal/animal_shell_poacher_4
# --- ladder: animal_fox_hunt ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_fox_hunt_1=false},scores={bacaphd_l_animal_fox_hunt=50..}] run advancement grant @s only bacaphd:animal/animal_fox_hunt_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_fox_hunt_2=false},scores={bacaphd_l_animal_fox_hunt=250..}] run advancement grant @s only bacaphd:animal/animal_fox_hunt_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_fox_hunt_3=false},scores={bacaphd_l_animal_fox_hunt=1000..}] run advancement grant @s only bacaphd:animal/animal_fox_hunt_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_fox_hunt_4=false},scores={bacaphd_l_animal_fox_hunt=4000..}] run advancement grant @s only bacaphd:animal/animal_fox_hunt_4
# --- ladder: animal_shearing_rounds ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_shearing_rounds_1=false},scores={bacaphd_l_animal_shearing_rounds=250..}] run advancement grant @s only bacaphd:animal/animal_shearing_rounds_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_shearing_rounds_2=false},scores={bacaphd_l_animal_shearing_rounds=1500..}] run advancement grant @s only bacaphd:animal/animal_shearing_rounds_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_shearing_rounds_3=false},scores={bacaphd_l_animal_shearing_rounds=7000..}] run advancement grant @s only bacaphd:animal/animal_shearing_rounds_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_shearing_rounds_4=false},scores={bacaphd_l_animal_shearing_rounds=30000..}] run advancement grant @s only bacaphd:animal/animal_shearing_rounds_4
# --- ladder: animal_golden_carrot_stud ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_golden_carrot_stud_1=false},scores={bacaphd_l_animal_golden_carrot_stud=32..}] run advancement grant @s only bacaphd:animal/animal_golden_carrot_stud_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_golden_carrot_stud_2=false},scores={bacaphd_l_animal_golden_carrot_stud=200..}] run advancement grant @s only bacaphd:animal/animal_golden_carrot_stud_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_golden_carrot_stud_3=false},scores={bacaphd_l_animal_golden_carrot_stud=1000..}] run advancement grant @s only bacaphd:animal/animal_golden_carrot_stud_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_golden_carrot_stud_4=false},scores={bacaphd_l_animal_golden_carrot_stud=4000..}] run advancement grant @s only bacaphd:animal/animal_golden_carrot_stud_4
# --- ladder: animal_hay_feeder ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_hay_feeder_1=false},scores={bacaphd_l_animal_hay_feeder=64..}] run advancement grant @s only bacaphd:animal/animal_hay_feeder_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_hay_feeder_2=false},scores={bacaphd_l_animal_hay_feeder=400..}] run advancement grant @s only bacaphd:animal/animal_hay_feeder_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_hay_feeder_3=false},scores={bacaphd_l_animal_hay_feeder=2000..}] run advancement grant @s only bacaphd:animal/animal_hay_feeder_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/animal_hay_feeder_4=false},scores={bacaphd_l_animal_hay_feeder=8000..}] run advancement grant @s only bacaphd:animal/animal_hay_feeder_4
# --- ladder: biomes_kelp_harvest ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_kelp_harvest_1=false},scores={bacaphd_l_biomes_kelp_harvest=500..}] run advancement grant @s only bacaphd:biomes/biomes_kelp_harvest_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_kelp_harvest_2=false},scores={bacaphd_l_biomes_kelp_harvest=4000..}] run advancement grant @s only bacaphd:biomes/biomes_kelp_harvest_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_kelp_harvest_3=false},scores={bacaphd_l_biomes_kelp_harvest=20000..}] run advancement grant @s only bacaphd:biomes/biomes_kelp_harvest_3
# --- ladder: biomes_sponge_diving ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sponge_diving_1=false},scores={bacaphd_l_biomes_sponge_diving=32..}] run advancement grant @s only bacaphd:biomes/biomes_sponge_diving_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sponge_diving_2=false},scores={bacaphd_l_biomes_sponge_diving=160..}] run advancement grant @s only bacaphd:biomes/biomes_sponge_diving_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sponge_diving_3=false},scores={bacaphd_l_biomes_sponge_diving=640..}] run advancement grant @s only bacaphd:biomes/biomes_sponge_diving_3
# --- ladder: biomes_sea_pickles ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sea_pickles_1=false},scores={bacaphd_l_biomes_sea_pickles=64..}] run advancement grant @s only bacaphd:biomes/biomes_sea_pickles_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sea_pickles_2=false},scores={bacaphd_l_biomes_sea_pickles=512..}] run advancement grant @s only bacaphd:biomes/biomes_sea_pickles_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sea_pickles_3=false},scores={bacaphd_l_biomes_sea_pickles=2048..}] run advancement grant @s only bacaphd:biomes/biomes_sea_pickles_3
# --- ladder: biomes_coral_reef ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_coral_reef_1=false},scores={bacaphd_l_biomes_coral_reef=32..}] run advancement grant @s only bacaphd:biomes/biomes_coral_reef_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_coral_reef_2=false},scores={bacaphd_l_biomes_coral_reef=256..}] run advancement grant @s only bacaphd:biomes/biomes_coral_reef_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_coral_reef_3=false},scores={bacaphd_l_biomes_coral_reef=1024..}] run advancement grant @s only bacaphd:biomes/biomes_coral_reef_3
# --- ladder: biomes_ice_breaker ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_ice_breaker_1=false},scores={bacaphd_l_biomes_ice_breaker=500..}] run advancement grant @s only bacaphd:biomes/biomes_ice_breaker_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_ice_breaker_2=false},scores={bacaphd_l_biomes_ice_breaker=5000..}] run advancement grant @s only bacaphd:biomes/biomes_ice_breaker_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_ice_breaker_3=false},scores={bacaphd_l_biomes_ice_breaker=25000..}] run advancement grant @s only bacaphd:biomes/biomes_ice_breaker_3
# --- ladder: biomes_blue_ice_road ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_blue_ice_road_1=false},scores={bacaphd_l_biomes_blue_ice_road=16..}] run advancement grant @s only bacaphd:biomes/biomes_blue_ice_road_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_blue_ice_road_2=false},scores={bacaphd_l_biomes_blue_ice_road=128..}] run advancement grant @s only bacaphd:biomes/biomes_blue_ice_road_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_blue_ice_road_3=false},scores={bacaphd_l_biomes_blue_ice_road=640..}] run advancement grant @s only bacaphd:biomes/biomes_blue_ice_road_3
# --- ladder: biomes_snow_shovelling ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_snow_shovelling_1=false},scores={bacaphd_l_biomes_snow_shovelling=500..}] run advancement grant @s only bacaphd:biomes/biomes_snow_shovelling_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_snow_shovelling_2=false},scores={bacaphd_l_biomes_snow_shovelling=4000..}] run advancement grant @s only bacaphd:biomes/biomes_snow_shovelling_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_snow_shovelling_3=false},scores={bacaphd_l_biomes_snow_shovelling=20000..}] run advancement grant @s only bacaphd:biomes/biomes_snow_shovelling_3
# --- ladder: biomes_polar_bears ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_polar_bears_1=false},scores={bacaphd_l_biomes_polar_bears=5..}] run advancement grant @s only bacaphd:biomes/biomes_polar_bears_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_polar_bears_2=false},scores={bacaphd_l_biomes_polar_bears=25..}] run advancement grant @s only bacaphd:biomes/biomes_polar_bears_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_polar_bears_3=false},scores={bacaphd_l_biomes_polar_bears=100..}] run advancement grant @s only bacaphd:biomes/biomes_polar_bears_3
# --- ladder: biomes_sand_digger ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sand_digger_1=false},scores={bacaphd_l_biomes_sand_digger=1000..}] run advancement grant @s only bacaphd:biomes/biomes_sand_digger_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sand_digger_2=false},scores={bacaphd_l_biomes_sand_digger=10000..}] run advancement grant @s only bacaphd:biomes/biomes_sand_digger_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sand_digger_3=false},scores={bacaphd_l_biomes_sand_digger=50000..}] run advancement grant @s only bacaphd:biomes/biomes_sand_digger_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sand_digger_4=false},scores={bacaphd_l_biomes_sand_digger=250000..}] run advancement grant @s only bacaphd:biomes/biomes_sand_digger_4
# --- ladder: biomes_terracotta_mesa ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_terracotta_mesa_1=false},scores={bacaphd_l_biomes_terracotta_mesa=500..}] run advancement grant @s only bacaphd:biomes/biomes_terracotta_mesa_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_terracotta_mesa_2=false},scores={bacaphd_l_biomes_terracotta_mesa=4000..}] run advancement grant @s only bacaphd:biomes/biomes_terracotta_mesa_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_terracotta_mesa_3=false},scores={bacaphd_l_biomes_terracotta_mesa=20000..}] run advancement grant @s only bacaphd:biomes/biomes_terracotta_mesa_3
# --- ladder: biomes_cactus_farm ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cactus_farm_1=false},scores={bacaphd_l_biomes_cactus_farm=500..}] run advancement grant @s only bacaphd:biomes/biomes_cactus_farm_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cactus_farm_2=false},scores={bacaphd_l_biomes_cactus_farm=4000..}] run advancement grant @s only bacaphd:biomes/biomes_cactus_farm_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cactus_farm_3=false},scores={bacaphd_l_biomes_cactus_farm=20000..}] run advancement grant @s only bacaphd:biomes/biomes_cactus_farm_3
# --- ladder: biomes_bamboo_grove ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_bamboo_grove_1=false},scores={bacaphd_l_biomes_bamboo_grove=1000..}] run advancement grant @s only bacaphd:biomes/biomes_bamboo_grove_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_bamboo_grove_2=false},scores={bacaphd_l_biomes_bamboo_grove=10000..}] run advancement grant @s only bacaphd:biomes/biomes_bamboo_grove_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_bamboo_grove_3=false},scores={bacaphd_l_biomes_bamboo_grove=50000..}] run advancement grant @s only bacaphd:biomes/biomes_bamboo_grove_3
# --- ladder: biomes_cocoa_beans ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cocoa_beans_1=false},scores={bacaphd_l_biomes_cocoa_beans=250..}] run advancement grant @s only bacaphd:biomes/biomes_cocoa_beans_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cocoa_beans_2=false},scores={bacaphd_l_biomes_cocoa_beans=2000..}] run advancement grant @s only bacaphd:biomes/biomes_cocoa_beans_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cocoa_beans_3=false},scores={bacaphd_l_biomes_cocoa_beans=10000..}] run advancement grant @s only bacaphd:biomes/biomes_cocoa_beans_3
# --- ladder: biomes_vines ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_vines_1=false},scores={bacaphd_l_biomes_vines=250..}] run advancement grant @s only bacaphd:biomes/biomes_vines_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_vines_2=false},scores={bacaphd_l_biomes_vines=2000..}] run advancement grant @s only bacaphd:biomes/biomes_vines_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_vines_3=false},scores={bacaphd_l_biomes_vines=10000..}] run advancement grant @s only bacaphd:biomes/biomes_vines_3
# --- ladder: biomes_cherry_grove ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cherry_grove_1=false},scores={bacaphd_l_biomes_cherry_grove=128..}] run advancement grant @s only bacaphd:biomes/biomes_cherry_grove_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cherry_grove_2=false},scores={bacaphd_l_biomes_cherry_grove=1000..}] run advancement grant @s only bacaphd:biomes/biomes_cherry_grove_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cherry_grove_3=false},scores={bacaphd_l_biomes_cherry_grove=5000..}] run advancement grant @s only bacaphd:biomes/biomes_cherry_grove_3
# --- ladder: biomes_pink_petals ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_pink_petals_1=false},scores={bacaphd_l_biomes_pink_petals=200..}] run advancement grant @s only bacaphd:biomes/biomes_pink_petals_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_pink_petals_2=false},scores={bacaphd_l_biomes_pink_petals=1500..}] run advancement grant @s only bacaphd:biomes/biomes_pink_petals_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_pink_petals_3=false},scores={bacaphd_l_biomes_pink_petals=6000..}] run advancement grant @s only bacaphd:biomes/biomes_pink_petals_3
# --- ladder: biomes_pale_oak ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_pale_oak_1=false},scores={bacaphd_l_biomes_pale_oak=128..}] run advancement grant @s only bacaphd:biomes/biomes_pale_oak_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_pale_oak_2=false},scores={bacaphd_l_biomes_pale_oak=1000..}] run advancement grant @s only bacaphd:biomes/biomes_pale_oak_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_pale_oak_3=false},scores={bacaphd_l_biomes_pale_oak=5000..}] run advancement grant @s only bacaphd:biomes/biomes_pale_oak_3
# --- ladder: biomes_creaking_hearts ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_creaking_hearts_1=false},scores={bacaphd_l_biomes_creaking_hearts=10..}] run advancement grant @s only bacaphd:biomes/biomes_creaking_hearts_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_creaking_hearts_2=false},scores={bacaphd_l_biomes_creaking_hearts=50..}] run advancement grant @s only bacaphd:biomes/biomes_creaking_hearts_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_creaking_hearts_3=false},scores={bacaphd_l_biomes_creaking_hearts=250..}] run advancement grant @s only bacaphd:biomes/biomes_creaking_hearts_3
# --- ladder: biomes_resin ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_resin_1=false},scores={bacaphd_l_biomes_resin=64..}] run advancement grant @s only bacaphd:biomes/biomes_resin_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_resin_2=false},scores={bacaphd_l_biomes_resin=512..}] run advancement grant @s only bacaphd:biomes/biomes_resin_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_resin_3=false},scores={bacaphd_l_biomes_resin=2048..}] run advancement grant @s only bacaphd:biomes/biomes_resin_3
# --- ladder: biomes_mud ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mud_1=false},scores={bacaphd_l_biomes_mud=500..}] run advancement grant @s only bacaphd:biomes/biomes_mud_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mud_2=false},scores={bacaphd_l_biomes_mud=4000..}] run advancement grant @s only bacaphd:biomes/biomes_mud_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mud_3=false},scores={bacaphd_l_biomes_mud=20000..}] run advancement grant @s only bacaphd:biomes/biomes_mud_3
# --- ladder: biomes_mangrove ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mangrove_1=false},scores={bacaphd_l_biomes_mangrove=250..}] run advancement grant @s only bacaphd:biomes/biomes_mangrove_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mangrove_2=false},scores={bacaphd_l_biomes_mangrove=2000..}] run advancement grant @s only bacaphd:biomes/biomes_mangrove_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mangrove_3=false},scores={bacaphd_l_biomes_mangrove=10000..}] run advancement grant @s only bacaphd:biomes/biomes_mangrove_3
# --- ladder: biomes_lily_pads ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_lily_pads_1=false},scores={bacaphd_l_biomes_lily_pads=100..}] run advancement grant @s only bacaphd:biomes/biomes_lily_pads_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_lily_pads_2=false},scores={bacaphd_l_biomes_lily_pads=750..}] run advancement grant @s only bacaphd:biomes/biomes_lily_pads_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_lily_pads_3=false},scores={bacaphd_l_biomes_lily_pads=3000..}] run advancement grant @s only bacaphd:biomes/biomes_lily_pads_3
# --- ladder: biomes_mushrooms ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mushrooms_1=false},scores={bacaphd_l_biomes_mushrooms=250..}] run advancement grant @s only bacaphd:biomes/biomes_mushrooms_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mushrooms_2=false},scores={bacaphd_l_biomes_mushrooms=2000..}] run advancement grant @s only bacaphd:biomes/biomes_mushrooms_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mushrooms_3=false},scores={bacaphd_l_biomes_mushrooms=10000..}] run advancement grant @s only bacaphd:biomes/biomes_mushrooms_3
# --- ladder: biomes_spruce_taiga ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_spruce_taiga_1=false},scores={bacaphd_l_biomes_spruce_taiga=250..}] run advancement grant @s only bacaphd:biomes/biomes_spruce_taiga_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_spruce_taiga_2=false},scores={bacaphd_l_biomes_spruce_taiga=2500..}] run advancement grant @s only bacaphd:biomes/biomes_spruce_taiga_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_spruce_taiga_3=false},scores={bacaphd_l_biomes_spruce_taiga=10000..}] run advancement grant @s only bacaphd:biomes/biomes_spruce_taiga_3
# --- ladder: biomes_grass ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_grass_1=false},scores={bacaphd_l_biomes_grass=1000..}] run advancement grant @s only bacaphd:biomes/biomes_grass_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_grass_2=false},scores={bacaphd_l_biomes_grass=10000..}] run advancement grant @s only bacaphd:biomes/biomes_grass_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_grass_3=false},scores={bacaphd_l_biomes_grass=50000..}] run advancement grant @s only bacaphd:biomes/biomes_grass_3
# --- ladder: biomes_cornflowers ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cornflowers_1=false},scores={bacaphd_l_biomes_cornflowers=100..}] run advancement grant @s only bacaphd:biomes/biomes_cornflowers_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cornflowers_2=false},scores={bacaphd_l_biomes_cornflowers=750..}] run advancement grant @s only bacaphd:biomes/biomes_cornflowers_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_cornflowers_3=false},scores={bacaphd_l_biomes_cornflowers=3000..}] run advancement grant @s only bacaphd:biomes/biomes_cornflowers_3
# --- ladder: biomes_seagrass ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_seagrass_1=false},scores={bacaphd_l_biomes_seagrass=250..}] run advancement grant @s only bacaphd:biomes/biomes_seagrass_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_seagrass_2=false},scores={bacaphd_l_biomes_seagrass=1500..}] run advancement grant @s only bacaphd:biomes/biomes_seagrass_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_seagrass_3=false},scores={bacaphd_l_biomes_seagrass=6000..}] run advancement grant @s only bacaphd:biomes/biomes_seagrass_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_seagrass_4=false},scores={bacaphd_l_biomes_seagrass=20000..}] run advancement grant @s only bacaphd:biomes/biomes_seagrass_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_seagrass_5=false},scores={bacaphd_l_biomes_seagrass=60000..}] run advancement grant @s only bacaphd:biomes/biomes_seagrass_5
# --- ladder: biomes_packed_ice ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_packed_ice_1=false},scores={bacaphd_l_biomes_packed_ice=250..}] run advancement grant @s only bacaphd:biomes/biomes_packed_ice_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_packed_ice_2=false},scores={bacaphd_l_biomes_packed_ice=1500..}] run advancement grant @s only bacaphd:biomes/biomes_packed_ice_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_packed_ice_3=false},scores={bacaphd_l_biomes_packed_ice=6000..}] run advancement grant @s only bacaphd:biomes/biomes_packed_ice_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_packed_ice_4=false},scores={bacaphd_l_biomes_packed_ice=20000..}] run advancement grant @s only bacaphd:biomes/biomes_packed_ice_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_packed_ice_5=false},scores={bacaphd_l_biomes_packed_ice=60000..}] run advancement grant @s only bacaphd:biomes/biomes_packed_ice_5
# --- ladder: biomes_red_sand ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_red_sand_1=false},scores={bacaphd_l_biomes_red_sand=500..}] run advancement grant @s only bacaphd:biomes/biomes_red_sand_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_red_sand_2=false},scores={bacaphd_l_biomes_red_sand=4000..}] run advancement grant @s only bacaphd:biomes/biomes_red_sand_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_red_sand_3=false},scores={bacaphd_l_biomes_red_sand=20000..}] run advancement grant @s only bacaphd:biomes/biomes_red_sand_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_red_sand_4=false},scores={bacaphd_l_biomes_red_sand=60000..}] run advancement grant @s only bacaphd:biomes/biomes_red_sand_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_red_sand_5=false},scores={bacaphd_l_biomes_red_sand=150000..}] run advancement grant @s only bacaphd:biomes/biomes_red_sand_5
# --- ladder: biomes_birch_forest ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_birch_forest_1=false},scores={bacaphd_l_biomes_birch_forest=250..}] run advancement grant @s only bacaphd:biomes/biomes_birch_forest_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_birch_forest_2=false},scores={bacaphd_l_biomes_birch_forest=2000..}] run advancement grant @s only bacaphd:biomes/biomes_birch_forest_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_birch_forest_3=false},scores={bacaphd_l_biomes_birch_forest=8000..}] run advancement grant @s only bacaphd:biomes/biomes_birch_forest_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_birch_forest_4=false},scores={bacaphd_l_biomes_birch_forest=30000..}] run advancement grant @s only bacaphd:biomes/biomes_birch_forest_4
# --- ladder: biomes_pale_moss ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_pale_moss_1=false},scores={bacaphd_l_biomes_pale_moss=200..}] run advancement grant @s only bacaphd:biomes/biomes_pale_moss_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_pale_moss_2=false},scores={bacaphd_l_biomes_pale_moss=1500..}] run advancement grant @s only bacaphd:biomes/biomes_pale_moss_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_pale_moss_3=false},scores={bacaphd_l_biomes_pale_moss=6000..}] run advancement grant @s only bacaphd:biomes/biomes_pale_moss_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_pale_moss_4=false},scores={bacaphd_l_biomes_pale_moss=25000..}] run advancement grant @s only bacaphd:biomes/biomes_pale_moss_4
# --- ladder: biomes_mycelium ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mycelium_1=false},scores={bacaphd_l_biomes_mycelium=128..}] run advancement grant @s only bacaphd:biomes/biomes_mycelium_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mycelium_2=false},scores={bacaphd_l_biomes_mycelium=1000..}] run advancement grant @s only bacaphd:biomes/biomes_mycelium_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mycelium_3=false},scores={bacaphd_l_biomes_mycelium=5000..}] run advancement grant @s only bacaphd:biomes/biomes_mycelium_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_mycelium_4=false},scores={bacaphd_l_biomes_mycelium=20000..}] run advancement grant @s only bacaphd:biomes/biomes_mycelium_4
# --- ladder: biomes_sweet_berries ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sweet_berries_1=false},scores={bacaphd_l_biomes_sweet_berries=100..}] run advancement grant @s only bacaphd:biomes/biomes_sweet_berries_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sweet_berries_2=false},scores={bacaphd_l_biomes_sweet_berries=750..}] run advancement grant @s only bacaphd:biomes/biomes_sweet_berries_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sweet_berries_3=false},scores={bacaphd_l_biomes_sweet_berries=3000..}] run advancement grant @s only bacaphd:biomes/biomes_sweet_berries_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_sweet_berries_4=false},scores={bacaphd_l_biomes_sweet_berries=12000..}] run advancement grant @s only bacaphd:biomes/biomes_sweet_berries_4
# --- ladder: biomes_wildflowers ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_wildflowers_1=false},scores={bacaphd_l_biomes_wildflowers=200..}] run advancement grant @s only bacaphd:biomes/biomes_wildflowers_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_wildflowers_2=false},scores={bacaphd_l_biomes_wildflowers=1500..}] run advancement grant @s only bacaphd:biomes/biomes_wildflowers_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_wildflowers_3=false},scores={bacaphd_l_biomes_wildflowers=6000..}] run advancement grant @s only bacaphd:biomes/biomes_wildflowers_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/biomes_wildflowers_4=false},scores={bacaphd_l_biomes_wildflowers=20000..}] run advancement grant @s only bacaphd:biomes/biomes_wildflowers_4
# --- ladder: building_cobblestone ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_cobblestone_1=false},scores={bacaphd_l_building_cobblestone=1000..}] run advancement grant @s only bacaphd:building/building_cobblestone_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_cobblestone_2=false},scores={bacaphd_l_building_cobblestone=5000..}] run advancement grant @s only bacaphd:building/building_cobblestone_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_cobblestone_3=false},scores={bacaphd_l_building_cobblestone=25000..}] run advancement grant @s only bacaphd:building/building_cobblestone_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_cobblestone_4=false},scores={bacaphd_l_building_cobblestone=100000..}] run advancement grant @s only bacaphd:building/building_cobblestone_4
# --- ladder: building_stone_bricks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_stone_bricks_1=false},scores={bacaphd_l_building_stone_bricks=256..}] run advancement grant @s only bacaphd:building/building_stone_bricks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_stone_bricks_2=false},scores={bacaphd_l_building_stone_bricks=2048..}] run advancement grant @s only bacaphd:building/building_stone_bricks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_stone_bricks_3=false},scores={bacaphd_l_building_stone_bricks=10000..}] run advancement grant @s only bacaphd:building/building_stone_bricks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_stone_bricks_4=false},scores={bacaphd_l_building_stone_bricks=40000..}] run advancement grant @s only bacaphd:building/building_stone_bricks_4
# --- ladder: building_oak_planks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_oak_planks_1=false},scores={bacaphd_l_building_oak_planks=500..}] run advancement grant @s only bacaphd:building/building_oak_planks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_oak_planks_2=false},scores={bacaphd_l_building_oak_planks=2500..}] run advancement grant @s only bacaphd:building/building_oak_planks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_oak_planks_3=false},scores={bacaphd_l_building_oak_planks=12500..}] run advancement grant @s only bacaphd:building/building_oak_planks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_oak_planks_4=false},scores={bacaphd_l_building_oak_planks=50000..}] run advancement grant @s only bacaphd:building/building_oak_planks_4
# --- ladder: building_deepslate_bricks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_deepslate_bricks_1=false},scores={bacaphd_l_building_deepslate_bricks=128..}] run advancement grant @s only bacaphd:building/building_deepslate_bricks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_deepslate_bricks_2=false},scores={bacaphd_l_building_deepslate_bricks=1024..}] run advancement grant @s only bacaphd:building/building_deepslate_bricks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_deepslate_bricks_3=false},scores={bacaphd_l_building_deepslate_bricks=5000..}] run advancement grant @s only bacaphd:building/building_deepslate_bricks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_deepslate_bricks_4=false},scores={bacaphd_l_building_deepslate_bricks=20000..}] run advancement grant @s only bacaphd:building/building_deepslate_bricks_4
# --- ladder: building_sandstone ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_sandstone_1=false},scores={bacaphd_l_building_sandstone=128..}] run advancement grant @s only bacaphd:building/building_sandstone_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_sandstone_2=false},scores={bacaphd_l_building_sandstone=1024..}] run advancement grant @s only bacaphd:building/building_sandstone_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_sandstone_3=false},scores={bacaphd_l_building_sandstone=5000..}] run advancement grant @s only bacaphd:building/building_sandstone_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_sandstone_4=false},scores={bacaphd_l_building_sandstone=20000..}] run advancement grant @s only bacaphd:building/building_sandstone_4
# --- ladder: building_quartz ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_quartz_1=false},scores={bacaphd_l_building_quartz=128..}] run advancement grant @s only bacaphd:building/building_quartz_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_quartz_2=false},scores={bacaphd_l_building_quartz=1024..}] run advancement grant @s only bacaphd:building/building_quartz_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_quartz_3=false},scores={bacaphd_l_building_quartz=5000..}] run advancement grant @s only bacaphd:building/building_quartz_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_quartz_4=false},scores={bacaphd_l_building_quartz=20000..}] run advancement grant @s only bacaphd:building/building_quartz_4
# --- ladder: building_terracotta ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_terracotta_1=false},scores={bacaphd_l_building_terracotta=128..}] run advancement grant @s only bacaphd:building/building_terracotta_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_terracotta_2=false},scores={bacaphd_l_building_terracotta=1024..}] run advancement grant @s only bacaphd:building/building_terracotta_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_terracotta_3=false},scores={bacaphd_l_building_terracotta=5000..}] run advancement grant @s only bacaphd:building/building_terracotta_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_terracotta_4=false},scores={bacaphd_l_building_terracotta=20000..}] run advancement grant @s only bacaphd:building/building_terracotta_4
# --- ladder: building_concrete ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_concrete_1=false},scores={bacaphd_l_building_concrete=64..}] run advancement grant @s only bacaphd:building/building_concrete_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_concrete_2=false},scores={bacaphd_l_building_concrete=512..}] run advancement grant @s only bacaphd:building/building_concrete_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_concrete_3=false},scores={bacaphd_l_building_concrete=2500..}] run advancement grant @s only bacaphd:building/building_concrete_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_concrete_4=false},scores={bacaphd_l_building_concrete=12000..}] run advancement grant @s only bacaphd:building/building_concrete_4
# --- ladder: building_glass ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_glass_1=false},scores={bacaphd_l_building_glass=128..}] run advancement grant @s only bacaphd:building/building_glass_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_glass_2=false},scores={bacaphd_l_building_glass=1024..}] run advancement grant @s only bacaphd:building/building_glass_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_glass_3=false},scores={bacaphd_l_building_glass=5000..}] run advancement grant @s only bacaphd:building/building_glass_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_glass_4=false},scores={bacaphd_l_building_glass=20000..}] run advancement grant @s only bacaphd:building/building_glass_4
# --- ladder: building_glass_panes ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_glass_panes_1=false},scores={bacaphd_l_building_glass_panes=64..}] run advancement grant @s only bacaphd:building/building_glass_panes_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_glass_panes_2=false},scores={bacaphd_l_building_glass_panes=512..}] run advancement grant @s only bacaphd:building/building_glass_panes_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_glass_panes_3=false},scores={bacaphd_l_building_glass_panes=2500..}] run advancement grant @s only bacaphd:building/building_glass_panes_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_glass_panes_4=false},scores={bacaphd_l_building_glass_panes=12000..}] run advancement grant @s only bacaphd:building/building_glass_panes_4
# --- ladder: building_wool ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_wool_1=false},scores={bacaphd_l_building_wool=128..}] run advancement grant @s only bacaphd:building/building_wool_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_wool_2=false},scores={bacaphd_l_building_wool=1024..}] run advancement grant @s only bacaphd:building/building_wool_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_wool_3=false},scores={bacaphd_l_building_wool=5000..}] run advancement grant @s only bacaphd:building/building_wool_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_wool_4=false},scores={bacaphd_l_building_wool=20000..}] run advancement grant @s only bacaphd:building/building_wool_4
# --- ladder: building_stairs ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_stairs_1=false},scores={bacaphd_l_building_stairs=128..}] run advancement grant @s only bacaphd:building/building_stairs_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_stairs_2=false},scores={bacaphd_l_building_stairs=1024..}] run advancement grant @s only bacaphd:building/building_stairs_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_stairs_3=false},scores={bacaphd_l_building_stairs=5000..}] run advancement grant @s only bacaphd:building/building_stairs_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_stairs_4=false},scores={bacaphd_l_building_stairs=20000..}] run advancement grant @s only bacaphd:building/building_stairs_4
# --- ladder: building_slabs ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_slabs_1=false},scores={bacaphd_l_building_slabs=128..}] run advancement grant @s only bacaphd:building/building_slabs_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_slabs_2=false},scores={bacaphd_l_building_slabs=1024..}] run advancement grant @s only bacaphd:building/building_slabs_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_slabs_3=false},scores={bacaphd_l_building_slabs=5000..}] run advancement grant @s only bacaphd:building/building_slabs_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_slabs_4=false},scores={bacaphd_l_building_slabs=20000..}] run advancement grant @s only bacaphd:building/building_slabs_4
# --- ladder: building_walls ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_walls_1=false},scores={bacaphd_l_building_walls=64..}] run advancement grant @s only bacaphd:building/building_walls_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_walls_2=false},scores={bacaphd_l_building_walls=512..}] run advancement grant @s only bacaphd:building/building_walls_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_walls_3=false},scores={bacaphd_l_building_walls=2500..}] run advancement grant @s only bacaphd:building/building_walls_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_walls_4=false},scores={bacaphd_l_building_walls=12000..}] run advancement grant @s only bacaphd:building/building_walls_4
# --- ladder: building_fences ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_fences_1=false},scores={bacaphd_l_building_fences=64..}] run advancement grant @s only bacaphd:building/building_fences_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_fences_2=false},scores={bacaphd_l_building_fences=512..}] run advancement grant @s only bacaphd:building/building_fences_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_fences_3=false},scores={bacaphd_l_building_fences=2500..}] run advancement grant @s only bacaphd:building/building_fences_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_fences_4=false},scores={bacaphd_l_building_fences=12000..}] run advancement grant @s only bacaphd:building/building_fences_4
# --- ladder: building_torches ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_torches_1=false},scores={bacaphd_l_building_torches=250..}] run advancement grant @s only bacaphd:building/building_torches_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_torches_2=false},scores={bacaphd_l_building_torches=2000..}] run advancement grant @s only bacaphd:building/building_torches_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_torches_3=false},scores={bacaphd_l_building_torches=10000..}] run advancement grant @s only bacaphd:building/building_torches_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_torches_4=false},scores={bacaphd_l_building_torches=40000..}] run advancement grant @s only bacaphd:building/building_torches_4
# --- ladder: building_lanterns ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_lanterns_1=false},scores={bacaphd_l_building_lanterns=64..}] run advancement grant @s only bacaphd:building/building_lanterns_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_lanterns_2=false},scores={bacaphd_l_building_lanterns=512..}] run advancement grant @s only bacaphd:building/building_lanterns_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_lanterns_3=false},scores={bacaphd_l_building_lanterns=2500..}] run advancement grant @s only bacaphd:building/building_lanterns_3
# --- ladder: building_sea_lanterns ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_sea_lanterns_1=false},scores={bacaphd_l_building_sea_lanterns=64..}] run advancement grant @s only bacaphd:building/building_sea_lanterns_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_sea_lanterns_2=false},scores={bacaphd_l_building_sea_lanterns=512..}] run advancement grant @s only bacaphd:building/building_sea_lanterns_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_sea_lanterns_3=false},scores={bacaphd_l_building_sea_lanterns=2500..}] run advancement grant @s only bacaphd:building/building_sea_lanterns_3
# --- ladder: building_scaffolding ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_scaffolding_1=false},scores={bacaphd_l_building_scaffolding=128..}] run advancement grant @s only bacaphd:building/building_scaffolding_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_scaffolding_2=false},scores={bacaphd_l_building_scaffolding=1024..}] run advancement grant @s only bacaphd:building/building_scaffolding_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_scaffolding_3=false},scores={bacaphd_l_building_scaffolding=5000..}] run advancement grant @s only bacaphd:building/building_scaffolding_3
# --- ladder: building_ladders ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_ladders_1=false},scores={bacaphd_l_building_ladders=64..}] run advancement grant @s only bacaphd:building/building_ladders_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_ladders_2=false},scores={bacaphd_l_building_ladders=512..}] run advancement grant @s only bacaphd:building/building_ladders_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_ladders_3=false},scores={bacaphd_l_building_ladders=2500..}] run advancement grant @s only bacaphd:building/building_ladders_3
# --- ladder: building_item_frames ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_item_frames_1=false},scores={bacaphd_l_building_item_frames=32..}] run advancement grant @s only bacaphd:building/building_item_frames_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_item_frames_2=false},scores={bacaphd_l_building_item_frames=256..}] run advancement grant @s only bacaphd:building/building_item_frames_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_item_frames_3=false},scores={bacaphd_l_building_item_frames=1024..}] run advancement grant @s only bacaphd:building/building_item_frames_3
# --- ladder: building_flower_pots ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_flower_pots_1=false},scores={bacaphd_l_building_flower_pots=16..}] run advancement grant @s only bacaphd:building/building_flower_pots_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_flower_pots_2=false},scores={bacaphd_l_building_flower_pots=128..}] run advancement grant @s only bacaphd:building/building_flower_pots_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_flower_pots_3=false},scores={bacaphd_l_building_flower_pots=512..}] run advancement grant @s only bacaphd:building/building_flower_pots_3
# --- ladder: building_candles ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_candles_1=false},scores={bacaphd_l_building_candles=32..}] run advancement grant @s only bacaphd:building/building_candles_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_candles_2=false},scores={bacaphd_l_building_candles=256..}] run advancement grant @s only bacaphd:building/building_candles_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_candles_3=false},scores={bacaphd_l_building_candles=1024..}] run advancement grant @s only bacaphd:building/building_candles_3
# --- ladder: building_bookshelves ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_bookshelves_1=false},scores={bacaphd_l_building_bookshelves=32..}] run advancement grant @s only bacaphd:building/building_bookshelves_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_bookshelves_2=false},scores={bacaphd_l_building_bookshelves=256..}] run advancement grant @s only bacaphd:building/building_bookshelves_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_bookshelves_3=false},scores={bacaphd_l_building_bookshelves=1024..}] run advancement grant @s only bacaphd:building/building_bookshelves_3
# --- ladder: building_cut_copper ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_cut_copper_1=false},scores={bacaphd_l_building_cut_copper=64..}] run advancement grant @s only bacaphd:building/building_cut_copper_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_cut_copper_2=false},scores={bacaphd_l_building_cut_copper=512..}] run advancement grant @s only bacaphd:building/building_cut_copper_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_cut_copper_3=false},scores={bacaphd_l_building_cut_copper=2500..}] run advancement grant @s only bacaphd:building/building_cut_copper_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_cut_copper_4=false},scores={bacaphd_l_building_cut_copper=12000..}] run advancement grant @s only bacaphd:building/building_cut_copper_4
# --- ladder: building_bricks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_bricks_1=false},scores={bacaphd_l_building_bricks=64..}] run advancement grant @s only bacaphd:building/building_bricks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_bricks_2=false},scores={bacaphd_l_building_bricks=256..}] run advancement grant @s only bacaphd:building/building_bricks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_bricks_3=false},scores={bacaphd_l_building_bricks=1024..}] run advancement grant @s only bacaphd:building/building_bricks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_bricks_4=false},scores={bacaphd_l_building_bricks=5000..}] run advancement grant @s only bacaphd:building/building_bricks_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_bricks_5=false},scores={bacaphd_l_building_bricks=20000..}] run advancement grant @s only bacaphd:building/building_bricks_5
# --- ladder: building_nether_bricks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_nether_bricks_1=false},scores={bacaphd_l_building_nether_bricks=128..}] run advancement grant @s only bacaphd:building/building_nether_bricks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_nether_bricks_2=false},scores={bacaphd_l_building_nether_bricks=1024..}] run advancement grant @s only bacaphd:building/building_nether_bricks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_nether_bricks_3=false},scores={bacaphd_l_building_nether_bricks=5000..}] run advancement grant @s only bacaphd:building/building_nether_bricks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_nether_bricks_4=false},scores={bacaphd_l_building_nether_bricks=20000..}] run advancement grant @s only bacaphd:building/building_nether_bricks_4
# --- ladder: building_prismarine ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_prismarine_1=false},scores={bacaphd_l_building_prismarine=64..}] run advancement grant @s only bacaphd:building/building_prismarine_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_prismarine_2=false},scores={bacaphd_l_building_prismarine=512..}] run advancement grant @s only bacaphd:building/building_prismarine_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_prismarine_3=false},scores={bacaphd_l_building_prismarine=2500..}] run advancement grant @s only bacaphd:building/building_prismarine_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_prismarine_4=false},scores={bacaphd_l_building_prismarine=10000..}] run advancement grant @s only bacaphd:building/building_prismarine_4
# --- ladder: building_blackstone_bricks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_blackstone_bricks_1=false},scores={bacaphd_l_building_blackstone_bricks=128..}] run advancement grant @s only bacaphd:building/building_blackstone_bricks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_blackstone_bricks_2=false},scores={bacaphd_l_building_blackstone_bricks=1024..}] run advancement grant @s only bacaphd:building/building_blackstone_bricks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_blackstone_bricks_3=false},scores={bacaphd_l_building_blackstone_bricks=5000..}] run advancement grant @s only bacaphd:building/building_blackstone_bricks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_blackstone_bricks_4=false},scores={bacaphd_l_building_blackstone_bricks=20000..}] run advancement grant @s only bacaphd:building/building_blackstone_bricks_4
# --- ladder: building_mud_bricks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_mud_bricks_1=false},scores={bacaphd_l_building_mud_bricks=128..}] run advancement grant @s only bacaphd:building/building_mud_bricks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_mud_bricks_2=false},scores={bacaphd_l_building_mud_bricks=512..}] run advancement grant @s only bacaphd:building/building_mud_bricks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_mud_bricks_3=false},scores={bacaphd_l_building_mud_bricks=2048..}] run advancement grant @s only bacaphd:building/building_mud_bricks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_mud_bricks_4=false},scores={bacaphd_l_building_mud_bricks=10000..}] run advancement grant @s only bacaphd:building/building_mud_bricks_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_mud_bricks_5=false},scores={bacaphd_l_building_mud_bricks=40000..}] run advancement grant @s only bacaphd:building/building_mud_bricks_5
# --- ladder: building_tuff_bricks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_tuff_bricks_1=false},scores={bacaphd_l_building_tuff_bricks=128..}] run advancement grant @s only bacaphd:building/building_tuff_bricks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_tuff_bricks_2=false},scores={bacaphd_l_building_tuff_bricks=1024..}] run advancement grant @s only bacaphd:building/building_tuff_bricks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_tuff_bricks_3=false},scores={bacaphd_l_building_tuff_bricks=5000..}] run advancement grant @s only bacaphd:building/building_tuff_bricks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/building_tuff_bricks_4=false},scores={bacaphd_l_building_tuff_bricks=20000..}] run advancement grant @s only bacaphd:building/building_tuff_bricks_4
# --- ladder: enchanting_paper_trail ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_paper_trail_1=false},scores={bacaphd_l_enchanting_paper_trail=256..}] run advancement grant @s only bacaphd:enchanting/enchanting_paper_trail_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_paper_trail_2=false},scores={bacaphd_l_enchanting_paper_trail=1500..}] run advancement grant @s only bacaphd:enchanting/enchanting_paper_trail_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_paper_trail_3=false},scores={bacaphd_l_enchanting_paper_trail=8000..}] run advancement grant @s only bacaphd:enchanting/enchanting_paper_trail_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_paper_trail_4=false},scores={bacaphd_l_enchanting_paper_trail=40000..}] run advancement grant @s only bacaphd:enchanting/enchanting_paper_trail_4
# --- ladder: enchanting_tannery ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_tannery_1=false},scores={bacaphd_l_enchanting_tannery=8..}] run advancement grant @s only bacaphd:enchanting/enchanting_tannery_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_tannery_2=false},scores={bacaphd_l_enchanting_tannery=40..}] run advancement grant @s only bacaphd:enchanting/enchanting_tannery_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_tannery_3=false},scores={bacaphd_l_enchanting_tannery=128..}] run advancement grant @s only bacaphd:enchanting/enchanting_tannery_3
# --- ladder: enchanting_bookbinding ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_bookbinding_1=false},scores={bacaphd_l_enchanting_bookbinding=45..}] run advancement grant @s only bacaphd:enchanting/enchanting_bookbinding_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_bookbinding_2=false},scores={bacaphd_l_enchanting_bookbinding=300..}] run advancement grant @s only bacaphd:enchanting/enchanting_bookbinding_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_bookbinding_3=false},scores={bacaphd_l_enchanting_bookbinding=1500..}] run advancement grant @s only bacaphd:enchanting/enchanting_bookbinding_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_bookbinding_4=false},scores={bacaphd_l_enchanting_bookbinding=6000..}] run advancement grant @s only bacaphd:enchanting/enchanting_bookbinding_4
# --- ladder: enchanting_quill_and_ink ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_quill_and_ink_1=false},scores={bacaphd_l_enchanting_quill_and_ink=8..}] run advancement grant @s only bacaphd:enchanting/enchanting_quill_and_ink_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_quill_and_ink_2=false},scores={bacaphd_l_enchanting_quill_and_ink=48..}] run advancement grant @s only bacaphd:enchanting/enchanting_quill_and_ink_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_quill_and_ink_3=false},scores={bacaphd_l_enchanting_quill_and_ink=192..}] run advancement grant @s only bacaphd:enchanting/enchanting_quill_and_ink_3
# --- ladder: enchanting_scriptorium ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_scriptorium_1=false},scores={bacaphd_l_enchanting_scriptorium=8..}] run advancement grant @s only bacaphd:enchanting/enchanting_scriptorium_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_scriptorium_2=false},scores={bacaphd_l_enchanting_scriptorium=40..}] run advancement grant @s only bacaphd:enchanting/enchanting_scriptorium_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_scriptorium_3=false},scores={bacaphd_l_enchanting_scriptorium=160..}] run advancement grant @s only bacaphd:enchanting/enchanting_scriptorium_3
# --- ladder: enchanting_shelf_supply ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_shelf_supply_1=false},scores={bacaphd_l_enchanting_shelf_supply=15..}] run advancement grant @s only bacaphd:enchanting/enchanting_shelf_supply_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_shelf_supply_2=false},scores={bacaphd_l_enchanting_shelf_supply=90..}] run advancement grant @s only bacaphd:enchanting/enchanting_shelf_supply_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_shelf_supply_3=false},scores={bacaphd_l_enchanting_shelf_supply=450..}] run advancement grant @s only bacaphd:enchanting/enchanting_shelf_supply_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_shelf_supply_4=false},scores={bacaphd_l_enchanting_shelf_supply=1500..}] run advancement grant @s only bacaphd:enchanting/enchanting_shelf_supply_4
# --- ladder: enchanting_shelf_raider ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_shelf_raider_1=false},scores={bacaphd_l_enchanting_shelf_raider=12..}] run advancement grant @s only bacaphd:enchanting/enchanting_shelf_raider_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_shelf_raider_2=false},scores={bacaphd_l_enchanting_shelf_raider=90..}] run advancement grant @s only bacaphd:enchanting/enchanting_shelf_raider_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_shelf_raider_3=false},scores={bacaphd_l_enchanting_shelf_raider=400..}] run advancement grant @s only bacaphd:enchanting/enchanting_shelf_raider_3
# --- ladder: enchanting_chiseled_supply ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chiseled_supply_1=false},scores={bacaphd_l_enchanting_chiseled_supply=8..}] run advancement grant @s only bacaphd:enchanting/enchanting_chiseled_supply_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chiseled_supply_2=false},scores={bacaphd_l_enchanting_chiseled_supply=64..}] run advancement grant @s only bacaphd:enchanting/enchanting_chiseled_supply_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chiseled_supply_3=false},scores={bacaphd_l_enchanting_chiseled_supply=256..}] run advancement grant @s only bacaphd:enchanting/enchanting_chiseled_supply_3
# --- ladder: enchanting_chiseled_placement ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chiseled_placement_1=false},scores={bacaphd_l_enchanting_chiseled_placement=8..}] run advancement grant @s only bacaphd:enchanting/enchanting_chiseled_placement_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chiseled_placement_2=false},scores={bacaphd_l_enchanting_chiseled_placement=64..}] run advancement grant @s only bacaphd:enchanting/enchanting_chiseled_placement_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chiseled_placement_3=false},scores={bacaphd_l_enchanting_chiseled_placement=256..}] run advancement grant @s only bacaphd:enchanting/enchanting_chiseled_placement_3
# --- ladder: enchanting_oak_shelving ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_oak_shelving_1=false},scores={bacaphd_l_enchanting_oak_shelving=16..}] run advancement grant @s only bacaphd:enchanting/enchanting_oak_shelving_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_oak_shelving_2=false},scores={bacaphd_l_enchanting_oak_shelving=96..}] run advancement grant @s only bacaphd:enchanting/enchanting_oak_shelving_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_oak_shelving_3=false},scores={bacaphd_l_enchanting_oak_shelving=384..}] run advancement grant @s only bacaphd:enchanting/enchanting_oak_shelving_3
# --- ladder: enchanting_lectern_supply ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lectern_supply_1=false},scores={bacaphd_l_enchanting_lectern_supply=8..}] run advancement grant @s only bacaphd:enchanting/enchanting_lectern_supply_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lectern_supply_2=false},scores={bacaphd_l_enchanting_lectern_supply=48..}] run advancement grant @s only bacaphd:enchanting/enchanting_lectern_supply_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lectern_supply_3=false},scores={bacaphd_l_enchanting_lectern_supply=200..}] run advancement grant @s only bacaphd:enchanting/enchanting_lectern_supply_3
# --- ladder: enchanting_lectern_reroll ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lectern_reroll_1=false},scores={bacaphd_l_enchanting_lectern_reroll=50..}] run advancement grant @s only bacaphd:enchanting/enchanting_lectern_reroll_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lectern_reroll_2=false},scores={bacaphd_l_enchanting_lectern_reroll=400..}] run advancement grant @s only bacaphd:enchanting/enchanting_lectern_reroll_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lectern_reroll_3=false},scores={bacaphd_l_enchanting_lectern_reroll=1500..}] run advancement grant @s only bacaphd:enchanting/enchanting_lectern_reroll_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lectern_reroll_4=false},scores={bacaphd_l_enchanting_lectern_reroll=6000..}] run advancement grant @s only bacaphd:enchanting/enchanting_lectern_reroll_4
# --- ladder: enchanting_lapis_seams ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_seams_1=false},scores={bacaphd_l_enchanting_lapis_seams=64..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_seams_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_seams_2=false},scores={bacaphd_l_enchanting_lapis_seams=400..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_seams_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_seams_3=false},scores={bacaphd_l_enchanting_lapis_seams=1600..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_seams_3
# --- ladder: enchanting_deepslate_lapis ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_deepslate_lapis_1=false},scores={bacaphd_l_enchanting_deepslate_lapis=64..}] run advancement grant @s only bacaphd:enchanting/enchanting_deepslate_lapis_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_deepslate_lapis_2=false},scores={bacaphd_l_enchanting_deepslate_lapis=512..}] run advancement grant @s only bacaphd:enchanting/enchanting_deepslate_lapis_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_deepslate_lapis_3=false},scores={bacaphd_l_enchanting_deepslate_lapis=2048..}] run advancement grant @s only bacaphd:enchanting/enchanting_deepslate_lapis_3
# --- ladder: enchanting_lapis_blocks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_blocks_1=false},scores={bacaphd_l_enchanting_lapis_blocks=16..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_blocks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_blocks_2=false},scores={bacaphd_l_enchanting_lapis_blocks=128..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_blocks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_blocks_3=false},scores={bacaphd_l_enchanting_lapis_blocks=512..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_blocks_3
# --- ladder: enchanting_lapis_masonry ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_masonry_1=false},scores={bacaphd_l_enchanting_lapis_masonry=16..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_masonry_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_masonry_2=false},scores={bacaphd_l_enchanting_lapis_masonry=128..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_masonry_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_masonry_3=false},scores={bacaphd_l_enchanting_lapis_masonry=640..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_masonry_3
# --- ladder: enchanting_anvil_forge ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_anvil_forge_1=false},scores={bacaphd_l_enchanting_anvil_forge=4..}] run advancement grant @s only bacaphd:enchanting/enchanting_anvil_forge_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_anvil_forge_2=false},scores={bacaphd_l_enchanting_anvil_forge=25..}] run advancement grant @s only bacaphd:enchanting/enchanting_anvil_forge_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_anvil_forge_3=false},scores={bacaphd_l_enchanting_anvil_forge=100..}] run advancement grant @s only bacaphd:enchanting/enchanting_anvil_forge_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_anvil_forge_4=false},scores={bacaphd_l_enchanting_anvil_forge=400..}] run advancement grant @s only bacaphd:enchanting/enchanting_anvil_forge_4
# --- ladder: enchanting_anvil_placement ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_anvil_placement_1=false},scores={bacaphd_l_enchanting_anvil_placement=10..}] run advancement grant @s only bacaphd:enchanting/enchanting_anvil_placement_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_anvil_placement_2=false},scores={bacaphd_l_enchanting_anvil_placement=75..}] run advancement grant @s only bacaphd:enchanting/enchanting_anvil_placement_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_anvil_placement_3=false},scores={bacaphd_l_enchanting_anvil_placement=300..}] run advancement grant @s only bacaphd:enchanting/enchanting_anvil_placement_3
# --- ladder: enchanting_chipped_anvils ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chipped_anvils_1=false},scores={bacaphd_l_enchanting_chipped_anvils=4..}] run advancement grant @s only bacaphd:enchanting/enchanting_chipped_anvils_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chipped_anvils_2=false},scores={bacaphd_l_enchanting_chipped_anvils=24..}] run advancement grant @s only bacaphd:enchanting/enchanting_chipped_anvils_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chipped_anvils_3=false},scores={bacaphd_l_enchanting_chipped_anvils=100..}] run advancement grant @s only bacaphd:enchanting/enchanting_chipped_anvils_3
# --- ladder: enchanting_damaged_anvils ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_damaged_anvils_1=false},scores={bacaphd_l_enchanting_damaged_anvils=3..}] run advancement grant @s only bacaphd:enchanting/enchanting_damaged_anvils_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_damaged_anvils_2=false},scores={bacaphd_l_enchanting_damaged_anvils=20..}] run advancement grant @s only bacaphd:enchanting/enchanting_damaged_anvils_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_damaged_anvils_3=false},scores={bacaphd_l_enchanting_damaged_anvils=80..}] run advancement grant @s only bacaphd:enchanting/enchanting_damaged_anvils_3
# --- ladder: enchanting_table_forge ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_table_forge_1=false},scores={bacaphd_l_enchanting_table_forge=2..}] run advancement grant @s only bacaphd:enchanting/enchanting_table_forge_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_table_forge_2=false},scores={bacaphd_l_enchanting_table_forge=8..}] run advancement grant @s only bacaphd:enchanting/enchanting_table_forge_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_table_forge_3=false},scores={bacaphd_l_enchanting_table_forge=24..}] run advancement grant @s only bacaphd:enchanting/enchanting_table_forge_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_table_forge_4=false},scores={bacaphd_l_enchanting_table_forge=64..}] run advancement grant @s only bacaphd:enchanting/enchanting_table_forge_4
# --- ladder: enchanting_table_placement ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_table_placement_1=false},scores={bacaphd_l_enchanting_table_placement=3..}] run advancement grant @s only bacaphd:enchanting/enchanting_table_placement_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_table_placement_2=false},scores={bacaphd_l_enchanting_table_placement=20..}] run advancement grant @s only bacaphd:enchanting/enchanting_table_placement_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_table_placement_3=false},scores={bacaphd_l_enchanting_table_placement=80..}] run advancement grant @s only bacaphd:enchanting/enchanting_table_placement_3
# --- ladder: enchanting_table_salvage ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_table_salvage_1=false},scores={bacaphd_l_enchanting_table_salvage=2..}] run advancement grant @s only bacaphd:enchanting/enchanting_table_salvage_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_table_salvage_2=false},scores={bacaphd_l_enchanting_table_salvage=12..}] run advancement grant @s only bacaphd:enchanting/enchanting_table_salvage_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_table_salvage_3=false},scores={bacaphd_l_enchanting_table_salvage=50..}] run advancement grant @s only bacaphd:enchanting/enchanting_table_salvage_3
# --- ladder: enchanting_xp_bottles ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_xp_bottles_1=false},scores={bacaphd_l_enchanting_xp_bottles=64..}] run advancement grant @s only bacaphd:enchanting/enchanting_xp_bottles_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_xp_bottles_2=false},scores={bacaphd_l_enchanting_xp_bottles=512..}] run advancement grant @s only bacaphd:enchanting/enchanting_xp_bottles_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_xp_bottles_3=false},scores={bacaphd_l_enchanting_xp_bottles=2048..}] run advancement grant @s only bacaphd:enchanting/enchanting_xp_bottles_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_xp_bottles_4=false},scores={bacaphd_l_enchanting_xp_bottles=8192..}] run advancement grant @s only bacaphd:enchanting/enchanting_xp_bottles_4
# --- ladder: enchanting_grindstone_supply ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_grindstone_supply_1=false},scores={bacaphd_l_enchanting_grindstone_supply=8..}] run advancement grant @s only bacaphd:enchanting/enchanting_grindstone_supply_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_grindstone_supply_2=false},scores={bacaphd_l_enchanting_grindstone_supply=40..}] run advancement grant @s only bacaphd:enchanting/enchanting_grindstone_supply_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_grindstone_supply_3=false},scores={bacaphd_l_enchanting_grindstone_supply=200..}] run advancement grant @s only bacaphd:enchanting/enchanting_grindstone_supply_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_grindstone_supply_4=false},scores={bacaphd_l_enchanting_grindstone_supply=800..}] run advancement grant @s only bacaphd:enchanting/enchanting_grindstone_supply_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_grindstone_supply_5=false},scores={bacaphd_l_enchanting_grindstone_supply=2500..}] run advancement grant @s only bacaphd:enchanting/enchanting_grindstone_supply_5
# --- ladder: enchanting_grindstone_placement ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_grindstone_placement_1=false},scores={bacaphd_l_enchanting_grindstone_placement=25..}] run advancement grant @s only bacaphd:enchanting/enchanting_grindstone_placement_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_grindstone_placement_2=false},scores={bacaphd_l_enchanting_grindstone_placement=150..}] run advancement grant @s only bacaphd:enchanting/enchanting_grindstone_placement_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_grindstone_placement_3=false},scores={bacaphd_l_enchanting_grindstone_placement=600..}] run advancement grant @s only bacaphd:enchanting/enchanting_grindstone_placement_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_grindstone_placement_4=false},scores={bacaphd_l_enchanting_grindstone_placement=2000..}] run advancement grant @s only bacaphd:enchanting/enchanting_grindstone_placement_4
# --- ladder: enchanting_smithing_placement ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_smithing_placement_1=false},scores={bacaphd_l_enchanting_smithing_placement=20..}] run advancement grant @s only bacaphd:enchanting/enchanting_smithing_placement_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_smithing_placement_2=false},scores={bacaphd_l_enchanting_smithing_placement=150..}] run advancement grant @s only bacaphd:enchanting/enchanting_smithing_placement_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_smithing_placement_3=false},scores={bacaphd_l_enchanting_smithing_placement=600..}] run advancement grant @s only bacaphd:enchanting/enchanting_smithing_placement_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_smithing_placement_4=false},scores={bacaphd_l_enchanting_smithing_placement=2500..}] run advancement grant @s only bacaphd:enchanting/enchanting_smithing_placement_4
# --- ladder: enchanting_chiseled_salvage ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chiseled_salvage_1=false},scores={bacaphd_l_enchanting_chiseled_salvage=8..}] run advancement grant @s only bacaphd:enchanting/enchanting_chiseled_salvage_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chiseled_salvage_2=false},scores={bacaphd_l_enchanting_chiseled_salvage=48..}] run advancement grant @s only bacaphd:enchanting/enchanting_chiseled_salvage_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chiseled_salvage_3=false},scores={bacaphd_l_enchanting_chiseled_salvage=200..}] run advancement grant @s only bacaphd:enchanting/enchanting_chiseled_salvage_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_chiseled_salvage_4=false},scores={bacaphd_l_enchanting_chiseled_salvage=800..}] run advancement grant @s only bacaphd:enchanting/enchanting_chiseled_salvage_4
# --- ladder: enchanting_anvil_salvage ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_anvil_salvage_1=false},scores={bacaphd_l_enchanting_anvil_salvage=10..}] run advancement grant @s only bacaphd:enchanting/enchanting_anvil_salvage_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_anvil_salvage_2=false},scores={bacaphd_l_enchanting_anvil_salvage=75..}] run advancement grant @s only bacaphd:enchanting/enchanting_anvil_salvage_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_anvil_salvage_3=false},scores={bacaphd_l_enchanting_anvil_salvage=300..}] run advancement grant @s only bacaphd:enchanting/enchanting_anvil_salvage_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_anvil_salvage_4=false},scores={bacaphd_l_enchanting_anvil_salvage=1000..}] run advancement grant @s only bacaphd:enchanting/enchanting_anvil_salvage_4
# --- ladder: enchanting_lapis_dye ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_dye_1=false},scores={bacaphd_l_enchanting_lapis_dye=64..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_dye_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_dye_2=false},scores={bacaphd_l_enchanting_lapis_dye=256..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_dye_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_dye_3=false},scores={bacaphd_l_enchanting_lapis_dye=1024..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_dye_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_dye_4=false},scores={bacaphd_l_enchanting_lapis_dye=4096..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_dye_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_lapis_dye_5=false},scores={bacaphd_l_enchanting_lapis_dye=12000..}] run advancement grant @s only bacaphd:enchanting/enchanting_lapis_dye_5
# --- ladder: enchanting_obsidian_altar ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_obsidian_altar_1=false},scores={bacaphd_l_enchanting_obsidian_altar=32..}] run advancement grant @s only bacaphd:enchanting/enchanting_obsidian_altar_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_obsidian_altar_2=false},scores={bacaphd_l_enchanting_obsidian_altar=128..}] run advancement grant @s only bacaphd:enchanting/enchanting_obsidian_altar_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_obsidian_altar_3=false},scores={bacaphd_l_enchanting_obsidian_altar=512..}] run advancement grant @s only bacaphd:enchanting/enchanting_obsidian_altar_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_obsidian_altar_4=false},scores={bacaphd_l_enchanting_obsidian_altar=2048..}] run advancement grant @s only bacaphd:enchanting/enchanting_obsidian_altar_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_obsidian_altar_5=false},scores={bacaphd_l_enchanting_obsidian_altar=6000..}] run advancement grant @s only bacaphd:enchanting/enchanting_obsidian_altar_5
# --- ladder: enchanting_cane_planting ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_cane_planting_1=false},scores={bacaphd_l_enchanting_cane_planting=96..}] run advancement grant @s only bacaphd:enchanting/enchanting_cane_planting_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_cane_planting_2=false},scores={bacaphd_l_enchanting_cane_planting=512..}] run advancement grant @s only bacaphd:enchanting/enchanting_cane_planting_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_cane_planting_3=false},scores={bacaphd_l_enchanting_cane_planting=2000..}] run advancement grant @s only bacaphd:enchanting/enchanting_cane_planting_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_cane_planting_4=false},scores={bacaphd_l_enchanting_cane_planting=6000..}] run advancement grant @s only bacaphd:enchanting/enchanting_cane_planting_4
# --- ladder: enchanting_pickaxe_supply ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_pickaxe_supply_1=false},scores={bacaphd_l_enchanting_pickaxe_supply=8..}] run advancement grant @s only bacaphd:enchanting/enchanting_pickaxe_supply_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_pickaxe_supply_2=false},scores={bacaphd_l_enchanting_pickaxe_supply=48..}] run advancement grant @s only bacaphd:enchanting/enchanting_pickaxe_supply_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_pickaxe_supply_3=false},scores={bacaphd_l_enchanting_pickaxe_supply=200..}] run advancement grant @s only bacaphd:enchanting/enchanting_pickaxe_supply_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:enchanting/enchanting_pickaxe_supply_4=false},scores={bacaphd_l_enchanting_pickaxe_supply=600..}] run advancement grant @s only bacaphd:enchanting/enchanting_pickaxe_supply_4
# --- ladder: end_dragon_slayer ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_dragon_slayer_1=false},scores={bacaphd_l_end_dragon_slayer=5..}] run advancement grant @s only bacaphd:end/end_dragon_slayer_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_dragon_slayer_2=false},scores={bacaphd_l_end_dragon_slayer=25..}] run advancement grant @s only bacaphd:end/end_dragon_slayer_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_dragon_slayer_3=false},scores={bacaphd_l_end_dragon_slayer=100..}] run advancement grant @s only bacaphd:end/end_dragon_slayer_3
# --- ladder: end_enderman_hunter ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_enderman_hunter_1=false},scores={bacaphd_l_end_enderman_hunter=500..}] run advancement grant @s only bacaphd:end/end_enderman_hunter_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_enderman_hunter_2=false},scores={bacaphd_l_end_enderman_hunter=5000..}] run advancement grant @s only bacaphd:end/end_enderman_hunter_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_enderman_hunter_3=false},scores={bacaphd_l_end_enderman_hunter=25000..}] run advancement grant @s only bacaphd:end/end_enderman_hunter_3
# --- ladder: end_endermite_purge ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_endermite_purge_1=false},scores={bacaphd_l_end_endermite_purge=8..}] run advancement grant @s only bacaphd:end/end_endermite_purge_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_endermite_purge_2=false},scores={bacaphd_l_end_endermite_purge=40..}] run advancement grant @s only bacaphd:end/end_endermite_purge_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_endermite_purge_3=false},scores={bacaphd_l_end_endermite_purge=200..}] run advancement grant @s only bacaphd:end/end_endermite_purge_3
# --- ladder: end_shulker_slayer ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_slayer_1=false},scores={bacaphd_l_end_shulker_slayer=50..}] run advancement grant @s only bacaphd:end/end_shulker_slayer_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_slayer_2=false},scores={bacaphd_l_end_shulker_slayer=500..}] run advancement grant @s only bacaphd:end/end_shulker_slayer_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_slayer_3=false},scores={bacaphd_l_end_shulker_slayer=2500..}] run advancement grant @s only bacaphd:end/end_shulker_slayer_3
# --- ladder: end_phantom_cull ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_phantom_cull_1=false},scores={bacaphd_l_end_phantom_cull=100..}] run advancement grant @s only bacaphd:end/end_phantom_cull_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_phantom_cull_2=false},scores={bacaphd_l_end_phantom_cull=1000..}] run advancement grant @s only bacaphd:end/end_phantom_cull_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_phantom_cull_3=false},scores={bacaphd_l_end_phantom_cull=5000..}] run advancement grant @s only bacaphd:end/end_phantom_cull_3
# --- ladder: end_end_stone_quarry ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_end_stone_quarry_1=false},scores={bacaphd_l_end_end_stone_quarry=1000..}] run advancement grant @s only bacaphd:end/end_end_stone_quarry_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_end_stone_quarry_2=false},scores={bacaphd_l_end_end_stone_quarry=10000..}] run advancement grant @s only bacaphd:end/end_end_stone_quarry_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_end_stone_quarry_3=false},scores={bacaphd_l_end_end_stone_quarry=50000..}] run advancement grant @s only bacaphd:end/end_end_stone_quarry_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_end_stone_quarry_4=false},scores={bacaphd_l_end_end_stone_quarry=250000..}] run advancement grant @s only bacaphd:end/end_end_stone_quarry_4
# --- ladder: end_end_stone_builder ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_end_stone_builder_1=false},scores={bacaphd_l_end_end_stone_builder=512..}] run advancement grant @s only bacaphd:end/end_end_stone_builder_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_end_stone_builder_2=false},scores={bacaphd_l_end_end_stone_builder=4096..}] run advancement grant @s only bacaphd:end/end_end_stone_builder_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_end_stone_builder_3=false},scores={bacaphd_l_end_end_stone_builder=20000..}] run advancement grant @s only bacaphd:end/end_end_stone_builder_3
# --- ladder: end_brick_mason ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_brick_mason_1=false},scores={bacaphd_l_end_brick_mason=512..}] run advancement grant @s only bacaphd:end/end_brick_mason_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_brick_mason_2=false},scores={bacaphd_l_end_brick_mason=4096..}] run advancement grant @s only bacaphd:end/end_brick_mason_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_brick_mason_3=false},scores={bacaphd_l_end_brick_mason=20000..}] run advancement grant @s only bacaphd:end/end_brick_mason_3
# --- ladder: end_purpur_looter ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_looter_1=false},scores={bacaphd_l_end_purpur_looter=256..}] run advancement grant @s only bacaphd:end/end_purpur_looter_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_looter_2=false},scores={bacaphd_l_end_purpur_looter=2048..}] run advancement grant @s only bacaphd:end/end_purpur_looter_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_looter_3=false},scores={bacaphd_l_end_purpur_looter=10000..}] run advancement grant @s only bacaphd:end/end_purpur_looter_3
# --- ladder: end_purpur_foundry ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_foundry_1=false},scores={bacaphd_l_end_purpur_foundry=128..}] run advancement grant @s only bacaphd:end/end_purpur_foundry_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_foundry_2=false},scores={bacaphd_l_end_purpur_foundry=1024..}] run advancement grant @s only bacaphd:end/end_purpur_foundry_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_foundry_3=false},scores={bacaphd_l_end_purpur_foundry=5000..}] run advancement grant @s only bacaphd:end/end_purpur_foundry_3
# --- ladder: end_purpur_stairway ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_stairway_1=false},scores={bacaphd_l_end_purpur_stairway=256..}] run advancement grant @s only bacaphd:end/end_purpur_stairway_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_stairway_2=false},scores={bacaphd_l_end_purpur_stairway=2048..}] run advancement grant @s only bacaphd:end/end_purpur_stairway_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_stairway_3=false},scores={bacaphd_l_end_purpur_stairway=10000..}] run advancement grant @s only bacaphd:end/end_purpur_stairway_3
# --- ladder: end_chorus_florist ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_florist_1=false},scores={bacaphd_l_end_chorus_florist=64..}] run advancement grant @s only bacaphd:end/end_chorus_florist_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_florist_2=false},scores={bacaphd_l_end_chorus_florist=512..}] run advancement grant @s only bacaphd:end/end_chorus_florist_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_florist_3=false},scores={bacaphd_l_end_chorus_florist=2048..}] run advancement grant @s only bacaphd:end/end_chorus_florist_3
# --- ladder: end_chorus_smelter ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_smelter_1=false},scores={bacaphd_l_end_chorus_smelter=512..}] run advancement grant @s only bacaphd:end/end_chorus_smelter_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_smelter_2=false},scores={bacaphd_l_end_chorus_smelter=4096..}] run advancement grant @s only bacaphd:end/end_chorus_smelter_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_smelter_3=false},scores={bacaphd_l_end_chorus_smelter=20000..}] run advancement grant @s only bacaphd:end/end_chorus_smelter_3
# --- ladder: end_chorus_teleporter ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_teleporter_1=false},scores={bacaphd_l_end_chorus_teleporter=128..}] run advancement grant @s only bacaphd:end/end_chorus_teleporter_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_teleporter_2=false},scores={bacaphd_l_end_chorus_teleporter=1024..}] run advancement grant @s only bacaphd:end/end_chorus_teleporter_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_teleporter_3=false},scores={bacaphd_l_end_chorus_teleporter=5000..}] run advancement grant @s only bacaphd:end/end_chorus_teleporter_3
# --- ladder: end_crystal_ritualist ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_crystal_ritualist_1=false},scores={bacaphd_l_end_crystal_ritualist=16..}] run advancement grant @s only bacaphd:end/end_crystal_ritualist_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_crystal_ritualist_2=false},scores={bacaphd_l_end_crystal_ritualist=64..}] run advancement grant @s only bacaphd:end/end_crystal_ritualist_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_crystal_ritualist_3=false},scores={bacaphd_l_end_crystal_ritualist=256..}] run advancement grant @s only bacaphd:end/end_crystal_ritualist_3
# --- ladder: end_pearl_teleporter ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_pearl_teleporter_1=false},scores={bacaphd_l_end_pearl_teleporter=250..}] run advancement grant @s only bacaphd:end/end_pearl_teleporter_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_pearl_teleporter_2=false},scores={bacaphd_l_end_pearl_teleporter=2000..}] run advancement grant @s only bacaphd:end/end_pearl_teleporter_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_pearl_teleporter_3=false},scores={bacaphd_l_end_pearl_teleporter=8000..}] run advancement grant @s only bacaphd:end/end_pearl_teleporter_3
# --- ladder: end_eye_seeker ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_eye_seeker_1=false},scores={bacaphd_l_end_eye_seeker=32..}] run advancement grant @s only bacaphd:end/end_eye_seeker_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_eye_seeker_2=false},scores={bacaphd_l_end_eye_seeker=256..}] run advancement grant @s only bacaphd:end/end_eye_seeker_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_eye_seeker_3=false},scores={bacaphd_l_end_eye_seeker=1024..}] run advancement grant @s only bacaphd:end/end_eye_seeker_3
# --- ladder: end_rod_smith ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rod_smith_1=false},scores={bacaphd_l_end_rod_smith=64..}] run advancement grant @s only bacaphd:end/end_rod_smith_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rod_smith_2=false},scores={bacaphd_l_end_rod_smith=512..}] run advancement grant @s only bacaphd:end/end_rod_smith_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rod_smith_3=false},scores={bacaphd_l_end_rod_smith=2048..}] run advancement grant @s only bacaphd:end/end_rod_smith_3
# --- ladder: end_rod_lighter ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rod_lighter_1=false},scores={bacaphd_l_end_rod_lighter=128..}] run advancement grant @s only bacaphd:end/end_rod_lighter_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rod_lighter_2=false},scores={bacaphd_l_end_rod_lighter=1024..}] run advancement grant @s only bacaphd:end/end_rod_lighter_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rod_lighter_3=false},scores={bacaphd_l_end_rod_lighter=5000..}] run advancement grant @s only bacaphd:end/end_rod_lighter_3
# --- ladder: end_rocket_flier ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rocket_flier_1=false},scores={bacaphd_l_end_rocket_flier=500..}] run advancement grant @s only bacaphd:end/end_rocket_flier_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rocket_flier_2=false},scores={bacaphd_l_end_rocket_flier=5000..}] run advancement grant @s only bacaphd:end/end_rocket_flier_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rocket_flier_3=false},scores={bacaphd_l_end_rocket_flier=25000..}] run advancement grant @s only bacaphd:end/end_rocket_flier_3
# --- ladder: end_rocket_factory ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rocket_factory_1=false},scores={bacaphd_l_end_rocket_factory=512..}] run advancement grant @s only bacaphd:end/end_rocket_factory_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rocket_factory_2=false},scores={bacaphd_l_end_rocket_factory=4096..}] run advancement grant @s only bacaphd:end/end_rocket_factory_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_rocket_factory_3=false},scores={bacaphd_l_end_rocket_factory=20000..}] run advancement grant @s only bacaphd:end/end_rocket_factory_3
# --- ladder: end_firework_artisan ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_firework_artisan_1=false},scores={bacaphd_l_end_firework_artisan=64..}] run advancement grant @s only bacaphd:end/end_firework_artisan_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_firework_artisan_2=false},scores={bacaphd_l_end_firework_artisan=512..}] run advancement grant @s only bacaphd:end/end_firework_artisan_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_firework_artisan_3=false},scores={bacaphd_l_end_firework_artisan=2048..}] run advancement grant @s only bacaphd:end/end_firework_artisan_3
# --- ladder: end_ender_chest_network ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_ender_chest_network_1=false},scores={bacaphd_l_end_ender_chest_network=8..}] run advancement grant @s only bacaphd:end/end_ender_chest_network_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_ender_chest_network_2=false},scores={bacaphd_l_end_ender_chest_network=40..}] run advancement grant @s only bacaphd:end/end_ender_chest_network_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_ender_chest_network_3=false},scores={bacaphd_l_end_ender_chest_network=200..}] run advancement grant @s only bacaphd:end/end_ender_chest_network_3
# --- ladder: end_shulker_box_crafter ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_box_crafter_1=false},scores={bacaphd_l_end_shulker_box_crafter=16..}] run advancement grant @s only bacaphd:end/end_shulker_box_crafter_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_box_crafter_2=false},scores={bacaphd_l_end_shulker_box_crafter=64..}] run advancement grant @s only bacaphd:end/end_shulker_box_crafter_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_box_crafter_3=false},scores={bacaphd_l_end_shulker_box_crafter=256..}] run advancement grant @s only bacaphd:end/end_shulker_box_crafter_3
# --- ladder: end_shulker_box_nomad ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_box_nomad_1=false},scores={bacaphd_l_end_shulker_box_nomad=64..}] run advancement grant @s only bacaphd:end/end_shulker_box_nomad_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_box_nomad_2=false},scores={bacaphd_l_end_shulker_box_nomad=512..}] run advancement grant @s only bacaphd:end/end_shulker_box_nomad_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_box_nomad_3=false},scores={bacaphd_l_end_shulker_box_nomad=2500..}] run advancement grant @s only bacaphd:end/end_shulker_box_nomad_3
# --- ladder: end_chorus_harvest ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_harvest_1=false},scores={bacaphd_l_end_chorus_harvest=500..}] run advancement grant @s only bacaphd:end/end_chorus_harvest_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_harvest_2=false},scores={bacaphd_l_end_chorus_harvest=2500..}] run advancement grant @s only bacaphd:end/end_chorus_harvest_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_harvest_3=false},scores={bacaphd_l_end_chorus_harvest=10000..}] run advancement grant @s only bacaphd:end/end_chorus_harvest_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_harvest_4=false},scores={bacaphd_l_end_chorus_harvest=30000..}] run advancement grant @s only bacaphd:end/end_chorus_harvest_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_harvest_5=false},scores={bacaphd_l_end_chorus_harvest=100000..}] run advancement grant @s only bacaphd:end/end_chorus_harvest_5
# --- ladder: end_chorus_planter ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_planter_1=false},scores={bacaphd_l_end_chorus_planter=64..}] run advancement grant @s only bacaphd:end/end_chorus_planter_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_planter_2=false},scores={bacaphd_l_end_chorus_planter=256..}] run advancement grant @s only bacaphd:end/end_chorus_planter_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_planter_3=false},scores={bacaphd_l_end_chorus_planter=1024..}] run advancement grant @s only bacaphd:end/end_chorus_planter_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_chorus_planter_4=false},scores={bacaphd_l_end_chorus_planter=4096..}] run advancement grant @s only bacaphd:end/end_chorus_planter_4
# --- ladder: end_purpur_pillar ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_pillar_1=false},scores={bacaphd_l_end_purpur_pillar=256..}] run advancement grant @s only bacaphd:end/end_purpur_pillar_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_pillar_2=false},scores={bacaphd_l_end_purpur_pillar=1024..}] run advancement grant @s only bacaphd:end/end_purpur_pillar_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_pillar_3=false},scores={bacaphd_l_end_purpur_pillar=4096..}] run advancement grant @s only bacaphd:end/end_purpur_pillar_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_purpur_pillar_4=false},scores={bacaphd_l_end_purpur_pillar=16384..}] run advancement grant @s only bacaphd:end/end_purpur_pillar_4
# --- ladder: end_brick_stairs ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_brick_stairs_1=false},scores={bacaphd_l_end_brick_stairs=256..}] run advancement grant @s only bacaphd:end/end_brick_stairs_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_brick_stairs_2=false},scores={bacaphd_l_end_brick_stairs=1024..}] run advancement grant @s only bacaphd:end/end_brick_stairs_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_brick_stairs_3=false},scores={bacaphd_l_end_brick_stairs=4096..}] run advancement grant @s only bacaphd:end/end_brick_stairs_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_brick_stairs_4=false},scores={bacaphd_l_end_brick_stairs=16384..}] run advancement grant @s only bacaphd:end/end_brick_stairs_4
# --- ladder: end_eye_crafter ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_eye_crafter_1=false},scores={bacaphd_l_end_eye_crafter=16..}] run advancement grant @s only bacaphd:end/end_eye_crafter_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_eye_crafter_2=false},scores={bacaphd_l_end_eye_crafter=64..}] run advancement grant @s only bacaphd:end/end_eye_crafter_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_eye_crafter_3=false},scores={bacaphd_l_end_eye_crafter=256..}] run advancement grant @s only bacaphd:end/end_eye_crafter_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_eye_crafter_4=false},scores={bacaphd_l_end_eye_crafter=1024..}] run advancement grant @s only bacaphd:end/end_eye_crafter_4
# --- ladder: end_crystal_forge ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_crystal_forge_1=false},scores={bacaphd_l_end_crystal_forge=32..}] run advancement grant @s only bacaphd:end/end_crystal_forge_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_crystal_forge_2=false},scores={bacaphd_l_end_crystal_forge=128..}] run advancement grant @s only bacaphd:end/end_crystal_forge_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_crystal_forge_3=false},scores={bacaphd_l_end_crystal_forge=512..}] run advancement grant @s only bacaphd:end/end_crystal_forge_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_crystal_forge_4=false},scores={bacaphd_l_end_crystal_forge=2048..}] run advancement grant @s only bacaphd:end/end_crystal_forge_4
# --- ladder: end_shulker_unpacking ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_unpacking_1=false},scores={bacaphd_l_end_shulker_unpacking=250..}] run advancement grant @s only bacaphd:end/end_shulker_unpacking_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_unpacking_2=false},scores={bacaphd_l_end_shulker_unpacking=1000..}] run advancement grant @s only bacaphd:end/end_shulker_unpacking_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_unpacking_3=false},scores={bacaphd_l_end_shulker_unpacking=5000..}] run advancement grant @s only bacaphd:end/end_shulker_unpacking_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_shulker_unpacking_4=false},scores={bacaphd_l_end_shulker_unpacking=15000..}] run advancement grant @s only bacaphd:end/end_shulker_unpacking_4
# --- ladder: end_ender_chest_placer ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_ender_chest_placer_1=false},scores={bacaphd_l_end_ender_chest_placer=50..}] run advancement grant @s only bacaphd:end/end_ender_chest_placer_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_ender_chest_placer_2=false},scores={bacaphd_l_end_ender_chest_placer=250..}] run advancement grant @s only bacaphd:end/end_ender_chest_placer_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_ender_chest_placer_3=false},scores={bacaphd_l_end_ender_chest_placer=1000..}] run advancement grant @s only bacaphd:end/end_ender_chest_placer_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_ender_chest_placer_4=false},scores={bacaphd_l_end_ender_chest_placer=4000..}] run advancement grant @s only bacaphd:end/end_ender_chest_placer_4
# --- ladder: end_scaffold_bridger ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_scaffold_bridger_1=false},scores={bacaphd_l_end_scaffold_bridger=1000..}] run advancement grant @s only bacaphd:end/end_scaffold_bridger_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_scaffold_bridger_2=false},scores={bacaphd_l_end_scaffold_bridger=5000..}] run advancement grant @s only bacaphd:end/end_scaffold_bridger_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_scaffold_bridger_3=false},scores={bacaphd_l_end_scaffold_bridger=25000..}] run advancement grant @s only bacaphd:end/end_scaffold_bridger_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_scaffold_bridger_4=false},scores={bacaphd_l_end_scaffold_bridger=100000..}] run advancement grant @s only bacaphd:end/end_scaffold_bridger_4
# --- ladder: end_glass_smelter ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_glass_smelter_1=false},scores={bacaphd_l_end_glass_smelter=512..}] run advancement grant @s only bacaphd:end/end_glass_smelter_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_glass_smelter_2=false},scores={bacaphd_l_end_glass_smelter=2048..}] run advancement grant @s only bacaphd:end/end_glass_smelter_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_glass_smelter_3=false},scores={bacaphd_l_end_glass_smelter=10000..}] run advancement grant @s only bacaphd:end/end_glass_smelter_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_glass_smelter_4=false},scores={bacaphd_l_end_glass_smelter=30000..}] run advancement grant @s only bacaphd:end/end_glass_smelter_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/end_glass_smelter_5=false},scores={bacaphd_l_end_glass_smelter=100000..}] run advancement grant @s only bacaphd:end/end_glass_smelter_5
# --- ladder: farming_wheat_reaped ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_wheat_reaped_1=false},scores={bacaphd_l_farming_wheat_reaped=500..}] run advancement grant @s only bacaphd:farming/farming_wheat_reaped_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_wheat_reaped_2=false},scores={bacaphd_l_farming_wheat_reaped=4000..}] run advancement grant @s only bacaphd:farming/farming_wheat_reaped_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_wheat_reaped_3=false},scores={bacaphd_l_farming_wheat_reaped=20000..}] run advancement grant @s only bacaphd:farming/farming_wheat_reaped_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_wheat_reaped_4=false},scores={bacaphd_l_farming_wheat_reaped=80000..}] run advancement grant @s only bacaphd:farming/farming_wheat_reaped_4
# --- ladder: farming_seeds_sown ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_seeds_sown_1=false},scores={bacaphd_l_farming_seeds_sown=250..}] run advancement grant @s only bacaphd:farming/farming_seeds_sown_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_seeds_sown_2=false},scores={bacaphd_l_farming_seeds_sown=2000..}] run advancement grant @s only bacaphd:farming/farming_seeds_sown_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_seeds_sown_3=false},scores={bacaphd_l_farming_seeds_sown=10000..}] run advancement grant @s only bacaphd:farming/farming_seeds_sown_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_seeds_sown_4=false},scores={bacaphd_l_farming_seeds_sown=50000..}] run advancement grant @s only bacaphd:farming/farming_seeds_sown_4
# --- ladder: farming_carrots_pulled ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_carrots_pulled_1=false},scores={bacaphd_l_farming_carrots_pulled=250..}] run advancement grant @s only bacaphd:farming/farming_carrots_pulled_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_carrots_pulled_2=false},scores={bacaphd_l_farming_carrots_pulled=2000..}] run advancement grant @s only bacaphd:farming/farming_carrots_pulled_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_carrots_pulled_3=false},scores={bacaphd_l_farming_carrots_pulled=10000..}] run advancement grant @s only bacaphd:farming/farming_carrots_pulled_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_carrots_pulled_4=false},scores={bacaphd_l_farming_carrots_pulled=40000..}] run advancement grant @s only bacaphd:farming/farming_carrots_pulled_4
# --- ladder: farming_potatoes_dug ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_potatoes_dug_1=false},scores={bacaphd_l_farming_potatoes_dug=250..}] run advancement grant @s only bacaphd:farming/farming_potatoes_dug_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_potatoes_dug_2=false},scores={bacaphd_l_farming_potatoes_dug=2000..}] run advancement grant @s only bacaphd:farming/farming_potatoes_dug_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_potatoes_dug_3=false},scores={bacaphd_l_farming_potatoes_dug=10000..}] run advancement grant @s only bacaphd:farming/farming_potatoes_dug_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_potatoes_dug_4=false},scores={bacaphd_l_farming_potatoes_dug=40000..}] run advancement grant @s only bacaphd:farming/farming_potatoes_dug_4
# --- ladder: farming_beetroots_pulled ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_beetroots_pulled_1=false},scores={bacaphd_l_farming_beetroots_pulled=200..}] run advancement grant @s only bacaphd:farming/farming_beetroots_pulled_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_beetroots_pulled_2=false},scores={bacaphd_l_farming_beetroots_pulled=1500..}] run advancement grant @s only bacaphd:farming/farming_beetroots_pulled_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_beetroots_pulled_3=false},scores={bacaphd_l_farming_beetroots_pulled=8000..}] run advancement grant @s only bacaphd:farming/farming_beetroots_pulled_3
# --- ladder: farming_melons_split ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_melons_split_1=false},scores={bacaphd_l_farming_melons_split=250..}] run advancement grant @s only bacaphd:farming/farming_melons_split_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_melons_split_2=false},scores={bacaphd_l_farming_melons_split=2000..}] run advancement grant @s only bacaphd:farming/farming_melons_split_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_melons_split_3=false},scores={bacaphd_l_farming_melons_split=10000..}] run advancement grant @s only bacaphd:farming/farming_melons_split_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_melons_split_4=false},scores={bacaphd_l_farming_melons_split=40000..}] run advancement grant @s only bacaphd:farming/farming_melons_split_4
# --- ladder: farming_pumpkins_picked ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_pumpkins_picked_1=false},scores={bacaphd_l_farming_pumpkins_picked=250..}] run advancement grant @s only bacaphd:farming/farming_pumpkins_picked_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_pumpkins_picked_2=false},scores={bacaphd_l_farming_pumpkins_picked=2000..}] run advancement grant @s only bacaphd:farming/farming_pumpkins_picked_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_pumpkins_picked_3=false},scores={bacaphd_l_farming_pumpkins_picked=10000..}] run advancement grant @s only bacaphd:farming/farming_pumpkins_picked_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_pumpkins_picked_4=false},scores={bacaphd_l_farming_pumpkins_picked=40000..}] run advancement grant @s only bacaphd:farming/farming_pumpkins_picked_4
# --- ladder: farming_cane_cut ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cane_cut_1=false},scores={bacaphd_l_farming_cane_cut=250..}] run advancement grant @s only bacaphd:farming/farming_cane_cut_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cane_cut_2=false},scores={bacaphd_l_farming_cane_cut=2000..}] run advancement grant @s only bacaphd:farming/farming_cane_cut_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cane_cut_3=false},scores={bacaphd_l_farming_cane_cut=10000..}] run advancement grant @s only bacaphd:farming/farming_cane_cut_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cane_cut_4=false},scores={bacaphd_l_farming_cane_cut=40000..}] run advancement grant @s only bacaphd:farming/farming_cane_cut_4
# --- ladder: farming_nether_wart ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_nether_wart_1=false},scores={bacaphd_l_farming_nether_wart=250..}] run advancement grant @s only bacaphd:farming/farming_nether_wart_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_nether_wart_2=false},scores={bacaphd_l_farming_nether_wart=2000..}] run advancement grant @s only bacaphd:farming/farming_nether_wart_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_nether_wart_3=false},scores={bacaphd_l_farming_nether_wart=10000..}] run advancement grant @s only bacaphd:farming/farming_nether_wart_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_nether_wart_4=false},scores={bacaphd_l_farming_nether_wart=40000..}] run advancement grant @s only bacaphd:farming/farming_nether_wart_4
# --- ladder: farming_leaves_stripped ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_leaves_stripped_1=false},scores={bacaphd_l_farming_leaves_stripped=1000..}] run advancement grant @s only bacaphd:farming/farming_leaves_stripped_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_leaves_stripped_2=false},scores={bacaphd_l_farming_leaves_stripped=8000..}] run advancement grant @s only bacaphd:farming/farming_leaves_stripped_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_leaves_stripped_3=false},scores={bacaphd_l_farming_leaves_stripped=40000..}] run advancement grant @s only bacaphd:farming/farming_leaves_stripped_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_leaves_stripped_4=false},scores={bacaphd_l_farming_leaves_stripped=120000..}] run advancement grant @s only bacaphd:farming/farming_leaves_stripped_4
# --- ladder: farming_bone_meal_used ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bone_meal_used_1=false},scores={bacaphd_l_farming_bone_meal_used=500..}] run advancement grant @s only bacaphd:farming/farming_bone_meal_used_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bone_meal_used_2=false},scores={bacaphd_l_farming_bone_meal_used=4000..}] run advancement grant @s only bacaphd:farming/farming_bone_meal_used_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bone_meal_used_3=false},scores={bacaphd_l_farming_bone_meal_used=20000..}] run advancement grant @s only bacaphd:farming/farming_bone_meal_used_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bone_meal_used_4=false},scores={bacaphd_l_farming_bone_meal_used=80000..}] run advancement grant @s only bacaphd:farming/farming_bone_meal_used_4
# --- ladder: farming_saplings_planted ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_saplings_planted_1=false},scores={bacaphd_l_farming_saplings_planted=100..}] run advancement grant @s only bacaphd:farming/farming_saplings_planted_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_saplings_planted_2=false},scores={bacaphd_l_farming_saplings_planted=750..}] run advancement grant @s only bacaphd:farming/farming_saplings_planted_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_saplings_planted_3=false},scores={bacaphd_l_farming_saplings_planted=5000..}] run advancement grant @s only bacaphd:farming/farming_saplings_planted_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_saplings_planted_4=false},scores={bacaphd_l_farming_saplings_planted=25000..}] run advancement grant @s only bacaphd:farming/farming_saplings_planted_4
# --- ladder: farming_bread_baked ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bread_baked_1=false},scores={bacaphd_l_farming_bread_baked=128..}] run advancement grant @s only bacaphd:farming/farming_bread_baked_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bread_baked_2=false},scores={bacaphd_l_farming_bread_baked=1000..}] run advancement grant @s only bacaphd:farming/farming_bread_baked_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bread_baked_3=false},scores={bacaphd_l_farming_bread_baked=6000..}] run advancement grant @s only bacaphd:farming/farming_bread_baked_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bread_baked_4=false},scores={bacaphd_l_farming_bread_baked=25000..}] run advancement grant @s only bacaphd:farming/farming_bread_baked_4
# --- ladder: farming_cakes_baked ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cakes_baked_1=false},scores={bacaphd_l_farming_cakes_baked=16..}] run advancement grant @s only bacaphd:farming/farming_cakes_baked_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cakes_baked_2=false},scores={bacaphd_l_farming_cakes_baked=100..}] run advancement grant @s only bacaphd:farming/farming_cakes_baked_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cakes_baked_3=false},scores={bacaphd_l_farming_cakes_baked=500..}] run advancement grant @s only bacaphd:farming/farming_cakes_baked_3
# --- ladder: farming_cookies_baked ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cookies_baked_1=false},scores={bacaphd_l_farming_cookies_baked=128..}] run advancement grant @s only bacaphd:farming/farming_cookies_baked_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cookies_baked_2=false},scores={bacaphd_l_farming_cookies_baked=1024..}] run advancement grant @s only bacaphd:farming/farming_cookies_baked_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cookies_baked_3=false},scores={bacaphd_l_farming_cookies_baked=8192..}] run advancement grant @s only bacaphd:farming/farming_cookies_baked_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cookies_baked_4=false},scores={bacaphd_l_farming_cookies_baked=40000..}] run advancement grant @s only bacaphd:farming/farming_cookies_baked_4
# --- ladder: farming_pies_baked ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_pies_baked_1=false},scores={bacaphd_l_farming_pies_baked=32..}] run advancement grant @s only bacaphd:farming/farming_pies_baked_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_pies_baked_2=false},scores={bacaphd_l_farming_pies_baked=256..}] run advancement grant @s only bacaphd:farming/farming_pies_baked_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_pies_baked_3=false},scores={bacaphd_l_farming_pies_baked=1200..}] run advancement grant @s only bacaphd:farming/farming_pies_baked_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_pies_baked_4=false},scores={bacaphd_l_farming_pies_baked=5000..}] run advancement grant @s only bacaphd:farming/farming_pies_baked_4
# --- ladder: farming_golden_carrots ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_golden_carrots_1=false},scores={bacaphd_l_farming_golden_carrots=64..}] run advancement grant @s only bacaphd:farming/farming_golden_carrots_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_golden_carrots_2=false},scores={bacaphd_l_farming_golden_carrots=512..}] run advancement grant @s only bacaphd:farming/farming_golden_carrots_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_golden_carrots_3=false},scores={bacaphd_l_farming_golden_carrots=2048..}] run advancement grant @s only bacaphd:farming/farming_golden_carrots_3
# --- ladder: farming_hay_bales ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_hay_bales_1=false},scores={bacaphd_l_farming_hay_bales=64..}] run advancement grant @s only bacaphd:farming/farming_hay_bales_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_hay_bales_2=false},scores={bacaphd_l_farming_hay_bales=512..}] run advancement grant @s only bacaphd:farming/farming_hay_bales_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_hay_bales_3=false},scores={bacaphd_l_farming_hay_bales=2500..}] run advancement grant @s only bacaphd:farming/farming_hay_bales_3
# --- ladder: farming_dried_kelp_blocks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_dried_kelp_blocks_1=false},scores={bacaphd_l_farming_dried_kelp_blocks=64..}] run advancement grant @s only bacaphd:farming/farming_dried_kelp_blocks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_dried_kelp_blocks_2=false},scores={bacaphd_l_farming_dried_kelp_blocks=512..}] run advancement grant @s only bacaphd:farming/farming_dried_kelp_blocks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_dried_kelp_blocks_3=false},scores={bacaphd_l_farming_dried_kelp_blocks=2500..}] run advancement grant @s only bacaphd:farming/farming_dried_kelp_blocks_3
# --- ladder: farming_berries_picked ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_berries_picked_1=false},scores={bacaphd_l_farming_berries_picked=250..}] run advancement grant @s only bacaphd:farming/farming_berries_picked_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_berries_picked_2=false},scores={bacaphd_l_farming_berries_picked=2000..}] run advancement grant @s only bacaphd:farming/farming_berries_picked_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_berries_picked_3=false},scores={bacaphd_l_farming_berries_picked=10000..}] run advancement grant @s only bacaphd:farming/farming_berries_picked_3
# --- ladder: farming_red_mushrooms ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_red_mushrooms_1=false},scores={bacaphd_l_farming_red_mushrooms=250..}] run advancement grant @s only bacaphd:farming/farming_red_mushrooms_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_red_mushrooms_2=false},scores={bacaphd_l_farming_red_mushrooms=2000..}] run advancement grant @s only bacaphd:farming/farming_red_mushrooms_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_red_mushrooms_3=false},scores={bacaphd_l_farming_red_mushrooms=10000..}] run advancement grant @s only bacaphd:farming/farming_red_mushrooms_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_red_mushrooms_4=false},scores={bacaphd_l_farming_red_mushrooms=40000..}] run advancement grant @s only bacaphd:farming/farming_red_mushrooms_4
# --- ladder: farming_cocoa_planted ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cocoa_planted_1=false},scores={bacaphd_l_farming_cocoa_planted=250..}] run advancement grant @s only bacaphd:farming/farming_cocoa_planted_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cocoa_planted_2=false},scores={bacaphd_l_farming_cocoa_planted=2000..}] run advancement grant @s only bacaphd:farming/farming_cocoa_planted_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cocoa_planted_3=false},scores={bacaphd_l_farming_cocoa_planted=10000..}] run advancement grant @s only bacaphd:farming/farming_cocoa_planted_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_cocoa_planted_4=false},scores={bacaphd_l_farming_cocoa_planted=40000..}] run advancement grant @s only bacaphd:farming/farming_cocoa_planted_4
# --- ladder: farming_green_dye ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_green_dye_1=false},scores={bacaphd_l_farming_green_dye=256..}] run advancement grant @s only bacaphd:farming/farming_green_dye_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_green_dye_2=false},scores={bacaphd_l_farming_green_dye=2048..}] run advancement grant @s only bacaphd:farming/farming_green_dye_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_green_dye_3=false},scores={bacaphd_l_farming_green_dye=10000..}] run advancement grant @s only bacaphd:farming/farming_green_dye_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_green_dye_4=false},scores={bacaphd_l_farming_green_dye=40000..}] run advancement grant @s only bacaphd:farming/farming_green_dye_4
# --- ladder: farming_steak_cooked ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_steak_cooked_1=false},scores={bacaphd_l_farming_steak_cooked=64..}] run advancement grant @s only bacaphd:farming/farming_steak_cooked_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_steak_cooked_2=false},scores={bacaphd_l_farming_steak_cooked=512..}] run advancement grant @s only bacaphd:farming/farming_steak_cooked_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_steak_cooked_3=false},scores={bacaphd_l_farming_steak_cooked=4000..}] run advancement grant @s only bacaphd:farming/farming_steak_cooked_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_steak_cooked_4=false},scores={bacaphd_l_farming_steak_cooked=20000..}] run advancement grant @s only bacaphd:farming/farming_steak_cooked_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_steak_cooked_5=false},scores={bacaphd_l_farming_steak_cooked=75000..}] run advancement grant @s only bacaphd:farming/farming_steak_cooked_5
# --- ladder: farming_baked_potatoes ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_baked_potatoes_1=false},scores={bacaphd_l_farming_baked_potatoes=128..}] run advancement grant @s only bacaphd:farming/farming_baked_potatoes_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_baked_potatoes_2=false},scores={bacaphd_l_farming_baked_potatoes=1024..}] run advancement grant @s only bacaphd:farming/farming_baked_potatoes_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_baked_potatoes_3=false},scores={bacaphd_l_farming_baked_potatoes=8000..}] run advancement grant @s only bacaphd:farming/farming_baked_potatoes_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_baked_potatoes_4=false},scores={bacaphd_l_farming_baked_potatoes=35000..}] run advancement grant @s only bacaphd:farming/farming_baked_potatoes_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_baked_potatoes_5=false},scores={bacaphd_l_farming_baked_potatoes=120000..}] run advancement grant @s only bacaphd:farming/farming_baked_potatoes_5
# --- ladder: farming_dried_kelp ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_dried_kelp_1=false},scores={bacaphd_l_farming_dried_kelp=512..}] run advancement grant @s only bacaphd:farming/farming_dried_kelp_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_dried_kelp_2=false},scores={bacaphd_l_farming_dried_kelp=4096..}] run advancement grant @s only bacaphd:farming/farming_dried_kelp_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_dried_kelp_3=false},scores={bacaphd_l_farming_dried_kelp=25000..}] run advancement grant @s only bacaphd:farming/farming_dried_kelp_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_dried_kelp_4=false},scores={bacaphd_l_farming_dried_kelp=100000..}] run advancement grant @s only bacaphd:farming/farming_dried_kelp_4
# --- ladder: farming_glow_berries ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_glow_berries_1=false},scores={bacaphd_l_farming_glow_berries=250..}] run advancement grant @s only bacaphd:farming/farming_glow_berries_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_glow_berries_2=false},scores={bacaphd_l_farming_glow_berries=2000..}] run advancement grant @s only bacaphd:farming/farming_glow_berries_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_glow_berries_3=false},scores={bacaphd_l_farming_glow_berries=10000..}] run advancement grant @s only bacaphd:farming/farming_glow_berries_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_glow_berries_4=false},scores={bacaphd_l_farming_glow_berries=40000..}] run advancement grant @s only bacaphd:farming/farming_glow_berries_4
# --- ladder: farming_bone_meal_crafted ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bone_meal_crafted_1=false},scores={bacaphd_l_farming_bone_meal_crafted=256..}] run advancement grant @s only bacaphd:farming/farming_bone_meal_crafted_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bone_meal_crafted_2=false},scores={bacaphd_l_farming_bone_meal_crafted=2048..}] run advancement grant @s only bacaphd:farming/farming_bone_meal_crafted_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bone_meal_crafted_3=false},scores={bacaphd_l_farming_bone_meal_crafted=12000..}] run advancement grant @s only bacaphd:farming/farming_bone_meal_crafted_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bone_meal_crafted_4=false},scores={bacaphd_l_farming_bone_meal_crafted=50000..}] run advancement grant @s only bacaphd:farming/farming_bone_meal_crafted_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_bone_meal_crafted_5=false},scores={bacaphd_l_farming_bone_meal_crafted=200000..}] run advancement grant @s only bacaphd:farming/farming_bone_meal_crafted_5
# --- ladder: farming_golden_apples ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_golden_apples_1=false},scores={bacaphd_l_farming_golden_apples=16..}] run advancement grant @s only bacaphd:farming/farming_golden_apples_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_golden_apples_2=false},scores={bacaphd_l_farming_golden_apples=64..}] run advancement grant @s only bacaphd:farming/farming_golden_apples_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_golden_apples_3=false},scores={bacaphd_l_farming_golden_apples=256..}] run advancement grant @s only bacaphd:farming/farming_golden_apples_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_golden_apples_4=false},scores={bacaphd_l_farming_golden_apples=1024..}] run advancement grant @s only bacaphd:farming/farming_golden_apples_4
# --- ladder: farming_mushroom_stew ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_mushroom_stew_1=false},scores={bacaphd_l_farming_mushroom_stew=64..}] run advancement grant @s only bacaphd:farming/farming_mushroom_stew_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_mushroom_stew_2=false},scores={bacaphd_l_farming_mushroom_stew=512..}] run advancement grant @s only bacaphd:farming/farming_mushroom_stew_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_mushroom_stew_3=false},scores={bacaphd_l_farming_mushroom_stew=2048..}] run advancement grant @s only bacaphd:farming/farming_mushroom_stew_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/farming_mushroom_stew_4=false},scores={bacaphd_l_farming_mushroom_stew=8192..}] run advancement grant @s only bacaphd:farming/farming_mushroom_stew_4
# --- ladder: mining_stone ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_stone_1=false},scores={bacaphd_l_mining_stone=1000..}] run advancement grant @s only bacaphd:mining/mining_stone_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_stone_2=false},scores={bacaphd_l_mining_stone=10000..}] run advancement grant @s only bacaphd:mining/mining_stone_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_stone_3=false},scores={bacaphd_l_mining_stone=50000..}] run advancement grant @s only bacaphd:mining/mining_stone_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_stone_4=false},scores={bacaphd_l_mining_stone=250000..}] run advancement grant @s only bacaphd:mining/mining_stone_4
# --- ladder: mining_deepslate ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_1=false},scores={bacaphd_l_mining_deepslate=1000..}] run advancement grant @s only bacaphd:mining/mining_deepslate_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_2=false},scores={bacaphd_l_mining_deepslate=10000..}] run advancement grant @s only bacaphd:mining/mining_deepslate_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_3=false},scores={bacaphd_l_mining_deepslate=50000..}] run advancement grant @s only bacaphd:mining/mining_deepslate_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_4=false},scores={bacaphd_l_mining_deepslate=200000..}] run advancement grant @s only bacaphd:mining/mining_deepslate_4
# --- ladder: mining_tuff ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_tuff_1=false},scores={bacaphd_l_mining_tuff=500..}] run advancement grant @s only bacaphd:mining/mining_tuff_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_tuff_2=false},scores={bacaphd_l_mining_tuff=2500..}] run advancement grant @s only bacaphd:mining/mining_tuff_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_tuff_3=false},scores={bacaphd_l_mining_tuff=10000..}] run advancement grant @s only bacaphd:mining/mining_tuff_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_tuff_4=false},scores={bacaphd_l_mining_tuff=40000..}] run advancement grant @s only bacaphd:mining/mining_tuff_4
# --- ladder: mining_gravel ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_gravel_1=false},scores={bacaphd_l_mining_gravel=500..}] run advancement grant @s only bacaphd:mining/mining_gravel_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_gravel_2=false},scores={bacaphd_l_mining_gravel=2500..}] run advancement grant @s only bacaphd:mining/mining_gravel_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_gravel_3=false},scores={bacaphd_l_mining_gravel=10000..}] run advancement grant @s only bacaphd:mining/mining_gravel_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_gravel_4=false},scores={bacaphd_l_mining_gravel=40000..}] run advancement grant @s only bacaphd:mining/mining_gravel_4
# --- ladder: mining_obsidian ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_obsidian_1=false},scores={bacaphd_l_mining_obsidian=128..}] run advancement grant @s only bacaphd:mining/mining_obsidian_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_obsidian_2=false},scores={bacaphd_l_mining_obsidian=512..}] run advancement grant @s only bacaphd:mining/mining_obsidian_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_obsidian_3=false},scores={bacaphd_l_mining_obsidian=2048..}] run advancement grant @s only bacaphd:mining/mining_obsidian_3
# --- ladder: mining_coal_ore ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_coal_ore_1=false},scores={bacaphd_l_mining_coal_ore=128..}] run advancement grant @s only bacaphd:mining/mining_coal_ore_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_coal_ore_2=false},scores={bacaphd_l_mining_coal_ore=1024..}] run advancement grant @s only bacaphd:mining/mining_coal_ore_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_coal_ore_3=false},scores={bacaphd_l_mining_coal_ore=4096..}] run advancement grant @s only bacaphd:mining/mining_coal_ore_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_coal_ore_4=false},scores={bacaphd_l_mining_coal_ore=16384..}] run advancement grant @s only bacaphd:mining/mining_coal_ore_4
# --- ladder: mining_copper_ore ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_copper_ore_1=false},scores={bacaphd_l_mining_copper_ore=128..}] run advancement grant @s only bacaphd:mining/mining_copper_ore_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_copper_ore_2=false},scores={bacaphd_l_mining_copper_ore=1024..}] run advancement grant @s only bacaphd:mining/mining_copper_ore_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_copper_ore_3=false},scores={bacaphd_l_mining_copper_ore=4096..}] run advancement grant @s only bacaphd:mining/mining_copper_ore_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_copper_ore_4=false},scores={bacaphd_l_mining_copper_ore=16384..}] run advancement grant @s only bacaphd:mining/mining_copper_ore_4
# --- ladder: mining_iron_ore ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_iron_ore_1=false},scores={bacaphd_l_mining_iron_ore=128..}] run advancement grant @s only bacaphd:mining/mining_iron_ore_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_iron_ore_2=false},scores={bacaphd_l_mining_iron_ore=1024..}] run advancement grant @s only bacaphd:mining/mining_iron_ore_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_iron_ore_3=false},scores={bacaphd_l_mining_iron_ore=4096..}] run advancement grant @s only bacaphd:mining/mining_iron_ore_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_iron_ore_4=false},scores={bacaphd_l_mining_iron_ore=16384..}] run advancement grant @s only bacaphd:mining/mining_iron_ore_4
# --- ladder: mining_gold_ore ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_gold_ore_1=false},scores={bacaphd_l_mining_gold_ore=128..}] run advancement grant @s only bacaphd:mining/mining_gold_ore_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_gold_ore_2=false},scores={bacaphd_l_mining_gold_ore=1024..}] run advancement grant @s only bacaphd:mining/mining_gold_ore_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_gold_ore_3=false},scores={bacaphd_l_mining_gold_ore=4096..}] run advancement grant @s only bacaphd:mining/mining_gold_ore_3
# --- ladder: mining_redstone_ore ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_redstone_ore_1=false},scores={bacaphd_l_mining_redstone_ore=128..}] run advancement grant @s only bacaphd:mining/mining_redstone_ore_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_redstone_ore_2=false},scores={bacaphd_l_mining_redstone_ore=1024..}] run advancement grant @s only bacaphd:mining/mining_redstone_ore_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_redstone_ore_3=false},scores={bacaphd_l_mining_redstone_ore=4096..}] run advancement grant @s only bacaphd:mining/mining_redstone_ore_3
# --- ladder: mining_diamond_ore ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_diamond_ore_1=false},scores={bacaphd_l_mining_diamond_ore=64..}] run advancement grant @s only bacaphd:mining/mining_diamond_ore_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_diamond_ore_2=false},scores={bacaphd_l_mining_diamond_ore=512..}] run advancement grant @s only bacaphd:mining/mining_diamond_ore_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_diamond_ore_3=false},scores={bacaphd_l_mining_diamond_ore=2048..}] run advancement grant @s only bacaphd:mining/mining_diamond_ore_3
# --- ladder: mining_emerald_ore ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_emerald_ore_1=false},scores={bacaphd_l_mining_emerald_ore=32..}] run advancement grant @s only bacaphd:mining/mining_emerald_ore_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_emerald_ore_2=false},scores={bacaphd_l_mining_emerald_ore=128..}] run advancement grant @s only bacaphd:mining/mining_emerald_ore_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_emerald_ore_3=false},scores={bacaphd_l_mining_emerald_ore=512..}] run advancement grant @s only bacaphd:mining/mining_emerald_ore_3
# --- ladder: mining_amethyst ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_amethyst_1=false},scores={bacaphd_l_mining_amethyst=64..}] run advancement grant @s only bacaphd:mining/mining_amethyst_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_amethyst_2=false},scores={bacaphd_l_mining_amethyst=512..}] run advancement grant @s only bacaphd:mining/mining_amethyst_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_amethyst_3=false},scores={bacaphd_l_mining_amethyst=2048..}] run advancement grant @s only bacaphd:mining/mining_amethyst_3
# --- ladder: mining_dripstone ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_dripstone_1=false},scores={bacaphd_l_mining_dripstone=128..}] run advancement grant @s only bacaphd:mining/mining_dripstone_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_dripstone_2=false},scores={bacaphd_l_mining_dripstone=1024..}] run advancement grant @s only bacaphd:mining/mining_dripstone_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_dripstone_3=false},scores={bacaphd_l_mining_dripstone=4096..}] run advancement grant @s only bacaphd:mining/mining_dripstone_3
# --- ladder: mining_glow_lichen ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_glow_lichen_1=false},scores={bacaphd_l_mining_glow_lichen=64..}] run advancement grant @s only bacaphd:mining/mining_glow_lichen_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_glow_lichen_2=false},scores={bacaphd_l_mining_glow_lichen=512..}] run advancement grant @s only bacaphd:mining/mining_glow_lichen_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_glow_lichen_3=false},scores={bacaphd_l_mining_glow_lichen=2048..}] run advancement grant @s only bacaphd:mining/mining_glow_lichen_3
# --- ladder: mining_sculk ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_sculk_1=false},scores={bacaphd_l_mining_sculk=250..}] run advancement grant @s only bacaphd:mining/mining_sculk_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_sculk_2=false},scores={bacaphd_l_mining_sculk=2000..}] run advancement grant @s only bacaphd:mining/mining_sculk_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_sculk_3=false},scores={bacaphd_l_mining_sculk=10000..}] run advancement grant @s only bacaphd:mining/mining_sculk_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_sculk_4=false},scores={bacaphd_l_mining_sculk=50000..}] run advancement grant @s only bacaphd:mining/mining_sculk_4
# --- ladder: mining_warden ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_warden_1=false},scores={bacaphd_l_mining_warden=1..}] run advancement grant @s only bacaphd:mining/mining_warden_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_warden_2=false},scores={bacaphd_l_mining_warden=5..}] run advancement grant @s only bacaphd:mining/mining_warden_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_warden_3=false},scores={bacaphd_l_mining_warden=25..}] run advancement grant @s only bacaphd:mining/mining_warden_3
# --- ladder: mining_cave_spider ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_cave_spider_1=false},scores={bacaphd_l_mining_cave_spider=100..}] run advancement grant @s only bacaphd:mining/mining_cave_spider_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_cave_spider_2=false},scores={bacaphd_l_mining_cave_spider=1000..}] run advancement grant @s only bacaphd:mining/mining_cave_spider_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_cave_spider_3=false},scores={bacaphd_l_mining_cave_spider=5000..}] run advancement grant @s only bacaphd:mining/mining_cave_spider_3
# --- ladder: mining_silverfish ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_silverfish_1=false},scores={bacaphd_l_mining_silverfish=250..}] run advancement grant @s only bacaphd:mining/mining_silverfish_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_silverfish_2=false},scores={bacaphd_l_mining_silverfish=2000..}] run advancement grant @s only bacaphd:mining/mining_silverfish_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_silverfish_3=false},scores={bacaphd_l_mining_silverfish=10000..}] run advancement grant @s only bacaphd:mining/mining_silverfish_3
# --- ladder: mining_rail ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_rail_1=false},scores={bacaphd_l_mining_rail=256..}] run advancement grant @s only bacaphd:mining/mining_rail_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_rail_2=false},scores={bacaphd_l_mining_rail=2048..}] run advancement grant @s only bacaphd:mining/mining_rail_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_rail_3=false},scores={bacaphd_l_mining_rail=8192..}] run advancement grant @s only bacaphd:mining/mining_rail_3
# --- ladder: mining_tnt ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_tnt_1=false},scores={bacaphd_l_mining_tnt=64..}] run advancement grant @s only bacaphd:mining/mining_tnt_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_tnt_2=false},scores={bacaphd_l_mining_tnt=512..}] run advancement grant @s only bacaphd:mining/mining_tnt_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_tnt_3=false},scores={bacaphd_l_mining_tnt=2048..}] run advancement grant @s only bacaphd:mining/mining_tnt_3
# --- ladder: mining_deepslate_coal ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_coal_1=false},scores={bacaphd_l_mining_deepslate_coal=128..}] run advancement grant @s only bacaphd:mining/mining_deepslate_coal_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_coal_2=false},scores={bacaphd_l_mining_deepslate_coal=1024..}] run advancement grant @s only bacaphd:mining/mining_deepslate_coal_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_coal_3=false},scores={bacaphd_l_mining_deepslate_coal=4096..}] run advancement grant @s only bacaphd:mining/mining_deepslate_coal_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_coal_4=false},scores={bacaphd_l_mining_deepslate_coal=16384..}] run advancement grant @s only bacaphd:mining/mining_deepslate_coal_4
# --- ladder: mining_deepslate_emerald ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_emerald_1=false},scores={bacaphd_l_mining_deepslate_emerald=8..}] run advancement grant @s only bacaphd:mining/mining_deepslate_emerald_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_emerald_2=false},scores={bacaphd_l_mining_deepslate_emerald=32..}] run advancement grant @s only bacaphd:mining/mining_deepslate_emerald_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_emerald_3=false},scores={bacaphd_l_mining_deepslate_emerald=128..}] run advancement grant @s only bacaphd:mining/mining_deepslate_emerald_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_deepslate_emerald_4=false},scores={bacaphd_l_mining_deepslate_emerald=512..}] run advancement grant @s only bacaphd:mining/mining_deepslate_emerald_4
# --- ladder: mining_stone_diamond ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_stone_diamond_1=false},scores={bacaphd_l_mining_stone_diamond=8..}] run advancement grant @s only bacaphd:mining/mining_stone_diamond_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_stone_diamond_2=false},scores={bacaphd_l_mining_stone_diamond=32..}] run advancement grant @s only bacaphd:mining/mining_stone_diamond_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_stone_diamond_3=false},scores={bacaphd_l_mining_stone_diamond=128..}] run advancement grant @s only bacaphd:mining/mining_stone_diamond_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_stone_diamond_4=false},scores={bacaphd_l_mining_stone_diamond=512..}] run advancement grant @s only bacaphd:mining/mining_stone_diamond_4
# --- ladder: mining_redstone_seam ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_redstone_seam_1=false},scores={bacaphd_l_mining_redstone_seam=64..}] run advancement grant @s only bacaphd:mining/mining_redstone_seam_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_redstone_seam_2=false},scores={bacaphd_l_mining_redstone_seam=512..}] run advancement grant @s only bacaphd:mining/mining_redstone_seam_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_redstone_seam_3=false},scores={bacaphd_l_mining_redstone_seam=2048..}] run advancement grant @s only bacaphd:mining/mining_redstone_seam_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_redstone_seam_4=false},scores={bacaphd_l_mining_redstone_seam=8192..}] run advancement grant @s only bacaphd:mining/mining_redstone_seam_4
# --- ladder: mining_geode_shell ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_geode_shell_1=false},scores={bacaphd_l_mining_geode_shell=128..}] run advancement grant @s only bacaphd:mining/mining_geode_shell_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_geode_shell_2=false},scores={bacaphd_l_mining_geode_shell=1024..}] run advancement grant @s only bacaphd:mining/mining_geode_shell_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_geode_shell_3=false},scores={bacaphd_l_mining_geode_shell=4096..}] run advancement grant @s only bacaphd:mining/mining_geode_shell_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_geode_shell_4=false},scores={bacaphd_l_mining_geode_shell=16384..}] run advancement grant @s only bacaphd:mining/mining_geode_shell_4
# --- ladder: mining_sculk_veins ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_sculk_veins_1=false},scores={bacaphd_l_mining_sculk_veins=64..}] run advancement grant @s only bacaphd:mining/mining_sculk_veins_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_sculk_veins_2=false},scores={bacaphd_l_mining_sculk_veins=256..}] run advancement grant @s only bacaphd:mining/mining_sculk_veins_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_sculk_veins_3=false},scores={bacaphd_l_mining_sculk_veins=1024..}] run advancement grant @s only bacaphd:mining/mining_sculk_veins_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_sculk_veins_4=false},scores={bacaphd_l_mining_sculk_veins=4096..}] run advancement grant @s only bacaphd:mining/mining_sculk_veins_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_sculk_veins_5=false},scores={bacaphd_l_mining_sculk_veins=16384..}] run advancement grant @s only bacaphd:mining/mining_sculk_veins_5
# --- ladder: mining_torches ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_torches_1=false},scores={bacaphd_l_mining_torches=256..}] run advancement grant @s only bacaphd:mining/mining_torches_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_torches_2=false},scores={bacaphd_l_mining_torches=1024..}] run advancement grant @s only bacaphd:mining/mining_torches_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_torches_3=false},scores={bacaphd_l_mining_torches=4096..}] run advancement grant @s only bacaphd:mining/mining_torches_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_torches_4=false},scores={bacaphd_l_mining_torches=16384..}] run advancement grant @s only bacaphd:mining/mining_torches_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_torches_5=false},scores={bacaphd_l_mining_torches=50000..}] run advancement grant @s only bacaphd:mining/mining_torches_5
# --- ladder: mining_iron_ingots ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_iron_ingots_1=false},scores={bacaphd_l_mining_iron_ingots=256..}] run advancement grant @s only bacaphd:mining/mining_iron_ingots_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_iron_ingots_2=false},scores={bacaphd_l_mining_iron_ingots=2048..}] run advancement grant @s only bacaphd:mining/mining_iron_ingots_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_iron_ingots_3=false},scores={bacaphd_l_mining_iron_ingots=8192..}] run advancement grant @s only bacaphd:mining/mining_iron_ingots_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/mining_iron_ingots_4=false},scores={bacaphd_l_mining_iron_ingots=32768..}] run advancement grant @s only bacaphd:mining/mining_iron_ingots_4
# --- ladder: monsters_zombie ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_zombie_1=false},scores={bacaphd_l_monsters_zombie=250..}] run advancement grant @s only bacaphd:monsters/monsters_zombie_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_zombie_2=false},scores={bacaphd_l_monsters_zombie=1500..}] run advancement grant @s only bacaphd:monsters/monsters_zombie_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_zombie_3=false},scores={bacaphd_l_monsters_zombie=7500..}] run advancement grant @s only bacaphd:monsters/monsters_zombie_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_zombie_4=false},scores={bacaphd_l_monsters_zombie=25000..}] run advancement grant @s only bacaphd:monsters/monsters_zombie_4
# --- ladder: monsters_skeleton ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_skeleton_1=false},scores={bacaphd_l_monsters_skeleton=250..}] run advancement grant @s only bacaphd:monsters/monsters_skeleton_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_skeleton_2=false},scores={bacaphd_l_monsters_skeleton=1500..}] run advancement grant @s only bacaphd:monsters/monsters_skeleton_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_skeleton_3=false},scores={bacaphd_l_monsters_skeleton=7500..}] run advancement grant @s only bacaphd:monsters/monsters_skeleton_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_skeleton_4=false},scores={bacaphd_l_monsters_skeleton=25000..}] run advancement grant @s only bacaphd:monsters/monsters_skeleton_4
# --- ladder: monsters_creeper ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_creeper_1=false},scores={bacaphd_l_monsters_creeper=150..}] run advancement grant @s only bacaphd:monsters/monsters_creeper_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_creeper_2=false},scores={bacaphd_l_monsters_creeper=1000..}] run advancement grant @s only bacaphd:monsters/monsters_creeper_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_creeper_3=false},scores={bacaphd_l_monsters_creeper=5000..}] run advancement grant @s only bacaphd:monsters/monsters_creeper_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_creeper_4=false},scores={bacaphd_l_monsters_creeper=20000..}] run advancement grant @s only bacaphd:monsters/monsters_creeper_4
# --- ladder: monsters_spider ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_spider_1=false},scores={bacaphd_l_monsters_spider=250..}] run advancement grant @s only bacaphd:monsters/monsters_spider_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_spider_2=false},scores={bacaphd_l_monsters_spider=1500..}] run advancement grant @s only bacaphd:monsters/monsters_spider_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_spider_3=false},scores={bacaphd_l_monsters_spider=7500..}] run advancement grant @s only bacaphd:monsters/monsters_spider_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_spider_4=false},scores={bacaphd_l_monsters_spider=25000..}] run advancement grant @s only bacaphd:monsters/monsters_spider_4
# --- ladder: monsters_drowned ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_drowned_1=false},scores={bacaphd_l_monsters_drowned=150..}] run advancement grant @s only bacaphd:monsters/monsters_drowned_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_drowned_2=false},scores={bacaphd_l_monsters_drowned=1000..}] run advancement grant @s only bacaphd:monsters/monsters_drowned_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_drowned_3=false},scores={bacaphd_l_monsters_drowned=5000..}] run advancement grant @s only bacaphd:monsters/monsters_drowned_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_drowned_4=false},scores={bacaphd_l_monsters_drowned=20000..}] run advancement grant @s only bacaphd:monsters/monsters_drowned_4
# --- ladder: monsters_husk ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_husk_1=false},scores={bacaphd_l_monsters_husk=100..}] run advancement grant @s only bacaphd:monsters/monsters_husk_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_husk_2=false},scores={bacaphd_l_monsters_husk=600..}] run advancement grant @s only bacaphd:monsters/monsters_husk_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_husk_3=false},scores={bacaphd_l_monsters_husk=3000..}] run advancement grant @s only bacaphd:monsters/monsters_husk_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_husk_4=false},scores={bacaphd_l_monsters_husk=12000..}] run advancement grant @s only bacaphd:monsters/monsters_husk_4
# --- ladder: monsters_stray ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_stray_1=false},scores={bacaphd_l_monsters_stray=100..}] run advancement grant @s only bacaphd:monsters/monsters_stray_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_stray_2=false},scores={bacaphd_l_monsters_stray=600..}] run advancement grant @s only bacaphd:monsters/monsters_stray_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_stray_3=false},scores={bacaphd_l_monsters_stray=3000..}] run advancement grant @s only bacaphd:monsters/monsters_stray_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_stray_4=false},scores={bacaphd_l_monsters_stray=12000..}] run advancement grant @s only bacaphd:monsters/monsters_stray_4
# --- ladder: monsters_bogged ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_bogged_1=false},scores={bacaphd_l_monsters_bogged=100..}] run advancement grant @s only bacaphd:monsters/monsters_bogged_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_bogged_2=false},scores={bacaphd_l_monsters_bogged=600..}] run advancement grant @s only bacaphd:monsters/monsters_bogged_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_bogged_3=false},scores={bacaphd_l_monsters_bogged=3000..}] run advancement grant @s only bacaphd:monsters/monsters_bogged_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_bogged_4=false},scores={bacaphd_l_monsters_bogged=12000..}] run advancement grant @s only bacaphd:monsters/monsters_bogged_4
# --- ladder: monsters_slime ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_slime_1=false},scores={bacaphd_l_monsters_slime=100..}] run advancement grant @s only bacaphd:monsters/monsters_slime_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_slime_2=false},scores={bacaphd_l_monsters_slime=750..}] run advancement grant @s only bacaphd:monsters/monsters_slime_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_slime_3=false},scores={bacaphd_l_monsters_slime=4000..}] run advancement grant @s only bacaphd:monsters/monsters_slime_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_slime_4=false},scores={bacaphd_l_monsters_slime=15000..}] run advancement grant @s only bacaphd:monsters/monsters_slime_4
# --- ladder: monsters_creaking ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_creaking_1=false},scores={bacaphd_l_monsters_creaking=10..}] run advancement grant @s only bacaphd:monsters/monsters_creaking_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_creaking_2=false},scores={bacaphd_l_monsters_creaking=60..}] run advancement grant @s only bacaphd:monsters/monsters_creaking_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_creaking_3=false},scores={bacaphd_l_monsters_creaking=300..}] run advancement grant @s only bacaphd:monsters/monsters_creaking_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_creaking_4=false},scores={bacaphd_l_monsters_creaking=1200..}] run advancement grant @s only bacaphd:monsters/monsters_creaking_4
# --- ladder: monsters_wither ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_wither_1=false},scores={bacaphd_l_monsters_wither=1..}] run advancement grant @s only bacaphd:monsters/monsters_wither_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_wither_2=false},scores={bacaphd_l_monsters_wither=5..}] run advancement grant @s only bacaphd:monsters/monsters_wither_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_wither_3=false},scores={bacaphd_l_monsters_wither=20..}] run advancement grant @s only bacaphd:monsters/monsters_wither_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_wither_4=false},scores={bacaphd_l_monsters_wither=50..}] run advancement grant @s only bacaphd:monsters/monsters_wither_4
# --- ladder: monsters_rotten_flesh ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_rotten_flesh_1=false},scores={bacaphd_l_monsters_rotten_flesh=50..}] run advancement grant @s only bacaphd:monsters/monsters_rotten_flesh_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_rotten_flesh_2=false},scores={bacaphd_l_monsters_rotten_flesh=250..}] run advancement grant @s only bacaphd:monsters/monsters_rotten_flesh_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_rotten_flesh_3=false},scores={bacaphd_l_monsters_rotten_flesh=1000..}] run advancement grant @s only bacaphd:monsters/monsters_rotten_flesh_3
# --- ladder: monsters_cobweb ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_cobweb_1=false},scores={bacaphd_l_monsters_cobweb=100..}] run advancement grant @s only bacaphd:monsters/monsters_cobweb_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_cobweb_2=false},scores={bacaphd_l_monsters_cobweb=500..}] run advancement grant @s only bacaphd:monsters/monsters_cobweb_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_cobweb_3=false},scores={bacaphd_l_monsters_cobweb=2500..}] run advancement grant @s only bacaphd:monsters/monsters_cobweb_3
# --- ladder: monsters_parched ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_parched_1=false},scores={bacaphd_l_monsters_parched=100..}] run advancement grant @s only bacaphd:monsters/monsters_parched_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_parched_2=false},scores={bacaphd_l_monsters_parched=600..}] run advancement grant @s only bacaphd:monsters/monsters_parched_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_parched_3=false},scores={bacaphd_l_monsters_parched=3000..}] run advancement grant @s only bacaphd:monsters/monsters_parched_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_parched_4=false},scores={bacaphd_l_monsters_parched=12000..}] run advancement grant @s only bacaphd:monsters/monsters_parched_4
# --- ladder: monsters_camel_husk ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_camel_husk_1=false},scores={bacaphd_l_monsters_camel_husk=25..}] run advancement grant @s only bacaphd:monsters/monsters_camel_husk_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_camel_husk_2=false},scores={bacaphd_l_monsters_camel_husk=150..}] run advancement grant @s only bacaphd:monsters/monsters_camel_husk_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_camel_husk_3=false},scores={bacaphd_l_monsters_camel_husk=600..}] run advancement grant @s only bacaphd:monsters/monsters_camel_husk_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_camel_husk_4=false},scores={bacaphd_l_monsters_camel_husk=2000..}] run advancement grant @s only bacaphd:monsters/monsters_camel_husk_4
# --- ladder: monsters_skeleton_horse ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_skeleton_horse_1=false},scores={bacaphd_l_monsters_skeleton_horse=2..}] run advancement grant @s only bacaphd:monsters/monsters_skeleton_horse_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_skeleton_horse_2=false},scores={bacaphd_l_monsters_skeleton_horse=10..}] run advancement grant @s only bacaphd:monsters/monsters_skeleton_horse_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_skeleton_horse_3=false},scores={bacaphd_l_monsters_skeleton_horse=40..}] run advancement grant @s only bacaphd:monsters/monsters_skeleton_horse_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_skeleton_horse_4=false},scores={bacaphd_l_monsters_skeleton_horse=100..}] run advancement grant @s only bacaphd:monsters/monsters_skeleton_horse_4
# --- ladder: monsters_zombie_nautilus ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_zombie_nautilus_1=false},scores={bacaphd_l_monsters_zombie_nautilus=25..}] run advancement grant @s only bacaphd:monsters/monsters_zombie_nautilus_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_zombie_nautilus_2=false},scores={bacaphd_l_monsters_zombie_nautilus=150..}] run advancement grant @s only bacaphd:monsters/monsters_zombie_nautilus_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_zombie_nautilus_3=false},scores={bacaphd_l_monsters_zombie_nautilus=600..}] run advancement grant @s only bacaphd:monsters/monsters_zombie_nautilus_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_zombie_nautilus_4=false},scores={bacaphd_l_monsters_zombie_nautilus=2000..}] run advancement grant @s only bacaphd:monsters/monsters_zombie_nautilus_4
# --- ladder: monsters_infested_stone ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_infested_stone_1=false},scores={bacaphd_l_monsters_infested_stone=10..}] run advancement grant @s only bacaphd:monsters/monsters_infested_stone_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_infested_stone_2=false},scores={bacaphd_l_monsters_infested_stone=50..}] run advancement grant @s only bacaphd:monsters/monsters_infested_stone_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_infested_stone_3=false},scores={bacaphd_l_monsters_infested_stone=200..}] run advancement grant @s only bacaphd:monsters/monsters_infested_stone_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_infested_stone_4=false},scores={bacaphd_l_monsters_infested_stone=600..}] run advancement grant @s only bacaphd:monsters/monsters_infested_stone_4
# --- ladder: monsters_sculk_shrieker ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_sculk_shrieker_1=false},scores={bacaphd_l_monsters_sculk_shrieker=5..}] run advancement grant @s only bacaphd:monsters/monsters_sculk_shrieker_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_sculk_shrieker_2=false},scores={bacaphd_l_monsters_sculk_shrieker=25..}] run advancement grant @s only bacaphd:monsters/monsters_sculk_shrieker_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_sculk_shrieker_3=false},scores={bacaphd_l_monsters_sculk_shrieker=100..}] run advancement grant @s only bacaphd:monsters/monsters_sculk_shrieker_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_sculk_shrieker_4=false},scores={bacaphd_l_monsters_sculk_shrieker=300..}] run advancement grant @s only bacaphd:monsters/monsters_sculk_shrieker_4
# --- ladder: monsters_bone_block ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_bone_block_1=false},scores={bacaphd_l_monsters_bone_block=64..}] run advancement grant @s only bacaphd:monsters/monsters_bone_block_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_bone_block_2=false},scores={bacaphd_l_monsters_bone_block=256..}] run advancement grant @s only bacaphd:monsters/monsters_bone_block_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_bone_block_3=false},scores={bacaphd_l_monsters_bone_block=1024..}] run advancement grant @s only bacaphd:monsters/monsters_bone_block_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_bone_block_4=false},scores={bacaphd_l_monsters_bone_block=4096..}] run advancement grant @s only bacaphd:monsters/monsters_bone_block_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_bone_block_5=false},scores={bacaphd_l_monsters_bone_block=10000..}] run advancement grant @s only bacaphd:monsters/monsters_bone_block_5
# --- ladder: monsters_tnt ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_tnt_1=false},scores={bacaphd_l_monsters_tnt=32..}] run advancement grant @s only bacaphd:monsters/monsters_tnt_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_tnt_2=false},scores={bacaphd_l_monsters_tnt=128..}] run advancement grant @s only bacaphd:monsters/monsters_tnt_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_tnt_3=false},scores={bacaphd_l_monsters_tnt=512..}] run advancement grant @s only bacaphd:monsters/monsters_tnt_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_tnt_4=false},scores={bacaphd_l_monsters_tnt=2048..}] run advancement grant @s only bacaphd:monsters/monsters_tnt_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_tnt_5=false},scores={bacaphd_l_monsters_tnt=8192..}] run advancement grant @s only bacaphd:monsters/monsters_tnt_5
# --- ladder: monsters_slime_block ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_slime_block_1=false},scores={bacaphd_l_monsters_slime_block=128..}] run advancement grant @s only bacaphd:monsters/monsters_slime_block_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_slime_block_2=false},scores={bacaphd_l_monsters_slime_block=512..}] run advancement grant @s only bacaphd:monsters/monsters_slime_block_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_slime_block_3=false},scores={bacaphd_l_monsters_slime_block=2048..}] run advancement grant @s only bacaphd:monsters/monsters_slime_block_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_slime_block_4=false},scores={bacaphd_l_monsters_slime_block=4096..}] run advancement grant @s only bacaphd:monsters/monsters_slime_block_4
# --- ladder: monsters_beacon ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_beacon_1=false},scores={bacaphd_l_monsters_beacon=3..}] run advancement grant @s only bacaphd:monsters/monsters_beacon_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_beacon_2=false},scores={bacaphd_l_monsters_beacon=10..}] run advancement grant @s only bacaphd:monsters/monsters_beacon_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_beacon_3=false},scores={bacaphd_l_monsters_beacon=25..}] run advancement grant @s only bacaphd:monsters/monsters_beacon_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/monsters_beacon_4=false},scores={bacaphd_l_monsters_beacon=50..}] run advancement grant @s only bacaphd:monsters/monsters_beacon_4
# --- ladder: nether_netherrack ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_netherrack_1=false},scores={bacaphd_l_nether_netherrack=1000..}] run advancement grant @s only bacaphd:nether/nether_netherrack_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_netherrack_2=false},scores={bacaphd_l_nether_netherrack=10000..}] run advancement grant @s only bacaphd:nether/nether_netherrack_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_netherrack_3=false},scores={bacaphd_l_nether_netherrack=50000..}] run advancement grant @s only bacaphd:nether/nether_netherrack_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_netherrack_4=false},scores={bacaphd_l_nether_netherrack=200000..}] run advancement grant @s only bacaphd:nether/nether_netherrack_4
# --- ladder: nether_ancient_debris ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_ancient_debris_1=false},scores={bacaphd_l_nether_ancient_debris=8..}] run advancement grant @s only bacaphd:nether/nether_ancient_debris_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_ancient_debris_2=false},scores={bacaphd_l_nether_ancient_debris=32..}] run advancement grant @s only bacaphd:nether/nether_ancient_debris_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_ancient_debris_3=false},scores={bacaphd_l_nether_ancient_debris=128..}] run advancement grant @s only bacaphd:nether/nether_ancient_debris_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_ancient_debris_4=false},scores={bacaphd_l_nether_ancient_debris=512..}] run advancement grant @s only bacaphd:nether/nether_ancient_debris_4
# --- ladder: nether_quartz_ore ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_quartz_ore_1=false},scores={bacaphd_l_nether_quartz_ore=128..}] run advancement grant @s only bacaphd:nether/nether_quartz_ore_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_quartz_ore_2=false},scores={bacaphd_l_nether_quartz_ore=512..}] run advancement grant @s only bacaphd:nether/nether_quartz_ore_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_quartz_ore_3=false},scores={bacaphd_l_nether_quartz_ore=2048..}] run advancement grant @s only bacaphd:nether/nether_quartz_ore_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_quartz_ore_4=false},scores={bacaphd_l_nether_quartz_ore=8192..}] run advancement grant @s only bacaphd:nether/nether_quartz_ore_4
# --- ladder: nether_gold_ore ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_gold_ore_1=false},scores={bacaphd_l_nether_gold_ore=64..}] run advancement grant @s only bacaphd:nether/nether_gold_ore_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_gold_ore_2=false},scores={bacaphd_l_nether_gold_ore=256..}] run advancement grant @s only bacaphd:nether/nether_gold_ore_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_gold_ore_3=false},scores={bacaphd_l_nether_gold_ore=1024..}] run advancement grant @s only bacaphd:nether/nether_gold_ore_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_gold_ore_4=false},scores={bacaphd_l_nether_gold_ore=4096..}] run advancement grant @s only bacaphd:nether/nether_gold_ore_4
# --- ladder: nether_glowstone ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_glowstone_1=false},scores={bacaphd_l_nether_glowstone=128..}] run advancement grant @s only bacaphd:nether/nether_glowstone_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_glowstone_2=false},scores={bacaphd_l_nether_glowstone=512..}] run advancement grant @s only bacaphd:nether/nether_glowstone_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_glowstone_3=false},scores={bacaphd_l_nether_glowstone=2048..}] run advancement grant @s only bacaphd:nether/nether_glowstone_3
# --- ladder: nether_basalt ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_basalt_1=false},scores={bacaphd_l_nether_basalt=250..}] run advancement grant @s only bacaphd:nether/nether_basalt_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_basalt_2=false},scores={bacaphd_l_nether_basalt=2000..}] run advancement grant @s only bacaphd:nether/nether_basalt_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_basalt_3=false},scores={bacaphd_l_nether_basalt=10000..}] run advancement grant @s only bacaphd:nether/nether_basalt_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_basalt_4=false},scores={bacaphd_l_nether_basalt=50000..}] run advancement grant @s only bacaphd:nether/nether_basalt_4
# --- ladder: nether_blackstone ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_blackstone_1=false},scores={bacaphd_l_nether_blackstone=256..}] run advancement grant @s only bacaphd:nether/nether_blackstone_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_blackstone_2=false},scores={bacaphd_l_nether_blackstone=1024..}] run advancement grant @s only bacaphd:nether/nether_blackstone_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_blackstone_3=false},scores={bacaphd_l_nether_blackstone=5000..}] run advancement grant @s only bacaphd:nether/nether_blackstone_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_blackstone_4=false},scores={bacaphd_l_nether_blackstone=20000..}] run advancement grant @s only bacaphd:nether/nether_blackstone_4
# --- ladder: nether_gilded_blackstone ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_gilded_blackstone_1=false},scores={bacaphd_l_nether_gilded_blackstone=32..}] run advancement grant @s only bacaphd:nether/nether_gilded_blackstone_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_gilded_blackstone_2=false},scores={bacaphd_l_nether_gilded_blackstone=128..}] run advancement grant @s only bacaphd:nether/nether_gilded_blackstone_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_gilded_blackstone_3=false},scores={bacaphd_l_nether_gilded_blackstone=512..}] run advancement grant @s only bacaphd:nether/nether_gilded_blackstone_3
# --- ladder: nether_soul_sand ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_soul_sand_1=false},scores={bacaphd_l_nether_soul_sand=256..}] run advancement grant @s only bacaphd:nether/nether_soul_sand_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_soul_sand_2=false},scores={bacaphd_l_nether_soul_sand=1024..}] run advancement grant @s only bacaphd:nether/nether_soul_sand_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_soul_sand_3=false},scores={bacaphd_l_nether_soul_sand=4096..}] run advancement grant @s only bacaphd:nether/nether_soul_sand_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_soul_sand_4=false},scores={bacaphd_l_nether_soul_sand=16384..}] run advancement grant @s only bacaphd:nether/nether_soul_sand_4
# --- ladder: nether_magma_block ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_magma_block_1=false},scores={bacaphd_l_nether_magma_block=128..}] run advancement grant @s only bacaphd:nether/nether_magma_block_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_magma_block_2=false},scores={bacaphd_l_nether_magma_block=1024..}] run advancement grant @s only bacaphd:nether/nether_magma_block_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_magma_block_3=false},scores={bacaphd_l_nether_magma_block=5000..}] run advancement grant @s only bacaphd:nether/nether_magma_block_3
# --- ladder: nether_shroomlight ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_shroomlight_1=false},scores={bacaphd_l_nether_shroomlight=64..}] run advancement grant @s only bacaphd:nether/nether_shroomlight_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_shroomlight_2=false},scores={bacaphd_l_nether_shroomlight=512..}] run advancement grant @s only bacaphd:nether/nether_shroomlight_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_shroomlight_3=false},scores={bacaphd_l_nether_shroomlight=2048..}] run advancement grant @s only bacaphd:nether/nether_shroomlight_3
# --- ladder: nether_crimson_stem ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crimson_stem_1=false},scores={bacaphd_l_nether_crimson_stem=250..}] run advancement grant @s only bacaphd:nether/nether_crimson_stem_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crimson_stem_2=false},scores={bacaphd_l_nether_crimson_stem=2500..}] run advancement grant @s only bacaphd:nether/nether_crimson_stem_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crimson_stem_3=false},scores={bacaphd_l_nether_crimson_stem=12500..}] run advancement grant @s only bacaphd:nether/nether_crimson_stem_3
# --- ladder: nether_warped_stem ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_warped_stem_1=false},scores={bacaphd_l_nether_warped_stem=250..}] run advancement grant @s only bacaphd:nether/nether_warped_stem_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_warped_stem_2=false},scores={bacaphd_l_nether_warped_stem=2500..}] run advancement grant @s only bacaphd:nether/nether_warped_stem_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_warped_stem_3=false},scores={bacaphd_l_nether_warped_stem=12500..}] run advancement grant @s only bacaphd:nether/nether_warped_stem_3
# --- ladder: nether_blaze ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_blaze_1=false},scores={bacaphd_l_nether_blaze=50..}] run advancement grant @s only bacaphd:nether/nether_blaze_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_blaze_2=false},scores={bacaphd_l_nether_blaze=500..}] run advancement grant @s only bacaphd:nether/nether_blaze_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_blaze_3=false},scores={bacaphd_l_nether_blaze=2500..}] run advancement grant @s only bacaphd:nether/nether_blaze_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_blaze_4=false},scores={bacaphd_l_nether_blaze=10000..}] run advancement grant @s only bacaphd:nether/nether_blaze_4
# --- ladder: nether_ghast ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_ghast_1=false},scores={bacaphd_l_nether_ghast=25..}] run advancement grant @s only bacaphd:nether/nether_ghast_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_ghast_2=false},scores={bacaphd_l_nether_ghast=200..}] run advancement grant @s only bacaphd:nether/nether_ghast_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_ghast_3=false},scores={bacaphd_l_nether_ghast=1000..}] run advancement grant @s only bacaphd:nether/nether_ghast_3
# --- ladder: nether_wither_skeleton ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_wither_skeleton_1=false},scores={bacaphd_l_nether_wither_skeleton=50..}] run advancement grant @s only bacaphd:nether/nether_wither_skeleton_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_wither_skeleton_2=false},scores={bacaphd_l_nether_wither_skeleton=400..}] run advancement grant @s only bacaphd:nether/nether_wither_skeleton_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_wither_skeleton_3=false},scores={bacaphd_l_nether_wither_skeleton=2000..}] run advancement grant @s only bacaphd:nether/nether_wither_skeleton_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_wither_skeleton_4=false},scores={bacaphd_l_nether_wither_skeleton=8000..}] run advancement grant @s only bacaphd:nether/nether_wither_skeleton_4
# --- ladder: nether_piglin ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_piglin_1=false},scores={bacaphd_l_nether_piglin=50..}] run advancement grant @s only bacaphd:nether/nether_piglin_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_piglin_2=false},scores={bacaphd_l_nether_piglin=500..}] run advancement grant @s only bacaphd:nether/nether_piglin_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_piglin_3=false},scores={bacaphd_l_nether_piglin=2500..}] run advancement grant @s only bacaphd:nether/nether_piglin_3
# --- ladder: nether_piglin_brute ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_piglin_brute_1=false},scores={bacaphd_l_nether_piglin_brute=5..}] run advancement grant @s only bacaphd:nether/nether_piglin_brute_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_piglin_brute_2=false},scores={bacaphd_l_nether_piglin_brute=25..}] run advancement grant @s only bacaphd:nether/nether_piglin_brute_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_piglin_brute_3=false},scores={bacaphd_l_nether_piglin_brute=100..}] run advancement grant @s only bacaphd:nether/nether_piglin_brute_3
# --- ladder: nether_hoglin ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_hoglin_1=false},scores={bacaphd_l_nether_hoglin=40..}] run advancement grant @s only bacaphd:nether/nether_hoglin_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_hoglin_2=false},scores={bacaphd_l_nether_hoglin=400..}] run advancement grant @s only bacaphd:nether/nether_hoglin_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_hoglin_3=false},scores={bacaphd_l_nether_hoglin=2000..}] run advancement grant @s only bacaphd:nether/nether_hoglin_3
# --- ladder: nether_zombified_piglin ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_zombified_piglin_1=false},scores={bacaphd_l_nether_zombified_piglin=250..}] run advancement grant @s only bacaphd:nether/nether_zombified_piglin_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_zombified_piglin_2=false},scores={bacaphd_l_nether_zombified_piglin=2500..}] run advancement grant @s only bacaphd:nether/nether_zombified_piglin_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_zombified_piglin_3=false},scores={bacaphd_l_nether_zombified_piglin=20000..}] run advancement grant @s only bacaphd:nether/nether_zombified_piglin_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_zombified_piglin_4=false},scores={bacaphd_l_nether_zombified_piglin=100000..}] run advancement grant @s only bacaphd:nether/nether_zombified_piglin_4
# --- ladder: nether_magma_cube ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_magma_cube_1=false},scores={bacaphd_l_nether_magma_cube=100..}] run advancement grant @s only bacaphd:nether/nether_magma_cube_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_magma_cube_2=false},scores={bacaphd_l_nether_magma_cube=1000..}] run advancement grant @s only bacaphd:nether/nether_magma_cube_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_magma_cube_3=false},scores={bacaphd_l_nether_magma_cube=5000..}] run advancement grant @s only bacaphd:nether/nether_magma_cube_3
# --- ladder: nether_zoglin ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_zoglin_1=false},scores={bacaphd_l_nether_zoglin=10..}] run advancement grant @s only bacaphd:nether/nether_zoglin_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_zoglin_2=false},scores={bacaphd_l_nether_zoglin=50..}] run advancement grant @s only bacaphd:nether/nether_zoglin_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_zoglin_3=false},scores={bacaphd_l_nether_zoglin=200..}] run advancement grant @s only bacaphd:nether/nether_zoglin_3
# --- ladder: nether_netherite_ingot ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_netherite_ingot_1=false},scores={bacaphd_l_nether_netherite_ingot=4..}] run advancement grant @s only bacaphd:nether/nether_netherite_ingot_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_netherite_ingot_2=false},scores={bacaphd_l_nether_netherite_ingot=16..}] run advancement grant @s only bacaphd:nether/nether_netherite_ingot_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_netherite_ingot_3=false},scores={bacaphd_l_nether_netherite_ingot=64..}] run advancement grant @s only bacaphd:nether/nether_netherite_ingot_3
# --- ladder: nether_flint_and_steel ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_flint_and_steel_1=false},scores={bacaphd_l_nether_flint_and_steel=64..}] run advancement grant @s only bacaphd:nether/nether_flint_and_steel_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_flint_and_steel_2=false},scores={bacaphd_l_nether_flint_and_steel=512..}] run advancement grant @s only bacaphd:nether/nether_flint_and_steel_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_flint_and_steel_3=false},scores={bacaphd_l_nether_flint_and_steel=2048..}] run advancement grant @s only bacaphd:nether/nether_flint_and_steel_3
# --- ladder: nether_soul_soil ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_soul_soil_1=false},scores={bacaphd_l_nether_soul_soil=128..}] run advancement grant @s only bacaphd:nether/nether_soul_soil_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_soul_soil_2=false},scores={bacaphd_l_nether_soul_soil=512..}] run advancement grant @s only bacaphd:nether/nether_soul_soil_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_soul_soil_3=false},scores={bacaphd_l_nether_soul_soil=2500..}] run advancement grant @s only bacaphd:nether/nether_soul_soil_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_soul_soil_4=false},scores={bacaphd_l_nether_soul_soil=8000..}] run advancement grant @s only bacaphd:nether/nether_soul_soil_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_soul_soil_5=false},scores={bacaphd_l_nether_soul_soil=25000..}] run advancement grant @s only bacaphd:nether/nether_soul_soil_5
# --- ladder: nether_crimson_nylium ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crimson_nylium_1=false},scores={bacaphd_l_nether_crimson_nylium=100..}] run advancement grant @s only bacaphd:nether/nether_crimson_nylium_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crimson_nylium_2=false},scores={bacaphd_l_nether_crimson_nylium=600..}] run advancement grant @s only bacaphd:nether/nether_crimson_nylium_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crimson_nylium_3=false},scores={bacaphd_l_nether_crimson_nylium=2500..}] run advancement grant @s only bacaphd:nether/nether_crimson_nylium_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crimson_nylium_4=false},scores={bacaphd_l_nether_crimson_nylium=6000..}] run advancement grant @s only bacaphd:nether/nether_crimson_nylium_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crimson_nylium_5=false},scores={bacaphd_l_nether_crimson_nylium=15000..}] run advancement grant @s only bacaphd:nether/nether_crimson_nylium_5
# --- ladder: nether_warped_nylium ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_warped_nylium_1=false},scores={bacaphd_l_nether_warped_nylium=100..}] run advancement grant @s only bacaphd:nether/nether_warped_nylium_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_warped_nylium_2=false},scores={bacaphd_l_nether_warped_nylium=600..}] run advancement grant @s only bacaphd:nether/nether_warped_nylium_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_warped_nylium_3=false},scores={bacaphd_l_nether_warped_nylium=2500..}] run advancement grant @s only bacaphd:nether/nether_warped_nylium_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_warped_nylium_4=false},scores={bacaphd_l_nether_warped_nylium=8000..}] run advancement grant @s only bacaphd:nether/nether_warped_nylium_4
# --- ladder: nether_wart_block ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_wart_block_1=false},scores={bacaphd_l_nether_wart_block=128..}] run advancement grant @s only bacaphd:nether/nether_wart_block_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_wart_block_2=false},scores={bacaphd_l_nether_wart_block=1000..}] run advancement grant @s only bacaphd:nether/nether_wart_block_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_wart_block_3=false},scores={bacaphd_l_nether_wart_block=5000..}] run advancement grant @s only bacaphd:nether/nether_wart_block_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_wart_block_4=false},scores={bacaphd_l_nether_wart_block=15000..}] run advancement grant @s only bacaphd:nether/nether_wart_block_4
# --- ladder: nether_weeping_vines ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_weeping_vines_1=false},scores={bacaphd_l_nether_weeping_vines=32..}] run advancement grant @s only bacaphd:nether/nether_weeping_vines_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_weeping_vines_2=false},scores={bacaphd_l_nether_weeping_vines=128..}] run advancement grant @s only bacaphd:nether/nether_weeping_vines_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_weeping_vines_3=false},scores={bacaphd_l_nether_weeping_vines=512..}] run advancement grant @s only bacaphd:nether/nether_weeping_vines_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_weeping_vines_4=false},scores={bacaphd_l_nether_weeping_vines=2000..}] run advancement grant @s only bacaphd:nether/nether_weeping_vines_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_weeping_vines_5=false},scores={bacaphd_l_nether_weeping_vines=8000..}] run advancement grant @s only bacaphd:nether/nether_weeping_vines_5
# --- ladder: nether_fortress_bricks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_fortress_bricks_1=false},scores={bacaphd_l_nether_fortress_bricks=256..}] run advancement grant @s only bacaphd:nether/nether_fortress_bricks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_fortress_bricks_2=false},scores={bacaphd_l_nether_fortress_bricks=1024..}] run advancement grant @s only bacaphd:nether/nether_fortress_bricks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_fortress_bricks_3=false},scores={bacaphd_l_nether_fortress_bricks=4000..}] run advancement grant @s only bacaphd:nether/nether_fortress_bricks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_fortress_bricks_4=false},scores={bacaphd_l_nether_fortress_bricks=12000..}] run advancement grant @s only bacaphd:nether/nether_fortress_bricks_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_fortress_bricks_5=false},scores={bacaphd_l_nether_fortress_bricks=30000..}] run advancement grant @s only bacaphd:nether/nether_fortress_bricks_5
# --- ladder: nether_crying_obsidian ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crying_obsidian_1=false},scores={bacaphd_l_nether_crying_obsidian=8..}] run advancement grant @s only bacaphd:nether/nether_crying_obsidian_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crying_obsidian_2=false},scores={bacaphd_l_nether_crying_obsidian=32..}] run advancement grant @s only bacaphd:nether/nether_crying_obsidian_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crying_obsidian_3=false},scores={bacaphd_l_nether_crying_obsidian=128..}] run advancement grant @s only bacaphd:nether/nether_crying_obsidian_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_crying_obsidian_4=false},scores={bacaphd_l_nether_crying_obsidian=512..}] run advancement grant @s only bacaphd:nether/nether_crying_obsidian_4
# --- ladder: nether_lava_placed ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_lava_placed_1=false},scores={bacaphd_l_nether_lava_placed=64..}] run advancement grant @s only bacaphd:nether/nether_lava_placed_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_lava_placed_2=false},scores={bacaphd_l_nether_lava_placed=256..}] run advancement grant @s only bacaphd:nether/nether_lava_placed_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_lava_placed_3=false},scores={bacaphd_l_nether_lava_placed=1024..}] run advancement grant @s only bacaphd:nether/nether_lava_placed_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/nether_lava_placed_4=false},scores={bacaphd_l_nether_lava_placed=4096..}] run advancement grant @s only bacaphd:nether/nether_lava_placed_4
# --- ladder: potion_bottoms_up ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_bottoms_up_1=false},scores={bacaphd_l_potion_bottoms_up=25..}] run advancement grant @s only bacaphd:potion/potion_bottoms_up_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_bottoms_up_2=false},scores={bacaphd_l_potion_bottoms_up=150..}] run advancement grant @s only bacaphd:potion/potion_bottoms_up_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_bottoms_up_3=false},scores={bacaphd_l_potion_bottoms_up=750..}] run advancement grant @s only bacaphd:potion/potion_bottoms_up_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_bottoms_up_4=false},scores={bacaphd_l_potion_bottoms_up=3000..}] run advancement grant @s only bacaphd:potion/potion_bottoms_up_4
# --- ladder: potion_glass_grenade ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_glass_grenade_1=false},scores={bacaphd_l_potion_glass_grenade=20..}] run advancement grant @s only bacaphd:potion/potion_glass_grenade_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_glass_grenade_2=false},scores={bacaphd_l_potion_glass_grenade=120..}] run advancement grant @s only bacaphd:potion/potion_glass_grenade_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_glass_grenade_3=false},scores={bacaphd_l_potion_glass_grenade=600..}] run advancement grant @s only bacaphd:potion/potion_glass_grenade_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_glass_grenade_4=false},scores={bacaphd_l_potion_glass_grenade=2500..}] run advancement grant @s only bacaphd:potion/potion_glass_grenade_4
# --- ladder: potion_fog_of_war ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_fog_of_war_1=false},scores={bacaphd_l_potion_fog_of_war=10..}] run advancement grant @s only bacaphd:potion/potion_fog_of_war_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_fog_of_war_2=false},scores={bacaphd_l_potion_fog_of_war=60..}] run advancement grant @s only bacaphd:potion/potion_fog_of_war_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_fog_of_war_3=false},scores={bacaphd_l_potion_fog_of_war=300..}] run advancement grant @s only bacaphd:potion/potion_fog_of_war_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_fog_of_war_4=false},scores={bacaphd_l_potion_fog_of_war=1200..}] run advancement grant @s only bacaphd:potion/potion_fog_of_war_4
# --- ladder: potion_filling_station ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_filling_station_1=false},scores={bacaphd_l_potion_filling_station=75..}] run advancement grant @s only bacaphd:potion/potion_filling_station_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_filling_station_2=false},scores={bacaphd_l_potion_filling_station=400..}] run advancement grant @s only bacaphd:potion/potion_filling_station_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_filling_station_3=false},scores={bacaphd_l_potion_filling_station=1500..}] run advancement grant @s only bacaphd:potion/potion_filling_station_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_filling_station_4=false},scores={bacaphd_l_potion_filling_station=5000..}] run advancement grant @s only bacaphd:potion/potion_filling_station_4
# --- ladder: potion_glassblower ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_glassblower_1=false},scores={bacaphd_l_potion_glassblower=150..}] run advancement grant @s only bacaphd:potion/potion_glassblower_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_glassblower_2=false},scores={bacaphd_l_potion_glassblower=1000..}] run advancement grant @s only bacaphd:potion/potion_glassblower_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_glassblower_3=false},scores={bacaphd_l_potion_glassblower=5000..}] run advancement grant @s only bacaphd:potion/potion_glassblower_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_glassblower_4=false},scores={bacaphd_l_potion_glassblower=20000..}] run advancement grant @s only bacaphd:potion/potion_glassblower_4
# --- ladder: potion_setting_up_shop ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_setting_up_shop_1=false},scores={bacaphd_l_potion_setting_up_shop=3..}] run advancement grant @s only bacaphd:potion/potion_setting_up_shop_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_setting_up_shop_2=false},scores={bacaphd_l_potion_setting_up_shop=16..}] run advancement grant @s only bacaphd:potion/potion_setting_up_shop_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_setting_up_shop_3=false},scores={bacaphd_l_potion_setting_up_shop=64..}] run advancement grant @s only bacaphd:potion/potion_setting_up_shop_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_setting_up_shop_4=false},scores={bacaphd_l_potion_setting_up_shop=256..}] run advancement grant @s only bacaphd:potion/potion_setting_up_shop_4
# --- ladder: potion_sowing_the_nether ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sowing_the_nether_1=false},scores={bacaphd_l_potion_sowing_the_nether=200..}] run advancement grant @s only bacaphd:potion/potion_sowing_the_nether_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sowing_the_nether_2=false},scores={bacaphd_l_potion_sowing_the_nether=1200..}] run advancement grant @s only bacaphd:potion/potion_sowing_the_nether_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sowing_the_nether_3=false},scores={bacaphd_l_potion_sowing_the_nether=6000..}] run advancement grant @s only bacaphd:potion/potion_sowing_the_nether_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sowing_the_nether_4=false},scores={bacaphd_l_potion_sowing_the_nether=30000..}] run advancement grant @s only bacaphd:potion/potion_sowing_the_nether_4
# --- ladder: potion_pestle_and_blaze ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_pestle_and_blaze_1=false},scores={bacaphd_l_potion_pestle_and_blaze=64..}] run advancement grant @s only bacaphd:potion/potion_pestle_and_blaze_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_pestle_and_blaze_2=false},scores={bacaphd_l_potion_pestle_and_blaze=400..}] run advancement grant @s only bacaphd:potion/potion_pestle_and_blaze_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_pestle_and_blaze_3=false},scores={bacaphd_l_potion_pestle_and_blaze=2000..}] run advancement grant @s only bacaphd:potion/potion_pestle_and_blaze_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_pestle_and_blaze_4=false},scores={bacaphd_l_potion_pestle_and_blaze=8000..}] run advancement grant @s only bacaphd:potion/potion_pestle_and_blaze_4
# --- ladder: potion_slime_and_cinder ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_slime_and_cinder_1=false},scores={bacaphd_l_potion_slime_and_cinder=32..}] run advancement grant @s only bacaphd:potion/potion_slime_and_cinder_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_slime_and_cinder_2=false},scores={bacaphd_l_potion_slime_and_cinder=200..}] run advancement grant @s only bacaphd:potion/potion_slime_and_cinder_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_slime_and_cinder_3=false},scores={bacaphd_l_potion_slime_and_cinder=1000..}] run advancement grant @s only bacaphd:potion/potion_slime_and_cinder_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_slime_and_cinder_4=false},scores={bacaphd_l_potion_slime_and_cinder=4000..}] run advancement grant @s only bacaphd:potion/potion_slime_and_cinder_4
# --- ladder: potion_left_to_ferment ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_left_to_ferment_1=false},scores={bacaphd_l_potion_left_to_ferment=32..}] run advancement grant @s only bacaphd:potion/potion_left_to_ferment_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_left_to_ferment_2=false},scores={bacaphd_l_potion_left_to_ferment=200..}] run advancement grant @s only bacaphd:potion/potion_left_to_ferment_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_left_to_ferment_3=false},scores={bacaphd_l_potion_left_to_ferment=1000..}] run advancement grant @s only bacaphd:potion/potion_left_to_ferment_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_left_to_ferment_4=false},scores={bacaphd_l_potion_left_to_ferment=4000..}] run advancement grant @s only bacaphd:potion/potion_left_to_ferment_4
# --- ladder: potion_gilded_fruit ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_gilded_fruit_1=false},scores={bacaphd_l_potion_gilded_fruit=32..}] run advancement grant @s only bacaphd:potion/potion_gilded_fruit_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_gilded_fruit_2=false},scores={bacaphd_l_potion_gilded_fruit=200..}] run advancement grant @s only bacaphd:potion/potion_gilded_fruit_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_gilded_fruit_3=false},scores={bacaphd_l_potion_gilded_fruit=1000..}] run advancement grant @s only bacaphd:potion/potion_gilded_fruit_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_gilded_fruit_4=false},scores={bacaphd_l_potion_gilded_fruit=4000..}] run advancement grant @s only bacaphd:potion/potion_gilded_fruit_4
# --- ladder: potion_sweet_tooth ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sweet_tooth_1=false},scores={bacaphd_l_potion_sweet_tooth=128..}] run advancement grant @s only bacaphd:potion/potion_sweet_tooth_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sweet_tooth_2=false},scores={bacaphd_l_potion_sweet_tooth=800..}] run advancement grant @s only bacaphd:potion/potion_sweet_tooth_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sweet_tooth_3=false},scores={bacaphd_l_potion_sweet_tooth=4000..}] run advancement grant @s only bacaphd:potion/potion_sweet_tooth_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sweet_tooth_4=false},scores={bacaphd_l_potion_sweet_tooth=16000..}] run advancement grant @s only bacaphd:potion/potion_sweet_tooth_4
# --- ladder: potion_dipped_and_deadly ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_dipped_and_deadly_1=false},scores={bacaphd_l_potion_dipped_and_deadly=64..}] run advancement grant @s only bacaphd:potion/potion_dipped_and_deadly_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_dipped_and_deadly_2=false},scores={bacaphd_l_potion_dipped_and_deadly=400..}] run advancement grant @s only bacaphd:potion/potion_dipped_and_deadly_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_dipped_and_deadly_3=false},scores={bacaphd_l_potion_dipped_and_deadly=1600..}] run advancement grant @s only bacaphd:potion/potion_dipped_and_deadly_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_dipped_and_deadly_4=false},scores={bacaphd_l_potion_dipped_and_deadly=6400..}] run advancement grant @s only bacaphd:potion/potion_dipped_and_deadly_4
# --- ladder: potion_highlighter ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_highlighter_1=false},scores={bacaphd_l_potion_highlighter=64..}] run advancement grant @s only bacaphd:potion/potion_highlighter_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_highlighter_2=false},scores={bacaphd_l_potion_highlighter=400..}] run advancement grant @s only bacaphd:potion/potion_highlighter_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_highlighter_3=false},scores={bacaphd_l_potion_highlighter=2000..}] run advancement grant @s only bacaphd:potion/potion_highlighter_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_highlighter_4=false},scores={bacaphd_l_potion_highlighter=8000..}] run advancement grant @s only bacaphd:potion/potion_highlighter_4
# --- ladder: potion_an_apple_a_day ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_an_apple_a_day_1=false},scores={bacaphd_l_potion_an_apple_a_day=20..}] run advancement grant @s only bacaphd:potion/potion_an_apple_a_day_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_an_apple_a_day_2=false},scores={bacaphd_l_potion_an_apple_a_day=100..}] run advancement grant @s only bacaphd:potion/potion_an_apple_a_day_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_an_apple_a_day_3=false},scores={bacaphd_l_potion_an_apple_a_day=400..}] run advancement grant @s only bacaphd:potion/potion_an_apple_a_day_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_an_apple_a_day_4=false},scores={bacaphd_l_potion_an_apple_a_day=1500..}] run advancement grant @s only bacaphd:potion/potion_an_apple_a_day_4
# --- ladder: potion_taste_of_divinity ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_taste_of_divinity_1=false},scores={bacaphd_l_potion_taste_of_divinity=1..}] run advancement grant @s only bacaphd:potion/potion_taste_of_divinity_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_taste_of_divinity_2=false},scores={bacaphd_l_potion_taste_of_divinity=8..}] run advancement grant @s only bacaphd:potion/potion_taste_of_divinity_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_taste_of_divinity_3=false},scores={bacaphd_l_potion_taste_of_divinity=40..}] run advancement grant @s only bacaphd:potion/potion_taste_of_divinity_3
# --- ladder: potion_questionable_cuisine ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_questionable_cuisine_1=false},scores={bacaphd_l_potion_questionable_cuisine=25..}] run advancement grant @s only bacaphd:potion/potion_questionable_cuisine_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_questionable_cuisine_2=false},scores={bacaphd_l_potion_questionable_cuisine=150..}] run advancement grant @s only bacaphd:potion/potion_questionable_cuisine_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_questionable_cuisine_3=false},scores={bacaphd_l_potion_questionable_cuisine=700..}] run advancement grant @s only bacaphd:potion/potion_questionable_cuisine_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_questionable_cuisine_4=false},scores={bacaphd_l_potion_questionable_cuisine=2500..}] run advancement grant @s only bacaphd:potion/potion_questionable_cuisine_4
# --- ladder: potion_eyeballing_it ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_eyeballing_it_1=false},scores={bacaphd_l_potion_eyeballing_it=10..}] run advancement grant @s only bacaphd:potion/potion_eyeballing_it_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_eyeballing_it_2=false},scores={bacaphd_l_potion_eyeballing_it=60..}] run advancement grant @s only bacaphd:potion/potion_eyeballing_it_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_eyeballing_it_3=false},scores={bacaphd_l_potion_eyeballing_it=300..}] run advancement grant @s only bacaphd:potion/potion_eyeballing_it_3
# --- ladder: potion_brimstone ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_brimstone_1=false},scores={bacaphd_l_potion_brimstone=200..}] run advancement grant @s only bacaphd:potion/potion_brimstone_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_brimstone_2=false},scores={bacaphd_l_potion_brimstone=1200..}] run advancement grant @s only bacaphd:potion/potion_brimstone_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_brimstone_3=false},scores={bacaphd_l_potion_brimstone=6000..}] run advancement grant @s only bacaphd:potion/potion_brimstone_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_brimstone_4=false},scores={bacaphd_l_potion_brimstone=20000..}] run advancement grant @s only bacaphd:potion/potion_brimstone_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_brimstone_5=false},scores={bacaphd_l_potion_brimstone=60000..}] run advancement grant @s only bacaphd:potion/potion_brimstone_5
# --- ladder: potion_set_the_pot ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_set_the_pot_1=false},scores={bacaphd_l_potion_set_the_pot=8..}] run advancement grant @s only bacaphd:potion/potion_set_the_pot_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_set_the_pot_2=false},scores={bacaphd_l_potion_set_the_pot=40..}] run advancement grant @s only bacaphd:potion/potion_set_the_pot_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_set_the_pot_3=false},scores={bacaphd_l_potion_set_the_pot=200..}] run advancement grant @s only bacaphd:potion/potion_set_the_pot_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_set_the_pot_4=false},scores={bacaphd_l_potion_set_the_pot=800..}] run advancement grant @s only bacaphd:potion/potion_set_the_pot_4
# --- ladder: potion_wart_bales ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_wart_bales_1=false},scores={bacaphd_l_potion_wart_bales=32..}] run advancement grant @s only bacaphd:potion/potion_wart_bales_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_wart_bales_2=false},scores={bacaphd_l_potion_wart_bales=256..}] run advancement grant @s only bacaphd:potion/potion_wart_bales_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_wart_bales_3=false},scores={bacaphd_l_potion_wart_bales=1024..}] run advancement grant @s only bacaphd:potion/potion_wart_bales_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_wart_bales_4=false},scores={bacaphd_l_potion_wart_bales=4000..}] run advancement grant @s only bacaphd:potion/potion_wart_bales_4
# --- ladder: potion_sticky_remedy ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sticky_remedy_1=false},scores={bacaphd_l_potion_sticky_remedy=64..}] run advancement grant @s only bacaphd:potion/potion_sticky_remedy_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sticky_remedy_2=false},scores={bacaphd_l_potion_sticky_remedy=400..}] run advancement grant @s only bacaphd:potion/potion_sticky_remedy_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sticky_remedy_3=false},scores={bacaphd_l_potion_sticky_remedy=1600..}] run advancement grant @s only bacaphd:potion/potion_sticky_remedy_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_sticky_remedy_4=false},scores={bacaphd_l_potion_sticky_remedy=5000..}] run advancement grant @s only bacaphd:potion/potion_sticky_remedy_4
# --- ladder: potion_spiny_ingredient ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_spiny_ingredient_1=false},scores={bacaphd_l_potion_spiny_ingredient=15..}] run advancement grant @s only bacaphd:potion/potion_spiny_ingredient_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_spiny_ingredient_2=false},scores={bacaphd_l_potion_spiny_ingredient=75..}] run advancement grant @s only bacaphd:potion/potion_spiny_ingredient_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_spiny_ingredient_3=false},scores={bacaphd_l_potion_spiny_ingredient=300..}] run advancement grant @s only bacaphd:potion/potion_spiny_ingredient_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_spiny_ingredient_4=false},scores={bacaphd_l_potion_spiny_ingredient=1000..}] run advancement grant @s only bacaphd:potion/potion_spiny_ingredient_4
# --- ladder: potion_shell_smithing ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_shell_smithing_1=false},scores={bacaphd_l_potion_shell_smithing=1..}] run advancement grant @s only bacaphd:potion/potion_shell_smithing_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_shell_smithing_2=false},scores={bacaphd_l_potion_shell_smithing=8..}] run advancement grant @s only bacaphd:potion/potion_shell_smithing_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_shell_smithing_3=false},scores={bacaphd_l_potion_shell_smithing=40..}] run advancement grant @s only bacaphd:potion/potion_shell_smithing_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_shell_smithing_4=false},scores={bacaphd_l_potion_shell_smithing=150..}] run advancement grant @s only bacaphd:potion/potion_shell_smithing_4
# --- ladder: potion_pocket_gusts ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_pocket_gusts_1=false},scores={bacaphd_l_potion_pocket_gusts=32..}] run advancement grant @s only bacaphd:potion/potion_pocket_gusts_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_pocket_gusts_2=false},scores={bacaphd_l_potion_pocket_gusts=200..}] run advancement grant @s only bacaphd:potion/potion_pocket_gusts_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_pocket_gusts_3=false},scores={bacaphd_l_potion_pocket_gusts=800..}] run advancement grant @s only bacaphd:potion/potion_pocket_gusts_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_pocket_gusts_4=false},scores={bacaphd_l_potion_pocket_gusts=3000..}] run advancement grant @s only bacaphd:potion/potion_pocket_gusts_4
# --- ladder: potion_stink_cubes ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_stink_cubes_1=false},scores={bacaphd_l_potion_stink_cubes=32..}] run advancement grant @s only bacaphd:potion/potion_stink_cubes_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_stink_cubes_2=false},scores={bacaphd_l_potion_stink_cubes=250..}] run advancement grant @s only bacaphd:potion/potion_stink_cubes_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_stink_cubes_3=false},scores={bacaphd_l_potion_stink_cubes=1000..}] run advancement grant @s only bacaphd:potion/potion_stink_cubes_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:potion/potion_stink_cubes_4=false},scores={bacaphd_l_potion_stink_cubes=4000..}] run advancement grant @s only bacaphd:potion/potion_stink_cubes_4
# --- ladder: redstone_dust_placed ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_dust_placed_1=false},scores={bacaphd_l_redstone_dust_placed=500..}] run advancement grant @s only bacaphd:redstone/redstone_dust_placed_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_dust_placed_2=false},scores={bacaphd_l_redstone_dust_placed=2500..}] run advancement grant @s only bacaphd:redstone/redstone_dust_placed_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_dust_placed_3=false},scores={bacaphd_l_redstone_dust_placed=12500..}] run advancement grant @s only bacaphd:redstone/redstone_dust_placed_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_dust_placed_4=false},scores={bacaphd_l_redstone_dust_placed=50000..}] run advancement grant @s only bacaphd:redstone/redstone_dust_placed_4
# --- ladder: redstone_torches ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_torches_1=false},scores={bacaphd_l_redstone_torches=100..}] run advancement grant @s only bacaphd:redstone/redstone_torches_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_torches_2=false},scores={bacaphd_l_redstone_torches=500..}] run advancement grant @s only bacaphd:redstone/redstone_torches_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_torches_3=false},scores={bacaphd_l_redstone_torches=2500..}] run advancement grant @s only bacaphd:redstone/redstone_torches_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_torches_4=false},scores={bacaphd_l_redstone_torches=12500..}] run advancement grant @s only bacaphd:redstone/redstone_torches_4
# --- ladder: redstone_power_blocks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_power_blocks_1=false},scores={bacaphd_l_redstone_power_blocks=64..}] run advancement grant @s only bacaphd:redstone/redstone_power_blocks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_power_blocks_2=false},scores={bacaphd_l_redstone_power_blocks=320..}] run advancement grant @s only bacaphd:redstone/redstone_power_blocks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_power_blocks_3=false},scores={bacaphd_l_redstone_power_blocks=1600..}] run advancement grant @s only bacaphd:redstone/redstone_power_blocks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_power_blocks_4=false},scores={bacaphd_l_redstone_power_blocks=8000..}] run advancement grant @s only bacaphd:redstone/redstone_power_blocks_4
# --- ladder: redstone_repeaters ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_repeaters_1=false},scores={bacaphd_l_redstone_repeaters=64..}] run advancement grant @s only bacaphd:redstone/redstone_repeaters_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_repeaters_2=false},scores={bacaphd_l_redstone_repeaters=320..}] run advancement grant @s only bacaphd:redstone/redstone_repeaters_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_repeaters_3=false},scores={bacaphd_l_redstone_repeaters=1600..}] run advancement grant @s only bacaphd:redstone/redstone_repeaters_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_repeaters_4=false},scores={bacaphd_l_redstone_repeaters=8000..}] run advancement grant @s only bacaphd:redstone/redstone_repeaters_4
# --- ladder: redstone_comparators ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_comparators_1=false},scores={bacaphd_l_redstone_comparators=32..}] run advancement grant @s only bacaphd:redstone/redstone_comparators_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_comparators_2=false},scores={bacaphd_l_redstone_comparators=192..}] run advancement grant @s only bacaphd:redstone/redstone_comparators_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_comparators_3=false},scores={bacaphd_l_redstone_comparators=1000..}] run advancement grant @s only bacaphd:redstone/redstone_comparators_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_comparators_4=false},scores={bacaphd_l_redstone_comparators=5000..}] run advancement grant @s only bacaphd:redstone/redstone_comparators_4
# --- ladder: redstone_pistons ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_pistons_1=false},scores={bacaphd_l_redstone_pistons=100..}] run advancement grant @s only bacaphd:redstone/redstone_pistons_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_pistons_2=false},scores={bacaphd_l_redstone_pistons=500..}] run advancement grant @s only bacaphd:redstone/redstone_pistons_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_pistons_3=false},scores={bacaphd_l_redstone_pistons=2500..}] run advancement grant @s only bacaphd:redstone/redstone_pistons_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_pistons_4=false},scores={bacaphd_l_redstone_pistons=12000..}] run advancement grant @s only bacaphd:redstone/redstone_pistons_4
# --- ladder: redstone_sticky_pistons ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_sticky_pistons_1=false},scores={bacaphd_l_redstone_sticky_pistons=64..}] run advancement grant @s only bacaphd:redstone/redstone_sticky_pistons_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_sticky_pistons_2=false},scores={bacaphd_l_redstone_sticky_pistons=320..}] run advancement grant @s only bacaphd:redstone/redstone_sticky_pistons_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_sticky_pistons_3=false},scores={bacaphd_l_redstone_sticky_pistons=1600..}] run advancement grant @s only bacaphd:redstone/redstone_sticky_pistons_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_sticky_pistons_4=false},scores={bacaphd_l_redstone_sticky_pistons=8000..}] run advancement grant @s only bacaphd:redstone/redstone_sticky_pistons_4
# --- ladder: redstone_slime_blocks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_slime_blocks_1=false},scores={bacaphd_l_redstone_slime_blocks=50..}] run advancement grant @s only bacaphd:redstone/redstone_slime_blocks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_slime_blocks_2=false},scores={bacaphd_l_redstone_slime_blocks=250..}] run advancement grant @s only bacaphd:redstone/redstone_slime_blocks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_slime_blocks_3=false},scores={bacaphd_l_redstone_slime_blocks=1250..}] run advancement grant @s only bacaphd:redstone/redstone_slime_blocks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_slime_blocks_4=false},scores={bacaphd_l_redstone_slime_blocks=5000..}] run advancement grant @s only bacaphd:redstone/redstone_slime_blocks_4
# --- ladder: redstone_observers ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_observers_1=false},scores={bacaphd_l_redstone_observers=32..}] run advancement grant @s only bacaphd:redstone/redstone_observers_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_observers_2=false},scores={bacaphd_l_redstone_observers=192..}] run advancement grant @s only bacaphd:redstone/redstone_observers_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_observers_3=false},scores={bacaphd_l_redstone_observers=1000..}] run advancement grant @s only bacaphd:redstone/redstone_observers_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_observers_4=false},scores={bacaphd_l_redstone_observers=5000..}] run advancement grant @s only bacaphd:redstone/redstone_observers_4
# --- ladder: redstone_hoppers ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_hoppers_1=false},scores={bacaphd_l_redstone_hoppers=64..}] run advancement grant @s only bacaphd:redstone/redstone_hoppers_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_hoppers_2=false},scores={bacaphd_l_redstone_hoppers=320..}] run advancement grant @s only bacaphd:redstone/redstone_hoppers_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_hoppers_3=false},scores={bacaphd_l_redstone_hoppers=1500..}] run advancement grant @s only bacaphd:redstone/redstone_hoppers_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_hoppers_4=false},scores={bacaphd_l_redstone_hoppers=6000..}] run advancement grant @s only bacaphd:redstone/redstone_hoppers_4
# --- ladder: redstone_droppers ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_droppers_1=false},scores={bacaphd_l_redstone_droppers=32..}] run advancement grant @s only bacaphd:redstone/redstone_droppers_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_droppers_2=false},scores={bacaphd_l_redstone_droppers=160..}] run advancement grant @s only bacaphd:redstone/redstone_droppers_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_droppers_3=false},scores={bacaphd_l_redstone_droppers=800..}] run advancement grant @s only bacaphd:redstone/redstone_droppers_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_droppers_4=false},scores={bacaphd_l_redstone_droppers=4000..}] run advancement grant @s only bacaphd:redstone/redstone_droppers_4
# --- ladder: redstone_dispensers ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_dispensers_1=false},scores={bacaphd_l_redstone_dispensers=32..}] run advancement grant @s only bacaphd:redstone/redstone_dispensers_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_dispensers_2=false},scores={bacaphd_l_redstone_dispensers=160..}] run advancement grant @s only bacaphd:redstone/redstone_dispensers_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_dispensers_3=false},scores={bacaphd_l_redstone_dispensers=800..}] run advancement grant @s only bacaphd:redstone/redstone_dispensers_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_dispensers_4=false},scores={bacaphd_l_redstone_dispensers=3200..}] run advancement grant @s only bacaphd:redstone/redstone_dispensers_4
# --- ladder: redstone_lamps ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_lamps_1=false},scores={bacaphd_l_redstone_lamps=32..}] run advancement grant @s only bacaphd:redstone/redstone_lamps_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_lamps_2=false},scores={bacaphd_l_redstone_lamps=160..}] run advancement grant @s only bacaphd:redstone/redstone_lamps_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_lamps_3=false},scores={bacaphd_l_redstone_lamps=800..}] run advancement grant @s only bacaphd:redstone/redstone_lamps_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_lamps_4=false},scores={bacaphd_l_redstone_lamps=4000..}] run advancement grant @s only bacaphd:redstone/redstone_lamps_4
# --- ladder: redstone_note_blocks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_note_blocks_1=false},scores={bacaphd_l_redstone_note_blocks=32..}] run advancement grant @s only bacaphd:redstone/redstone_note_blocks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_note_blocks_2=false},scores={bacaphd_l_redstone_note_blocks=192..}] run advancement grant @s only bacaphd:redstone/redstone_note_blocks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_note_blocks_3=false},scores={bacaphd_l_redstone_note_blocks=1000..}] run advancement grant @s only bacaphd:redstone/redstone_note_blocks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_note_blocks_4=false},scores={bacaphd_l_redstone_note_blocks=5000..}] run advancement grant @s only bacaphd:redstone/redstone_note_blocks_4
# --- ladder: redstone_levers ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_levers_1=false},scores={bacaphd_l_redstone_levers=50..}] run advancement grant @s only bacaphd:redstone/redstone_levers_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_levers_2=false},scores={bacaphd_l_redstone_levers=250..}] run advancement grant @s only bacaphd:redstone/redstone_levers_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_levers_3=false},scores={bacaphd_l_redstone_levers=1250..}] run advancement grant @s only bacaphd:redstone/redstone_levers_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_levers_4=false},scores={bacaphd_l_redstone_levers=5000..}] run advancement grant @s only bacaphd:redstone/redstone_levers_4
# --- ladder: redstone_buttons ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_buttons_1=false},scores={bacaphd_l_redstone_buttons=50..}] run advancement grant @s only bacaphd:redstone/redstone_buttons_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_buttons_2=false},scores={bacaphd_l_redstone_buttons=250..}] run advancement grant @s only bacaphd:redstone/redstone_buttons_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_buttons_3=false},scores={bacaphd_l_redstone_buttons=1250..}] run advancement grant @s only bacaphd:redstone/redstone_buttons_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_buttons_4=false},scores={bacaphd_l_redstone_buttons=5000..}] run advancement grant @s only bacaphd:redstone/redstone_buttons_4
# --- ladder: redstone_pressure_plates ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_pressure_plates_1=false},scores={bacaphd_l_redstone_pressure_plates=32..}] run advancement grant @s only bacaphd:redstone/redstone_pressure_plates_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_pressure_plates_2=false},scores={bacaphd_l_redstone_pressure_plates=192..}] run advancement grant @s only bacaphd:redstone/redstone_pressure_plates_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_pressure_plates_3=false},scores={bacaphd_l_redstone_pressure_plates=1000..}] run advancement grant @s only bacaphd:redstone/redstone_pressure_plates_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_pressure_plates_4=false},scores={bacaphd_l_redstone_pressure_plates=5000..}] run advancement grant @s only bacaphd:redstone/redstone_pressure_plates_4
# --- ladder: redstone_tripwire_hooks ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_tripwire_hooks_1=false},scores={bacaphd_l_redstone_tripwire_hooks=32..}] run advancement grant @s only bacaphd:redstone/redstone_tripwire_hooks_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_tripwire_hooks_2=false},scores={bacaphd_l_redstone_tripwire_hooks=160..}] run advancement grant @s only bacaphd:redstone/redstone_tripwire_hooks_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_tripwire_hooks_3=false},scores={bacaphd_l_redstone_tripwire_hooks=800..}] run advancement grant @s only bacaphd:redstone/redstone_tripwire_hooks_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_tripwire_hooks_4=false},scores={bacaphd_l_redstone_tripwire_hooks=3200..}] run advancement grant @s only bacaphd:redstone/redstone_tripwire_hooks_4
# --- ladder: redstone_daylight_detectors ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_daylight_detectors_1=false},scores={bacaphd_l_redstone_daylight_detectors=16..}] run advancement grant @s only bacaphd:redstone/redstone_daylight_detectors_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_daylight_detectors_2=false},scores={bacaphd_l_redstone_daylight_detectors=80..}] run advancement grant @s only bacaphd:redstone/redstone_daylight_detectors_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_daylight_detectors_3=false},scores={bacaphd_l_redstone_daylight_detectors=400..}] run advancement grant @s only bacaphd:redstone/redstone_daylight_detectors_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_daylight_detectors_4=false},scores={bacaphd_l_redstone_daylight_detectors=2000..}] run advancement grant @s only bacaphd:redstone/redstone_daylight_detectors_4
# --- ladder: redstone_crafters ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_crafters_1=false},scores={bacaphd_l_redstone_crafters=16..}] run advancement grant @s only bacaphd:redstone/redstone_crafters_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_crafters_2=false},scores={bacaphd_l_redstone_crafters=80..}] run advancement grant @s only bacaphd:redstone/redstone_crafters_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_crafters_3=false},scores={bacaphd_l_redstone_crafters=400..}] run advancement grant @s only bacaphd:redstone/redstone_crafters_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_crafters_4=false},scores={bacaphd_l_redstone_crafters=2000..}] run advancement grant @s only bacaphd:redstone/redstone_crafters_4
# --- ladder: redstone_powered_rails ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_powered_rails_1=false},scores={bacaphd_l_redstone_powered_rails=64..}] run advancement grant @s only bacaphd:redstone/redstone_powered_rails_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_powered_rails_2=false},scores={bacaphd_l_redstone_powered_rails=320..}] run advancement grant @s only bacaphd:redstone/redstone_powered_rails_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_powered_rails_3=false},scores={bacaphd_l_redstone_powered_rails=1600..}] run advancement grant @s only bacaphd:redstone/redstone_powered_rails_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_powered_rails_4=false},scores={bacaphd_l_redstone_powered_rails=6400..}] run advancement grant @s only bacaphd:redstone/redstone_powered_rails_4
# --- ladder: redstone_detector_rails ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_detector_rails_1=false},scores={bacaphd_l_redstone_detector_rails=32..}] run advancement grant @s only bacaphd:redstone/redstone_detector_rails_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_detector_rails_2=false},scores={bacaphd_l_redstone_detector_rails=160..}] run advancement grant @s only bacaphd:redstone/redstone_detector_rails_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_detector_rails_3=false},scores={bacaphd_l_redstone_detector_rails=800..}] run advancement grant @s only bacaphd:redstone/redstone_detector_rails_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_detector_rails_4=false},scores={bacaphd_l_redstone_detector_rails=3200..}] run advancement grant @s only bacaphd:redstone/redstone_detector_rails_4
# --- ladder: redstone_minecarts ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_minecarts_1=false},scores={bacaphd_l_redstone_minecarts=32..}] run advancement grant @s only bacaphd:redstone/redstone_minecarts_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_minecarts_2=false},scores={bacaphd_l_redstone_minecarts=160..}] run advancement grant @s only bacaphd:redstone/redstone_minecarts_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_minecarts_3=false},scores={bacaphd_l_redstone_minecarts=800..}] run advancement grant @s only bacaphd:redstone/redstone_minecarts_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_minecarts_4=false},scores={bacaphd_l_redstone_minecarts=3200..}] run advancement grant @s only bacaphd:redstone/redstone_minecarts_4
# --- ladder: redstone_chest_minecarts ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_chest_minecarts_1=false},scores={bacaphd_l_redstone_chest_minecarts=10..}] run advancement grant @s only bacaphd:redstone/redstone_chest_minecarts_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_chest_minecarts_2=false},scores={bacaphd_l_redstone_chest_minecarts=50..}] run advancement grant @s only bacaphd:redstone/redstone_chest_minecarts_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_chest_minecarts_3=false},scores={bacaphd_l_redstone_chest_minecarts=250..}] run advancement grant @s only bacaphd:redstone/redstone_chest_minecarts_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_chest_minecarts_4=false},scores={bacaphd_l_redstone_chest_minecarts=1000..}] run advancement grant @s only bacaphd:redstone/redstone_chest_minecarts_4
# --- ladder: redstone_tnt_minecarts ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_tnt_minecarts_1=false},scores={bacaphd_l_redstone_tnt_minecarts=10..}] run advancement grant @s only bacaphd:redstone/redstone_tnt_minecarts_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_tnt_minecarts_2=false},scores={bacaphd_l_redstone_tnt_minecarts=64..}] run advancement grant @s only bacaphd:redstone/redstone_tnt_minecarts_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_tnt_minecarts_3=false},scores={bacaphd_l_redstone_tnt_minecarts=320..}] run advancement grant @s only bacaphd:redstone/redstone_tnt_minecarts_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_tnt_minecarts_4=false},scores={bacaphd_l_redstone_tnt_minecarts=1280..}] run advancement grant @s only bacaphd:redstone/redstone_tnt_minecarts_4
# --- ladder: redstone_targets ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_targets_1=false},scores={bacaphd_l_redstone_targets=16..}] run advancement grant @s only bacaphd:redstone/redstone_targets_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_targets_2=false},scores={bacaphd_l_redstone_targets=64..}] run advancement grant @s only bacaphd:redstone/redstone_targets_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_targets_3=false},scores={bacaphd_l_redstone_targets=250..}] run advancement grant @s only bacaphd:redstone/redstone_targets_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_targets_4=false},scores={bacaphd_l_redstone_targets=1000..}] run advancement grant @s only bacaphd:redstone/redstone_targets_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_targets_5=false},scores={bacaphd_l_redstone_targets=2500..}] run advancement grant @s only bacaphd:redstone/redstone_targets_5
# --- ladder: redstone_trapped_chests ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_trapped_chests_1=false},scores={bacaphd_l_redstone_trapped_chests=16..}] run advancement grant @s only bacaphd:redstone/redstone_trapped_chests_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_trapped_chests_2=false},scores={bacaphd_l_redstone_trapped_chests=96..}] run advancement grant @s only bacaphd:redstone/redstone_trapped_chests_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_trapped_chests_3=false},scores={bacaphd_l_redstone_trapped_chests=480..}] run advancement grant @s only bacaphd:redstone/redstone_trapped_chests_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_trapped_chests_4=false},scores={bacaphd_l_redstone_trapped_chests=1920..}] run advancement grant @s only bacaphd:redstone/redstone_trapped_chests_4
# --- ladder: redstone_lightning_rods ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_lightning_rods_1=false},scores={bacaphd_l_redstone_lightning_rods=32..}] run advancement grant @s only bacaphd:redstone/redstone_lightning_rods_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_lightning_rods_2=false},scores={bacaphd_l_redstone_lightning_rods=160..}] run advancement grant @s only bacaphd:redstone/redstone_lightning_rods_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_lightning_rods_3=false},scores={bacaphd_l_redstone_lightning_rods=800..}] run advancement grant @s only bacaphd:redstone/redstone_lightning_rods_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_lightning_rods_4=false},scores={bacaphd_l_redstone_lightning_rods=3200..}] run advancement grant @s only bacaphd:redstone/redstone_lightning_rods_4
# --- ladder: redstone_copper_bulbs ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_copper_bulbs_1=false},scores={bacaphd_l_redstone_copper_bulbs=16..}] run advancement grant @s only bacaphd:redstone/redstone_copper_bulbs_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_copper_bulbs_2=false},scores={bacaphd_l_redstone_copper_bulbs=96..}] run advancement grant @s only bacaphd:redstone/redstone_copper_bulbs_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_copper_bulbs_3=false},scores={bacaphd_l_redstone_copper_bulbs=480..}] run advancement grant @s only bacaphd:redstone/redstone_copper_bulbs_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/redstone_copper_bulbs_4=false},scores={bacaphd_l_redstone_copper_bulbs=1920..}] run advancement grant @s only bacaphd:redstone/redstone_copper_bulbs_4
# --- ladder: statistics_stick_whittling ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_stick_whittling_1=false},scores={bacaphd_l_statistics_stick_whittling=500..}] run advancement grant @s only bacaphd:statistics/statistics_stick_whittling_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_stick_whittling_2=false},scores={bacaphd_l_statistics_stick_whittling=3000..}] run advancement grant @s only bacaphd:statistics/statistics_stick_whittling_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_stick_whittling_3=false},scores={bacaphd_l_statistics_stick_whittling=20000..}] run advancement grant @s only bacaphd:statistics/statistics_stick_whittling_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_stick_whittling_4=false},scores={bacaphd_l_statistics_stick_whittling=100000..}] run advancement grant @s only bacaphd:statistics/statistics_stick_whittling_4
# --- ladder: statistics_oak_plank_milling ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_oak_plank_milling_1=false},scores={bacaphd_l_statistics_oak_plank_milling=500..}] run advancement grant @s only bacaphd:statistics/statistics_oak_plank_milling_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_oak_plank_milling_2=false},scores={bacaphd_l_statistics_oak_plank_milling=3000..}] run advancement grant @s only bacaphd:statistics/statistics_oak_plank_milling_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_oak_plank_milling_3=false},scores={bacaphd_l_statistics_oak_plank_milling=15000..}] run advancement grant @s only bacaphd:statistics/statistics_oak_plank_milling_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_oak_plank_milling_4=false},scores={bacaphd_l_statistics_oak_plank_milling=75000..}] run advancement grant @s only bacaphd:statistics/statistics_oak_plank_milling_4
# --- ladder: statistics_snowball_barrage ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_snowball_barrage_1=false},scores={bacaphd_l_statistics_snowball_barrage=100..}] run advancement grant @s only bacaphd:statistics/statistics_snowball_barrage_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_snowball_barrage_2=false},scores={bacaphd_l_statistics_snowball_barrage=500..}] run advancement grant @s only bacaphd:statistics/statistics_snowball_barrage_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_snowball_barrage_3=false},scores={bacaphd_l_statistics_snowball_barrage=2500..}] run advancement grant @s only bacaphd:statistics/statistics_snowball_barrage_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_snowball_barrage_4=false},scores={bacaphd_l_statistics_snowball_barrage=10000..}] run advancement grant @s only bacaphd:statistics/statistics_snowball_barrage_4
# --- ladder: statistics_water_pouring ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_water_pouring_1=false},scores={bacaphd_l_statistics_water_pouring=100..}] run advancement grant @s only bacaphd:statistics/statistics_water_pouring_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_water_pouring_2=false},scores={bacaphd_l_statistics_water_pouring=500..}] run advancement grant @s only bacaphd:statistics/statistics_water_pouring_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_water_pouring_3=false},scores={bacaphd_l_statistics_water_pouring=2500..}] run advancement grant @s only bacaphd:statistics/statistics_water_pouring_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_water_pouring_4=false},scores={bacaphd_l_statistics_water_pouring=10000..}] run advancement grant @s only bacaphd:statistics/statistics_water_pouring_4
# --- ladder: statistics_bucket_filling ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_bucket_filling_1=false},scores={bacaphd_l_statistics_bucket_filling=100..}] run advancement grant @s only bacaphd:statistics/statistics_bucket_filling_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_bucket_filling_2=false},scores={bacaphd_l_statistics_bucket_filling=500..}] run advancement grant @s only bacaphd:statistics/statistics_bucket_filling_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_bucket_filling_3=false},scores={bacaphd_l_statistics_bucket_filling=2500..}] run advancement grant @s only bacaphd:statistics/statistics_bucket_filling_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_bucket_filling_4=false},scores={bacaphd_l_statistics_bucket_filling=10000..}] run advancement grant @s only bacaphd:statistics/statistics_bucket_filling_4
# --- ladder: statistics_bow_drawing ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_bow_drawing_1=false},scores={bacaphd_l_statistics_bow_drawing=250..}] run advancement grant @s only bacaphd:statistics/statistics_bow_drawing_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_bow_drawing_2=false},scores={bacaphd_l_statistics_bow_drawing=1000..}] run advancement grant @s only bacaphd:statistics/statistics_bow_drawing_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_bow_drawing_3=false},scores={bacaphd_l_statistics_bow_drawing=5000..}] run advancement grant @s only bacaphd:statistics/statistics_bow_drawing_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_bow_drawing_4=false},scores={bacaphd_l_statistics_bow_drawing=25000..}] run advancement grant @s only bacaphd:statistics/statistics_bow_drawing_4
# --- ladder: statistics_crossbow_cranking ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_crossbow_cranking_1=false},scores={bacaphd_l_statistics_crossbow_cranking=100..}] run advancement grant @s only bacaphd:statistics/statistics_crossbow_cranking_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_crossbow_cranking_2=false},scores={bacaphd_l_statistics_crossbow_cranking=500..}] run advancement grant @s only bacaphd:statistics/statistics_crossbow_cranking_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_crossbow_cranking_3=false},scores={bacaphd_l_statistics_crossbow_cranking=2500..}] run advancement grant @s only bacaphd:statistics/statistics_crossbow_cranking_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_crossbow_cranking_4=false},scores={bacaphd_l_statistics_crossbow_cranking=10000..}] run advancement grant @s only bacaphd:statistics/statistics_crossbow_cranking_4
# --- ladder: statistics_shield_blocking ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_shield_blocking_1=false},scores={bacaphd_l_statistics_shield_blocking=250..}] run advancement grant @s only bacaphd:statistics/statistics_shield_blocking_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_shield_blocking_2=false},scores={bacaphd_l_statistics_shield_blocking=1000..}] run advancement grant @s only bacaphd:statistics/statistics_shield_blocking_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_shield_blocking_3=false},scores={bacaphd_l_statistics_shield_blocking=5000..}] run advancement grant @s only bacaphd:statistics/statistics_shield_blocking_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_shield_blocking_4=false},scores={bacaphd_l_statistics_shield_blocking=20000..}] run advancement grant @s only bacaphd:statistics/statistics_shield_blocking_4
# --- ladder: statistics_cake_baking ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_cake_baking_1=false},scores={bacaphd_l_statistics_cake_baking=10..}] run advancement grant @s only bacaphd:statistics/statistics_cake_baking_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_cake_baking_2=false},scores={bacaphd_l_statistics_cake_baking=50..}] run advancement grant @s only bacaphd:statistics/statistics_cake_baking_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_cake_baking_3=false},scores={bacaphd_l_statistics_cake_baking=200..}] run advancement grant @s only bacaphd:statistics/statistics_cake_baking_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_cake_baking_4=false},scores={bacaphd_l_statistics_cake_baking=750..}] run advancement grant @s only bacaphd:statistics/statistics_cake_baking_4
# --- ladder: statistics_arrow_fletching ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_arrow_fletching_1=false},scores={bacaphd_l_statistics_arrow_fletching=250..}] run advancement grant @s only bacaphd:statistics/statistics_arrow_fletching_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_arrow_fletching_2=false},scores={bacaphd_l_statistics_arrow_fletching=1000..}] run advancement grant @s only bacaphd:statistics/statistics_arrow_fletching_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_arrow_fletching_3=false},scores={bacaphd_l_statistics_arrow_fletching=5000..}] run advancement grant @s only bacaphd:statistics/statistics_arrow_fletching_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_arrow_fletching_4=false},scores={bacaphd_l_statistics_arrow_fletching=25000..}] run advancement grant @s only bacaphd:statistics/statistics_arrow_fletching_4
# --- ladder: statistics_chest_building ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_chest_building_1=false},scores={bacaphd_l_statistics_chest_building=50..}] run advancement grant @s only bacaphd:statistics/statistics_chest_building_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_chest_building_2=false},scores={bacaphd_l_statistics_chest_building=250..}] run advancement grant @s only bacaphd:statistics/statistics_chest_building_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_chest_building_3=false},scores={bacaphd_l_statistics_chest_building=1000..}] run advancement grant @s only bacaphd:statistics/statistics_chest_building_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_chest_building_4=false},scores={bacaphd_l_statistics_chest_building=5000..}] run advancement grant @s only bacaphd:statistics/statistics_chest_building_4
# --- ladder: statistics_pickaxe_wear ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_pickaxe_wear_1=false},scores={bacaphd_l_statistics_pickaxe_wear=500..}] run advancement grant @s only bacaphd:statistics/statistics_pickaxe_wear_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_pickaxe_wear_2=false},scores={bacaphd_l_statistics_pickaxe_wear=5000..}] run advancement grant @s only bacaphd:statistics/statistics_pickaxe_wear_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_pickaxe_wear_3=false},scores={bacaphd_l_statistics_pickaxe_wear=25000..}] run advancement grant @s only bacaphd:statistics/statistics_pickaxe_wear_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_pickaxe_wear_4=false},scores={bacaphd_l_statistics_pickaxe_wear=75000..}] run advancement grant @s only bacaphd:statistics/statistics_pickaxe_wear_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_pickaxe_wear_5=false},scores={bacaphd_l_statistics_pickaxe_wear=150000..}] run advancement grant @s only bacaphd:statistics/statistics_pickaxe_wear_5
# --- ladder: statistics_potato_feasting ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_potato_feasting_1=false},scores={bacaphd_l_statistics_potato_feasting=100..}] run advancement grant @s only bacaphd:statistics/statistics_potato_feasting_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_potato_feasting_2=false},scores={bacaphd_l_statistics_potato_feasting=500..}] run advancement grant @s only bacaphd:statistics/statistics_potato_feasting_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_potato_feasting_3=false},scores={bacaphd_l_statistics_potato_feasting=2500..}] run advancement grant @s only bacaphd:statistics/statistics_potato_feasting_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_potato_feasting_4=false},scores={bacaphd_l_statistics_potato_feasting=10000..}] run advancement grant @s only bacaphd:statistics/statistics_potato_feasting_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/statistics_potato_feasting_5=false},scores={bacaphd_l_statistics_potato_feasting=25000..}] run advancement grant @s only bacaphd:statistics/statistics_potato_feasting_5
# --- ladder: weaponry_wooden_sword ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_wooden_sword_1=false},scores={bacaphd_l_weaponry_wooden_sword=50..}] run advancement grant @s only bacaphd:weaponry/weaponry_wooden_sword_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_wooden_sword_2=false},scores={bacaphd_l_weaponry_wooden_sword=250..}] run advancement grant @s only bacaphd:weaponry/weaponry_wooden_sword_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_wooden_sword_3=false},scores={bacaphd_l_weaponry_wooden_sword=1000..}] run advancement grant @s only bacaphd:weaponry/weaponry_wooden_sword_3
# --- ladder: weaponry_stone_sword ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_stone_sword_1=false},scores={bacaphd_l_weaponry_stone_sword=100..}] run advancement grant @s only bacaphd:weaponry/weaponry_stone_sword_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_stone_sword_2=false},scores={bacaphd_l_weaponry_stone_sword=500..}] run advancement grant @s only bacaphd:weaponry/weaponry_stone_sword_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_stone_sword_3=false},scores={bacaphd_l_weaponry_stone_sword=2500..}] run advancement grant @s only bacaphd:weaponry/weaponry_stone_sword_3
# --- ladder: weaponry_iron_sword ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_iron_sword_1=false},scores={bacaphd_l_weaponry_iron_sword=250..}] run advancement grant @s only bacaphd:weaponry/weaponry_iron_sword_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_iron_sword_2=false},scores={bacaphd_l_weaponry_iron_sword=1500..}] run advancement grant @s only bacaphd:weaponry/weaponry_iron_sword_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_iron_sword_3=false},scores={bacaphd_l_weaponry_iron_sword=7500..}] run advancement grant @s only bacaphd:weaponry/weaponry_iron_sword_3
# --- ladder: weaponry_diamond_sword ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_sword_1=false},scores={bacaphd_l_weaponry_diamond_sword=500..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_sword_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_sword_2=false},scores={bacaphd_l_weaponry_diamond_sword=2500..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_sword_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_sword_3=false},scores={bacaphd_l_weaponry_diamond_sword=12500..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_sword_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_sword_4=false},scores={bacaphd_l_weaponry_diamond_sword=60000..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_sword_4
# --- ladder: weaponry_netherite_sword ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_sword_1=false},scores={bacaphd_l_weaponry_netherite_sword=250..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_sword_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_sword_2=false},scores={bacaphd_l_weaponry_netherite_sword=1500..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_sword_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_sword_3=false},scores={bacaphd_l_weaponry_netherite_sword=9000..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_sword_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_sword_4=false},scores={bacaphd_l_weaponry_netherite_sword=45000..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_sword_4
# --- ladder: weaponry_iron_axe ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_iron_axe_1=false},scores={bacaphd_l_weaponry_iron_axe=500..}] run advancement grant @s only bacaphd:weaponry/weaponry_iron_axe_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_iron_axe_2=false},scores={bacaphd_l_weaponry_iron_axe=3000..}] run advancement grant @s only bacaphd:weaponry/weaponry_iron_axe_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_iron_axe_3=false},scores={bacaphd_l_weaponry_iron_axe=15000..}] run advancement grant @s only bacaphd:weaponry/weaponry_iron_axe_3
# --- ladder: weaponry_netherite_axe ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_axe_1=false},scores={bacaphd_l_weaponry_netherite_axe=250..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_axe_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_axe_2=false},scores={bacaphd_l_weaponry_netherite_axe=1500..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_axe_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_axe_3=false},scores={bacaphd_l_weaponry_netherite_axe=7500..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_axe_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_axe_4=false},scores={bacaphd_l_weaponry_netherite_axe=35000..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_axe_4
# --- ladder: weaponry_wooden_spear ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_wooden_spear_1=false},scores={bacaphd_l_weaponry_wooden_spear=50..}] run advancement grant @s only bacaphd:weaponry/weaponry_wooden_spear_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_wooden_spear_2=false},scores={bacaphd_l_weaponry_wooden_spear=250..}] run advancement grant @s only bacaphd:weaponry/weaponry_wooden_spear_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_wooden_spear_3=false},scores={bacaphd_l_weaponry_wooden_spear=1000..}] run advancement grant @s only bacaphd:weaponry/weaponry_wooden_spear_3
# --- ladder: weaponry_iron_spear ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_iron_spear_1=false},scores={bacaphd_l_weaponry_iron_spear=250..}] run advancement grant @s only bacaphd:weaponry/weaponry_iron_spear_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_iron_spear_2=false},scores={bacaphd_l_weaponry_iron_spear=1250..}] run advancement grant @s only bacaphd:weaponry/weaponry_iron_spear_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_iron_spear_3=false},scores={bacaphd_l_weaponry_iron_spear=6000..}] run advancement grant @s only bacaphd:weaponry/weaponry_iron_spear_3
# --- ladder: weaponry_diamond_spear ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_spear_1=false},scores={bacaphd_l_weaponry_diamond_spear=500..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_spear_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_spear_2=false},scores={bacaphd_l_weaponry_diamond_spear=3000..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_spear_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_spear_3=false},scores={bacaphd_l_weaponry_diamond_spear=15000..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_spear_3
# --- ladder: weaponry_netherite_spear ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_spear_1=false},scores={bacaphd_l_weaponry_netherite_spear=250..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_spear_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_spear_2=false},scores={bacaphd_l_weaponry_netherite_spear=1500..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_spear_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_spear_3=false},scores={bacaphd_l_weaponry_netherite_spear=8000..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_spear_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_netherite_spear_4=false},scores={bacaphd_l_weaponry_netherite_spear=40000..}] run advancement grant @s only bacaphd:weaponry/weaponry_netherite_spear_4
# --- ladder: weaponry_trident ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_trident_1=false},scores={bacaphd_l_weaponry_trident=100..}] run advancement grant @s only bacaphd:weaponry/weaponry_trident_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_trident_2=false},scores={bacaphd_l_weaponry_trident=750..}] run advancement grant @s only bacaphd:weaponry/weaponry_trident_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_trident_3=false},scores={bacaphd_l_weaponry_trident=4000..}] run advancement grant @s only bacaphd:weaponry/weaponry_trident_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_trident_4=false},scores={bacaphd_l_weaponry_trident=20000..}] run advancement grant @s only bacaphd:weaponry/weaponry_trident_4
# --- ladder: weaponry_fire_charge ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_fire_charge_1=false},scores={bacaphd_l_weaponry_fire_charge=32..}] run advancement grant @s only bacaphd:weaponry/weaponry_fire_charge_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_fire_charge_2=false},scores={bacaphd_l_weaponry_fire_charge=256..}] run advancement grant @s only bacaphd:weaponry/weaponry_fire_charge_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_fire_charge_3=false},scores={bacaphd_l_weaponry_fire_charge=2048..}] run advancement grant @s only bacaphd:weaponry/weaponry_fire_charge_3
# --- ladder: weaponry_copper_sword ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_sword_1=false},scores={bacaphd_l_weaponry_copper_sword=100..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_sword_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_sword_2=false},scores={bacaphd_l_weaponry_copper_sword=600..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_sword_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_sword_3=false},scores={bacaphd_l_weaponry_copper_sword=3000..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_sword_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_sword_4=false},scores={bacaphd_l_weaponry_copper_sword=12000..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_sword_4
# --- ladder: weaponry_golden_sword ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_sword_1=false},scores={bacaphd_l_weaponry_golden_sword=100..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_sword_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_sword_2=false},scores={bacaphd_l_weaponry_golden_sword=500..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_sword_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_sword_3=false},scores={bacaphd_l_weaponry_golden_sword=2500..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_sword_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_sword_4=false},scores={bacaphd_l_weaponry_golden_sword=10000..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_sword_4
# --- ladder: weaponry_wooden_axe ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_wooden_axe_1=false},scores={bacaphd_l_weaponry_wooden_axe=100..}] run advancement grant @s only bacaphd:weaponry/weaponry_wooden_axe_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_wooden_axe_2=false},scores={bacaphd_l_weaponry_wooden_axe=500..}] run advancement grant @s only bacaphd:weaponry/weaponry_wooden_axe_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_wooden_axe_3=false},scores={bacaphd_l_weaponry_wooden_axe=2000..}] run advancement grant @s only bacaphd:weaponry/weaponry_wooden_axe_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_wooden_axe_4=false},scores={bacaphd_l_weaponry_wooden_axe=7500..}] run advancement grant @s only bacaphd:weaponry/weaponry_wooden_axe_4
# --- ladder: weaponry_stone_axe ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_stone_axe_1=false},scores={bacaphd_l_weaponry_stone_axe=250..}] run advancement grant @s only bacaphd:weaponry/weaponry_stone_axe_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_stone_axe_2=false},scores={bacaphd_l_weaponry_stone_axe=1250..}] run advancement grant @s only bacaphd:weaponry/weaponry_stone_axe_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_stone_axe_3=false},scores={bacaphd_l_weaponry_stone_axe=5000..}] run advancement grant @s only bacaphd:weaponry/weaponry_stone_axe_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_stone_axe_4=false},scores={bacaphd_l_weaponry_stone_axe=20000..}] run advancement grant @s only bacaphd:weaponry/weaponry_stone_axe_4
# --- ladder: weaponry_copper_axe ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_axe_1=false},scores={bacaphd_l_weaponry_copper_axe=200..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_axe_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_axe_2=false},scores={bacaphd_l_weaponry_copper_axe=1000..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_axe_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_axe_3=false},scores={bacaphd_l_weaponry_copper_axe=5000..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_axe_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_axe_4=false},scores={bacaphd_l_weaponry_copper_axe=18000..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_axe_4
# --- ladder: weaponry_golden_axe ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_axe_1=false},scores={bacaphd_l_weaponry_golden_axe=100..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_axe_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_axe_2=false},scores={bacaphd_l_weaponry_golden_axe=500..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_axe_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_axe_3=false},scores={bacaphd_l_weaponry_golden_axe=2500..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_axe_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_axe_4=false},scores={bacaphd_l_weaponry_golden_axe=10000..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_axe_4
# --- ladder: weaponry_diamond_axe ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_axe_1=false},scores={bacaphd_l_weaponry_diamond_axe=500..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_axe_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_axe_2=false},scores={bacaphd_l_weaponry_diamond_axe=2500..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_axe_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_axe_3=false},scores={bacaphd_l_weaponry_diamond_axe=10000..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_axe_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_axe_4=false},scores={bacaphd_l_weaponry_diamond_axe=25000..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_axe_4
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_diamond_axe_5=false},scores={bacaphd_l_weaponry_diamond_axe=50000..}] run advancement grant @s only bacaphd:weaponry/weaponry_diamond_axe_5
# --- ladder: weaponry_copper_spear ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_spear_1=false},scores={bacaphd_l_weaponry_copper_spear=100..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_spear_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_spear_2=false},scores={bacaphd_l_weaponry_copper_spear=600..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_spear_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_spear_3=false},scores={bacaphd_l_weaponry_copper_spear=3000..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_spear_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_copper_spear_4=false},scores={bacaphd_l_weaponry_copper_spear=12000..}] run advancement grant @s only bacaphd:weaponry/weaponry_copper_spear_4
# --- ladder: weaponry_stone_spear ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_stone_spear_1=false},scores={bacaphd_l_weaponry_stone_spear=100..}] run advancement grant @s only bacaphd:weaponry/weaponry_stone_spear_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_stone_spear_2=false},scores={bacaphd_l_weaponry_stone_spear=500..}] run advancement grant @s only bacaphd:weaponry/weaponry_stone_spear_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_stone_spear_3=false},scores={bacaphd_l_weaponry_stone_spear=2500..}] run advancement grant @s only bacaphd:weaponry/weaponry_stone_spear_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_stone_spear_4=false},scores={bacaphd_l_weaponry_stone_spear=10000..}] run advancement grant @s only bacaphd:weaponry/weaponry_stone_spear_4
# --- ladder: weaponry_golden_spear ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_spear_1=false},scores={bacaphd_l_weaponry_golden_spear=100..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_spear_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_spear_2=false},scores={bacaphd_l_weaponry_golden_spear=500..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_spear_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_spear_3=false},scores={bacaphd_l_weaponry_golden_spear=2000..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_spear_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_golden_spear_4=false},scores={bacaphd_l_weaponry_golden_spear=8000..}] run advancement grant @s only bacaphd:weaponry/weaponry_golden_spear_4
# --- ladder: weaponry_shield_crafted ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_shield_crafted_1=false},scores={bacaphd_l_weaponry_shield_crafted=4..}] run advancement grant @s only bacaphd:weaponry/weaponry_shield_crafted_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_shield_crafted_2=false},scores={bacaphd_l_weaponry_shield_crafted=32..}] run advancement grant @s only bacaphd:weaponry/weaponry_shield_crafted_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_shield_crafted_3=false},scores={bacaphd_l_weaponry_shield_crafted=128..}] run advancement grant @s only bacaphd:weaponry/weaponry_shield_crafted_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_shield_crafted_4=false},scores={bacaphd_l_weaponry_shield_crafted=512..}] run advancement grant @s only bacaphd:weaponry/weaponry_shield_crafted_4
# --- ladder: weaponry_nether_star ---
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_nether_star_1=false},scores={bacaphd_l_weaponry_nether_star=10..}] run advancement grant @s only bacaphd:weaponry/weaponry_nether_star_1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_nether_star_2=false},scores={bacaphd_l_weaponry_nether_star=100..}] run advancement grant @s only bacaphd:weaponry/weaponry_nether_star_2
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_nether_star_3=false},scores={bacaphd_l_weaponry_nether_star=500..}] run advancement grant @s only bacaphd:weaponry/weaponry_nether_star_3
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/weaponry_nether_star_4=false},scores={bacaphd_l_weaponry_nether_star=2000..}] run advancement grant @s only bacaphd:weaponry/weaponry_nether_star_4
