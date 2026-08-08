scoreboard players add #hb_medium bacaphd_sys 1
# --- Ghast Couture (B2): a Happy Ghast that has worn all sixteen Harness colours ---
# The proximity test here is only a cheap gate. detect/ghast_couture does nothing
# unless the player is actually RIDING the ghast, and only grants on the sample that
# records a colour the ghast had never worn, so a bystander cannot inherit the work.
execute as @a[gamemode=!spectator,advancements={bacaphd:nether/ghast_couture=false}] at @s if entity @e[type=minecraft:happy_ghast,distance=..12,limit=1] run function bacaphd:detect/ghast_couture

# --- Golem Courier (B6): five Copper Golems carrying items in the same sample ---
# Count the golems properly first; `if entity @e[limit=5]` would only test for one.
execute as @a[gamemode=!spectator,advancements={bacaphd:mining/golem_courier=false}] at @s store result score @s bacaphd_gol if entity @e[type=minecraft:copper_golem,distance=..16,limit=5]
execute as @a[gamemode=!spectator,advancements={bacaphd:mining/golem_courier=false},scores={bacaphd_gol=5}] at @s run function bacaphd:detect/golem_courier
execute store result score #today bacaphd_day run time query day
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/sniffer_sommelier=false}] at @s if entity @e[type=minecraft:sniffer,distance=..16,limit=1] run function bacaphd:detect/sniffer_watch
execute as @a[gamemode=!spectator,advancements={bacaphd:animal/bee_movie={stung=true}}] unless entity @s[advancements={bacaphd:animal/bee_movie=true}] run function bacaphd:detect/bee_movie
execute as @a[gamemode=!spectator,advancements={bacaphd:weaponry/boomerang_bones={shot_by_skeleton=true}}] unless entity @s[advancements={bacaphd:weaponry/boomerang_bones=true}] run function bacaphd:detect/boomerang_shot
execute as @a[gamemode=!spectator,advancements={bacaphd:weaponry/boomerang_bones={arrow_kill=true}}] unless entity @s[advancements={bacaphd:weaponry/boomerang_bones=true}] run function bacaphd:detect/boomerang_kill
execute as @a[gamemode=!spectator,scores={bacaphd_boomerang=1..}] run scoreboard players remove @s bacaphd_boomerang 1
execute as @a[gamemode=!spectator,advancements={bacaphd:monsters/death_by_committee={armed=true}}] run function bacaphd:detect/committee_arm
execute as @a[gamemode=!spectator,advancements={bacaphd:monsters/death_by_committee=false},scores={bacaphd_committee=1..}] run function bacaphd:detect/committee_tick
execute as @a[gamemode=!spectator,advancements={bacaphd:monsters/death_by_committee=false},scores={bacaphd_health=0,bacaphd_committee=0..}] run function bacaphd:detect/committee_reset
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/boat_drop=false}] run function bacaphd:detect/boat_gate
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/ice_road_trucker=false}] run function bacaphd:detect/ice_gate
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/vertical_limit=false}] at @s if dimension minecraft:overworld positioned ~ -64 ~ if entity @s[dx=0,dy=6,dz=0] run scoreboard players set @s bacaphd_vl_t 120
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/vertical_limit=false},scores={bacaphd_vl_t=1..}] run function bacaphd:detect/vl_top
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/free_solo=false}] at @s run function bacaphd:detect/free_solo
execute as @a[advancements={bacaphd:challenges/untouchable=false},scores={bacaphd_init_b2=1}] if score @s bacaphd_dragon_kills matches 0.. if score @s bacaphd_dragon_seen matches 0.. unless score @s bacaphd_dragon_kills = @s bacaphd_dragon_seen run function bacaphd:detect/untouchable
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:challenges/untouchable=false},scores={bacaphd_health=10..,bacaphd_untouched=0..1}] at @s unless dimension minecraft:the_end run scoreboard players set @s bacaphd_untouched 1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/featherweight=false}] at @s if entity @e[type=minecraft:wither,distance=..128,limit=1] run function bacaphd:detect/featherweight
execute as @a[advancements={bacaphd:adventure/featherweight=false},scores={bacaphd_fw_kit=1}] at @s unless entity @e[type=minecraft:wither,distance=..128,limit=1] run scoreboard players set @s bacaphd_fw_kit 0
# B45 Disenchanted - a Grindstone strip, anchored to the interact_with_grindstone statistic
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_b4=1},advancements={bacaphd:enchanting/disenchanted=false}] run function bacaphd:detect/disenchanted
# B46 Magma Marathon - lava distance while unburnt (Fire Resistance)
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_b4=1},advancements={bacaphd:nether/magma_marathon=false}] at @s run function bacaphd:detect/magma_marathon
# B47 Soul Speed Demon - distance only accumulates while the Soul Speed III
# criterion is currently held; the detect function revokes it again every time,
# so the game has to re-prove the boots before the next sample.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/soul_speed_demon={soul_speed=true,distance=false}}] at @s run function bacaphd:detect/soul_speed_demon
# B48 Portal Sniper - Overworld anchor, Nether depth, return distance
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/portal_sniper=false}] at @s run function bacaphd:detect/portal_sniper
# B49 Roof Runner - distance on top of the Nether ceiling
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/roof_runner=false}] at @s run function bacaphd:detect/roof_runner
# B50 Gateway Tourist - long teleports inside the End
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/gateway_tourist=false}] at @s run function bacaphd:detect/gateway_tourist
# B52 Dragon Rider - minute-long UNBROKEN clean stay next to the dragon
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_b4=1},advancements={bacaphd:end/dragon_rider=false}] at @s if dimension minecraft:the_end run function bacaphd:detect/dragon_rider
# B55 Piston Elevator - altitude gained while riding slime/honey/pistons
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/piston_elevator=false}] at @s run function bacaphd:detect/piston_elevator
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/parrot_choir={choir=false}}] at @s if entity @e[type=minecraft:parrot,distance=..8,limit=1] run function bacaphd:detect/parrot_choir
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/armadillo_roller=false}] at @s if entity @e[type=minecraft:armadillo,distance=..8,limit=1] run function bacaphd:detect/armadillo_roller
# --- expansion ---
# --- The Floor Is Lava (solo3): two hundred blocks crossed on foot over a lava sea ---
# gamemode=!creative as well as !spectator: this measures movement and block placement.
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_s3=1},advancements={bacaphd:nether/the_floor_is_lava=false}] at @s if dimension minecraft:the_nether run function bacaphd:detect/floor_is_lava
# Leaving the Nether ends the crossing. Re-arming the seed here stops the portal hop
# itself from being banked as distance when the player comes back.
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_s3=1},advancements={bacaphd:nether/the_floor_is_lava=false}] at @s unless dimension minecraft:the_nether run scoreboard players set @s bacaphd_fl_dist 0
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_s3=1},advancements={bacaphd:nether/the_floor_is_lava=false}] at @s unless dimension minecraft:the_nether run scoreboard players set @s bacaphd_fl_seed 1

