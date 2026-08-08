# `data get` on an NBT LIST returns its length, so the whole simultaneous-effect count
# is one command and there is no per-effect predicate to keep in step with the game.
# On a player carrying no effects the path does not exist, the command fails, and
# `execute store result` writes 0 - which is the right answer anyway.
# Called from bucket_medium, i.e. once every 10 ticks, so +10 per sample is one game
# tick per game tick and 24000 is exactly one in-game day held unbroken.
execute store result score @s bacaphd_eff run data get entity @s active_effects
execute if score @s bacaphd_eff matches 8.. run scoreboard players add @s bacaphd_chem 10
execute if score @s bacaphd_eff matches ..7 run scoreboard players set @s bacaphd_chem 0
execute if score @s bacaphd_chem matches 24000.. run advancement grant @s only bacaphd:potion/chemical_dependency
