> **This is an alpha.** The pack builds clean and passes every automated check, but the
> advancements have not been played through on a live server. Expect some not to fire, and
> please open an issue when one doesn't — that feedback is the point of the alpha.

**275 solo advancements for BlazeandCave's Advancements Pack.** Weighted towards the Copper
Age content no other pack covers — the 16 coloured Happy Ghast harnesses, 16 bundle colours
and 15 shelf wood types had no advancements at all. None duplicates any of the advancements
already in BACAP or BACAP Enhanced Discoveries.

### Install

Download **`BACAP-HiddenDepths-v0.1.0-alpha.3.zip`** below and drop it into
your world's `datapacks/` folder next to the BACAP zip, then `/reload`.

```
<world>/datapacks/
  BlazeandCave's Advancements Pack 1.21.zip            <- required, install first
  BACAP-HiddenDepths-v0.1.0-alpha.3.zip                        <- this pack (rename freely)
```

**BACAP is required.** This pack registers through BACAP's fanpack hooks, so scoreboard
totals, points and `/trigger bac_progress` stay correct. Without BACAP it does nothing. It
hooks onto BACAP's existing tabs rather than adding new ones, and adds its own milestone
chain ending in *Hidden Depths Legend*.

### What's in it

275 advancements across 15 tabs: Biomes 25, Adventure 22, Animals 22, Nether 21, Mining 20,
Building 19, Enchanting 18, Weaponry 18, Farming 18, Redstone 17, Statistics 17,
The End 16, Monsters 16, Potions 16, Super Challenges 10. Full list with tiers and XP in
[`ADVANCEMENTS.md`](../blob/main/ADVANCEMENTS.md).

Everything is completable solo — Copper Age collections, spear and nautilus work, movement
and physics stunts, restriction challenges, and a few deliberately silly ones.

### Notes

Built for **Paper 26.2** with BACAP and Enhanced Discoveries installed. 112 of the 275 use
tick-driven detection for block scans, movement streaks and statistic tracking that
advancement criteria cannot express; every check is gated on players who do not yet hold
the advancement, so completed entries stop costing anything. The heaviest is Chunk Miner,
which compares three whole chunks.

`/function bacaphd:diagnose` prints a heartbeat for the tick chain if you ever need to
confirm it is running.

Advancements that rely on version-specific behaviour are written to fail closed, so if one
never fires that is the expected symptom of a wrong assumption rather than a broken world.
Please open an issue with the name and what you did.
