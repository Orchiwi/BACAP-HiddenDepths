# B34 Death by Committee. Count the window down; when it reaches zero the partial roll
# call is wiped, so the ten mobs have to land inside one thirty second brawl.
scoreboard players remove @s bacaphd_committee 1
execute if score @s bacaphd_committee matches 0 run function bacaphd:detect/committee_reset
