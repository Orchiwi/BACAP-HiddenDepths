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
execute as @r[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:challenges/flying_buttress=false}] at @s run function bacaphd:detect/flying_buttress
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
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:challenges/fort_knox=false}] at @s if block ~ ~-1 ~ minecraft:obsidian run function bacaphd:detect/fort_knox
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
execute as @a[gamemode=!spectator,advancements={bacaphd:challenges/bread_winner=false}] at @s if entity @e[type=minecraft:villager,distance=..48,limit=1] run function bacaphd:detect/bread_winner
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
