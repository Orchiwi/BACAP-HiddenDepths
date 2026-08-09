scoreboard players add #hb_fast bacaphd_sys 1
# --- Ominous Marathon (B13): this MUST be per-tick, not per-5-seconds. The credited
# --- position is read where the player stands when the ominous-key statistic moves;
# --- at a 100-tick sample an elytra player covers far more than the 256-block
# --- separation test in the gap, so five unlocks inside ONE chamber could each look
# --- like a new chamber. At one tick the sampled position IS the vault.
# --- Order matters: seed the mirror before it is ever read, credit on an increase,
# --- then resync for EVERY player. The resync is deliberately ungated so no
# --- advancement state can desynchronise it, and it runs after the credit so exactly
# --- one credit is taken per key spent.
execute as @a[gamemode=!spectator,tag=bacaphd.om_init,advancements={bacaphd:adventure/ominous_marathon=false}] at @s if score @s bacaphd_okey > @s bacaphd_okeyb run function bacaphd:detect/ominous_marathon
execute as @a run scoreboard players operation @s bacaphd_okeyb = @s bacaphd_okey
execute as @a[gamemode=!spectator] if score @s bacaphd_wither_kills matches 0.. if score @s bacaphd_wither_seen_pv matches 0.. unless score @s bacaphd_wither_kills = @s bacaphd_wither_seen_pv run function bacaphd:detect/pyrrhic_victory
execute as @a[gamemode=!spectator] if score @s bacaphd_pearls_used matches 0.. if score @s bacaphd_pearls_seen matches 0.. unless score @s bacaphd_pearls_used = @s bacaphd_pearls_seen run function bacaphd:detect/own_goal_arm
execute as @a[gamemode=!spectator,advancements={bacaphd:weaponry/own_goal={pearl_fall=true}}] unless entity @s[advancements={bacaphd:weaponry/own_goal=true}] run function bacaphd:detect/own_goal
execute as @a[gamemode=!spectator,scores={bacaphd_pearl_window=1..}] run scoreboard players remove @s bacaphd_pearl_window 1
execute as @a[advancements={bacaphd:end/pearl_chain=false},scores={bacaphd_init_b2=1}] if score @s bacaphd_pearls matches 0.. if score @s bacaphd_pearl_seen matches 0.. unless score @s bacaphd_pearls = @s bacaphd_pearl_seen run function bacaphd:detect/pearl_throw
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/pearl_chain=false},scores={bacaphd_pearl_chain=1..}] run function bacaphd:detect/pearl_ground
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slime_ladder=false},tag=!bacaphd.on_slime] at @s if block ~ ~-1 ~ minecraft:slime_block run function bacaphd:detect/slime_bounce
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slime_ladder=false},tag=bacaphd.on_slime] at @s unless block ~ ~-1 ~ minecraft:slime_block run function bacaphd:detect/slime_leave
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slime_ladder=false},tag=!bacaphd.on_slime,scores={bacaphd_slime_chain=1..}] run function bacaphd:detect/slime_air
execute as @a[advancements={bacaphd:redstone/cannonball={cannonball=true,impossible=false}}] run function bacaphd:detect/cannonball
# Dropping below half IN THE END latches -1, which the re-arm below refuses to lift.
# Clearing to 0 was forgotten the moment the player stepped out of the dimension, so
# dying to the dragon, respawning and walking back through the portal presented the
# same wounded dragon as a fresh clean run. The dragon keeps its health across a
# player's death, so that is one fight, not two.
execute as @a[advancements={bacaphd:challenges/untouchable=false},scores={bacaphd_health=..9}] at @s if dimension minecraft:the_end run scoreboard players set @s bacaphd_untouched -1
execute as @a[advancements={bacaphd:challenges/untouchable=false},scores={bacaphd_health=..9,bacaphd_untouched=0..}] at @s unless dimension minecraft:the_end run scoreboard players set @s bacaphd_untouched 0
# Statistic mirrors for this batch must start from each player's CURRENT lifetime
# totals, or the first sample reads a whole save's damage - or a whole save's
# Grindstone use - as a fresh event.
# --- expansion ---
# --- Breaking Bad (solo3): a thousand potions pulled off the stand ---
# Per tick on purpose. brewed_potion fires once per finished bottle taken out of the
# stand, so a 10-tick sample would quietly drop two of every three-bottle batch. The
# detector revokes the criterion before crediting, which is what re-arms the doorbell.
execute as @a[gamemode=!spectator,advancements={bacaphd:challenges/breaking_bad={brewed=true,impossible=false}}] run function bacaphd:detect/breaking_bad
# --- Pottery Barn (solo6): a Decorated Pot was just placed. The mirror is seeded in
# --- bacaphd:seed, and the test is a strict increase, so an unset score cannot fire it.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/pottery_barn=false},scores={bacaphd_s6ini=1}] at @s if score @s bacaphd_s6pot > @s bacaphd_s6potm run function bacaphd:detect/pottery_barn

