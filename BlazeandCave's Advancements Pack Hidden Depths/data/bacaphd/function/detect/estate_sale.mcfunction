# Estate Sale. Reached only for a player who has already proved both halves the vanilla
# triggers can prove: a killed Wandering Trader, and a lead used on a Trader Llama.
# `player_interacted_with_entity` only fires when the interaction was CONSUMED, and a
# llama still leashed to a living Trader refuses a second lead, so the `llama` criterion
# already means the leash took hold. What neither criterion can express is the causal
# chain in the description - that the llama came away WITH you and that its Trader is gone.
# That is the whole job of this file, and it is why the impossible guard sits in its own
# AND group: the two criteria alone must never finish the advancement.
# 6 blocks is inside the leash's own tether length, so it means "at your heels", not
# "somewhere in the chunk". 24 blocks is well outside the caravan range a Wandering
# Trader keeps its llamas on, so any living owner anywhere near blocks the grant.
# Both selectors are type-filtered, distance-bounded and limited; never an open @e.
execute if entity @e[type=minecraft:trader_llama,distance=..6,limit=1] unless entity @e[type=minecraft:wandering_trader,distance=..24,limit=1] run advancement grant @s only bacaphd:adventure/estate_sale estate
