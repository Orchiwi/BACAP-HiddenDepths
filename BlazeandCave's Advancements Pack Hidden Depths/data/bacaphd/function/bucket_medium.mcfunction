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
execute as @a[advancements={bacaphd:challenges/untouchable=false},scores={bacaphd_init_b2=1}] unless score @s bacaphd_dragon_kills = @s bacaphd_dragon_seen run function bacaphd:detect/untouchable
execute as @a[gamemode=!spectator,gamemode=!creative,advancements={bacaphd:challenges/untouchable=false},scores={bacaphd_health=10..}] at @s unless dimension minecraft:the_end run scoreboard players set @s bacaphd_untouched 1
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
