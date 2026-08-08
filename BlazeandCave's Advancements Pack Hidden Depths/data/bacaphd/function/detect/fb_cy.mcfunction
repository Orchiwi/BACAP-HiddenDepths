scoreboard players set @s bacaphd_fbz 0
function bacaphd:detect/fb_cz
scoreboard players add @s bacaphd_fbv 1
execute if score @s bacaphd_fbv matches ..2 positioned ~ ~1 ~ run function bacaphd:detect/fb_cy
