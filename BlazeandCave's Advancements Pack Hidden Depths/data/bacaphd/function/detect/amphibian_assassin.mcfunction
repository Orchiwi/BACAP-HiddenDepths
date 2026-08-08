# S8 Amphibian Assassin. Runs AS a slime_ball item entity, AT that item, dispatched from
# bucket_fast only for an ungranted non-spectator who has a Frog within sixteen blocks.
#
# `unless data entity @s Thrower` is the entire reason this is a function rather than a
# bucket line: an item a player dropped or threw carries a Thrower UUID, an item a mob or
# a Frog spat out does not, and a selector's nbt= argument can only test for presence,
# never absence. Without it a player could toss a slimeball at a Frog's feet and claim it.
#
# The Frog radius is deliberately tight - a Frog that has just swallowed a Slime is
# standing on top of the drop - and both entity selectors are bounded by distance= and
# limit=. @p cannot reach past the sixteen-block dispatch radius, and the advancement
# filter on it means an already-granted bystander cannot absorb the credit.
execute unless data entity @s Thrower if entity @e[type=minecraft:frog,distance=..2.5,limit=1] run advancement grant @p[distance=..16,gamemode=!spectator,advancements={bacaphd:animal/amphibian_assassin=false}] only bacaphd:animal/amphibian_assassin
