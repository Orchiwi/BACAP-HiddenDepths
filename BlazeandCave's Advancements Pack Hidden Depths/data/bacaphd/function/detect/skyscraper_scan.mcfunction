scoreboard players set @s bacaphd_col 0
scoreboard players set @s bacaphd_sy 0
execute positioned ~ -64 ~ run function bacaphd:detect/skyscraper_y
# y -64 to y 319 inclusive is 384 blocks: bedrock floor to build limit.
execute if score @s bacaphd_col matches 384 run advancement grant @s only bacaphd:building/skyscraper