# --- Perpetual Motion (solo6): standing on a Redstone Lamp, per tick so no flip of the
# --- clock can be missed by aliasing against a slower sample rate.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/perpetual_motion=false}] at @s if block ~ ~-1 ~ minecraft:redstone_lamp run function bacaphd:detect/perpetual_motion
# Stepping off the lamp ends the run immediately.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/perpetual_motion=false},scores={bacaphd_s6pm=1..}] at @s unless block ~ ~-1 ~ minecraft:redstone_lamp run scoreboard players set @s bacaphd_s6pm 0

# --- Mind the Gap (solo6): riding a minecart. Positioned at the cart, executed as the
# --- rider, so the rail test reads the block the cart is in.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/mind_the_gap=false}] on vehicle if entity @s[type=minecraft:minecart] at @s on passengers if entity @s[type=player] run function bacaphd:detect/mind_the_gap
# Spawner Camper. The damage test runs FIRST so the clean flag is already current
# when the probe below reads it on the same tick. bacaphd_sc_dmg is only ever
# compared while bacaphd_sc_ok is 1, and both are written together in detect/sc_arm
# and seeded in bacaphd:seed, so no lifetime damage total can be read as one hit.
execute as @a[gamemode=!spectator,scores={bacaphd_sc_ok=1}] if score @s bacaphd_dmg matches 0.. if score @s bacaphd_sc_dmg matches 0.. unless score @s bacaphd_dmg = @s bacaphd_sc_dmg run scoreboard players set @s bacaphd_sc_ok -1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:adventure/spawner_camper={in_chamber=true,impossible=false}}] at @s run function bacaphd:detect/spawner_camper
# Revoking in_chamber every pass is what makes it a LIVE gate instead of a sticky
# one: minecraft:location re-grants it within 20 ticks only while the player is
# still inside a Trial Chamber. impossible=false keeps this off anyone who has
# already earned the advancement.
advancement revoke @a[gamemode=!spectator,advancements={bacaphd:adventure/spawner_camper={in_chamber=true,impossible=false}}] only bacaphd:adventure/spawner_camper in_chamber
# --- Laundry Day (solo1): a hundred items washed clean in a Cauldron ---
# Counted from the advancement's own criterion, never from a lifetime statistic: the
# revoke re-arms `wash` on every tick, so only washes done after this pack was
# installed are ever counted. The `unless ... =true` guard stops the counter running
# on forever once the advancement is complete and every criterion reads true.
execute as @a[gamemode=!spectator,advancements={bacaphd:statistics/laundry_day={wash=true}}] unless entity @s[advancements={bacaphd:statistics/laundry_day=true}] run scoreboard players add @s bacaphd_laundry 1
execute as @a[gamemode=!spectator,advancements={bacaphd:statistics/laundry_day={wash=true}}] unless entity @s[advancements={bacaphd:statistics/laundry_day=true}] run advancement revoke @s only bacaphd:statistics/laundry_day wash
execute as @a[gamemode=!spectator,advancements={bacaphd:statistics/laundry_day=false},scores={bacaphd_laundry=100..}] run advancement grant @s only bacaphd:statistics/laundry_day
# --- Amphibian Assassin (S8): a Frog swallowing a small Slime spits out a slimeball ---
# Gated hard: only a non-spectator who lacks the advancement AND has a Frog within
# sixteen blocks scans at all, and the item scan is bounded by both distance= and
# limit=. Per-tick rather than per-half-second because the slimeball becomes
# pickupable ten ticks after it lands and would otherwise be gone before the sample.
execute as @a[gamemode=!spectator,advancements={bacaphd:animal/amphibian_assassin=false}] at @s if entity @e[type=minecraft:frog,distance=..16,limit=1] as @e[type=minecraft:item,distance=..16,limit=8,nbt={Item:{id:"minecraft:slime_ball"}}] at @s run function bacaphd:detect/amphibian_assassin