# --- Bucket Brigade (solo3): an Axolotl led two hundred blocks by a bucket ---
# The bucket test lives here rather than in the detector, so the entity scan never runs
# for a player who is not on the job. The two reset lines are the other half of it: they
# cover the moment the bucket is put away, which the detector would then never see.
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_s3=1},advancements={bacaphd:animal/bucket_brigade=false}] at @s if items entity @s weapon.mainhand minecraft:tropical_fish_bucket run function bacaphd:detect/bucket_brigade
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_s3=1},advancements={bacaphd:animal/bucket_brigade=false}] unless items entity @s weapon.mainhand minecraft:tropical_fish_bucket run scoreboard players set @s bacaphd_bb_dist 0
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_s3=1},advancements={bacaphd:animal/bucket_brigade=false}] unless items entity @s weapon.mainhand minecraft:tropical_fish_bucket run scoreboard players set @s bacaphd_bb_seed 1
# --- Breakfast in Bed (solo4) - the sleep mirror is resynced for EVERY player, gated
# --- only on the seed having run, so no advancement state can desynchronise it.
execute as @a[scores={bacaphd_init_b5=1}] if score @s bacaphd_sleeps matches 0.. if score @s bacaphd_sleeps_seen matches 0.. unless score @s bacaphd_sleeps = @s bacaphd_sleeps_seen run function bacaphd:detect/bib_wake
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/breakfast_in_bed=false},scores={bacaphd_bib=1..}] at @s run function bacaphd:detect/breakfast_in_bed
execute as @a[scores={bacaphd_bib=1..}] run scoreboard players remove @s bacaphd_bib 1
# --- Chemical Dependency (solo4) - eight effects held unbroken for a full in-game day.
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_b5=1},advancements={bacaphd:potion/chemical_dependency=false}] run function bacaphd:detect/chemical_dependency
# --- ...and the timer cannot be banked in creative or spectator, where /effect is free.
execute as @a[gamemode=creative] run scoreboard players set @s bacaphd_chem 0
execute as @a[gamemode=spectator] run scoreboard players set @s bacaphd_chem 0
# --- Zoom and Enhance (B5): count Map extends. The `unless ... =true` guard is not
# --- optional - the detector revokes the `extend` criterion, and running it on a
# --- player who already holds the advancement would un-complete it.
execute as @a[gamemode=!spectator,advancements={bacaphd:adventure/zoom_and_enhance={extend=true}}] unless entity @s[advancements={bacaphd:adventure/zoom_and_enhance=true}] run function bacaphd:detect/zoom_and_enhance

