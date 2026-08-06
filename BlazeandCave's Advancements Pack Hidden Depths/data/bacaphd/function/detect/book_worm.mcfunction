# B44 Book Worm. Enchanted Books do not stack, so a count of 36 is literally
# every one of the 27 inventory slots and 9 hotbar slots holding one.
scoreboard players set @s bacaphd_books 0
execute store result score @s bacaphd_bktmp if items entity @s inventory.* minecraft:enchanted_book
scoreboard players operation @s bacaphd_books += @s bacaphd_bktmp
execute store result score @s bacaphd_bktmp if items entity @s hotbar.* minecraft:enchanted_book
scoreboard players operation @s bacaphd_books += @s bacaphd_bktmp
execute if score @s bacaphd_books matches 36.. run advancement grant @s only bacaphd:enchanting/book_worm
