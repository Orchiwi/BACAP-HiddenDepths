# B45 Disenchanted. Anchored to the vanilla statistic
# minecraft.custom:minecraft.interact_with_grindstone, mirrored as bacaphd_grind.
# While the book sits in the Grindstone's input slot it is inside the MENU
# container, not inventory.* / hotbar.* / weapon.offhand, so the enchanted book
# vanishing and the plain book appearing are always two separate clicks and can
# never land in one sample. Opening a Grindstone therefore arms a sixty-sample
# (thirty second) window and snapshots the two counts as of the PREVIOUS sample,
# which is before the menu opened even if the player inserts immediately.
# Anywhere inside that window, fewer Enchanted Books AND more plain Books than
# the snapshot is a strip. No Grindstone means no window, so nothing latches.
scoreboard players set @s bacaphd_dis_mb 0
scoreboard players set @s bacaphd_dis_bk 0
execute store result score @s bacaphd_dis_t if items entity @s inventory.* minecraft:enchanted_book
scoreboard players operation @s bacaphd_dis_mb += @s bacaphd_dis_t
execute store result score @s bacaphd_dis_t if items entity @s hotbar.* minecraft:enchanted_book
scoreboard players operation @s bacaphd_dis_mb += @s bacaphd_dis_t
execute store result score @s bacaphd_dis_t if items entity @s weapon.offhand minecraft:enchanted_book
scoreboard players operation @s bacaphd_dis_mb += @s bacaphd_dis_t
execute store result score @s bacaphd_dis_t if items entity @s inventory.* minecraft:book
scoreboard players operation @s bacaphd_dis_bk += @s bacaphd_dis_t
execute store result score @s bacaphd_dis_t if items entity @s hotbar.* minecraft:book
scoreboard players operation @s bacaphd_dis_bk += @s bacaphd_dis_t
execute store result score @s bacaphd_dis_t if items entity @s weapon.offhand minecraft:book
scoreboard players operation @s bacaphd_dis_bk += @s bacaphd_dis_t
execute if score @s bacaphd_grind > @s bacaphd_gr_prev run function bacaphd:detect/disenchanted_arm
scoreboard players operation @s bacaphd_gr_prev = @s bacaphd_grind
execute if score @s bacaphd_dis_w matches 1.. if score @s bacaphd_dis_mb < @s bacaphd_dis_pmb if score @s bacaphd_dis_bk > @s bacaphd_dis_pbk run function bacaphd:detect/disenchanted_done
execute if score @s bacaphd_dis_w matches 1.. run scoreboard players remove @s bacaphd_dis_w 1
scoreboard players operation @s bacaphd_dis_qmb = @s bacaphd_dis_mb
scoreboard players operation @s bacaphd_dis_qbk = @s bacaphd_dis_bk