# --- Estate Sale (B5): the kill and the leash are proved by the two vanilla criteria;
# --- this settles the causal link between them - that the llama actually came away with
# --- you and that its Wandering Trader is gone. The selector is the whole cost control:
# --- it only reaches a player who already holds BOTH criteria and still lacks the guard,
# --- so the entity scans never run for anyone else.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/estate_sale={trader=true,llama=true,estate=false}}] at @s run function bacaphd:detect/estate_sale

# --- The Big Picture (B5): a painting was just hung; check what went up.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/the_big_picture={hung=true}}] unless entity @s[advancements={bacaphd:building/the_big_picture=true}] at @s run function bacaphd:detect/the_big_picture

# --- Dig Site (B5): the Sniffer lookup is type-filtered with no NBT, cheap enough
# --- for every medium tick and rare enough that the item scans almost never run.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:farming/dig_site=false}] at @s if entity @e[type=minecraft:sniffer,distance=..16,limit=1] run function bacaphd:detect/dig_site
# Layer Cake - three lines of NBT, no block scan; the `if data` guard inside the
# function is what keeps `data get` from erroring on every player without a banner.
execute as @a[gamemode=!spectator,advancements={bacaphd:building/layer_cake=false}] run function bacaphd:detect/layer_cake
# --- Landscape Gardener + Reverse Logistics (solo1): mobs changing what they carry ---
# Two calls, not one, and the second excludes anyone the first already covered, so a
# player missing both is swept exactly once.
# Rotate the Enderman arming tag: what was armed last sweep becomes lg_prev, and this
# sweep re-arms lg_carry from scratch. Anything that wandered off keeps neither.
tag @e[type=minecraft:enderman,tag=bacaphd.lg_carry] add bacaphd.lg_prev
tag @e[type=minecraft:enderman,tag=bacaphd.lg_carry] remove bacaphd.lg_carry
execute as @a[gamemode=!spectator,advancements={bacaphd:monsters/landscape_gardener=false}] at @s run function bacaphd:detect/mob_carry_watch
execute as @a[gamemode=!spectator,advancements={bacaphd:monsters/landscape_gardener=true,bacaphd:mining/reverse_logistics=false}] at @s run function bacaphd:detect/mob_carry_watch
# Tags are cleared only AFTER every player's sweep, so one player's pass can never
# wipe the flip before another player's pass has read it. tag= bounds both selectors.
tag @e[type=minecraft:enderman,tag=bacaphd.lg_placed] remove bacaphd.lg_carry
tag @e[type=minecraft:enderman,tag=bacaphd.lg_placed] remove bacaphd.lg_placed
# lg_prev is scoped to this sweep and must not survive into the next one.
tag @e[type=minecraft:enderman,tag=bacaphd.lg_prev] remove bacaphd.lg_prev
tag @e[type=minecraft:copper_golem,tag=bacaphd.rl_took] remove bacaphd.rl_empty
tag @e[type=minecraft:copper_golem,tag=bacaphd.rl_took] remove bacaphd.rl_took
# --- Sea to Shining Sea (S8): 5000 blocks under sail with the hull never over land ---
# A delta on the vanilla boat_one_cm statistic against a baseline that is re-armed on
# every sample where the player is NOT sitting in a boat with water directly beneath it.
# The qualifying line hops `on vehicle` to check the boat and the block under it, then
# hops back `on passengers` to clear the reset tag - the same round trip Copper Stable
# already uses. gamemode=!creative is on every line because this measures movement.
tag @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/sea_to_shining_sea=false}] add bacaphd.sea_off
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/sea_to_shining_sea=false}] on vehicle if entity @s[type=#blazeandcave:all_boats] at @s if block ~ ~-1 ~ minecraft:water on passengers if entity @s[type=player] run tag @s remove bacaphd.sea_off
execute as @a[tag=bacaphd.sea_off] run scoreboard players operation @s bacaphd_boatb = @s bacaphd_boat
tag @a[tag=bacaphd.sea_off] remove bacaphd.sea_off
execute as @a[gamemode=!spectator,gamemode=!creative,tag=bacaphd.seed8,advancements={bacaphd:biomes/sea_to_shining_sea=false}] run scoreboard players operation @s bacaphd_boatd = @s bacaphd_boat
execute as @a[gamemode=!spectator,gamemode=!creative,tag=bacaphd.seed8,advancements={bacaphd:biomes/sea_to_shining_sea=false}] run scoreboard players operation @s bacaphd_boatd -= @s bacaphd_boatb
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/sea_to_shining_sea=false},scores={bacaphd_boatd=500000..}] run advancement grant @s only bacaphd:biomes/sea_to_shining_sea

