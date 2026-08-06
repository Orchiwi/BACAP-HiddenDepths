# B2 Ghast Couture. Runs as a Happy Ghast that is currently wearing a harness and
# is being ridden by a player who does not yet hold the advancement. A body slot
# holds exactly one item, so at most one colour can match per pass.
# First block: set bacaphd.h_new only when the worn colour is one this ghast has
# never worn before. Second block: record the colour permanently, so colours
# accumulate across sessions. h_new is what makes the grant belong to the rider who
# completed the set instead of to whoever mounts the finished ghast next.
tag @s remove bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_white] if items entity @s armor.body minecraft:white_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_orange] if items entity @s armor.body minecraft:orange_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_magenta] if items entity @s armor.body minecraft:magenta_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_light_blue] if items entity @s armor.body minecraft:light_blue_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_yellow] if items entity @s armor.body minecraft:yellow_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_lime] if items entity @s armor.body minecraft:lime_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_pink] if items entity @s armor.body minecraft:pink_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_gray] if items entity @s armor.body minecraft:gray_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_light_gray] if items entity @s armor.body minecraft:light_gray_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_cyan] if items entity @s armor.body minecraft:cyan_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_purple] if items entity @s armor.body minecraft:purple_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_blue] if items entity @s armor.body minecraft:blue_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_brown] if items entity @s armor.body minecraft:brown_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_green] if items entity @s armor.body minecraft:green_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_red] if items entity @s armor.body minecraft:red_harness run tag @s add bacaphd.h_new
execute unless entity @s[tag=bacaphd.h_black] if items entity @s armor.body minecraft:black_harness run tag @s add bacaphd.h_new
execute if items entity @s armor.body minecraft:white_harness run tag @s add bacaphd.h_white
execute if items entity @s armor.body minecraft:orange_harness run tag @s add bacaphd.h_orange
execute if items entity @s armor.body minecraft:magenta_harness run tag @s add bacaphd.h_magenta
execute if items entity @s armor.body minecraft:light_blue_harness run tag @s add bacaphd.h_light_blue
execute if items entity @s armor.body minecraft:yellow_harness run tag @s add bacaphd.h_yellow
execute if items entity @s armor.body minecraft:lime_harness run tag @s add bacaphd.h_lime
execute if items entity @s armor.body minecraft:pink_harness run tag @s add bacaphd.h_pink
execute if items entity @s armor.body minecraft:gray_harness run tag @s add bacaphd.h_gray
execute if items entity @s armor.body minecraft:light_gray_harness run tag @s add bacaphd.h_light_gray
execute if items entity @s armor.body minecraft:cyan_harness run tag @s add bacaphd.h_cyan
execute if items entity @s armor.body minecraft:purple_harness run tag @s add bacaphd.h_purple
execute if items entity @s armor.body minecraft:blue_harness run tag @s add bacaphd.h_blue
execute if items entity @s armor.body minecraft:brown_harness run tag @s add bacaphd.h_brown
execute if items entity @s armor.body minecraft:green_harness run tag @s add bacaphd.h_green
execute if items entity @s armor.body minecraft:red_harness run tag @s add bacaphd.h_red
execute if items entity @s armor.body minecraft:black_harness run tag @s add bacaphd.h_black
