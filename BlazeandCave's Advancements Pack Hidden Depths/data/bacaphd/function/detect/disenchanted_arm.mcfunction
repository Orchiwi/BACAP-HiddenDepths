# The baseline is the PREVIOUS sample's counts, not this one's: the statistic is
# only seen up to half a second after the menu opened, and a fast player can
# already have the book in the input slot by then.
scoreboard players set @s bacaphd_dis_w 60
scoreboard players operation @s bacaphd_dis_pmb = @s bacaphd_dis_qmb
scoreboard players operation @s bacaphd_dis_pbk = @s bacaphd_dis_qbk
