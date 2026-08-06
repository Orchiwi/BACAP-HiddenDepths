# BlazeandCave's Advancements Pack Hidden Depths

An add-on for **BlazeandCave's Advancements Pack** adding **75 advancements, all
completable solo**. Weighted towards the Copper Age content neither BACAP nor Enhanced
Discoveries touches — the 16 coloured Happy Ghast harnesses, 16 bundle colours and 15
shelf wood types had no advancements at all. None duplicates any of the 1,776 existing
advancements.

## Install

Download this repository (**Code → Download ZIP**, or clone it) and copy the folder
`BlazeandCave's Advancements Pack Hidden Depths` into your world's `datapacks/` folder, next to the
BACAP zip. Then `/reload`, or restart the server.

```
<world>/datapacks/
  BlazeandCave's Advancements Pack 1.21.zip   <- required, install this first
  BlazeandCave's Advancements Pack Hidden Depths/   <- this pack
```

Minecraft accepts datapacks as plain folders, so no zipping is needed. If you would rather
install a zip, compress the **contents** of that folder — `pack.mcmeta` has to sit at the
root of the archive, not inside another folder.

**BACAP must be installed.** This pack registers through BACAP's fanpack hooks
(`bacap_fanpacks:update_score` and `update_points`) so scoreboard totals, points and
`/trigger bac_progress` stay correct. Without BACAP it does nothing. It hooks onto BACAP's
existing tabs rather than adding new ones, and adds its own milestone chain ending in
*Hidden Depths Legend*.

## What's in it

75 advancements across 15 tabs: Mining 8, Adventure 7, Animals 7, Redstone 7, Biomes 6,
Farming 6, Nether 6, Statistics 6, Building 4, The End 4, Enchanting 3, Monsters 3,
Potions 3, Super Challenges 3, Weaponry 2. See `ADVANCEMENTS.md` for the full list with
tiers and XP.

## Performance

52 of the 75 need tick-driven detection — block scans, movement streaks and statistic
mirrors that advancement criteria cannot express. They are split across three buckets:
every tick, every 0.5 s, and every 5 s. Every check is gated on players who do not yet hold
the advancement, so completed entries stop costing anything permanently. The heaviest is
Chunk Miner, which runs three whole-chunk `fill` comparisons; if the server strains, that
is the first thing to look at.

## Diagnostics

```
/function bacaphd:diagnose
```

Run it twice a few seconds apart. It prints a heartbeat for the tick function and each of
the three dispatch buckets, the player count the buckets see, and BACAP's `bac_settings`
values. If the heartbeats are not rising, the tick chain is not running — check
`logs/latest.log` for `Failed to load function`.

## Test these first

The pack is confirmed loading and running on a live Paper 26.2 server: the load
function initialises, the tick chain dispatches, and advancements grant in play.

What that does **not** prove is that all 75 fire correctly — only that the machinery they
depend on is alive. The entries below rest on behaviour that could not be confirmed
statically, so they are the ones worth a deliberate look as you come to them. Where they
are wrong they fail closed — they do not fire — rather than granting for free.

| Advancement | What to confirm |
|---|---|
| Chunk Miner | that three whole-chunk `fill` compares in one tick do not stall the server, and that carver `cave_air` is handled |
| Ghast Couture, Golem Courier | which inventory slot a Happy Ghast's harness and a Copper Golem's carried item occupy |
| Sniffer Sommelier | that dropped items carry the `Thrower` NBT key |
| Boat Drop, Ice Road Trucker, Wind Rider, Cannonball, Slime Ladder | the movement thresholds, calibrated from published figures rather than measured |
| Spear Master | that Spears accrue the item-broken statistic |
| Disenchanted | that `interact_with_grindstone` increments on a strip |
| Clock Tower, Monochrome, Parrot Choir | the block-scan geometry against a real build |

## Credits and how this was built

An add-on for [BlazeandCave's Advancements Pack]. It requires BACAP and does not modify
it; all of the tabs these advancements appear in, the tier and points system, and the
reward machinery are BACAP's. Full credit for the underlying pack goes to BlazeandCave.

Every advancement here was checked against the 1,776 advancements already in BACAP and
BACAP Enhanced Discoveries so that nothing duplicates them. The pack is generated from a
declarative definition of each advancement rather than hand-written, and a static verifier
checks item and block IDs, triggers, parent references, file completeness and command
safety before each release. That build tooling is kept outside this repository, which holds
the finished datapack only.

## Feedback

If an advancement does not fire when it should, open an issue with its name and what you
did. It is more useful than it sounds: a couple of these rely on version-specific
behaviour, and they are written to fail closed, so a silent no-op is the expected symptom
of a wrong assumption rather than a rare edge case.