# --- Infestation (S8): six Silverfish inside eight blocks at the same instant ---
# Counted into a scoreboard. `if entity @e[...,limit=6]` would only ever test for at
# least one match, which is the bug this pattern exists to avoid. The store overwrites
# the score every sample before it is read, so this needs no seeding.
# gamemode=!creative on BOTH lines, matching every other grant in this region: without it
# a creative player could spawn-egg six Silverfish and take the advancement on the spot.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/infestation=false}] at @s store result score @s bacaphd_sfish if entity @e[type=minecraft:silverfish,distance=..8,limit=6]
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:mining/infestation=false},scores={bacaphd_sfish=6..}] run advancement grant @s only bacaphd:mining/infestation

# --- Assistant of the Year (S8): a thousand Allay hand-offs ---
# Cheap proximity gate only; the function does nothing unless an Allay's main hand
# actually goes from full to empty, which is the delivery itself.
execute as @a[gamemode=!spectator,advancements={bacaphd:statistics/assistant_of_the_year=false}] at @s if entity @e[type=minecraft:allay,distance=..12,limit=1] run function bacaphd:detect/assistant_of_the_year
# --- Say It With Flowers (solo9): the golem's poppy is a real main-hand item for the whole 400-tick offer ---
execute as @a[gamemode=!spectator,advancements={bacaphd:adventure/say_it_with_flowers=false}] at @s as @e[type=minecraft:iron_golem,distance=..20,nbt={HandItems:[{id:"minecraft:poppy"}]}] at @s if entity @e[type=minecraft:villager,distance=..5,predicate=blazeandcave:is_baby,limit=1] run advancement grant @a[gamemode=!spectator,distance=..20,advancements={bacaphd:adventure/say_it_with_flowers=false}] only bacaphd:adventure/say_it_with_flowers
# --- Duvet Day (solo9): a bed is 0.5625 high, so a cat lying on one floors into the bed block itself. ---
# --- Sitting is deliberately NOT tested: lying-on-a-bed is the unsaved DATA_IS_LYING flag, not Sitting NBT. ---
execute as @a[gamemode=!spectator,advancements={bacaphd:animal/duvet_day=false}] at @s as @e[type=minecraft:cat,distance=..12] at @s if data entity @s Owner if block ~ ~ ~ #minecraft:beds run advancement grant @a[gamemode=!spectator,distance=..12,advancements={bacaphd:animal/duvet_day=false}] only bacaphd:animal/duvet_day
# --- Bless You (solo9): the sneeze drop landing beside the cub ---
# Bless You is detected further down this bucket, on the PICKUP, via bacaphd_sneeze.
# The line that stood here granted to every player within 12 blocks the moment a
# slime ball existed near a baby panda, so bystanders were paid and nobody had to
# pick anything up. Superseded, not merely disabled.
# --- Parrot-phrase (solo9): 20 blocks is vanilla's own imitation radius ---
execute as @a[gamemode=!spectator,advancements={bacaphd:animal/parrot_phrase=false}] at @s as @e[type=minecraft:parrot,distance=..8] at @s if data entity @s Owner if entity @e[type=#blazeandcave:hostile_monsters,distance=..20,limit=1] run advancement grant @a[gamemode=!spectator,distance=..8,advancements={bacaphd:animal/parrot_phrase=false}] only bacaphd:animal/parrot_phrase
# --- Door to Door (solo9): CanBreakDoors is the Hard-difficulty gate; there is no `execute if difficulty` ---
execute as @a[gamemode=!spectator,advancements={bacaphd:monsters/door_to_door=false}] at @s if entity @e[type=minecraft:zombie,distance=..24,nbt={CanBreakDoors:1b},limit=1] run function bacaphd:detect/door_to_door
# --- Ship of Theseus (solo9): dimension gated by predicate, never `execute in the_end`, which would move the context ---
execute as @a[gamemode=!spectator,predicate=blazeandcave:in_the_end,advancements={bacaphd:end/ship_of_theseus=false}] at @s if entity @e[type=minecraft:item_frame,distance=..12,limit=1] run function bacaphd:detect/ship_of_theseus
# --- Pod Cast: 120 samples at one every 10 ticks is exactly sixty seconds.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/pod_cast=false}] at @s run function bacaphd:detect/pod_cast
# --- Sniffed Out: a Warden within 24 blocks whose current attack target is not a
# --- player. `on target` yields no executor at all when the Warden has no target,
# --- so the guard is exact. `on` moves the executor but never the position, so the
# --- grant selector still resolves at the player's own coordinates - @p[distance=..1]
# --- is that player and cannot be a bystander.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:monsters/sniffed_out=false}] at @s as @e[type=minecraft:warden,distance=..24] on target unless entity @s[type=minecraft:player] run advancement grant @p[distance=..1,gamemode=!spectator] only bacaphd:monsters/sniffed_out
# --- Meals on Wheels: a villager-shareable food lying next to a Villager and well
# --- clear of the player. The villager gate runs first so the item scan costs
# --- nothing away from a village; the 4-block stand-off is what separates a thrown
# --- gift from something the player simply dropped at their own feet.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/meals_on_wheels=false}] at @s if entity @e[type=minecraft:villager,distance=..16,limit=1] as @e[type=minecraft:item,distance=4..16,nbt={Item:{id:"minecraft:bread"}}] at @s if entity @e[type=minecraft:villager,distance=..2,limit=1] run advancement grant @p[distance=..16,gamemode=!spectator] only bacaphd:adventure/meals_on_wheels
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/meals_on_wheels=false}] at @s if entity @e[type=minecraft:villager,distance=..16,limit=1] as @e[type=minecraft:item,distance=4..16,nbt={Item:{id:"minecraft:carrot"}}] at @s if entity @e[type=minecraft:villager,distance=..2,limit=1] run advancement grant @p[distance=..16,gamemode=!spectator] only bacaphd:adventure/meals_on_wheels
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/meals_on_wheels=false}] at @s if entity @e[type=minecraft:villager,distance=..16,limit=1] as @e[type=minecraft:item,distance=4..16,nbt={Item:{id:"minecraft:potato"}}] at @s if entity @e[type=minecraft:villager,distance=..2,limit=1] run advancement grant @p[distance=..16,gamemode=!spectator] only bacaphd:adventure/meals_on_wheels
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/meals_on_wheels=false}] at @s if entity @e[type=minecraft:villager,distance=..16,limit=1] as @e[type=minecraft:item,distance=4..16,nbt={Item:{id:"minecraft:beetroot"}}] at @s if entity @e[type=minecraft:villager,distance=..2,limit=1] run advancement grant @p[distance=..16,gamemode=!spectator] only bacaphd:adventure/meals_on_wheels
# --- Bless You: a Slime Ball on the ground at a Panda's feet is a sneeze - nothing
# --- else drops one there. The pickup itself is the advancement's real criterion.
execute as @a[gamemode=!spectator,advancements={bacaphd:animal/bless_you=false}] at @s if entity @e[type=minecraft:panda,distance=..16,limit=1] as @e[type=minecraft:item,distance=..16,nbt={Item:{id:"minecraft:slime_ball"}}] at @s if entity @e[type=minecraft:panda,distance=..2,limit=1] run scoreboard players set @p[distance=..16,gamemode=!spectator] bacaphd_sneeze 1
execute as @a[gamemode=!spectator,scores={bacaphd_sneeze=1},advancements={bacaphd:animal/bless_you={picked_up=true}}] run advancement grant @s only bacaphd:animal/bless_you
# --- Chain Reaction: three powered Targets and three Dispensers inside the window.
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_cr_win=1..},advancements={bacaphd:redstone/chain_reaction=false}] at @s run function bacaphd:detect/chain_reaction
# --- Shake It Off (solo7): half a second is ample, a wolf's shake lasts well over that.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/shake_it_off=false}] at @s run function bacaphd:detect/shake_it_off
# --- Round Trip (solo7): the same ten-tick position sampling Gateway Tourist uses. It is
# --- deliberately not gated on being in the End - the out-of-End samples are what clear
# --- bacaphd_rt_in, and without them entering the End would read as a gateway jump.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/round_trip=false}] at @s run function bacaphd:detect/round_trip
# --- Terraforming Service (B9): three block-carrying Endermen in melee range at once ---
# One Enderman in range is only a cheap gate; detect/terraforming_service does the real
# counting, because `if entity @e[limit=3]` would test for at least one, not for three.
execute as @a[gamemode=!spectator,advancements={bacaphd:monsters/terraforming_service=false}] at @s if entity @e[type=minecraft:enderman,distance=..8,limit=1] run function bacaphd:detect/terraforming_service
# --- Sky Ferry (B10): a Happy Ghast in flight with four leashed mobs under it ---
# `on vehicle` then `on passengers` is the Copper Stable shape: it only reaches players
# who are actually sitting on a Happy Ghast, and hands the check to a player on that ghast.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/sky_ferry=false}] on vehicle if entity @s[type=minecraft:happy_ghast] on passengers if entity @s[type=minecraft:player] run function bacaphd:detect/sky_ferry
# --- Bless You (B5): a slimeball collected beside a Panda cub ---
# Only runs for players whose slime-ball criterion is currently armed and who do not yet
# hold the advancement; the detector reads the cub's Age and re-arms the criterion.
execute as @a[gamemode=!spectator,advancements={bacaphd:animal/bless_you={slime=true}}] unless entity @s[advancements={bacaphd:animal/bless_you=true}] at @s run function bacaphd:detect/bless_you
# --- Not My Problem (B13): an Iron Golem's own target dies while your hands stay clean.
# The cooldown is set from a private mirror of damage_dealt and read on the same
# cadence, so any damage at all in the last ten samples (five seconds) blocks the grant.
# The resync is deliberately ungated so no advancement state can desynchronise it, and
# it runs AFTER the delta test so exactly one cooldown is taken per burst of damage.
execute as @a[gamemode=!spectator,advancements={bacaphd:adventure/not_my_problem=false}] if score @s bacaphd_dmgd matches 0.. if score @s bacaphd_nmp_dmgb matches 0.. unless score @s bacaphd_dmgd = @s bacaphd_nmp_dmgb run scoreboard players set @s bacaphd_nmp_cd 10
execute as @a run scoreboard players operation @s bacaphd_nmp_dmgb = @s bacaphd_dmgd
execute as @a[gamemode=!spectator,scores={bacaphd_nmp_cd=1..}] run scoreboard players remove @s bacaphd_nmp_cd 1
# `on target` hops from each nearby golem to whatever it is currently fighting. The
# type=!player guard stops an angry golem tagging the player and leaving a dead player
# looking like a dead monster later on.
execute as @a[gamemode=!spectator,advancements={bacaphd:adventure/not_my_problem=false}] at @s as @e[type=minecraft:iron_golem,distance=..24,limit=4] on target if entity @s[type=!player] run tag @s add bacaphd.nmp_mark
execute as @a[gamemode=!spectator,advancements={bacaphd:adventure/not_my_problem=false},scores={bacaphd_nmp_cd=0}] at @s if entity @e[tag=bacaphd.nmp_mark,type=!player,distance=..24,limit=1,nbt={Health:0.0f}] if entity @e[type=minecraft:iron_golem,distance=..24,limit=1] run advancement grant @s only bacaphd:adventure/not_my_problem

