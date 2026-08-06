# B13 Ominous Marathon. First sight of this player: copy their lifetime ominous key
# usage into the mirror, so a total earned before this pack was installed can never
# be mistaken for a fresh vault unlock on the very next tick. This runs in the fast
# bucket, ahead of the credit line, so it is always ordered before the first read.
scoreboard players operation @s bacaphd_okeyb = @s bacaphd_okey
tag @s add bacaphd.om_init
