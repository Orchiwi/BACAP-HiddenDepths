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
execute as @a[tag=!bacaphd.om_init] run function bacaphd:detect/ominous_init
execute as @a[gamemode=!spectator,tag=bacaphd.om_init,advancements={bacaphd:adventure/ominous_marathon=false}] at @s if score @s bacaphd_okey > @s bacaphd_okeyb run function bacaphd:detect/ominous_marathon
execute as @a run scoreboard players operation @s bacaphd_okeyb = @s bacaphd_okey
execute as @a[gamemode=!spectator] unless score @s bacaphd_init matches 1 run function bacaphd:detect/init
execute as @a[gamemode=!spectator] unless score @s bacaphd_wither_kills = @s bacaphd_wither_seen_pv run function bacaphd:detect/pyrrhic_victory
execute as @a[gamemode=!spectator] unless score @s bacaphd_pearls_used = @s bacaphd_pearls_seen run function bacaphd:detect/own_goal_arm
execute as @a[gamemode=!spectator,advancements={bacaphd:weaponry/own_goal={pearl_fall=true}}] unless entity @s[advancements={bacaphd:weaponry/own_goal=true}] run function bacaphd:detect/own_goal
execute as @a[gamemode=!spectator,scores={bacaphd_pearl_window=1..}] run scoreboard players remove @s bacaphd_pearl_window 1
execute as @a unless score @s bacaphd_init_b2 matches 1 run function bacaphd:detect/init_b2
execute as @a[advancements={bacaphd:end/pearl_chain=false},scores={bacaphd_init_b2=1}] unless score @s bacaphd_pearls = @s bacaphd_pearl_seen run function bacaphd:detect/pearl_throw
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:end/pearl_chain=false},scores={bacaphd_pearl_chain=1..}] run function bacaphd:detect/pearl_ground
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slime_ladder=false},tag=!bacaphd.on_slime] at @s if block ~ ~-1 ~ minecraft:slime_block run function bacaphd:detect/slime_bounce
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slime_ladder=false},tag=bacaphd.on_slime] at @s unless block ~ ~-1 ~ minecraft:slime_block run function bacaphd:detect/slime_leave
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:redstone/slime_ladder=false},tag=!bacaphd.on_slime,scores={bacaphd_slime_chain=1..}] run function bacaphd:detect/slime_air
execute as @a[advancements={bacaphd:redstone/cannonball={cannonball=true,impossible=false}}] run function bacaphd:detect/cannonball
execute as @a[advancements={bacaphd:challenges/untouchable=false},scores={bacaphd_health=..9}] run scoreboard players set @s bacaphd_untouched 0
# Statistic mirrors for this batch must start from each player's CURRENT lifetime
# totals, or the first sample reads a whole save's damage - or a whole save's
# Grindstone use - as a fresh event.
execute as @a unless score @s bacaphd_init_b4 matches 1 run function bacaphd:detect/init_b4
