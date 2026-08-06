# B2 Ghast Couture. Runs as an ungranted player standing near a Happy Ghast.
# Everything below is a no-op unless that player is actually RIDING a harnessed
# Happy Ghast: a Happy Ghast can only be ridden once a Harness has been fitted to
# it, so "ridden wearing this colour" is a faithful stand-in for "fitted with this
# colour", and a passer-by can no longer be granted for a ghast someone else dressed.
# bacaphd.gc_self carries this player's identity across the `on vehicle` hop, which
# moves the executor to the ghast. The function runs one player at a time, so the
# tag is only ever on a single player, and it is removed again on the last line.
# Going back with `on passengers` instead would have granted every passenger, up to
# four people, only one of whom did the work.
tag @s add bacaphd.gc_self
execute on vehicle if entity @s[type=minecraft:happy_ghast] if items entity @s armor.body * run function bacaphd:detect/ghast_couture_tag
execute on vehicle if entity @s[type=minecraft:happy_ghast,tag=bacaphd.h_new,tag=bacaphd.h_white,tag=bacaphd.h_orange,tag=bacaphd.h_magenta,tag=bacaphd.h_light_blue,tag=bacaphd.h_yellow,tag=bacaphd.h_lime,tag=bacaphd.h_pink,tag=bacaphd.h_gray,tag=bacaphd.h_light_gray,tag=bacaphd.h_cyan,tag=bacaphd.h_purple,tag=bacaphd.h_blue,tag=bacaphd.h_brown,tag=bacaphd.h_green,tag=bacaphd.h_red,tag=bacaphd.h_black] run advancement grant @a[tag=bacaphd.gc_self] only bacaphd:nether/ghast_couture
execute on vehicle if entity @s[type=minecraft:happy_ghast] run tag @s remove bacaphd.h_new
tag @s remove bacaphd.gc_self
