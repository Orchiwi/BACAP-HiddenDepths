# Every advancement in Hidden Depths

Generated from the built pack with `python3 generator/list_advancements.py`.

Legend: `·` task · `◆` goal · `★` challenge · `★★` super challenge

None of these duplicates any of the 1,776 advancements already in BlazeandCave's Advancements Pack or Enhanced Discoveries.

---

# Hidden Depths

75 advancements, all completable solo. Weighted towards the Copper Age content neither installed pack touches.

**75 advancements** across 15 tabs, plus 16 progression entries.

| Tab | Count |
|---|---|
| Adventure | 7 |
| Animals | 7 |
| Biomes | 6 |
| Building | 4 |
| Enchanting | 3 |
| Farming | 6 |
| Mining | 8 |
| Monsters | 3 |
| Nether | 6 |
| Potions | 3 |
| Redstone | 7 |
| Statistics | 6 |
| Super Challenges | 3 |
| The End | 4 |
| Weaponry | 2 |

## Adventure — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Boat Drop** | Adventure | Survive a sixty-block fall while sitting in a boat | 45 |
| ◆ | **Bundle of Everything** | Adventure | Collect all sixteen colours of Bundle | 55 |
| ★ | **Featherweight** | Adventure | Kill the Wither with no armour and nothing but a sword, a bow and a stack of arrows | 250 |
| ★ | **Free Solo** | Adventure | Climb two hundred blocks of ladders or vines without touching the ground | 150 |
| ◆ | **Key Master** | Adventure | Hold sixteen Trial Keys and sixteen Ominous Trial Keys at once | 65 |
| ★ | **Ominous Marathon** | Adventure | Open an Ominous Vault in five separate Trial Chambers | 260 |
| ◆ | **Wind Rider** | Adventure | Get thrown eighty blocks sideways by a Wind Charge | 60 |

<details><summary>How these are detected</summary>

- **Boat Drop** — minecraft:fall_from_height never fires for a boat passenger (the boat absorbs the fall), so the sampler stays. The dispatch no longer round-trips `on vehicle ... on passengers`, which re-entered the player context once per rider and made the advancement unobtainable with a second person aboard: detect/boat_gate stays as the player throughout and only asks whether the vehicle is a boat, with `execute store result score @s bacaphd_in_boat run execute on vehicle if entity @s[type=#minecraft:boat]`. The store target resolves in the player context before the fork, so the sampler runs exactly once per player. Every 10 ticks a Y sample that drops 4-200 blocks counts as falling, the Y before the first such sample is remembered as the top, and when the descent stops after two or more consecutive falling samples a total of 60+ blocks grants it. bacaphd_bd_seed re-seeds bacaphd_bd_prev on the first sample after boarding, so a stale previous position from before the ride can never be read as a fall, and leaving the boat (including on death) zeroes the sample counter. Unchanged this round.
- **Bundle of Everything** — Sixteen inventory_changed criteria, one per coloured bundle item, all required by default (requirements_json empty, so the requirement set covers the criteria set exactly). The plain uncoloured minecraft:bundle is deliberately not required, so this is exactly the sixteen dyed variants and does not restate BACAP's animal/humble_bundle.
- **Featherweight** — The kill itself is a plain minecraft:player_killed_entity criterion, and the empty armour and offhand slots are five inverted equipment conditions on that same criterion -- version-proof, and evaluated at the exact instant of the kill. There is no Wither-kill statistic delta line at all, so nothing can collide with batch 3's Pyrrhic Victory. The only thing a function still has to answer is what is in the 36 carried slots, and detect/featherweight does that every 10 ticks for players within 128 blocks of a Wither: exactly one sword (#blazeandcave:swords), exactly one bow, at most one stack of arrows, and an Inventory list length equal to that expected stack count. The result is parked in bacaphd_fw_kit, which the criterion reads with minecraft:entity_scores, and which is zeroed again as soon as no Wither is in range so nothing stale is left on the scoreboard. An unset bacaphd_fw_kit fails entity_scores, so the default is 'not qualified'. Unchanged this round.
- **Free Solo** — Every 10 ticks detect/free_solo does eight cheap block lookups at the player's feet (ladder, vine, both cave vine states, both twisting and both weeping vine states); only if one matches does the NBT position read happen. The accumulator records the Y of the first climbing sample as bacaphd_fs_start and reports NET displacement, bacaphd_fs_y - bacaphd_fs_start, so descending gives back exactly what it took and 2000 decimetres really means two hundred blocks of net ascent. The instant the feet block is not climbable the anchor and the progress are both wiped, and the grant path wipes them too. Creative is excluded because creative flight makes the climb free. Unchanged this round.
- **Key Master** — `count: {min: 16}` inside an inventory_changed item predicate matches ONE stack of sixteen or more, not a total, so the normal loot-several-vaults result of 8+8 in two stacks failed a description that says 'hold sixteen'. The check therefore lives in bacaphd:detect/key_master, which uses `execute store result score @s <obj> run clear @s <item> 0` — maxCount 0 counts matching items across the entire inventory (including offhand and armour) and removes nothing. bacaphd_okeys is zeroed at the top of the function so a stale value from a previous sample can never grant on its own, and bacaphd_tkeys is overwritten every call.
- **Ominous Marathon** — FIXED for sampling lag. The signal is the vanilla minecraft.used:minecraft.ominous_trial_key statistic — actually unlocking an Ominous Vault, and exactly the statistic Enhanced Discoveries' adventure/ominous_vault_hunter is built on, so it is attested. The whole three-line sequence now lives in bucket_fast (every tick) instead of bucket_slow (every 100 ticks): initialise, credit, resync, in that order. That closes the reviewer's hole — at a 5-second sample a player on rockets covers well over 256 blocks between the key being spent and the position being read, so five unlocks inside ONE chamber could each be credited from a different sampled spot. At one tick the sampled position IS the vault the key was just spent on. bacaphd_okey is mirrored into bacaphd_okeyb; a credit fires only on an increase, and the resync runs immediately after the credit in the same tick, so exactly one credit is taken per key spent. The mirror is seeded the first time a player is seen, via the bacaphd.om_init tag, so a lifetime total can never read as a fresh unlock; it is used by nothing else; and the resync line is ungated (`execute as @a run ...`) so no advancement state can desynchronise it. Every credit is checked against ALL previously credited positions (five bacaphd_lx1..lx5 / bacaphd_lz1..lz5 pairs) and rejected unless it is at least 256 blocks away on the X or the Z axis from each of them, so one chamber can never be counted twice no matter how many Ominous Bottles are brought back to it. 256 sits between the width of a single chamber and the 12-chunk minimum structure separation; two chambers closer than that are simply not both counted, which loses the player nothing but a walk and never grants for free.
- **Wind Rider** — Pure criteria on the SIDEWAYS axis, which no existing advancement measures: minecraft:fall_after_explosion with a wind_charge cause and distance.horizontal.min 80, the same trigger and cause shape BACAP uses in redstone/we_have_liftoff and Enhanced uses in adventure/nobody_needs_rockets, with the horizontal component of the distance predicate that BACAP already uses in minecraft/nether/fast_travel and adventure/sniper_duel. New in this round: a `flags: {is_flying: False}` player condition. distance.horizontal is measured from the latched impulse impact position to wherever the player finally touches down, so without that guard one Wind Charge followed by an ordinary elytra glide accumulated the eighty blocks and the wind did none of the sideways work. `is_flying` is the pack set's attested gliding flag (BACAP ships blazeandcave:predicate/is_flying and uses it in technical/divers_dozen_count alongside an equipped elytra; Enhanced's technical/air_battle_detect writes its 'without using elytra' clause as is_flying:false). A player who was never gliding reads false, so the guard can only ever remove the glide route, never a legitimate grant. Zero functions, zero objectives, no tick cost.

</details>

## Animals — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| · | **Armadillo Roller** | Animals | Startle an Armadillo into rolling up five separate times | 25 |
| ★ | **Bee Movie** | Animals | Have twenty Bees leave their stingers in you and live to tell it | 150 |
| ◆ | **Climate Croakers** | Animals | Breed a pair of Temperate Frogs, a pair of Warm Frogs and a pair of Cold Frogs | 40 |
| ◆ | **Copper Stable** | Animals | Ride a kilometre without dismounting on a horse in Copper Horse Armor | 60 |
| ◆ | **Full Kennel** | Animals | Equip Wolves with Wolf Armor in the ten remaining dyes, then gather ten armored Wolves around you | 55 |
| ◆ | **Herding Cats** | Animals | Gather all eleven variants of Cat within eight blocks of you | 50 |
| ◆ | **Parrot Choir** | Animals | Tame a Parrot of every color, then get five of them dancing at one Jukebox | 55 |

<details><summary>How these are detected</summary>

