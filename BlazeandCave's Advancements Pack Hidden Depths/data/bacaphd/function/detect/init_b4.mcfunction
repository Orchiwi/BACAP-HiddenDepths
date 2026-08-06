# Runs once per player, from the fast bucket, before any of this batch's
# statistic comparisons are allowed to run. A mirror that starts at zero on an
# existing save reads the player's whole history as a fresh event.
# The two damage mirrors are deliberately separate: sharing one pair between
# Magma Marathon and Dragon Rider would make them eat each other's deltas.
scoreboard players set @s bacaphd_init_b4 1
scoreboard players operation @s bacaphd_mm_dmg = @s bacaphd_dmg
scoreboard players operation @s bacaphd_dr_dmg = @s bacaphd_dmg
scoreboard players operation @s bacaphd_gr_prev = @s bacaphd_grind
scoreboard players set @s bacaphd_dis_w 0
scoreboard players set @s bacaphd_cp_lr 0
scoreboard players set @s bacaphd_ps_arm 0
scoreboard players set @s bacaphd_ps_has 0
scoreboard players set @s bacaphd_ps_pdim 2
