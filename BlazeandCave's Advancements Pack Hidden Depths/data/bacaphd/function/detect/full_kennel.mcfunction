# B60 Full Kennel - ten ARMOURED Wolves gathered around the player at once.
# Wild unarmoured wolves must not pad the count, so the selector requires the body slot
# to hold Wolf Armor (1.21.5+ unified 'equipment' compound).
execute store result score #h5_wolves bacaphd_tmp if entity @e[type=minecraft:wolf,distance=..16,nbt={equipment:{body:{id:"minecraft:wolf_armor"}}}]
execute if score #h5_wolves bacaphd_tmp matches 10.. run advancement grant @s only bacaphd:animal/full_kennel kennel
