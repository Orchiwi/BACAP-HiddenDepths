# Breaking Bad. Runs as a player whose brewed_potion criterion is set and whose impossible
# guard is not, once per tick.
# Revoke FIRST. brewed_potion fires once per finished bottle pulled off the stand, and a
# bottle taken on the very next tick has to find the doorbell un-pressed. Crediting first
# and revoking after would lose every brew that lands in the same tick as the grant.
advancement revoke @s only bacaphd:potion/breaking_bad brewed
scoreboard players add @s bacaphd_brews 1
execute if score @s bacaphd_brews matches 1000.. run advancement grant @s only bacaphd:potion/breaking_bad