# --- Thermal Shock (B13): desert and frozen biome inside a ten-second window.
# Both halves are genuine minecraft:location criteria; these lines only EXPIRE a half
# that has been held on its own for 20 medium ticks = 200 game ticks. Vanilla re-fires
# the location trigger every 20 ticks, so a revoked half returns within a second while
# you are still standing in the biome. Every line is gated on the other half being
# false, so nothing is ever revoked from a completed advancement.
execute as @a[gamemode=!spectator,advancements={bacaphd:biomes/thermal_shock={hot=false}}] run scoreboard players set @s bacaphd_ts_h 0
execute as @a[gamemode=!spectator,advancements={bacaphd:biomes/thermal_shock={hot=true,cold=false}}] run scoreboard players add @s bacaphd_ts_h 1
execute as @a[gamemode=!spectator,advancements={bacaphd:biomes/thermal_shock={hot=true,cold=false}},scores={bacaphd_ts_h=20..}] run advancement revoke @s only bacaphd:biomes/thermal_shock hot
execute as @a[gamemode=!spectator,advancements={bacaphd:biomes/thermal_shock={cold=false}}] run scoreboard players set @s bacaphd_ts_c 0
execute as @a[gamemode=!spectator,advancements={bacaphd:biomes/thermal_shock={cold=true,hot=false}}] run scoreboard players add @s bacaphd_ts_c 1
execute as @a[gamemode=!spectator,advancements={bacaphd:biomes/thermal_shock={cold=true,hot=false}},scores={bacaphd_ts_c=20..}] run advancement revoke @s only bacaphd:biomes/thermal_shock cold

