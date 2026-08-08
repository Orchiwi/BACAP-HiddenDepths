# Fortress of Solitude. Runs every 100 ticks for a player who has not finished it.
# The structure test is done by vanilla, not here: `inside` is an ordinary
# minecraft:location criterion naming minecraft:fortress, and the game re-evaluates the
# location trigger for every player every 20 ticks. So revoking that criterion on each
# sample and finding it back on the next one is proof the player never left, at a
# granularity five times coarser than the trigger's own, which is why it cannot be
# missed. 240 unbroken samples is 24000 ticks - one full Minecraft day.
# Any sample that finds the criterion absent resets the counter to zero, so stepping
# outside the structure for even one sample starts the day over.
execute unless entity @s[advancements={bacaphd:nether/fortress_of_solitude={inside=true}}] run scoreboard players set @s bacaphd_fortress 0
execute if entity @s[advancements={bacaphd:nether/fortress_of_solitude={inside=true}}] run scoreboard players add @s bacaphd_fortress 1
advancement revoke @s only bacaphd:nether/fortress_of_solitude inside
execute if score @s bacaphd_fortress matches 240.. run advancement grant @s only bacaphd:nether/fortress_of_solitude
