# Every per-player mirror and flag is seeded HERE, before any detector runs.
# These calls used to sit inside the dispatch buckets, which meant a detector
# could run first: on a player whose mirror was still unset,
# `unless score @s <stat> = @s <mirror>` is true, so the detector fired and read
# a whole lifetime statistic as one fresh event. Each line is self-gating, so
# this costs one failed score check per player per tick once seeded.
execute as @a[tag=!bacaphd.om_init] run function bacaphd:detect/ominous_init
execute as @a[gamemode=!spectator] unless score @s bacaphd_init matches 1 run function bacaphd:detect/init
execute as @a unless score @s bacaphd_init_b2 matches 1 run function bacaphd:detect/init_b2
execute as @a unless score @s bacaphd_init_b4 matches 1 run function bacaphd:detect/init_b4
# --- expansion seeding ---
# Solo batch 3: every mirror and flag this batch owns is seeded here, before any bucket
# runs. Each bucket line for the batch is additionally gated on bacaphd_init_s3=1, so no
# delta in it can ever be evaluated against an unset score.
execute as @a unless score @s bacaphd_init_s3 matches 1 run function bacaphd:detect/init_s3
execute as @a unless score @s bacaphd_init_b5 matches 1 run function bacaphd:detect/init_b5
# --- solo6 seeding. The Decorated Pot mirror MUST equal the live statistic before the
# --- fast bucket can compare them, or a player who has placed pots before this pack was
# --- installed reads their lifetime total as one fresh placement. `add 0` first, because
# --- a criterion objective has no score at all until the statistic first moves.
execute as @a unless score @s bacaphd_s6ini matches 1 run scoreboard players add @s bacaphd_s6pot 0
execute as @a unless score @s bacaphd_s6ini matches 1 run scoreboard players operation @s bacaphd_s6potm = @s bacaphd_s6pot
execute as @a unless score @s bacaphd_s6ini matches 1 run scoreboard players set @s bacaphd_s6potn 0
execute as @a unless score @s bacaphd_s6ini matches 1 run scoreboard players set @s bacaphd_s6pm 0
execute as @a unless score @s bacaphd_s6ini matches 1 run scoreboard players set @s bacaphd_s6pmg 0
# -1 can never equal a lit state of 0 or 1, so the first sample always reads as a flip.
execute as @a unless score @s bacaphd_s6ini matches 1 run scoreboard players set @s bacaphd_s6pml -1
execute as @a unless score @s bacaphd_s6ini matches 1 run scoreboard players set @s bacaphd_s6mf 0
execute as @a unless score @s bacaphd_s6ini matches 1 run scoreboard players set @s bacaphd_s6ini 1
# --- Batch 5 mirrors and flags. Seeded HERE, before any batch-5 detector runs. A
# --- mirror that is still unset makes `unless score @s <stat> = @s <mirror>` true on
# --- the first sample, which reads a whole save's statistic as one fresh event.
# --- The init flag is set LAST, so a half-seeded player is never treated as seeded.
execute as @a unless score @s bacaphd_init_b5 matches 1 run scoreboard players operation @s bacaphd_rockb = @s bacaphd_rock
execute as @a unless score @s bacaphd_init_b5 matches 1 run scoreboard players operation @s bacaphd_wa_hb = @s bacaphd_wa_heart
execute as @a unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_glide 0
execute as @a unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_gl_prev 0
execute as @a unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_ze 0
execute as @a unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_wa 0
execute as @a unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_ds_moss 0
execute as @a unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_ds_mud 0
execute as @a unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_ds_root 0
execute as @a unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_init_b5 1
# Spawner Camper's clean flag and damage mirror, seeded once per player before any
# detector can read them. Both lines are self-gating on the score not existing yet,
# so they cost one failed check per player per tick afterwards.
execute as @a unless score @s bacaphd_sc_ok matches ..2147483647 run scoreboard players set @s bacaphd_sc_ok 0
execute as @a unless score @s bacaphd_sc_dmg matches ..2147483647 run scoreboard players operation @s bacaphd_sc_dmg = @s bacaphd_dmg
# solo1: the only statistic mirror this batch owns is the Shulker kill total used by
# Shulker Removal Service. It is seeded here, before any detector can read it, so the
# very first sample cannot see a whole save's Shulker kills as a fresh kill. The
# `add 0` materialises the statistic objective first; the detector is gated on
# bacaphd_solo1_init so it cannot run before this has happened.
execute as @a unless score @s bacaphd_solo1_init matches 1 run scoreboard players add @s bacaphd_shulk_kills 0
execute as @a unless score @s bacaphd_solo1_init matches 1 run scoreboard players operation @s bacaphd_shulk_last = @s bacaphd_shulk_kills
execute as @a unless score @s bacaphd_solo1_init matches 1 run scoreboard players set @s bacaphd_solo1_init 1
# Batch solo8. Every mirror this batch introduces is seeded HERE, before any bucket can
# read it. A detector that runs before its mirror is seeded compares a live lifetime
# statistic against an unset score and reads the whole statistic as one fresh event.
# The bacaphd.seed8 tag makes each line cost one failed tag test per player per tick
# once seeded. The `add ... 0` calls are the same idiom detect/init already uses to
# force a statistic-backed score entry to exist before it is copied.
execute as @a[tag=!bacaphd.seed8] run scoreboard players add @s bacaphd_boat 0
execute as @a[tag=!bacaphd.seed8] run scoreboard players operation @s bacaphd_boatb = @s bacaphd_boat
execute as @a[tag=!bacaphd.seed8] run scoreboard players set @s bacaphd_boatd 0
execute as @a[tag=!bacaphd.seed8] run scoreboard players add @s bacaphd_wfung 0
execute as @a[tag=!bacaphd.seed8] run scoreboard players operation @s bacaphd_wfungb = @s bacaphd_wfung
execute as @a[tag=!bacaphd.seed8] run scoreboard players set @s bacaphd_sfish 0
execute as @a[tag=!bacaphd.seed8] run scoreboard players set @s bacaphd_allay 0
# bacaphd_ckcraft is deliberately NOT seeded: it is only ever read with
# `unless score @s bacaphd_ckcraft matches 1..`, which treats a missing entry as
# "nothing crafted yet" and fails safe in the player's favour.
tag @a[tag=!bacaphd.seed8] add bacaphd.seed8
scoreboard players add @a bacaphd_bw 0
scoreboard players add @a bacaphd_ship 0
# Evel Knievel take-off latches and Pod Cast streak, seeded here before any detector
# reads them. None of these is a statistic mirror, so an unset read could not have read
# a lifetime stat as a fresh event, but they are seeded anyway so the airborne branch
# can never operate on an unset take-off point. Each line is self-gating.
execute as @a unless score @s bacaphd_ek_x matches -2147483648.. run scoreboard players set @s bacaphd_ek_x 0
execute as @a unless score @s bacaphd_ek_y matches -2147483648.. run scoreboard players set @s bacaphd_ek_y 0
execute as @a unless score @s bacaphd_ek_z matches -2147483648.. run scoreboard players set @s bacaphd_ek_z 0
execute as @a unless score @s bacaphd_ek_best matches -2147483648.. run scoreboard players set @s bacaphd_ek_best 0
execute as @a unless score @s bacaphd_pct matches -2147483648.. run scoreboard players set @s bacaphd_pct 0
# Batch 5 mirrors and flags. Seeded HERE, before any detector runs: the Pearl Portal
# mirror starts equal to the live ender_pearl statistic, so a save's whole lifetime
# of pearl throws can never read as one fresh throw on the first sample.
execute as @a[gamemode=!spectator] unless score @s bacaphd_init_b5 matches 1 run scoreboard players add @s bacaphd_pearls 0
execute as @a[gamemode=!spectator] unless score @s bacaphd_init_b5 matches 1 run scoreboard players operation @s bacaphd_pp_seen = @s bacaphd_pearls
execute as @a[gamemode=!spectator] unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_pp_win 0
execute as @a[gamemode=!spectator] unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_pp_far 0
execute as @a[gamemode=!spectator] unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_cr_win 0
execute as @a[gamemode=!spectator] unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_sneeze 0
execute as @a[gamemode=!spectator] unless score @s bacaphd_init_b5 matches 1 run scoreboard players add @s bacaphd_astand 0
execute as @a[gamemode=!spectator] unless score @s bacaphd_init_b5 matches 1 run scoreboard players set @s bacaphd_init_b5 1
# Batch solo7 mirrors and flags, seeded before any solo7 detector can read them.
# bacaphd_srdq starts DISQUALIFIED on purpose: a player already ten thousand blocks from
# the origin when the pack lands must walk home once before a run counts.
execute as @a unless score @s bacaphd_s7_init matches 1 run scoreboard players set @s bacaphd_srdq 1
execute as @a unless score @s bacaphd_s7_init matches 1 run scoreboard players set @s bacaphd_fall_tot 0
execute as @a unless score @s bacaphd_s7_init matches 1 run scoreboard players set @s bacaphd_fall_prev 0
execute as @a unless score @s bacaphd_s7_init matches 1 run scoreboard players set @s bacaphd_rt_st 0
execute as @a unless score @s bacaphd_s7_init matches 1 run scoreboard players set @s bacaphd_rt_in 0
execute as @a unless score @s bacaphd_s7_init matches 1 run scoreboard players set @s bacaphd_ud_n 0
execute as @a unless score @s bacaphd_s7_init matches 1 run scoreboard players set @s bacaphd_s7_init 1
execute as @a[gamemode=!spectator] unless score @s bacaphd_barrels matches -2147483648.. run scoreboard players set @s bacaphd_barrels 0
# Not My Problem: seed the private damage_dealt mirror ONCE, before any bucket reads
# it. Without this the first sample sees an unset mirror, treats a whole save's
# damage as a fresh hit and parks the player on a five-second cooldown for nothing.
# bacaphd_nmp_cd also has to start SET, because scores={bacaphd_nmp_cd=0} does not
# match an unset score and the grant line would otherwise never be reachable.
execute as @a[tag=!bacaphd.nmp_seed] run scoreboard players operation @s bacaphd_nmp_dmgb = @s bacaphd_dmgd
execute as @a[tag=!bacaphd.nmp_seed] run scoreboard players set @s bacaphd_nmp_cd 10
execute as @a[tag=!bacaphd.nmp_seed] run tag @s add bacaphd.nmp_seed
# Greenhouse Gases: mirror the wheat-mined statistic from each player's CURRENT
# lifetime total before the detector can ever read it. Seeded here and not in a
# bucket, so there is no tick on which `unless score @s ... = @s ...` is true only
# because the mirror was still unset - that is what would read a whole save's
# wheat harvest as one fresh break. Self-gating on the tag, so it costs one failed
# tag test per player per tick once seeded.
# Seeding RETRIES until the statistic exists. minecraft.mined:minecraft.wheat has no
# entry until the player first breaks a crop, so the copy silently did not run while
# the tag was added anyway - leaving both scores unset forever. bucket_fast then read
# `unless score A = B` on two unset scores, which is TRUE every tick, so the harvest
# gate was removed and the scan granted on the glass count alone. Seeding at the
# moment the statistic first appears also keeps the delta at 0 on an established
# world, instead of reading a lifetime total as one harvest.
execute as @a[tag=!bacaphd.gg_init] if score @s bacaphd_gg_mined matches 0.. run scoreboard players operation @s bacaphd_gg_seen = @s bacaphd_gg_mined
execute as @a[tag=!bacaphd.gg_init] if score @s bacaphd_gg_mined matches 0.. run tag @s add bacaphd.gg_init
# Torchbearer: mirror the copper-torch statistic from each player's CURRENT lifetime total
# before the slow bucket can compare against it. Without this the bucket read the raw
# minecraft.used:minecraft.copper_torch score, so any save that had already placed 64
# Copper Torches was handed the advancement on the first slow tick after installing. The
# `add ... 0` materialises the statistic-backed entry first - a criterion objective has no
# score at all until the statistic first moves - and the tag is set LAST, so a half-seeded
# player is never treated as seeded. bacaphd_ctorchd starts at 0 for the same reason: the
# bucket's grant line matches on scores={bacaphd_ctorchd=64..}, which needs the entry to
# exist. Self-gating on the tag, so it costs one failed tag test per player per tick.
execute as @a[tag=!bacaphd.ctorch_seed] run scoreboard players add @s bacaphd_ctorch 0
execute as @a[tag=!bacaphd.ctorch_seed] run scoreboard players operation @s bacaphd_ctorchb = @s bacaphd_ctorch
execute as @a[tag=!bacaphd.ctorch_seed] run scoreboard players set @s bacaphd_ctorchd 0
execute as @a[tag=!bacaphd.ctorch_seed] run tag @s add bacaphd.ctorch_seed
# --- Patient Investor: a stable id per player, stamped onto the marker they pin ---
execute as @a[tag=!bacaphd.pi_id] run scoreboard players add #pi_next bacaphd_pi_own 1
execute as @a[tag=!bacaphd.pi_id] run scoreboard players operation @s bacaphd_pi_own = #pi_next bacaphd_pi_own
execute as @a[tag=!bacaphd.pi_id] run tag @s add bacaphd.pi_id