- **Armadillo Roller** — Every 10 ticks, for non-spectator non-creative players near an Armadillo, bacaphd:detect/armadillo_roller looks for an Armadillo within 8 blocks whose 'state' NBT string is "scared" or "rolling" and increments bacaphd_roll once per roll-up, using bacaphd_roll_lock as a latch so a single long roll cannot count twice. Five distinct roll-ups grant the advancement, and both bacaphd_roll and bacaphd_roll_lock are reset on the grant path (lock first, then the counter, so the second reset's guard still sees the score) so nothing leaks. The 'state' field and its four values idle/rolling/scared/unrolling are now confirmed against Armadillo$ArmadilloState in the 26.1.2 class files, so this is no longer a guess.
- **Bee Movie** — Unchanged this round. Criterion `stung` is entity_hurt_player with the damage source entity a Bee, and `counted` is minecraft:impossible so the criteria never grant on their own. bucket_medium reacts to `stung`, revokes it to re-arm, and only then counts Bees carrying HasStung:1b within six blocks - melee range, executed `at @s` - with limit=20 so the NBT scan is bounded no matter how large the apiary. Twenty of them plus a player whose health objective still reads 1 or more is twenty stings survived.
- **Climate Croakers** — Complete redesign - the old 'Frog Chorus' was a strict subset of bacaped:animal/what_are_you_doing_in_my_swamp and needed no function at all. This version is pure criteria: three bred_animals criteria built from blazeandcave:animal/frog_family's own parent/partner shape, each additionally requiring BOTH bred frogs to carry the same minecraft:frog/variant component value (the component form is attested by blazeandcave:biomes/birdkeeper's minecraft:parrot/variant). Requiring both sides removes the ambiguity of which of the two animals the game labels 'parent'. Because a Frog's variant is fixed by the biome its tadpole matured in, this forces the player to actually raise breeding pairs in a warm biome and in a snowy biome, not merely stand near three frogs. No tick function and no scoreboard are involved.
- **Copper Stable** — The anchor for the horse_one_cm delta is re-taken on every ride, so bacaphd_hdiff is distance ridden on THIS horse rather than lifetime horse distance since the player was first seen on a copper-armoured one. Each slow tick the bucket flags every ungranted, non-spectator, non-creative player that currently holds an anchor with bacaphd.cs_off; the detector — reached by walking `on vehicle` to a horse wearing minecraft:copper_horse_armor in armor.body and `on passengers` back to the rider, the hop BACAP itself uses in biomes/submarine_fleet — clears that flag and does the delta work; whoever is still flagged afterwards runs detect/copper_stable_off, which drops the anchor tag so the next mount re-snapshots. The statistic mirror is initialised at mount time (never against zero), belongs to this advancement alone, and its housekeeping is not gated on the advancement state of anyone else. gamemode=!creative is present because this measures distance travelled. The description says 'without dismounting', which is what the mechanism tests: a break of more than one 5-second sample resets the anchor.
- **Full Kennel** — Ten player_interacted_with_entity criteria copy blazeandcave:animal/paw_patrol's proven structure exactly, using the ten dye colours Paw Patrol leaves out, so each fires when you equip a Wolf with Wolf Armor of that dyed_color integer. The eleventh criterion 'kennel' is impossible and is granted by bacaphd:detect/full_kennel, which counts only Wolves actually WEARING Wolf Armor (nbt={equipment:{body:{id:"minecraft:wolf_armor"}}}). The 'equipment' compound and its 'body' slot key are confirmed against LivingEntity and EquipmentSlot in the 26.1.2 class files, so wild unarmoured wolves cannot pad the count. The description promises only what is enforced: ten colours equipped over time, ten armoured Wolves gathered at once.
- **Herding Cats** — Renamed away from BACAP's 'Crazy Cat Lady' and rebuilt so the variants really are the point. The advancement carries a single impossible criterion (the captain_america pattern) and is granted by bacaphd:detect/herding_cats, which chains eleven separate 'if entity @e[type=minecraft:cat,nbt={variant:"minecraft:<v>"},distance=..8,limit=1]' probes - the same nbt={variant:...} entity form Enhanced Discoveries ships in what_are_you_doing_in_my_swamp_check.mcfunction. The NBT key is confirmed: VariantUtils.TAG_VARIANT is the string "variant" and Cat writes its variant through it in 26.1.2, and the eleven ids match data/minecraft/cat_variant/ exactly. Eleven bred copies of one variant no longer pass.
- **Parrot Choir** — Five tame_animal criteria copy blazeandcave:biomes/birdkeeper exactly, one per minecraft:parrot/variant value, so the colours are handled natively. The sixth criterion 'choir' is impossible and is granted by bacaphd:detect/parrot_choir. Parrot.tick only dances a Parrot while the Jukebox BlockPos is closerToCenterThan(pos, 3.46) - I read that constant out of the 26.1.2 Parrot class - so the five are now counted from the Jukebox, not from the player: each probe that finds a jukebox[has_record=true] in the 3x3 column at or one below the player's feet snaps to that block's centre with 'align xyz positioned ~0.5 ~0.5 ~0.5' and calls detect/parrot_choir_count, which counts @e[type=minecraft:parrot,distance=..3] from there. A Parrot five blocks from the player but six from the Jukebox can no longer pad the choir. The cheap outer gate was widened from 5 to 8 blocks so a legitimate Parrot on the far side of the Jukebox is not missed, and #h5_jukebox still short-circuits the scan with a single grant at the end.

</details>

## Biomes — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★ | **Abyssal Jouster** | Biomes | Kill a Drowned with a Spear charge while riding a Nautilus | 170 |
| ★★ | **Angler's Atlas** | Biomes | Catch a fish in every Overworld biome | 600 |
| ★ | **Armada** | Biomes | Gather twenty Nautiluses in Nautilus Armor around you | 200 |
| ◆ | **Cold Blooded** | Biomes | Survive a full night in a Frozen Peaks biome wearing no armor at all | 55 |
| ◆ | **Harpooner** | Biomes | Kill a Guardian with a Spear while underwater | 50 |
| ◆ | **Ice Road Trucker** | Biomes | Travel five hundred blocks by boat over Blue Ice without stopping | 55 |

<details><summary>How these are detected</summary>