# --- Golem Grand Tour (B13): a living Copper Golem beside you in all three dimensions.
# Statues are blocks, not entities, so an oxidised-out golem stops counting.
execute as @a[gamemode=!spectator,advancements={bacaphd:end/golem_grand_tour={overworld=false}}] at @s if dimension minecraft:overworld if entity @e[type=minecraft:copper_golem,distance=..8,limit=1] run advancement grant @s only bacaphd:end/golem_grand_tour overworld
execute as @a[gamemode=!spectator,advancements={bacaphd:end/golem_grand_tour={nether=false}}] at @s if dimension minecraft:the_nether if entity @e[type=minecraft:copper_golem,distance=..8,limit=1] run advancement grant @s only bacaphd:end/golem_grand_tour nether
execute as @a[gamemode=!spectator,advancements={bacaphd:end/golem_grand_tour={the_end=false}}] at @s if dimension minecraft:the_end if entity @e[type=minecraft:copper_golem,distance=..8,limit=1] run advancement grant @s only bacaphd:end/golem_grand_tour the_end

# --- Boxed In (B13): six trapdoor faces around one block, checked from on top of it.
# Two lines because a closed trapdoor is either half=bottom (the player's feet land
# inside the trapdoor's own block) or half=top (feet land one block above it).
# The enclosed centre is tested as well: six trapdoors around an air pocket is a box
# with nothing sealed inside it, which is not what the advancement asks for.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/boxed_in=false}] at @s if block ~ ~-1 ~ #minecraft:trapdoors if block ~ ~-3 ~ #minecraft:trapdoors if block ~1 ~-2 ~ #minecraft:trapdoors if block ~-1 ~-2 ~ #minecraft:trapdoors if block ~ ~-2 ~1 #minecraft:trapdoors if block ~ ~-2 ~-1 #minecraft:trapdoors unless block ~ ~-2 ~ minecraft:air unless block ~ ~-2 ~ minecraft:cave_air run advancement grant @s only bacaphd:building/boxed_in
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/boxed_in=false}] at @s if block ~ ~ ~ #minecraft:trapdoors if block ~ ~-2 ~ #minecraft:trapdoors if block ~1 ~-1 ~ #minecraft:trapdoors if block ~-1 ~-1 ~ #minecraft:trapdoors if block ~ ~-1 ~1 #minecraft:trapdoors if block ~ ~-1 ~-1 #minecraft:trapdoors unless block ~ ~-1 ~ minecraft:air unless block ~ ~-1 ~ minecraft:cave_air run advancement grant @s only bacaphd:building/boxed_in

