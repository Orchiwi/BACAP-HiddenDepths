# B34 Death by Committee. An entity has drawn blood. If no window is running, start a
# fixed thirty second one (60 medium ticks); nothing refreshes it once started, so
# standing in a fire or letting a single mob chip at you cannot hold it open.
# Once the advancement is held the timer is parked for good, so no later tick can ever
# revoke a completed advancement.
execute if entity @s[advancements={bacaphd:monsters/death_by_committee=true}] run scoreboard players set @s bacaphd_committee -1
execute unless entity @s[advancements={bacaphd:monsters/death_by_committee=true}] if score @s bacaphd_committee matches -1 run scoreboard players set @s bacaphd_committee 60
