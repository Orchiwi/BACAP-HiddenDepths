> **This is an alpha.** The pack builds clean and passes every automated check, but the
> advancements have not been played through on a live server. Expect some not to fire, and
> please open an issue when one doesn't — that feedback is the point of the alpha.

**9,398 solo advancements for BlazeandCave's Advancements Pack.** Weighted towards the Copper
Age content no other pack covers — the 16 coloured Happy Ghast harnesses, 16 bundle colours
and 15 shelf wood types had no advancements at all. None duplicates any of the advancements
already in BACAP or BACAP Enhanced Discoveries.

### Install

Download **`BACAP-HiddenDepths-v0.1.0-alpha.16.zip`** below and drop it into
your world's `datapacks/` folder next to the BACAP zip, then `/reload`.

```
<world>/datapacks/
  BlazeandCave's Advancements Pack 1.21.zip            <- required, install first
  BACAP-HiddenDepths-v0.1.0-alpha.16.zip                        <- this pack (rename freely)
```

**BACAP is required.** This pack registers through BACAP's fanpack hooks, so scoreboard
totals, points and `/trigger bac_progress` stay correct. Without BACAP it does nothing. It
hooks onto BACAP's existing tabs rather than adding new ones, and adds its own milestone
chain ending in *Hidden Depths Legend*.

### What's in it

9,398 advancements across 15 tabs: Adventure 787, Enchanting 765, Building 757, Animals 744, Biomes 719, Redstone 706, Nether 674, The End 667, Farming 665, Mining 652, Potions 612, Weaponry 586, Monsters 568, Statistics 410, Super Challenges 86. Full list with tiers and XP in
[`ADVANCEMENTS.md`](../blob/main/ADVANCEMENTS.md).

Everything is completable solo — Copper Age collections, spear and nautilus work, movement
and physics stunts, restriction challenges, and a few deliberately silly ones.

### Notes

Built for **Paper 26.2** with BACAP and Enhanced Discoveries installed. 1,216 of them are tiered statistic ladders of 3-9 rungs each; the rest are one-off feats in BACAP's own idiom, including 86 super challenges built to be hard rather than long. 1,609 of the 2,372 use
tick-driven detection for block scans, movement streaks and statistic tracking that
advancement criteria cannot express; every check is gated on players who do not yet hold
the advancement, so completed entries stop costing anything. The heaviest is Chunk Miner,
which compares three whole chunks.

`/function bacaphd:diagnose` prints a heartbeat for the tick chain if you ever need to
confirm it is running.

Advancements that rely on version-specific behaviour are written to fail closed, so if one
never fires that is the expected symptom of a wrong assumption rather than a broken world.
Please open an issue with the name and what you did.