- **Abyssal Jouster** — One player_killed_entity criterion: the victim is a Drowned, the killing blow carries the blazeandcave:spear damage-type tag (verified to contain exactly minecraft:spear, the charge-attack damage type BACAP's weaponry/hit_and_run keys off), and the player's vehicle is in #blazeandcave:nautiluses (verified to contain minecraft:nautilus and minecraft:zombie_nautilus). Unlike hit_and_run this needs no mainhand/offhand split, because the damage type alone identifies a spear charge regardless of which hand held it. requirements_json empty, so the single criterion is required.
- **Angler's Atlas** — Complete replacement for 'Biome Bingo', whose 65 criteria were a character-for-character re-run of blazeandcave:challenges/explorer_of_worlds' biome set. Angler's Atlas changes the verb instead of the map: fifty-four minecraft:fishing_rod_hooked criteria, one per Overworld biome, each requiring the thing on the hook to be a raw Cod, Salmon, Tropical Fish or Pufferfish (junk and treasure do not count) and the player to be standing in that biome. The 'item' field of FishingRodHookedTrigger.TriggerInstance is confirmed in the 26.1.2 class files; the biome + inverted-spectator player condition pair is taken verbatim from blazeandcave:biomes/cold_feet. Nether and End biomes are excluded because they hold no fishable water. There is no external timer, no scoreboard and no tick function: the whole thing is native criteria, so the advancement screen itself is the progress readout the old invisible one-week window never had. The real work is hauling a water source into Deep Dark, Dripstone Caves, Lush Caves, Jagged Peaks and the Badlands.
- **Armada** — No NBT guess anywhere: nothing in either installed pack touches a Nautilus NBT field (equiangular_spiral uses the minecraft:tame_animal trigger, submarine_fleet reads the `body` equipment slot through blazeandcave:predicate/equipment/*_nautilus_armor). Ownership is proven by equipment instead: a Nautilus's body slot only ever holds Nautilus Armor, which a player must craft and fit, so `if items entity @s armor.body *` is a one-command, registry-free test that a wild school can never satisfy. The slow bucket counts Nautiluses within 20 blocks with `store result score @s bacaphd_naut if entity @e[...,limit=20]` and only runs the detector at exactly 20; the detector then tags the armoured ones, counts the tags with a second store-result, grants at twenty, removes every tag it added and resets the shared counter. 'Armada' does not collide with any of the 1776 existing titles and is distinct from BACAP's biomes/submarine_fleet (ride a Nautilus in each armour type, one at a time).
- **Cold Blooded** — bucket_slow reads the world time once into #h5_daytime, and only while it is night (13000-22999) does it run bacaphd:detect/cold_blooded for non-spectator, non-creative players who lack the advancement; that function adds 100 to bacaphd_cold each pass while the player is standing in minecraft:frozen_peaks with every armour slot empty ('unless items entity @s armor.* *'), and resets the streak to 0 the moment either condition breaks. A separate line zeroes bacaphd_cold for everyone as soon as day returns, so two nights cannot be pieced together. 8000 ticks of unbroken night in the biome grants it - comfortably inside the 10000-tick night - and the counter is reset on the grant path so it does not leak.
- **Harpooner** — Copied from BACAP's weaponry/spear_fishing shape: one criterion for a mainhand spear killing blow tagged minecraft:is_player_attack and one for an offhand spear killing blow tagged blazeandcave:spear (that damage-type tag wraps minecraft:spear and is confirmed at BACAP/data/blazeandcave/tags/damage_type/spear.json), OR-ed by the requirements list. The requirements list names exactly the two criteria that exist, so the requirement set covers the criteria set — nothing missing, nothing extra. The fluid predicate on the player's own location is the same shape BACAP uses in potion/marine_marauder. #blazeandcave:spears is confirmed present at BACAP/data/blazeandcave/tags/item/spears.json.
- **Ice Road Trucker** — Same dispatch repair as Boat Drop: detect/ice_gate never leaves the player context, so a passenger can no longer make the sampler run twice and wipe the running total on every sample. The one remaining fork is `on vehicle at @s`, which resolves to exactly one boat, and it is only used to read the block under the hull. Every 10 ticks the horizontal step since the last sample is added to a running total in decimetres (octagonal approximation, max + 3/8*min) and 5000 dm grants it. The total is wiped whenever the boat is not over Blue Ice, or the sample shows less than 3 blocks of travel (stopped) or more than 50 blocks (teleport or portal), and bacaphd_ice_seed discards the very first step after boarding so a stale position cannot be counted. The total is also zeroed on the grant path. Unchanged this round.

</details>

## Building — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Cartographer's Wall** | Building | Hang nine filled Maps in item frames on a single wall | 65 |
| ★ | **Monochrome** | Building | Pack five hundred blocks of a single dyed colour into one nine-block cube | 180 |
| ◆ | **Shelf Museum** | Building | Place a Shelf made from every type of wood | 60 |
| ★ | **Skyscraper** | Building | Build a solid column from bedrock all the way to the build limit | 220 |

<details><summary>How these are detected</summary>

- **Cartographer's Wall** — Unchanged this round. Item frames are entities, so this needs no block scan at all: two counts over item_frame and glow_item_frame within 6 blocks holding a minecraft:filled_map are summed with the 'execute store result score @s <obj> run execute if entity @e[...]' form that Enhanced Discoveries uses in its mob_collections counters, and nine or more grants it. Radius 6 forces the maps to be clustered like a wall, but the exact 3x3 arrangement is not verified. The selector carries gamemode=!spectator,gamemode=!creative.
- **Monochrome** — FIXED - the cube is now measured BELOW the player, not around them. The reviewer caught a real regression from last round's 15-cube to 9-cube shrink: 'positioned ~-4 ~-4 ~-4' spanned feet-4 to feet+4, so a player standing on top of their own solid mass could only ever reach four full layers, 4 x 81 = 324 of 729, under the 500 threshold - the natural way to earn it could not grant it. The scan now starts at 'positioned ~-4 ~-9 ~-4', which spans feet-9 to feet-1: the top layer of the cube is exactly the block the player is standing on, the same block that names the colour, and standing on a nine-deep dyed mass reads a full 729. The threshold stays at 500 of 729, a 69% fill, so the cube really is a solid body of one colour. The block under the player's feet is matched against the 48 dyed wool, concrete and terracotta blocks, written into storage bacaphd:mono, and the macro scan counts that exact id. @r caps it at one player per slow cycle, the selector carries gamemode=!spectator,gamemode=!creative, and the gate means the scan does not run at all unless the player is standing on a dyed block.
- **Shelf Museum** — Twelve placed_block criteria covering every shelf ID attested in VALID_IDS.txt (oak, spruce, birch, jungle, acacia, dark oak, mangrove, cherry, pale oak, bamboo, crimson, warped), all required by default. Stated plainly: the 'side by side' clause from the idea list is NOT enforced — only that one shelf of each wood has been placed. Distinct from building/shelfception (a shelf placed on a shelf) and building/shelf_expression (a filled chiseled bookshelf).
- **Skyscraper** — Unchanged this round. The four cheap probes at y 0, 100, 200 and 300 reject exactly what the full walk rejects: air, cave_air, void_air, water and lava, so a lava or void column is thrown out by the gate instead of paying for a 384-position walk every five seconds forever. Only if all four probes hit does the column from y -64 to y 319 get walked, and every one of those 384 positions must be a solid non-air, non-fluid block. The y coordinates in the probes are absolute (no tilde), so they do not compound down the chain. The selector carries gamemode=!spectator,gamemode=!creative.

</details>

## Enchanting — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Book Worm** | Enchanting | Fill every single slot of your inventory with Enchanted Books | 80 |
| ★ | **Cursed** | Enchanting | Wear a full set of armour with both Curse of Binding and Curse of Vanishing on every piece | 150 |
| · | **Disenchanted** | Enchanting | Strip an Enchanted Book back down to a plain Book on a Grindstone | 20 |

<details><summary>How these are detected</summary>

- **Book Worm** — Unchanged this round. Enchanted Books do not stack, so 36 of them is literally every slot of the 27-slot inventory and the 9-slot hotbar occupied at once. detect/book_worm sums two counts using the BACAP-attested form (execute store result score @s <obj> if items entity @s inventory.* / hotbar.* minecraft:enchanted_book, the same shape as bac_inv_check in BACAP's inventory_immortal) and grants at 36. Which enchantments they carry is irrelevant, which is precisely what keeps it clear of master_enchanter.
- **Cursed** — Unchanged, and untouched by this round. The minecraft:location trigger is polled by the server, so the single criterion fires on its own the moment all four equipped armour slots simultaneously carry both curses; the equipment/predicates/enchantments shape is verbatim BACAP's enchanting/handmade_blinding and nether/soul_runnings. Spectators are excluded with the same inverted gamemode term BACAP uses. One criterion, no requirements block, so the default (all criteria) applies.
- **Disenchanted** — REDESIGNED again. The previous version demanded that the Enchanted Book count fall and the plain Book count rise inside the SAME half-second sample, which a Grindstone can never produce: while the book sits in the Grindstone's input slot it lives in the menu container, invisible to inventory.*, hotbar.* and weapon.offhand, so the drop and the rise are always two separate clicks. It is now anchored to the vanilla statistic minecraft.custom:minecraft.interact_with_grindstone, mirrored as bacaphd_grind. Opening a Grindstone bumps that statistic, which arms a sixty-sample (thirty second) window and snapshots the two book counts as they stood one sample BEFORE the menu opened - the previous sample, so a player who opens and inserts inside the same half second still gets a clean baseline. Anywhere inside that window, Enchanted Books below the snapshot AND plain Books above it grants it. A Grindstone is now an actual condition rather than a word in the description, nothing latches (no window, no grant), and any pacing of the two clicks works. bacaphd_gr_prev is seeded from the player's lifetime total by detect/init_b4 and the bucket line refuses to run until that has happened, so an existing save's Grindstone history cannot arm a window on the first tick. The Mending wording stays dropped: pinning the enchantment needs an item-component sub-predicate that is not attested in either reference pack.

</details>

## Farming — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Cake Hoarder** | Farming | Place sixty-four Cakes without ever leaving the chunk | 60 |
| ★ | **Farm to Table** | Farming | Grow wheat, potatoes and beetroot in the End, then eat the whole harvest there | 200 |
| ★ | **Herbivore** | Farming | Survive ten in-game days eating only plant-based food | 200 |
| ◆ | **Nether Orchard** | Farming | Bone meal a sapling into a full tree in the Nether | 40 |
| ◆ | **Sniffer Sommelier** | Farming | Have a Sniffer turn up both ancient seeds on the same day | 50 |
| · | **Sourdough** | Farming | Bake bread in the Nether from wheat you planted there | 20 |

<details><summary>How these are detected</summary>

- **Cake Hoarder** — Unchanged this round. Function-granted. bucket_slow fires only when minecraft.used:minecraft.cake has changed. detect/cake_hoarder identifies the chunk by summoning a marker at the block-aligned position (`execute at @s align xz run summon`), reading its Pos - an exact integer, so no assumption has to be made about how `data get`'s scale argument rounds - and floor-dividing by 16 with the scoreboard's /= (which is floorDiv, correct on both sides of the origin). Any change in either chunk coordinate zeroes the running count. The delta is consumed before any early exit so it can never bank up, and a creative placement is thrown away AND ends the run. The count is reset on the grant path.
- **Farm to Table** — Unchanged this round. Six criteria, all required by the default requirements: three placed_block criteria for the wheat, potato and beetroot crop blocks with location_check pinned to the End, and three consume_item criteria for bread, baked potato and beetroot soup with a `player` entity_properties predicate pinning the eating to the End. Item provenance is untrackable, so planting all three crops in the End plus eating all three foods there is the expressible form of 'a meal made only from End-grown crops'.
- **Herbivore** — Twenty minecraft.used statistic objectives (every meat, fish, rabbit stew, rotten flesh, spider eye and milk bucket) are summed every 100 ticks; if the sum is unchanged the streak gains 100 ticks, if it moved the streak is wiped, and 240000 ticks (ten in-game days of online time) grants it. The mirror is a private sum objective used by nothing else, and detect/init_b2 parks it at -1 so the very first sweep is guaranteed to be treated as a reset rather than as a lifetime total. Honey, pumpkin pie, cookies and cake count as plant matter here, matching BACAP's own 'Vegetarian' list. Caveat: the ITEM_USED statistic fires when eating begins, so cancelling a bite of steak still breaks the streak. The streak is zeroed on the grant path. Unchanged this round.
- **Nether Orchard** — Unchanged this round. grown_tree is exactly the mechanism BACAP uses for farming/one_course_meal: item_used_on_block records the clicked position after the use resolves, so when bone meal turns a sapling into a tree the block there is now a log, matched against #minecraft:logs_that_burn, with the dimension pinned to the Nether. Nether stems are outside that tag, so bone-mealing a fungus cannot trigger it. A second required criterion, planted_sapling, makes the description literal - the player must have placed a #minecraft:saplings block in the Nether. Only bone-mealed growth is detectable; a sapling left to grow on its own will not fire.
- **Sniffer Sommelier** — Function-granted, and rebuilt again this round around the DIG rather than the pickup, because the pickup statistic can never tell a dug seed from a re-picked one. bucket_medium gates on a Sniffer within sixteen blocks of the player - a type-filtered entity lookup with no NBT, cheap enough to run every 0.5 s and rare enough that everything below almost never runs. detect/sniffer_watch then executes `at` that Sniffer and looks for a Torchflower Seed or a Pitcher Pod item entity lying within five blocks of it that has NO Thrower tag. Torchflower Seeds and Pitcher Pods have no vanilla source other than a Sniffer dig, and an item a player throws or drops keeps that player's UUID in Thrower for the rest of its life, so 'seed on the ground at a Sniffer's feet with no Thrower' is the dig itself. Dropping two hoarded seeds next to your Sniffer and picking them back up now proves nothing - both would carry Thrower. Each half stamps its own day number (#today, refreshed every medium tick from `time query day`), and the grant fires when the two stamps are equal; they start at -1 and -2 so an uninitialised player can never match. The bucket line carries gamemode=!spectator, gamemode=!creative and advancements={...=false}. The two pickup statistics and their mirrors are gone entirely.
- **Sourdough** — Both criteria required, default requirements. placed_block fires when wheat seeds are planted (seeds are a BlockItem, so the trigger fires with the wheat crop block at that position) with location_check pinned to the Nether - the same location_check shape BACAP uses in redstone/powerful_light. recipe_crafted for minecraft:bread carries a `player` entity_properties predicate pinning the crafting to the Nether, the shape BACAP uses in end/im_coming_back_murph. The description was reworded from 'Grow wheat in the Nether and bake it into bread down there' to 'Bake bread in the Nether from wheat you planted there'. That does two things: it drops verify.py's duplicate warning against the parent Bake Bread ('Grow wheat and use it to bake bread') from 0.50 Jaccard to 0.375, under the 0.45 threshold, and it stops the description promising something the criteria do not test. The criterion observes PLANTING, not growth, so the description now says planted. Item provenance is untrackable, so baking in the Nether stands in for baking the Nether-grown wheat specifically.

</details>

## Mining — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★★ | **Chunk Miner** | Mining | Strip an entire Overworld chunk down to bedrock, leaving nothing but air | 800 |
| ◆ | **Copper Loadout** | Mining | Hold a full set of Copper tools and Copper armour at once | 45 |
| ★ | **Deep Pockets** | Mining | Fill a Shulker Box to the brim with Diamonds | 150 |
| ◆ | **Golem Courier** | Mining | Catch five Copper Golems carrying items at once | 50 |
| ★ | **Patina Parade** | Mining | Pose a Copper Golem Statue at every stage of oxidation, in every pose | 110 |
| · | **Torchbearer** | Mining | Place sixty-four Copper Torches | 20 |
| ◆ | **Vein Miner** | Mining | Break nine Diamond Ore in a single minute | 45 |
| ★ | **Vertical Limit** | Mining | Go from bedrock to the build limit in under sixty seconds | 170 |

<details><summary>How these are detected</summary>

- **Chunk Miner** — Function-granted, and the cave_air hole is now closed at both ends. A carver cave or ravine leaves minecraft:cave_air, a block state distinct from minecraft:air that a player mining the chunk never touches and cannot break, so the old proof - 'the corner is air and every block equals it' - failed forever on any naturally carved chunk. Three changes. (1) The cheap slow-bucket gate moved into detect/chunk_gate, which counts five samples up the player's column (y -59, 5, 100, 200, 319) accepting air OR cave_air; y -59 exists only in the Overworld, so that sample is still the dimension check. (2) detect/chunk_scan normalises just the two diagonal corner columns with `fill ... minecraft:air replace minecraft:cave_air` (379 blocks each - a no-op for the world, since the two states behave identically) and only proceeds if both columns are then entirely air. That short-circuit is what keeps a 1x1 shaft from paying for the expensive pass. (3) detect/chunk_scan_full normalises the whole chunk in three y-slices of 32512, 32512 and 32000 blocks - each under the 32768 fill limit - and then runs the original eight-condition induction: the corner block is air, the corner column equals itself shifted one block up, three y-slices proving block(x,y,z) == block(x+1,y,z) and three more along z, each region 30480 blocks. Together every block in the chunk equals the all-air corner column. y -59..319 skips the unbreakable bedrock shell. Aquifer water still has to be drained by hand, which is part of the job.
- **Copper Loadout** — A single inventory_changed criterion whose items array holds nine separate predicates; the trigger only matches when every predicate finds a distinct stack in the inventory at the same moment, so all five copper tools and all four copper armour pieces must be carried simultaneously. Distinct from BACAP's mining/copper_golem_overlord, which is about wearing copper armour while surrounded by ten golems.
- **Deep Pockets** — Unchanged this round. inventory_changed with an item predicate on any #minecraft:shulker_boxes stack whose minecraft:container component holds a full 64-stack of Diamonds in all 27 slots - the exact structure BACAP uses for redstone/sculker_box. 1728 diamonds is three times what the parent mining/master_diamond_miner asks for and sits one frame above it.
- **Golem Courier** — FIVE Copper Golems carrying items in the same 10-tick sample, within 16 blocks — a working golem logistics network rather than the single golem doing its normal job that the first draft asked for. The medium bucket counts golems with `execute ... store result score @s bacaphd_gol if entity @e[...,limit=5]` (never `if entity @a[limit=N]`, which only tests for one match) and runs the detector only when that count is exactly 5. The detector tags each carrying golem, counts the tagged ones with another store-result, grants at five, then removes every tag it added and resets the shared counter, so nothing leaks. The carried item is looked for in BOTH weapon.mainhand and container.0 — a deliberate hedge, since no installed pack attests which slot a Copper Golem uses, and an entity that lacks a slot simply fails that test rather than erroring. Distinct from mining/copper_golem_overlord, which requires copper armour and ten idle golems and says nothing about them working.
- **Patina Parade** — The full 4x4 matrix: sixteen any_block_use criteria, one per (oxidation stage x pose) pair, all required. The trigger, the block-state key copper_golem_pose and its four values (standing, sitting, running, star) are copied verbatim from BACAP's mining/such_a_poser, which this extends rather than restates — such_a_poser is four poses on any one statue, this is four poses on a statue of each of the four oxidation stages, so it is also not a subset of mining/statue_of_limitations (a stack of every oxidising stage). Waxed variants are accepted alongside each stage; all eight block IDs are in VALID_IDS.txt. requirements_json is empty so all sixteen criterion names are covered by the default requirement set.
- **Torchbearer** — The scoreboard objective bacaphd_ctorch tracks minecraft.used:minecraft.copper_torch, which vanilla increments each time the BlockItem is placed. The slow bucket grants directly to any player whose score reaches 64. The selector carries gamemode=!spectator AND gamemode=!creative, because this measures block placement and creative torches are free. This is a counting task, not a restatement of BACAP's building/chartreuse (one-off 'light up the area').
- **Vein Miner** — Unchanged this round. Function-granted. bucket_slow fires when either minecraft.mined:minecraft.diamond_ore or minecraft.mined:minecraft.deepslate_diamond_ore changes; detect/vein_miner consumes both deltas on every visit, then adds them to the running count. The window is stamped from the FIRST ore of the run in bacaphd_vein_start, so nine ores fifty-nine seconds apart no longer accumulate; a run whose first ore is more than 1200 game ticks old is discarded and the next ore starts a fresh one. Ore broken in creative is thrown away and ends the run. The count is reset on the grant path.
- **Vertical Limit** — Two medium-bucket lines. Standing in the overworld bedrock layer (`positioned ~ -64 ~ if entity @s[dx=0,dy=6,dz=0]`) arms a 120-sample timer; detect/vl_top then decrements that timer once per 10 ticks and reads the exact altitude, granting at y>=319, so the run expires after exactly 60 seconds. The top test is no longer a selector volume. A dx/dy/dz selector box matches on bounding-box INTERSECTION, not on the feet position, so `positioned ~ 319 ~ if entity @s[dy=2000]` passed as soon as the player's head crossed 319, i.e. with the feet at about y 317.2 -- almost two blocks early. detect/vl_top now stores Pos[1] with scale 1 and compares the score, which is exact. The reviewer's stated cause (Vec3Argument centre-correcting the integer) is not the reason: WorldCoordinates.parseDouble passes centerCorrect=false for the Y component specifically, which is why /tp @s 0 64 0 lands you at 0.5, 64.0, 0.5 -- the Y anchor was already 319.0 and -64.0 exactly. The bedrock arming line keeps the volume idiom: the same intersection slack there only widens the arming zone to feet between about -65.8 and -57, which is the bedrock layer plus a block, and being generous at the START of a 380-block climb costs nothing. No dimension check is needed beyond the overworld guard on the arming line since y>=319 is unreachable in the Nether or the End. Creative is excluded alongside spectator, and the timer is zeroed on the grant path.

</details>

## Monsters — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★ | **Death by Committee** | Monsters | Be wounded by ten different kinds of monster inside thirty seconds and survive | 220 |
| ★ | **Pacifist Streak** | Monsters | Go five in-game days without killing a single mob | 180 |
| ★ | **Pyrrhic Victory** | Monsters | Kill the Wither and be killed by the very same blast | 180 |

<details><summary>How these are detected</summary>

- **Death by Committee** — Unchanged this round. Ten entity_hurt_player criteria (blocked:false, so shield hits do not count) plus an eleventh, `armed`, which fires on damage from ANY entity - source_entity present but empty. All eleven are required and `armed` is implied by every one of the ten, so it costs the player nothing. The first time `armed` shows up, detect/committee_arm starts a fixed thirty second countdown (60 medium ticks) and detect/committee_tick revokes the whole advancement's progress when it runs out; nothing refreshes it. A separate bucket line fires detect/committee_reset the moment the health objective reads 0, so 'and survive' is enforced. Every line that can revoke is gated on advancements={...=false} and committee_arm parks the timer at -1 once the advancement is held.
- **Pacifist Streak** — A bacaphd_kills objective on the vanilla `totalKillCount` criterion is compared against its own private mirror every 100 ticks; unchanged adds 100 ticks to the streak, any change wipes it, and 120000 ticks (five in-game days of online time) grants it. detect/init_b2 seeds the mirror from the live statistic on the player's first tick so a lifetime kill count is never read as a fresh kill. The whole check is four scoreboard commands per player per five seconds and touches no NBT; the streak is zeroed on the grant path. Unchanged this round.
- **Pyrrhic Victory** — Unchanged this round. Function-granted. bucket_fast watches the minecraft.killed:minecraft.wither statistic against bacaphd_wither_seen_pv - a mirror owned by THIS advancement alone, so it can neither consume nor be consumed by any other Wither-watching check in the pack. The tick a Wither kill is credited, detect/pyrrhic_victory grants if the health objective reads 0, i.e. the player is already dead at that instant. The mirror is rebased on every visit and the housekeeping line is not gated on the advancement, so a lifetime total can never bank up.

</details>

## Nether — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★ | **Ghast Couture** | Nether | Ride the same Happy Ghast in all sixteen colours of Harness | 220 |
| ◆ | **Magma Marathon** | Nether | Swim five hundred blocks through lava under Fire Resistance without taking a single point of damage | 75 |
| ★ | **Portal Sniper** | Nether | Go two hundred blocks deep into the Nether and come back out within ten blocks of where you went in | 150 |
| ◆ | **Rainbow Rigging** | Nether | Collect all sixteen colours of Happy Ghast Harness | 60 |
| ★ | **Roof Runner** | Nether | Travel two thousand blocks on top of the Nether roof | 140 |
| ◆ | **Soul Speed Demon** | Nether | Cover five thousand blocks of Soul Sand and Soul Soil wearing Soul Speed III | 85 |

<details><summary>How these are detected</summary>

- **Ghast Couture** — FIXED for ownership. The colour tags still live on the ghast so they survive relogs, but two things changed. (1) The tag pass no longer runs for anyone standing near a ghast; it only runs for a player who is RIDING it, reached with `on vehicle` — the same hop BACAP uses in biomes/submarine_fleet. A Happy Ghast can only be ridden once a Harness has been fitted (BACAP's nether/hot_air_balloon: 'Craft a Harness, place it on a Happy Ghast, and ride it'), so 'ridden while it wore this colour' is a faithful stand-in for 'fitted with this colour' and costs the player nothing they were not already doing. (2) The grant is gated on bacaphd.h_new, a marker the tag pass sets only when the colour worn this sample is one the ghast has never worn before. So the grant belongs to the rider who registered the sixteenth colour; a second player who mounts the finished ghast registers no new colour and is not granted. The player's identity is carried across the `on vehicle` hop by the short-lived bacaphd.gc_self tag, because after `on vehicle` the executor is the ghast — going back with `on passengers` would have granted every passenger, up to four people. A body slot holds exactly one item, so at most one colour can match per pass, which is what makes the newness marker exact. `if items entity @s armor.body *` is used rather than a guessed `#minecraft:harnesses` tag; `body` is the equipment slot BACAP reads for Nautilus and Horse armour in blazeandcave:predicate/equipment/.
- **Magma Marathon** — FIXED for the same reason the reviewer raised against Dragon Rider: the description promises 'without taking a single point of damage' and the counter was merely PAUSING on damage, not clearing. bacaphd_lava is now zeroed the moment minecraft.custom:minecraft.damage_taken moves, so the five hundred blocks really do have to be unbroken. Every 10 ticks the medium bucket samples X/Z in decimetres; if the feet block is lava and the damage mirror has not moved since the previous sample, the horizontal step is added to bacaphd_lava. The damage mirror bacaphd_mm_dmg is private to this advancement and is seeded from the player's current lifetime total by detect/init_b4 on first sight, and the bucket line refuses to run until that seeding has happened. Steps over 40 blocks per sample are discarded so teleports cannot pad the total, and bacaphd_lava is zeroed on the grant path.
- **Portal Sniper** — Unchanged this round. Entering the Nether freezes the Overworld anchor AND records the arrival position; every subsequent Nether sample updates bacaphd_ps_far with the furthest the player has been from that arrival point (a running max, not a path length, so milling around next to the portal banks nothing). The return check only grants when bacaphd_ps_far is at least 200 blocks and the Overworld arrival is within 10 blocks of the departure point. This is deliberately not 'link two different portals precisely' - vanilla portal search makes a far-flung second Nether portal land 8x further out in the Overworld, so that version is unachievable. bacaphd_ps_far is reset on the grant path and on every fresh entry.
- **Rainbow Rigging** — Sixteen independent inventory_changed criteria, one per colour-prefixed harness item. requirements_json is empty so the default applies and every criterion name is covered exactly once. Each fires the first time that harness ID appears anywhere in the player's inventory; they do not have to be held at the same time. All sixteen IDs are attested in VALID_IDS.txt.
- **Roof Runner** — FIXED - elytra can no longer bank it at any altitude. The reviewer is right that 'unless block ~ ~-1 ~ minecraft:air' at feet y 128 tests the bedrock roof itself and is therefore always true, so gliding one to five blocks above the roof passed. Two changes replace it: the altitude band is now y 128..129 only (feet on the roof surface, or at the apex of a jump from it - a glider has to stay inside a two-block slot right against the bedrock), and the per-sample step is capped at 6 blocks per half second, i.e. 12 blocks a second. Sprinting is 5.6 and sprint-jumping about 7.1, so foot travel counts in full; unassisted gliding is 15 to 25 and rocket flight 30 plus, so neither contributes anything. The redundant block test under the feet is gone - in the Nether there is nowhere at y 128 except above the bedrock ceiling, which tops out at y 127. The bucket line still carries gamemode=!spectator,gamemode=!creative. bacaphd_roof is zeroed on the grant path.
- **Soul Speed Demon** — FIXED - the boots are now re-proven continuously instead of once. The tick bucket still selects on advancements={bacaphd:nether/soul_speed_demon={soul_speed=true,distance=false}}, but the first line of detect/soul_speed_demon revokes that criterion again, so the game has to re-award it before the next sample can accumulate anything. The vanilla minecraft:location trigger is polled once a second per player, so in practice one sample in two banks distance and the boots are verified about once a second for the whole five kilometres; take them off and accumulation stops within a second. This is Enhanced Discoveries' own revoke-to-re-prove idiom - bacaped:1sec_timer revokes camel_adventure, big_pig_adventure and intergalactic_journey exactly this way and relies on their location criteria being re-earned, and flap_dont_fall_reset uses the criterion-level 'advancement revoke @s only <adv> <criterion>' form. The revoke is deliberately the FIRST line so the completion path's grant (which grants both criteria at once) can never be undone by it in the same execution. The per-sample cap is tightened from 40 blocks to 25, matching the slower effective sample rate. The criterion predicate itself is BACAP's nether/soul_runnings shape. Both criteria are required (no requirements block). The accumulator is zeroed on the grant path.

</details>

## Potions — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Alchemist's Shelf** | Potions | Place every type of Potion onto Shelves | 70 |
| ◆ | **Bad Trip** | Potions | Suffer Nausea, Blindness and Darkness all at the same time | 45 |
| ★ | **Overdose** | Potions | Hold twelve potion effects at once, each with thirty seconds still to run | 160 |

<details><summary>How these are detected</summary>

- **Alchemist's Shelf** — Twenty-three item_used_on_block criteria, one per base Potion type, each requiring the used item to be a minecraft:potion whose potion_contents matches that type (the 'predicates':{'potion_contents': ...} item-predicate form BACAP uses in Furious Ammunition) and the clicked block to be one of the twelve wood Shelves; the location/match_tool condition-list shape is copied from blazeandcave:adventure/im_not_lost_anymore. Long and strong variants are deliberately excluded so the set stays at one bottle per effect. The description says 'Place every type of Potion onto Shelves' - plural, accumulated over time - because a single Shelf holds only three items and because the criteria latch on each placement rather than on the potions still being there.
- **Bad Trip** — A single effects_changed criterion, written with the trigger's top-level 'effects' map as in blazeandcave:adventure/war_is_coming, that fires when the player simultaneously holds Nausea (pufferfish or a Nether portal), Blindness (a witch or suspicious stew) and Darkness (a Sculk Shrieker or a Warden).
- **Overdose** — One effects_changed criterion using the trigger's own top-level 'effects' map, the shape BACAP ships in blazeandcave:potion/a_much_more_doable_challenge and Enhanced Discoveries ships in challenges/explosive_elexir. The axis moved from 'how many effects' to 'where they came from'. Twelve effects must be held at once AND each must still have at least 600 ticks left (MobEffectInstancePredicate.duration, verified in the 26.1.2 class files). A beacon writes its effect with a duration of (9 + levels*2) seconds - 340 ticks at a full pyramid - Conduit Power is 260 ticks and Dolphin's Grace 100, so none of the ambient sources can ever show 600 and every one of the twelve has to come out of a bottle. That makes this a brewing-throughput challenge instead of a subset of 'How Did We Get Here?': twelve different brews stood up and drunk inside about twenty seconds. Regeneration is the only member of the list whose base brew (0:45) is too short once drinking time is counted, so the extended version is needed; Absorption comes from a Golden Apple (2:00). The old fifteen-effect list was nether/all_effects with the cheap half removed, and is gone.

</details>

## Redstone — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★ | **Cannonball** | Redstone | Get thrown a hundred blocks sideways by TNT and survive the landing | 150 |
| ◆ | **Clock Tower** | Redstone | Wire a Daylight Detector to a Bell at least five blocks below it, using eight pieces of redstone | 45 |
| ◆ | **Copper Counter** | Redstone | Wire up sixteen Copper Bulbs and get them showing a mixed on-off pattern | 80 |
| ◆ | **Hoist by Your Own Petard** | Redstone | Blow yourself up with TNT that you lit yourself | 40 |
| ★ | **Piston Elevator** | Redstone | Ride a piston-powered elevator a hundred blocks upward | 150 |
| ◆ | **Slime Ladder** | Redstone | Bounce five times in a row on Slime Blocks, each at least three blocks high | 35 |
| ◆ | **Sorting Facility** | Redstone | Cram twenty-seven Hoppers and twenty-seven Chests into one storage room | 70 |

<details><summary>How these are detected</summary>

- **Cannonball** — REWORKED into an impossible-gated advancement, the shape Enhanced uses for end/dragon_blitz. The `cannonball` criterion is the same fall_after_explosion / TNT cause / distance.horizontal.min 100 as before, now with the same is_flying:false glide guard as Wind Rider; the second criterion is minecraft:impossible and requirements are [["cannonball"],["impossible"]], so the advancement can never complete on its own. Survival is no longer tested inside the criterion, because it cannot be: fall_after_explosion is fired from checkFallDamage BEFORE the landing damage is applied, and the health-criterion objective is only rewritten later in the same player tick, so at criterion time bacaphd_health still holds pre-landing health either way. Instead a bucket_fast line matches `advancements={bacaphd:redstone/cannonball={cannonball=true,impossible=false}}` and runs detect/cannonball. #minecraft:tick functions run at the top of tickChildren, before the levels tick, so that line first sees the completed criterion on the tick AFTER the landing -- by which point bacaphd_health has been rewritten with the post-landing value. 1 or more grants the whole advancement (`advancement grant @s only` completes the impossible criterion too); 0 revokes it, which re-arms the criterion for the next attempt. Once granted, impossible=true and the selector stops matching, so the line self-retires.
- **Clock Tower** — FIXED - the reviewer's exploit build (a lever on a bell, a detector on the ground and eight dust sprinkled five blocks away) no longer passes, because the check is now vertical. The scan volume changed from 11x7x11 to 9x11x9 - narrower horizontally, much taller - and the loop's own y index doubles as an altitude reading: bacaphd_ct_by keeps the lowest layer holding a powered Bell and bacaphd_ct_dy the highest layer holding an EMITTING Daylight Detector. The grant needs a powered Bell, an emitting Detector, eight pieces of redstone dust / repeaters / comparators in the volume, and the Detector at least five layers ABOVE the Bell. A flat one-room build cannot produce that separation, and a two-block Detector-on-Bell stack certainly cannot; what can is an actual tower with the sensor on the roof and the bell below it, which is what the advancement is named after. It still cannot follow the wire from one end to the other - no command can - and the description now states exactly the three things that are measured rather than implying a timed circuit. The selector carries gamemode=!spectator,gamemode=!creative and every counter is reset at the top of each scan; the two altitude registers are seeded to 99 and -99 so a missing Bell or Detector yields a negative separation and fails.
- **Copper Counter** — Unchanged this round. A 13x5x13 slow-bucket scan around one candidate player counts Copper Bulbs in all eight oxidation and waxed variants, split by their lit blockstate; sixteen bulbs in total with at least four lit and at least four unlit grants it. The mixed pattern stands in for 'working counter', which is not something a command can verify. The air short-circuit skips air, cave_air and void_air, so empty space costs three checks instead of the full sixteen-variant test. The selector carries gamemode=!spectator,gamemode=!creative, and all three counters are reset at the top of every scan.
- **Hoist by Your Own Petard** — Unchanged this round - no residual defect was reported against it. entity_killed_player fires on the player's death; killing_blow matches an explosion whose direct entity is a primed minecraft:tnt (same shape as BACAP end/dimension_penetration and monsters/keep_your_distance). Ownership is checked: the trigger's `entity` field is damageSource.getEntity(), which for a TNT explosion is PrimedTnt.getOwner() - the player who lit it, propagated down chain reactions and null for redstone- or fire-lit TNT. The loot context that `entity` is matched against uses the dying player's position as ORIGIN, so distance.absolute.max 0.5 means 'the igniter is standing exactly where the victim is', i.e. the igniter IS the victim. That is the same distance trick BACAP uses in reverse in mining/diamonds_to_you (min 1 to exclude self). Another player's trap, a creeper chain and a desert-temple trap all fail it.
- **Piston Elevator** — Unchanged this round. Every 10 ticks, if the block under the player's feet is a Slime Block, Honey Block, Piston or Sticky Piston, any gain in altitude since the last sample is added to a running total; stepping off any of those blocks resets the total to zero, so the hundred blocks are continuous. That covers slime flying machines and honey/slime lift shafts alike. The bucket line carries gamemode=!spectator,gamemode=!creative. bacaphd_pe_rise is zeroed on the grant path.
- **Slime Ladder** — REWORKED so a bounce has to be a bounce. The old debounce counted any contact-then-clear cycle, and an ordinary jump from a slime block lifts the feet more than one block, so the block at ~ ~-1 ~ became air, the tag was dropped with OnGround 0 (chain preserved) and the landing counted a 'bounce' -- five standing jumps on one slime block finished it. Now the apex between contacts is measured. detect/slime_bounce fires only on the contact tick (the bucket selector carries tag=!bacaphd.on_slime, so the per-tick cost for a player already standing on slime is one block test and nothing else), latches the contact Y in bacaphd_slime_y and seeds bacaphd_slime_peak with it. While the tag is absent and a chain is live, detect/slime_air maxes bacaphd_slime_peak against the current Y. The next contact runs detect/slime_hop, which requires peak - landing Y >= 30 decimetres: a plain jump peaks about 1.25 blocks up and fails, a real slime rebound (the block reflects almost the whole fall velocity) clears it easily. A failed hop drops the chain to 0 and the current contact becomes the new first contact. detect/slime_air also zeroes the chain if OnGround reads 1 while the feet block is not slime -- that is the 'touching another block' reset. The grant path clears the chain, the apex and the tag, and creative is excluded because creative flight removes the bouncing entirely.
- **Sorting Facility** — Unchanged this round. A bounded 16x7x16 block scan centred on the player, run on the slow bucket for at most one candidate player per cycle (selected with @r so the cost is capped no matter how many people lack it), counts Hoppers and Chests and grants when both reach 27. The selector carries gamemode=!spectator,gamemode=!creative, since this measures block placement. It checks quantity in a chunk-sized footprint, not that each Hopper actually feeds a Chest - no command can trace redstone or item flow, and the description does not claim otherwise. Both counters are reset at the top of every scan.

</details>

## Statistics — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Copper Baron** | Statistics | Mine ten thousand Copper Ore | 65 |
| ◆ | **Golem Foreman** | Statistics | Build Copper Golems, and place a hundred Carved Pumpkins doing it | 65 |
| ◆ | **Harness Hours** | Statistics | Spend ten in-game days actually flying a Happy Ghast | 75 |
| ◆ | **Shelf Stocker** | Statistics | Place a thousand Shelves | 60 |
| ◆ | **Spear Master** | Statistics | Wear out twenty-five Spears in battle | 65 |
| ◆ | **Wind Walker** | Statistics | Use a thousand Wind Charges | 60 |

<details><summary>How these are detected</summary>

- **Copper Baron** — Two statistic objectives, bacaphd_cu_ore on minecraft.mined:minecraft.copper_ore and bacaphd_cu_deep on minecraft.mined:minecraft.deepslate_copper_ore, are summed into the dummy objective bacaphd_cu_sum by bacaphd:detect/copper_baron every five seconds for non-spectator, non-creative players who lack the advancement, and 10000 grants it. These are live statistic objectives read directly, not saved mirrors compared against a copy, so there is no first-tick false positive and no shared delta to consume; bacaphd_cu_sum is rebuilt from zero every pass and reset on the grant path.
- **Golem Foreman** — The 'first_golem' criterion is BACAP's own Beep Bop structure, a summoned_entity trigger on minecraft:copper_golem verified against blazeandcave:mining/beep_bop.json, so the player must genuinely raise a Copper Golem. The 'hundred' criterion is impossible and is granted by a single bucket_slow line, gated on gamemode=!spectator and gamemode=!creative, when the statistic objective bacaphd_pumpkin (minecraft.used:minecraft.carved_pumpkin) reaches 100. There is no vanilla statistic for golems built, so carved pumpkins placed is the proxy and the description says so rather than promising an exact golem count.
- **Harness Hours** — bucket_slow calls bacaphd:detect/harness_hours every 100 ticks for non-spectator, non-creative players who lack the advancement and have a Happy Ghast within 8 blocks. The function confirms with 'execute on vehicle' that the player's own vehicle is a minecraft:happy_ghast, then hands off to detect/harness_step, which samples Pos[0] and Pos[2] into bacaphd_gx / bacaphd_gz and compares them with the previous sample: the clock only advances 100 ticks when |dx| + |dz| is at least 10 blocks, i.e. the Ghast really travelled during those five seconds. A Happy Ghast hovers in place when unsteered, so the old version paid out to a player who walked away from the keyboard in the saddle; it no longer does. bacaphd_gseen guards the first sample so a fresh mount cannot cash in a teleport, and it is cleared the moment the player is not riding. 240000 ticks of moving flight is roughly twice the flight time behind bacaped:statistics/ghastonaut's 50 km, so this is a rung above it rather than something Ghastonaut implies, and it measures time under power rather than distance.
- **Shelf Stocker** — bacaphd:detect/shelf_stocker sums the minecraft.used statistic of all twelve wood Shelves into bacaphd_sh_sum and grants at 1000, resetting the sum afterwards. Block placement goes through ItemStack/BlockItem, which does award Stats.ITEM_USED, so these objectives move. Nothing in vanilla counts items placed onto Shelves, so the IDEAS wording could not be measured; shelves placed is the nearest real statistic and the description states that plainly. The bucket line is gated on gamemode=!spectator and gamemode=!creative because this measures block placement.
- **Spear Master** — Rebuilt on a statistic that a Spear actually moves. I decompiled Item$Properties.spear in the 26.1.2 jar: a Spear carries KINETIC_WEAPON, PIERCING_WEAPON, ATTACK_RANGE, MINIMUM_ATTACK_CHARGE and WEAPON(1), and no consumable or use component at all - there is no SpearItem class and no code path that awards Stats.ITEM_USED for it, so the seven minecraft.used objectives the previous version summed would have stayed at zero forever. minecraft.broken is Stats.ITEM_BROKEN, awarded from ServerPlayer.onEquippedItemBroken whenever a held item's durability runs out, and WEAPON(1) means a Spear only loses durability when it strikes - so bacaphd_spb_sum is a hit counter weighted by tier (a wooden Spear is 59 strikes), never a crafting counter. bacaphd:detect/spear_master sums the seven tiers and grants at twenty-five broken Spears. Creative is now excluded alongside spectator, matching the rest of the tab; in Creative the durability would never drop anyway.
- **Wind Walker** — A statistic objective bacaphd_wind on minecraft.used:minecraft.wind_charge, checked by one bucket_slow line that selects non-spectator, non-creative players who lack the advancement and whose score is 1000 or more, and grants it. WindChargeItem awards Stats.ITEM_USED itself (confirmed in the 26.1.2 class files), so unlike the Spears this objective really does move. No function needed and nothing to leak, because the objective is the vanilla statistic itself rather than a mirror.

</details>

## Super Challenges — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★★ | **Hanging by a Thread** | Super Challenges | Kill a Warden while on half a heart | 550 |
| ★★ | **Naked and Afraid** | Super Challenges | Kill an Elder Guardian with no armour and no potion effects | 400 |
| ★★ | **Untouchable** | Super Challenges | Kill the Ender Dragon without ever dropping below half health | 600 |

<details><summary>How these are detected</summary>

- **Hanging by a Thread** — Pure criteria, copying BACAP's own 'Miracle Drink' pattern exactly: minecraft:entity_scores against a `health` criterion objective, which reads 1 only while the player is on a single health point, i.e. half a heart. Unlike Cannonball this one is NOT affected by the one-tick lag of the health objective: it asks about a state the player was already in before the kill, not about a change the triggering event itself causes, so reading the value written at the end of the previous player tick is exactly right. The only residual caveat is the reverse case: a player who is at half a heart for less than a full tick could miss it. Unchanged this round.
- **Naked and Afraid** — Pure criteria and no tick cost. minecraft:player_killed_entity on an Elder Guardian, with four inverted equipment conditions (an armour slot holding a stack of count>=1 fails the inversion, so all four must be empty -- the same head/chest/legs/feet equipment shape BACAP uses in monsters/maximum_resistance) and one inverted any_of over the status effects. minecraft:instant_damage is deliberately absent: it is an instantaneous effect that never persists as an active effect. health_boost, luck and unluck are absent because those IDs are not in VALID_IDS.txt for this pack set and none is obtainable in survival. The list covers exactly the 34 attested effects that can actually be active at the moment of the kill. Unchanged this round.
- **Untouchable** — A bacaphd_health objective on the vanilla `health` criterion makes the per-tick check a pure score selector: any player at 9 or less has their bacaphd_untouched flag cleared instantly, costing nothing for everyone else, and that clearing line carries no gamemode filter so it can never be dodged. The flag is only ever restored OUTSIDE the End, at half health or better, so it can no longer be re-armed mid-fight by backing off 200 blocks and healing; once you step through the portal the flag can only go down. When minecraft.killed:minecraft.ender_dragon advances, detect/untouchable refreshes its own mirror (bacaphd_dragon_seen, seeded by detect/init_b2 so a pre-existing dragon kill cannot fire it on the first tick) and grants only if the flag survived. Residual loophole, unchanged and inherent to a kill-triggered check: leaving the End entirely, healing and returning for the last hit re-arms the flag. Unchanged this round.

</details>

## The End — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ★ | **City Planner** | The End | Visit twenty End Cities, each one further out than the last | 250 |
| ★★ | **Dragon Rider** | The End | Spend a full minute within twelve blocks of the Ender Dragon without taking a scratch | 400 |
| ◆ | **Gateway Tourist** | The End | Teleport through End Gateways ten times | 60 |
| ★ | **Pearl Chain** | The End | Throw five Ender Pearls without touching the ground between teleports | 160 |

<details><summary>How these are detected</summary>

- **City Planner** — Mechanism unchanged; the only change is housekeeping. A site requires BOTH a Shulker within 24 blocks AND the player standing on the city's own purpur or end stone brick floor. The dedupe is monotonic: bacaphd_cp_lr holds the distance from the centre of the End of the last banked city, and a new site only counts if it is at least 1000 blocks FURTHER out than that, so the radius can only ever rise - no city can be banked twice and no pair can be alternated. detect/city_planner_done now clears bacaphd_cp_lr as well as bacaphd_cpcount, so nothing is left behind on a completed player, which is what every other counter in the batch already did.
- **Dragon Rider** — FIXED - the minute is now unbroken. Leaving the twelve-block radius previously only stopped the timer incrementing, so 120 separate fly-bys spread over an evening completed it; detect/dragon_rider now zeroes bacaphd_drtimer whenever no dragon is within range, on the line immediately before the increment, so the 120 clean half-second samples have to be consecutive. Any increase in minecraft.custom:minecraft.damage_taken also wipes the timer. The radius is 12 blocks rather than 5 because entity selectors measure to the dragon's origin rather than to its hitbox parts, and outside the perch phase that origin sits well above anything a player can reach. The damage mirror bacaphd_dr_dmg is private to this advancement (it does not share with Magma Marathon's) and is seeded from the player's lifetime total by detect/init_b4, with the bucket line refusing to run until that has happened. The timer is zeroed on the grant path.
- **Gateway Tourist** — Unchanged this round. A gateway trip is detected as a jump of 200+ horizontal blocks between two consecutive medium-bucket samples half a second apart while the player stays in the End; nothing else in the game moves a player that far that fast (elytra with rockets manages about 25 blocks per sample). The bucket line carries gamemode=!spectator,gamemode=!creative. A counter reaches ten and the advancement is granted, and bacaphd_gwcount is zeroed on that path. This counts trips, not distinct gateways, so shuttling back and forth also works - that is intended.
- **Pearl Chain** — A per-tick score comparison spots the minecraft.used:minecraft.ender_pearl statistic advancing; on that tick detect/pearl_throw refreshes its own mirror and, for a player who is neither spectating nor in creative, either increments the chain (airborne throw) or zeroes it. 'Airborne' is not just OnGround==0: standing on a ladder or floating in water both read OnGround 0, which would have let a player farm the whole chain from a single ladder rung, so detect/pearl_grounded also treats a #minecraft:climbable feet block or a water feet block as grounded. A second per-tick line, gated on chain>=1 so it costs nothing for everyone else, zeroes the chain the moment any of those three conditions holds. The mirror is seeded by detect/init_b2 before any delta line is allowed to run, so a player who threw pearls before the pack was installed does not trip a phantom delta, and the chain is zeroed on the grant path. Unchanged this round.

</details>

## Weaponry — Hidden Depths

| | Advancement | Tab | What you do | XP |
|---|---|---|---|---|
| ◆ | **Boomerang Bones** | Weaponry | Take a Skeleton's arrow, then put one straight back inside ten seconds | 45 |
| · | **Own Goal** | Weaponry | Throw an Ender Pearl and die at the other end of it | 20 |

<details><summary>How these are detected</summary>

- **Boomerang Bones** — All three criteria required; `counted` is minecraft:impossible so the criteria themselves never grant. The literal idea is impossible in vanilla - arrows fired by mobs carry Pickup 0 (DISALLOWED) and are removed on impact - so the advancement is 'a Skeleton shot you, and you shot a Skeleton dead within ten seconds' instead. The ordering is now airtight within a single medium tick: detect/boomerang_shot opens the window at 21, and detect/boomerang_kill only spends a window of 1..20. Because bucket_medium evaluates the shot line before the kill line and the decrement line after both, a window opened in the same 0.5 s sample as the kill still reads 21 when the kill line looks at it and is rejected; the decrement brings it to 20 at the end of that same sample, so a kill on any LATER sample is accepted. The effective window is therefore twenty medium ticks, ten seconds, starting from the sample after the arrow landed. spectral_arrow is absent from shot_by_skeleton (Skeletons only ever fire minecraft:arrow) but kept on the return shot. Both bucket lines carry `unless entity @s[advancements={...=true}]` so a criterion is never revoked out of a completed advancement.
- **Own Goal** — An Ender Pearl teleport deals exactly 5.0 damage of DamageTypes.FALL with no source entity, so criterion pearl_fall is 'exactly 5.0 raw damage of a #minecraft:is_fall type'; `counted` is minecraft:impossible so the criteria alone never grant. Three independent things must now line up. (1) pearl_fall fired. (2) the health objective reads 0 on the very next tick. (3) one of this player's own pearls was thrown within the last six seconds AND the player has moved at least eight blocks horizontally away from the spot they threw it from. That third clause is what closes the eight-block-ledge false positive: an ordinary eight-block fall also deals exactly 5.0, but the ledge is normally right where you are standing, whereas a pearl by definition puts you somewhere else - which is what the description promises. detect/own_goal_arm latches the throw position with `data get entity @s Pos[0]/Pos[2]`, and detect/own_goal_check takes the absolute value of each axis difference with a max against its own negation and requires max(|dx|,|dz|) >= 8. The window was pulled back from twelve seconds to six now that displacement carries the weight. The criterion is revoked on every visit so it re-arms, and the bucket line carries `unless entity @s[advancements={...=true}]` so a completed advancement is never un-completed.

</details>

## Progression — Hidden Depths

Milestones unlock as you finish each tab, chaining into the pack's capstone. They live in the BlazeandCave's Advancements tab, not the tab they track.

| | Advancement | Tab | Requirement | XP |
|---|---|---|---|---|
| ◆ | **Hidden Depths Adventure Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Adventure tab | 500 |
| ◆ | **Hidden Depths Animals Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Animals tab | 500 |
| ◆ | **Hidden Depths Biomes Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Biomes tab | 500 |
| ◆ | **Hidden Depths Building Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Building tab | 500 |
| ◆ | **Hidden Depths Super Challenges Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Super Challenges tab | 500 |
| ◆ | **Hidden Depths Enchanting Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Enchanting tab | 500 |
| ◆ | **Hidden Depths The End Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the The End tab | 500 |
| ◆ | **Hidden Depths Farming Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Farming tab | 500 |
| ★★★ | **Hidden Depths Legend** | BlazeandCave's Advancements | Complete every single advancement in Hidden Depths | 1500 |
| ◆ | **Hidden Depths Mining Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Mining tab | 500 |
| ◆ | **Hidden Depths Monsters Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Monsters tab | 500 |
| ◆ | **Hidden Depths Nether Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Nether tab | 500 |
| ◆ | **Hidden Depths Potions Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Potions tab | 500 |
| ◆ | **Hidden Depths Redstone Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Redstone tab | 500 |
| ◆ | **Hidden Depths Statistics Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Statistics tab | 500 |
| ◆ | **Hidden Depths Weaponry Milestone** | BlazeandCave's Advancements | Complete every Hidden Depths advancement in the Weaponry tab | 500 |

---

# Alphabetical index

All 75 advancements, A to Z, with the tab each one appears in.

| Advancement | Tab | | What you do |
|---|---|---|---|
| **Abyssal Jouster** | Biomes | ★ | Kill a Drowned with a Spear charge while riding a Nautilus |
| **Alchemist's Shelf** | Potions | ◆ | Place every type of Potion onto Shelves |
| **Angler's Atlas** | Biomes | ★★ | Catch a fish in every Overworld biome |
| **Armada** | Biomes | ★ | Gather twenty Nautiluses in Nautilus Armor around you |
| **Armadillo Roller** | Animals | · | Startle an Armadillo into rolling up five separate times |
| **Bad Trip** | Potions | ◆ | Suffer Nausea, Blindness and Darkness all at the same time |
| **Bee Movie** | Animals | ★ | Have twenty Bees leave their stingers in you and live to tell it |
| **Boat Drop** | Adventure | ◆ | Survive a sixty-block fall while sitting in a boat |
| **Book Worm** | Enchanting | ◆ | Fill every single slot of your inventory with Enchanted Books |
| **Boomerang Bones** | Weaponry | ◆ | Take a Skeleton's arrow, then put one straight back inside ten seconds |
| **Bundle of Everything** | Adventure | ◆ | Collect all sixteen colours of Bundle |
| **Cake Hoarder** | Farming | ◆ | Place sixty-four Cakes without ever leaving the chunk |
| **Cannonball** | Redstone | ★ | Get thrown a hundred blocks sideways by TNT and survive the landing |
| **Cartographer's Wall** | Building | ◆ | Hang nine filled Maps in item frames on a single wall |
| **Chunk Miner** | Mining | ★★ | Strip an entire Overworld chunk down to bedrock, leaving nothing but air |
| **City Planner** | The End | ★ | Visit twenty End Cities, each one further out than the last |
| **Climate Croakers** | Animals | ◆ | Breed a pair of Temperate Frogs, a pair of Warm Frogs and a pair of Cold Frogs |
| **Clock Tower** | Redstone | ◆ | Wire a Daylight Detector to a Bell at least five blocks below it, using eight pieces of redstone |
| **Cold Blooded** | Biomes | ◆ | Survive a full night in a Frozen Peaks biome wearing no armor at all |
| **Copper Baron** | Statistics | ◆ | Mine ten thousand Copper Ore |
| **Copper Counter** | Redstone | ◆ | Wire up sixteen Copper Bulbs and get them showing a mixed on-off pattern |
| **Copper Loadout** | Mining | ◆ | Hold a full set of Copper tools and Copper armour at once |
| **Copper Stable** | Animals | ◆ | Ride a kilometre without dismounting on a horse in Copper Horse Armor |
| **Cursed** | Enchanting | ★ | Wear a full set of armour with both Curse of Binding and Curse of Vanishing on every piece |
| **Death by Committee** | Monsters | ★ | Be wounded by ten different kinds of monster inside thirty seconds and survive |
| **Deep Pockets** | Mining | ★ | Fill a Shulker Box to the brim with Diamonds |
| **Disenchanted** | Enchanting | · | Strip an Enchanted Book back down to a plain Book on a Grindstone |
| **Dragon Rider** | The End | ★★ | Spend a full minute within twelve blocks of the Ender Dragon without taking a scratch |
| **Farm to Table** | Farming | ★ | Grow wheat, potatoes and beetroot in the End, then eat the whole harvest there |
| **Featherweight** | Adventure | ★ | Kill the Wither with no armour and nothing but a sword, a bow and a stack of arrows |
| **Free Solo** | Adventure | ★ | Climb two hundred blocks of ladders or vines without touching the ground |
| **Full Kennel** | Animals | ◆ | Equip Wolves with Wolf Armor in the ten remaining dyes, then gather ten armored Wolves around you |
| **Gateway Tourist** | The End | ◆ | Teleport through End Gateways ten times |
| **Ghast Couture** | Nether | ★ | Ride the same Happy Ghast in all sixteen colours of Harness |
| **Golem Courier** | Mining | ◆ | Catch five Copper Golems carrying items at once |
| **Golem Foreman** | Statistics | ◆ | Build Copper Golems, and place a hundred Carved Pumpkins doing it |
| **Hanging by a Thread** | Super Challenges | ★★ | Kill a Warden while on half a heart |
| **Harness Hours** | Statistics | ◆ | Spend ten in-game days actually flying a Happy Ghast |
| **Harpooner** | Biomes | ◆ | Kill a Guardian with a Spear while underwater |
| **Herbivore** | Farming | ★ | Survive ten in-game days eating only plant-based food |
| **Herding Cats** | Animals | ◆ | Gather all eleven variants of Cat within eight blocks of you |
| **Hoist by Your Own Petard** | Redstone | ◆ | Blow yourself up with TNT that you lit yourself |
| **Ice Road Trucker** | Biomes | ◆ | Travel five hundred blocks by boat over Blue Ice without stopping |
| **Key Master** | Adventure | ◆ | Hold sixteen Trial Keys and sixteen Ominous Trial Keys at once |
| **Magma Marathon** | Nether | ◆ | Swim five hundred blocks through lava under Fire Resistance without taking a single point of damage |
| **Monochrome** | Building | ★ | Pack five hundred blocks of a single dyed colour into one nine-block cube |
| **Naked and Afraid** | Super Challenges | ★★ | Kill an Elder Guardian with no armour and no potion effects |
| **Nether Orchard** | Farming | ◆ | Bone meal a sapling into a full tree in the Nether |
| **Ominous Marathon** | Adventure | ★ | Open an Ominous Vault in five separate Trial Chambers |
| **Overdose** | Potions | ★ | Hold twelve potion effects at once, each with thirty seconds still to run |
| **Own Goal** | Weaponry | · | Throw an Ender Pearl and die at the other end of it |
| **Pacifist Streak** | Monsters | ★ | Go five in-game days without killing a single mob |
| **Parrot Choir** | Animals | ◆ | Tame a Parrot of every color, then get five of them dancing at one Jukebox |
| **Patina Parade** | Mining | ★ | Pose a Copper Golem Statue at every stage of oxidation, in every pose |
| **Pearl Chain** | The End | ★ | Throw five Ender Pearls without touching the ground between teleports |
| **Piston Elevator** | Redstone | ★ | Ride a piston-powered elevator a hundred blocks upward |
| **Portal Sniper** | Nether | ★ | Go two hundred blocks deep into the Nether and come back out within ten blocks of where you went in |
| **Pyrrhic Victory** | Monsters | ★ | Kill the Wither and be killed by the very same blast |
| **Rainbow Rigging** | Nether | ◆ | Collect all sixteen colours of Happy Ghast Harness |
| **Roof Runner** | Nether | ★ | Travel two thousand blocks on top of the Nether roof |
| **Shelf Museum** | Building | ◆ | Place a Shelf made from every type of wood |
| **Shelf Stocker** | Statistics | ◆ | Place a thousand Shelves |
| **Skyscraper** | Building | ★ | Build a solid column from bedrock all the way to the build limit |
| **Slime Ladder** | Redstone | ◆ | Bounce five times in a row on Slime Blocks, each at least three blocks high |
| **Sniffer Sommelier** | Farming | ◆ | Have a Sniffer turn up both ancient seeds on the same day |
| **Sorting Facility** | Redstone | ◆ | Cram twenty-seven Hoppers and twenty-seven Chests into one storage room |
| **Soul Speed Demon** | Nether | ◆ | Cover five thousand blocks of Soul Sand and Soul Soil wearing Soul Speed III |
| **Sourdough** | Farming | · | Bake bread in the Nether from wheat you planted there |
| **Spear Master** | Statistics | ◆ | Wear out twenty-five Spears in battle |
| **Torchbearer** | Mining | · | Place sixty-four Copper Torches |
| **Untouchable** | Super Challenges | ★★ | Kill the Ender Dragon without ever dropping below half health |
| **Vein Miner** | Mining | ◆ | Break nine Diamond Ore in a single minute |
| **Vertical Limit** | Mining | ★ | Go from bedrock to the build limit in under sixty seconds |
| **Wind Rider** | Adventure | ◆ | Get thrown eighty blocks sideways by a Wind Charge |
| **Wind Walker** | Statistics | ◆ | Use a thousand Wind Charges |

**75 advancements in total.**
