# Chain Reaction. minecraft:target_hit only ever fires for the player who owns the
# projectile, so a dispenser-fired arrow triggers nothing - the criterion below is
# the player's OWN opening shot and nothing more. Revoke it straight away, the way
# Soul Speed Demon revokes its soul_speed criterion, so the next shot has to re-prove
# itself instead of latching the window open forever. The window is six samples of
# the 10-tick bucket; an arrow leaves a Target powered for 20 ticks, so a real relay
# is always caught with all three Targets still lit.
advancement revoke @s only bacaphd:redstone/chain_reaction first_shot
scoreboard players set @s bacaphd_cr_win 6
