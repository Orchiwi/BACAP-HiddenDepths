# Bless You. The slime-ball criterion has just fired for this player. Read the Age of the
# nearest Panda in melee range - only a cub carries a negative Age - and grant on that.
# The score is zeroed first so a stale reading from an earlier sample cannot pass, and the
# `if entity` guard means the `data get` is only attempted when there is something to read.
# The re-arm is guarded: revoking a criterion of an advancement that was just completed
# would tear the completion straight back down.
scoreboard players set @s bacaphd_cub 0
execute if entity @e[type=minecraft:panda,distance=..6,limit=1,sort=nearest] store result score @s bacaphd_cub run data get entity @e[type=minecraft:panda,distance=..6,limit=1,sort=nearest] Age
execute if score @s bacaphd_cub matches ..-1 run advancement grant @s only bacaphd:animal/bless_you
execute unless entity @s[advancements={bacaphd:animal/bless_you=true}] run advancement revoke @s only bacaphd:animal/bless_you slime