# --- Fungus Among Us (S8): place Warped Fungus with a Hoglin inside its flee radius ---
# Same mirror discipline as Ominous Marathon. The credit is taken on the tick the
# used-statistic moves, so the Hoglin test is made where the player stood when the
# fungus went down. tag=bacaphd.seed8 guarantees the mirror was seeded before it is
# ever compared. The resync afterwards is deliberately UNGATED and runs for every
# player so no advancement state can desynchronise it, and it runs after the credit so
# exactly one credit is taken per placement.
execute as @a[gamemode=!spectator,gamemode=!creative,tag=bacaphd.seed8,advancements={bacaphd:nether/fungus_among_us=false}] at @s if score @s bacaphd_wfung > @s bacaphd_wfungb if entity @e[type=minecraft:hoglin,distance=..8,limit=1] run advancement grant @s only bacaphd:nether/fungus_among_us
execute as @a run scoreboard players operation @s bacaphd_wfungb = @s bacaphd_wfung
# --- Evel Knievel: a Camel leap is over in about a second, so it cannot be sampled slower.
# --- The on vehicle / on passengers chain is the same one the Copper Stable line uses,
# --- so the detector only ever runs for a player actually mounted on a Camel.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/evel_knievel=false}] on vehicle if entity @s[type=minecraft:camel] on passengers if entity @s[type=minecraft:player,gamemode=!spectator,gamemode=!creative,advancements={bacaphd:animal/evel_knievel=false}] at @s run function bacaphd:detect/camel_dash
# --- Hunting Party: a Hoglin's DeathTime:1s window is one tick wide.
execute as @a[gamemode=!spectator,advancements={bacaphd:nether/hunting_party=false}] at @s if dimension minecraft:the_nether run function bacaphd:detect/hunting_party
# --- Pearl Portal: a pearl spent in the End opens a three second window. Order is
# --- load-bearing: arm on the increase FIRST, then resync the mirror for every
# --- player on a deliberately ungated line, so exactly one arming is taken per pearl.
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_init_b5=1},advancements={bacaphd:end/pearl_portal=false}] at @s if dimension minecraft:the_end if score @s bacaphd_pearls matches 0.. if score @s bacaphd_pp_seen matches 0.. unless score @s bacaphd_pearls = @s bacaphd_pp_seen run function bacaphd:detect/pearl_portal_arm
execute as @a run scoreboard players operation @s bacaphd_pp_seen = @s bacaphd_pearls
execute as @a[gamemode=!spectator,gamemode=!creative,scores={bacaphd_pp_win=1..},advancements={bacaphd:end/pearl_portal=false}] at @s run function bacaphd:detect/pearl_portal
# --- Chain Reaction: the player's own opening shot on a Target opens the window.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/chain_reaction={first_shot=true}}] run function bacaphd:detect/chain_reaction_arm
# --- The Scenic Route (solo7): disqualification probes. Four cheap selector tests,
# --- gated on players who do not hold it yet. They are per-tick because a boat hop or
# --- one elytra glide can be over and done with inside half a second.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/the_scenic_route=false},nbt={FallFlying:1b}] run scoreboard players set @s bacaphd_srdq 1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/the_scenic_route=false}] at @s unless dimension minecraft:overworld run scoreboard players set @s bacaphd_srdq 1
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:biomes/the_scenic_route=false}] on vehicle on passengers if entity @s[type=minecraft:player] run scoreboard players set @s bacaphd_srdq 1
execute as @a[gamemode=!survival,gamemode=!adventure,advancements={bacaphd:biomes/the_scenic_route=false}] run scoreboard players set @s bacaphd_srdq 1
# --- Gravity Always Wins (solo7): FallDistance has to be read every tick or the landing
# --- that ends the fall is missed and nothing is ever banked.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:statistics/gravity_always_wins=false}] run function bacaphd:detect/gravity_fall
# --- Barrel of Laughs (B12): a thousand Barrel opens, counted by the pack ---
# minecraft.custom:minecraft.open_barrel is not an attested scoreboard criterion and an
# unknown one stops the whole file loading, so the any_block_use criterion is re-armed
# instead and a fresh counter is kept. This MUST be per-tick, not per-5-seconds: at a
# ten-tick sample a player working through a storage room would have opens swallowed in
# the gap. Both the count and the re-arm stop the moment the advancement is held -
# otherwise the revoke would tear the finished advancement back down every tick.
execute as @a[gamemode=!spectator,advancements={bacaphd:statistics/barrel_of_laughs={opened=true}}] unless entity @s[advancements={bacaphd:statistics/barrel_of_laughs=true}] run scoreboard players add @s bacaphd_barrels 1
execute as @a[gamemode=!spectator,advancements={bacaphd:statistics/barrel_of_laughs={opened=true}}] unless entity @s[advancements={bacaphd:statistics/barrel_of_laughs=true}] run advancement revoke @s only bacaphd:statistics/barrel_of_laughs opened
execute as @a[gamemode=!spectator,advancements={bacaphd:statistics/barrel_of_laughs=false},scores={bacaphd_barrels=1000..}] run advancement grant @s only bacaphd:statistics/barrel_of_laughs
# --- Yeet (B13): arm on any hit the player lands, then measure how far the mob goes.
# Every arming line is gated on the smack criterion being freshly true, so once the
# hit is consumed they cost one failed selector test per tick and nothing else.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/yeet={smack=true,impossible=false}}] at @s run tag @e[type=!player,type=!item,type=!experience_orb,type=!arrow,distance=..6,limit=1,sort=nearest] add bacaphd.yeet
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/yeet={smack=true,impossible=false}}] at @s store result score @s bacaphd_yeet_x run data get entity @s Pos[0]
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/yeet={smack=true,impossible=false}}] at @s store result score @s bacaphd_yeet_z run data get entity @s Pos[2]
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/yeet={smack=true,impossible=false}}] run scoreboard players set @s bacaphd_yeet_t 200
# Revoke LAST, after the anchor and the tag are both recorded, so the criterion is
# re-armable for the next swing and one hit opens exactly one window.
execute as @a[advancements={bacaphd:weaponry/yeet={smack=true,impossible=false}}] run advancement revoke @s only bacaphd:weaponry/yeet smack
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:weaponry/yeet=false},scores={bacaphd_yeet_t=1..}] at @s run function bacaphd:detect/yeet
# Spore Loser - armed by the placed_block criterion, so this only runs on the tick
# after a Spore Blossom goes down, and the detector revokes on a short count to
# re-arm it rather than leaving the selector permanently true.
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:building/spore_loser={placed=true,impossible=false}}] at @s run function bacaphd:detect/spore_loser
# Greenhouse Gases - fires on the tick the wheat-mined mirror moves. Order matters:
# credit first, then resync for EVERY player, ungated, so no advancement state can
# desynchronise the mirror and exactly one break is taken per increment.
execute as @a[gamemode=!spectator,gamemode=!creative,tag=bacaphd.gg_init,advancements={bacaphd:farming/greenhouse_gases=false}] at @s if score @s bacaphd_gg_mined matches 0.. if score @s bacaphd_gg_seen matches 0.. unless score @s bacaphd_gg_mined = @s bacaphd_gg_seen run function bacaphd:detect/greenhouse_gases
execute as @a run scoreboard players operation @s bacaphd_gg_seen = @s bacaphd_gg_mined
# --- expansion ---
# --- Bombproof (solofill4): a creeper blast survived beside a rolled-up Armadillo ---
# Per tick, not per ten. The blast criterion has to be revoked promptly or a second creeper
# in the same second finds it already set and the armadillo check never re-runs.
# `at @s` is load-bearing: the detector's distance= is measured from the execution position.
# !spectator only - this needs no !creative, because a creeper blast does no damage in
# creative and so the criterion that gates this line can never fire there in the first place.
execute as @a[gamemode=!spectator,advancements={bacaphd:animal/bombproof={blast=true,impossible=false}}] at @s run function bacaphd:detect/bombproof
# --- Hatchling (animal/hatchling): four chicks out of one thrown Chicken Egg ---
# This is the batch's single detection function and it has to be per-tick: the test
# inside reads a chick's Age on the first tick of its life, and a coarser bucket
# would let the newborn window slide shut before the sample is taken.
execute as @a[gamemode=!spectator,advancements={bacaphd:animal/hatchling=false}] at @s run function bacaphd:detect/hatchling

