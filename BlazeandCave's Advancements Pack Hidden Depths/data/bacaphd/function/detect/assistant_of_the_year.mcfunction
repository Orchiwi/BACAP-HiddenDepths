# S8 Assistant of the Year. Runs as an ungranted non-spectator with at least one Allay
# within twelve blocks, at that player.
#
# An Allay carries the stack it is fetching in its main hand and empties that hand at the
# moment it hands it over, so one main-hand full -> empty transition is one delivery. The
# state is stored as a tag on the ALLAY, not on the player: it survives chunk unloads and
# relogs, and the same delivery cannot be counted twice by two samples.
#
# bacaphd.aoty_self carries this player's identity across the `as @e` hop, which moves the
# executor to the Allay. This function runs one player at a time, so the tag is only ever
# on a single player, and it is removed again before the grant test.
# Order matters: score and untag the emptied Allays FIRST, then re-tag whoever is holding
# something, otherwise an Allay that refilled inside the same sample would be scored twice.
tag @s add bacaphd.aoty_self
execute as @e[type=minecraft:allay,distance=..12,limit=8,tag=bacaphd.aoty_held] unless items entity @s weapon.mainhand * run scoreboard players add @a[tag=bacaphd.aoty_self] bacaphd_allay 1
execute as @e[type=minecraft:allay,distance=..12,limit=8,tag=bacaphd.aoty_held] unless items entity @s weapon.mainhand * run tag @s remove bacaphd.aoty_held
execute as @e[type=minecraft:allay,distance=..12,limit=8] if items entity @s weapon.mainhand * run tag @s add bacaphd.aoty_held
tag @s remove bacaphd.aoty_self
execute if score @s bacaphd_allay matches 1000.. run advancement grant @s only bacaphd:statistics/assistant_of_the_year