# --- Stable Genius (B13): a Hoglin walked up onto the Nether roof.
# The altitude score is parked at -1 first and only overwritten while the hoglin is
# actually beside the player in the Nether, so a stale reading can never grant.
# The hoglin is picked out of a BOX, not a sphere: the box floor sits one block under
# the player's feet, so a hoglin still standing on the Nether floor twelve blocks
# below the bedrock ceiling no longer counts. With the player's own y forced to 128
# the hoglin can only be at 127 or higher, and 123-127 is solid bedrock - so the only
# place it can actually be standing is the roof itself.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/stable_genius=false}] run scoreboard players set @s bacaphd_sg_y -1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/stable_genius=false}] at @s if dimension minecraft:the_nether positioned ~-8 ~-1 ~-8 if entity @e[type=minecraft:hoglin,dx=16,dy=10,dz=16,limit=1] store result score @s bacaphd_sg_y run data get entity @s Pos[1]
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:nether/stable_genius=false},scores={bacaphd_sg_y=128..}] run advancement grant @s only bacaphd:nether/stable_genius

# --- Bottom Feeder (B13): sea-floor distance, same cadence as the other travel meters.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/bottom_feeder=false}] at @s run function bacaphd:detect/bottom_feeder
# Ghast Nursery - entity count only, no block scan. The Snowball test is both the
# thing the description promises and what keeps this off most players entirely.
execute as @a[gamemode=!spectator,advancements={bacaphd:nether/ghast_nursery=false}] at @s if items entity @s weapon.mainhand minecraft:snowball run function bacaphd:detect/ghast_nursery
# --- expansion ---
# --- Golem on Rails (solofill1): a Copper Golem riding a Minecart that sits on a rail ---
# Cheap proximity gate only; the function does the passenger and rail tests.
execute as @a[gamemode=!spectator,advancements={bacaphd:redstone/golem_on_rails=false}] at @s if entity @e[type=minecraft:minecart,distance=..16,limit=1] run function bacaphd:detect/golem_on_rails

# --- Growing Pains (B2): a Ghastling you fed, followed until it grows up ---
# Only runs for a player whose snowball latch is already set and who has not yet been
# credited with the growth, so it costs one failed selector test per five seconds for
# everybody else. The detector marks the Ghastlings standing beside that player and
# grants only when a mob still carrying that mark has turned adult, which is the one
# thing an already-grown wild Happy Ghast can never do.
execute as @a[gamemode=!spectator,advancements={bacaphd:nether/growing_pains={fed=true,grown=false}}] at @s run function bacaphd:detect/growing_pains