# --- Backdraft (B13): the sleep attempt and the blast have to be the SAME event ---
# Both halves are cleared again on the very next tick whenever only one of them is
# set, so an old bed placement can never pair up with a later creeper, and a creeper
# blast can never sit and wait for a bed. Using a Bed in the Nether detonates it
# inside the same tick as the click, so the two criteria latch together and the
# advancement completes before either revoke is reached.
execute as @a[advancements={bacaphd:nether/backdraft={tried_to_sleep=true,blown_up=false}}] run advancement revoke @s only bacaphd:nether/backdraft tried_to_sleep
execute as @a[advancements={bacaphd:nether/backdraft={blown_up=true,tried_to_sleep=false}}] run advancement revoke @s only bacaphd:nether/backdraft blown_up

# --- Talk to the Hand (B13): the arrow only counts with a Breeze in the room ---
# The hurt criterion is a one-tick latch. Grant first, revoke second, both on the same
# pass: if a Breeze is within sixteen blocks on the tick the player's own arrow lands,
# the deflection is credited; otherwise the latch is torn down again and shooting an
# arrow straight up somewhere quiet gets nowhere.
execute as @a[gamemode=!spectator,advancements={bacaphd:weaponry/talk_to_the_hand={own_arrow=true,breeze_nearby=false}}] at @s if entity @e[type=minecraft:breeze,distance=..16,limit=1] run advancement grant @s only bacaphd:weaponry/talk_to_the_hand breeze_nearby
execute as @a[advancements={bacaphd:weaponry/talk_to_the_hand={own_arrow=true,breeze_nearby=false}}] run advancement revoke @s only bacaphd:weaponry/talk_to_the_hand own_arrow
