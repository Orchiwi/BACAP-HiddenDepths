scoreboard players set @s bacaphd_fbv 0
function bacaphd:detect/fb_cy
scoreboard players add @s bacaphd_fbx 1
execute if score @s bacaphd_fbx matches ..15 positioned ~1 ~ ~ run function bacaphd:detect/fb_cx
