# Raise command limits, matching what BACAP and Enhanced Discoveries do
execute in minecraft:overworld run gamerule max_command_forks 999999999
execute in minecraft:the_nether run gamerule max_command_forks 999999999
execute in minecraft:the_end run gamerule max_command_forks 999999999
execute in minecraft:overworld run gamerule max_command_sequence_length 999999999
execute in minecraft:the_nether run gamerule max_command_sequence_length 999999999
execute in minecraft:the_end run gamerule max_command_sequence_length 999999999

scoreboard objectives add bacaphd_sys dummy
scoreboard objectives add bacaphd_gol dummy
scoreboard objectives add bacaphd_hbase dummy
scoreboard objectives add bacaphd_hdiff dummy
scoreboard objectives add bacaphd_naut dummy
scoreboard objectives add bacaphd_okeyb dummy
scoreboard objectives add bacaphd_px dummy
scoreboard objectives add bacaphd_pz dummy
scoreboard objectives add bacaphd_dx dummy
scoreboard objectives add bacaphd_dz dummy
scoreboard objectives add bacaphd_lx1 dummy
scoreboard objectives add bacaphd_lz1 dummy
scoreboard objectives add bacaphd_lx2 dummy
scoreboard objectives add bacaphd_lz2 dummy
scoreboard objectives add bacaphd_lx3 dummy
scoreboard objectives add bacaphd_lz3 dummy
scoreboard objectives add bacaphd_lx4 dummy
scoreboard objectives add bacaphd_lz4 dummy
scoreboard objectives add bacaphd_lx5 dummy
scoreboard objectives add bacaphd_lz5 dummy
scoreboard objectives add bacaphd_omc dummy
scoreboard objectives add bacaphd_ok dummy
scoreboard objectives add bacaphd_tkeys dummy
scoreboard objectives add bacaphd_okeys dummy
scoreboard objectives add bacaphd_const dummy
scoreboard objectives add bacaphd_init dummy
scoreboard objectives add bacaphd_wither_seen_pv dummy
scoreboard objectives add bacaphd_pearls_seen dummy
scoreboard objectives add bacaphd_pearl_window dummy
scoreboard objectives add bacaphd_pearl_x dummy
scoreboard objectives add bacaphd_pearl_z dummy
scoreboard objectives add bacaphd_boomerang dummy
scoreboard objectives add bacaphd_bee_count dummy
scoreboard objectives add bacaphd_committee dummy
scoreboard objectives add bacaphd_cakes_seen dummy
scoreboard objectives add bacaphd_cakes_chunk dummy
scoreboard objectives add bacaphd_chunk_x dummy
scoreboard objectives add bacaphd_chunk_z dummy
scoreboard objectives add bacaphd_chunk_x_last dummy
scoreboard objectives add bacaphd_chunk_z_last dummy
scoreboard objectives add bacaphd_scan_x dummy
scoreboard objectives add bacaphd_scan_z dummy
scoreboard objectives add bacaphd_torch_day dummy
scoreboard objectives add bacaphd_pitcher_day dummy
scoreboard objectives add bacaphd_day dummy
scoreboard objectives add bacaphd_gametime dummy
scoreboard objectives add bacaphd_ore_diamond_seen dummy
scoreboard objectives add bacaphd_ore_deepslate_seen dummy
scoreboard objectives add bacaphd_vein dummy
scoreboard objectives add bacaphd_vein_start dummy
scoreboard objectives add bacaphd_calc dummy
scoreboard objectives add bacaphd_calc2 dummy
scoreboard objectives add bacaphd_init_b2 dummy
scoreboard objectives add bacaphd_in_boat dummy
scoreboard objectives add bacaphd_bd_y dummy
scoreboard objectives add bacaphd_bd_prev dummy
scoreboard objectives add bacaphd_bd_d dummy
scoreboard objectives add bacaphd_bd_n dummy
scoreboard objectives add bacaphd_bd_top dummy
scoreboard objectives add bacaphd_bd_seed dummy
scoreboard objectives add bacaphd_on_ice dummy
scoreboard objectives add bacaphd_ice_x dummy
scoreboard objectives add bacaphd_ice_z dummy
scoreboard objectives add bacaphd_ice_dx dummy
scoreboard objectives add bacaphd_ice_dz dummy
scoreboard objectives add bacaphd_ice_hi dummy
scoreboard objectives add bacaphd_ice_lo dummy
scoreboard objectives add bacaphd_ice_dist dummy
scoreboard objectives add bacaphd_ice_seed dummy
scoreboard objectives add bacaphd_vl_t dummy
scoreboard objectives add bacaphd_vl_y dummy
scoreboard objectives add bacaphd_fs_ok dummy
scoreboard objectives add bacaphd_fs_on dummy
scoreboard objectives add bacaphd_fs_y dummy
scoreboard objectives add bacaphd_fs_start dummy
scoreboard objectives add bacaphd_fs_climb dummy
scoreboard objectives add bacaphd_pearl_seen dummy
scoreboard objectives add bacaphd_pearl_chain dummy
scoreboard objectives add bacaphd_pearl_grd dummy
scoreboard objectives add bacaphd_slime_chain dummy
scoreboard objectives add bacaphd_slime_grd dummy
scoreboard objectives add bacaphd_slime_y dummy
scoreboard objectives add bacaphd_slime_peak dummy
scoreboard objectives add bacaphd_untouched dummy
scoreboard objectives add bacaphd_dragon_seen dummy
scoreboard objectives add bacaphd_fw_kit dummy
scoreboard objectives add bacaphd_fw_inv dummy
scoreboard objectives add bacaphd_fw_sword dummy
scoreboard objectives add bacaphd_fw_bow dummy
scoreboard objectives add bacaphd_fw_arrow dummy
scoreboard objectives add bacaphd_fw_want dummy
scoreboard objectives add bacaphd_meat dummy
scoreboard objectives add bacaphd_meat_seen dummy
scoreboard objectives add bacaphd_herb_ticks dummy
scoreboard objectives add bacaphd_kills_seen dummy
scoreboard objectives add bacaphd_pac_ticks dummy
scoreboard objectives add bacaphd_hi dummy
scoreboard objectives add bacaphd_lo dummy
scoreboard objectives add bacaphd_sx dummy
scoreboard objectives add bacaphd_sy dummy
scoreboard objectives add bacaphd_sz dummy
scoreboard objectives add bacaphd_init_b4 dummy
scoreboard objectives add bacaphd_books dummy
scoreboard objectives add bacaphd_bktmp dummy
scoreboard objectives add bacaphd_dis_mb dummy
scoreboard objectives add bacaphd_dis_bk dummy
scoreboard objectives add bacaphd_dis_t dummy
scoreboard objectives add bacaphd_dis_pmb dummy
scoreboard objectives add bacaphd_dis_pbk dummy
scoreboard objectives add bacaphd_dis_qmb dummy
scoreboard objectives add bacaphd_dis_qbk dummy
scoreboard objectives add bacaphd_dis_w dummy
scoreboard objectives add bacaphd_gr_prev dummy
scoreboard objectives add bacaphd_mm_ok dummy
scoreboard objectives add bacaphd_mm_prev dummy
scoreboard objectives add bacaphd_mm_x dummy
scoreboard objectives add bacaphd_mm_z dummy
scoreboard objectives add bacaphd_mm_px dummy
scoreboard objectives add bacaphd_mm_pz dummy
scoreboard objectives add bacaphd_mm_dmg dummy
scoreboard objectives add bacaphd_lava dummy
scoreboard objectives add bacaphd_ss_ok dummy
scoreboard objectives add bacaphd_ss_prev dummy
scoreboard objectives add bacaphd_ss_x dummy
scoreboard objectives add bacaphd_ss_z dummy
scoreboard objectives add bacaphd_ss_px dummy
scoreboard objectives add bacaphd_ss_pz dummy
scoreboard objectives add bacaphd_soul dummy
scoreboard objectives add bacaphd_ps_dim dummy
scoreboard objectives add bacaphd_ps_pdim dummy
scoreboard objectives add bacaphd_ps_arm dummy
scoreboard objectives add bacaphd_ps_has dummy
scoreboard objectives add bacaphd_ps_ax dummy
scoreboard objectives add bacaphd_ps_az dummy
scoreboard objectives add bacaphd_ps_x dummy
scoreboard objectives add bacaphd_ps_z dummy
scoreboard objectives add bacaphd_ps_nx dummy
scoreboard objectives add bacaphd_ps_nz dummy
scoreboard objectives add bacaphd_ps_far dummy
scoreboard objectives add bacaphd_rr_ok dummy
scoreboard objectives add bacaphd_rr_prev dummy
scoreboard objectives add bacaphd_rr_x dummy
scoreboard objectives add bacaphd_rr_z dummy
scoreboard objectives add bacaphd_rr_px dummy
scoreboard objectives add bacaphd_rr_pz dummy
scoreboard objectives add bacaphd_rr_y dummy
scoreboard objectives add bacaphd_roof dummy
scoreboard objectives add bacaphd_gw_now dummy
scoreboard objectives add bacaphd_gw_in dummy
scoreboard objectives add bacaphd_gw_x dummy
scoreboard objectives add bacaphd_gw_z dummy
scoreboard objectives add bacaphd_gw_px dummy
scoreboard objectives add bacaphd_gw_pz dummy
scoreboard objectives add bacaphd_gwcount dummy
scoreboard objectives add bacaphd_cp_hit dummy
scoreboard objectives add bacaphd_cp_lr dummy
scoreboard objectives add bacaphd_cp_next dummy
scoreboard objectives add bacaphd_cpcount dummy
scoreboard objectives add bacaphd_dr_dmg dummy
scoreboard objectives add bacaphd_drtimer dummy
scoreboard objectives add bacaphd_hoppers dummy
scoreboard objectives add bacaphd_chests dummy
scoreboard objectives add bacaphd_bells dummy
scoreboard objectives add bacaphd_dets dummy
scoreboard objectives add bacaphd_wire dummy
scoreboard objectives add bacaphd_ct_by dummy
scoreboard objectives add bacaphd_ct_dy dummy
scoreboard objectives add bacaphd_ct_sep dummy
scoreboard objectives add bacaphd_pe_ok dummy
scoreboard objectives add bacaphd_pe_prev dummy
scoreboard objectives add bacaphd_pe_y dummy
scoreboard objectives add bacaphd_pe_py dummy
scoreboard objectives add bacaphd_pe_rise dummy
scoreboard objectives add bacaphd_bulbs dummy
scoreboard objectives add bacaphd_bulbs_on dummy
scoreboard objectives add bacaphd_bulbs_off dummy
scoreboard objectives add bacaphd_maps dummy
scoreboard objectives add bacaphd_col dummy
scoreboard objectives add bacaphd_mono dummy
scoreboard objectives add bacaphd_tmp dummy
scoreboard objectives add bacaphd_roll dummy
scoreboard objectives add bacaphd_roll_lock dummy
scoreboard objectives add bacaphd_cold dummy
scoreboard objectives add bacaphd_ghast dummy
scoreboard objectives add bacaphd_cu_sum dummy
scoreboard objectives add bacaphd_sh_sum dummy
scoreboard objectives add bacaphd_spb_sum dummy
scoreboard objectives add bacaphd_gx dummy
scoreboard objectives add bacaphd_gz dummy
scoreboard objectives add bacaphd_gpx dummy
scoreboard objectives add bacaphd_gpz dummy
scoreboard objectives add bacaphd_gseen dummy
scoreboard objectives add bacaphd_init_s3 dummy
scoreboard objectives add bacaphd_brews dummy
scoreboard objectives add bacaphd_fl_x dummy
scoreboard objectives add bacaphd_fl_z dummy
scoreboard objectives add bacaphd_fl_dx dummy
scoreboard objectives add bacaphd_fl_dz dummy
scoreboard objectives add bacaphd_fl_dist dummy
scoreboard objectives add bacaphd_fl_seed dummy
scoreboard objectives add bacaphd_bb_x dummy
scoreboard objectives add bacaphd_bb_z dummy
scoreboard objectives add bacaphd_bb_dx dummy
scoreboard objectives add bacaphd_bb_dz dummy
scoreboard objectives add bacaphd_bb_dist dummy
scoreboard objectives add bacaphd_bb_seed dummy
scoreboard objectives add bacaphd_sleeps_seen dummy
scoreboard objectives add bacaphd_bib dummy
scoreboard objectives add bacaphd_init_b5 dummy
scoreboard objectives add bacaphd_w2c dummy
scoreboard objectives add bacaphd_w2x dummy
scoreboard objectives add bacaphd_w2z dummy
scoreboard objectives add bacaphd_fbk dummy
scoreboard objectives add bacaphd_fby dummy
scoreboard objectives add bacaphd_fbg dummy
scoreboard objectives add bacaphd_fbr dummy
scoreboard objectives add bacaphd_fbc dummy
scoreboard objectives add bacaphd_fbx dummy
scoreboard objectives add bacaphd_fbv dummy
scoreboard objectives add bacaphd_fbz dummy
scoreboard objectives add bacaphd_whh dummy
scoreboard objectives add bacaphd_whx dummy
scoreboard objectives add bacaphd_why dummy
scoreboard objectives add bacaphd_whz dummy
scoreboard objectives add bacaphd_eff dummy
scoreboard objectives add bacaphd_chem dummy
scoreboard objectives add bacaphd_s6potm dummy
scoreboard objectives add bacaphd_s6potn dummy
scoreboard objectives add bacaphd_s6ini dummy
scoreboard objectives add bacaphd_s6pax dummy
scoreboard objectives add bacaphd_s6pay dummy
scoreboard objectives add bacaphd_s6paz dummy
scoreboard objectives add bacaphd_s6px dummy
scoreboard objectives add bacaphd_s6py dummy
scoreboard objectives add bacaphd_s6pz dummy
scoreboard objectives add bacaphd_s6t dummy
scoreboard objectives add bacaphd_s6pm dummy
scoreboard objectives add bacaphd_s6pml dummy
scoreboard objectives add bacaphd_s6pmg dummy
scoreboard objectives add bacaphd_s6mx dummy
scoreboard objectives add bacaphd_s6mz dummy
scoreboard objectives add bacaphd_s6mf dummy
scoreboard objectives add bacaphd_s6cx dummy
scoreboard objectives add bacaphd_s6cz dummy
scoreboard objectives add bacaphd_ze dummy
scoreboard objectives add bacaphd_wa dummy
scoreboard objectives add bacaphd_wa_hb dummy
scoreboard objectives add bacaphd_rockb dummy
scoreboard objectives add bacaphd_glide dummy
scoreboard objectives add bacaphd_gl_x dummy
scoreboard objectives add bacaphd_gl_z dummy
scoreboard objectives add bacaphd_gl_px dummy
scoreboard objectives add bacaphd_gl_pz dummy
scoreboard objectives add bacaphd_gl_dx dummy
scoreboard objectives add bacaphd_gl_dz dummy
scoreboard objectives add bacaphd_gl_hi dummy
scoreboard objectives add bacaphd_gl_lo dummy
scoreboard objectives add bacaphd_gl_prev dummy
scoreboard objectives add bacaphd_ds_moss dummy
scoreboard objectives add bacaphd_ds_mud dummy
scoreboard objectives add bacaphd_ds_root dummy
scoreboard objectives add bacaphd_s2x dummy
scoreboard objectives add bacaphd_s2z dummy
scoreboard objectives add bacaphd_sc_ok dummy
scoreboard objectives add bacaphd_sc_dmg dummy
scoreboard objectives add bacaphd_eye dummy
scoreboard objectives add bacaphd_lc dummy
scoreboard objectives add bacaphd_fk dummy
scoreboard objectives add bacaphd_fk_i dummy
scoreboard objectives add bacaphd_fk_k dummy
scoreboard objectives add bacaphd_fk_done dummy
scoreboard objectives add bacaphd_gc_r dummy
scoreboard objectives add bacaphd_gc_p dummy
scoreboard objectives add bacaphd_gc_d dummy
scoreboard objectives add bacaphd_gc_a dummy
scoreboard objectives add bacaphd_solo1_init dummy
scoreboard objectives add bacaphd_light dummy
scoreboard objectives add bacaphd_shulk_n dummy
scoreboard objectives add bacaphd_shulk_base dummy
scoreboard objectives add bacaphd_shulk_arm dummy
scoreboard objectives add bacaphd_shulk_prog dummy
scoreboard objectives add bacaphd_shulk_last dummy
scoreboard objectives add bacaphd_fortress dummy
scoreboard objectives add bacaphd_slowburn dummy
scoreboard objectives add bacaphd_slowburn_p dummy
scoreboard objectives add bacaphd_laundry dummy
scoreboard objectives add bacaphd_boatb dummy
scoreboard objectives add bacaphd_boatd dummy
scoreboard objectives add bacaphd_wfungb dummy
scoreboard objectives add bacaphd_sfish dummy
scoreboard objectives add bacaphd_allay dummy
scoreboard objectives add bacaphd_bw dummy
scoreboard objectives add bacaphd_ship dummy
scoreboard objectives add bacaphd_gfv dummy
scoreboard objectives add bacaphd_ek dummy
scoreboard objectives add bacaphd_ek_x dummy
scoreboard objectives add bacaphd_ek_y dummy
scoreboard objectives add bacaphd_ek_z dummy
scoreboard objectives add bacaphd_ek_dx dummy
scoreboard objectives add bacaphd_ek_dy dummy
scoreboard objectives add bacaphd_ek_dz dummy
scoreboard objectives add bacaphd_ek_tmp dummy
scoreboard objectives add bacaphd_ek_best dummy
scoreboard objectives add bacaphd_pcn dummy
scoreboard objectives add bacaphd_pct dummy
scoreboard objectives add bacaphd_hp dummy
scoreboard objectives add bacaphd_pp_seen dummy
scoreboard objectives add bacaphd_pp_win dummy
scoreboard objectives add bacaphd_pp_x dummy
scoreboard objectives add bacaphd_pp_z dummy
scoreboard objectives add bacaphd_pp_dx dummy
scoreboard objectives add bacaphd_pp_dz dummy
scoreboard objectives add bacaphd_pp_far dummy
scoreboard objectives add bacaphd_cr_win dummy
scoreboard objectives add bacaphd_ctgt dummy
scoreboard objectives add bacaphd_disp dummy
scoreboard objectives add bacaphd_ffb dummy
scoreboard objectives add bacaphd_fpath dummy
scoreboard objectives add bacaphd_sneeze dummy
scoreboard objectives add bacaphd_s7_init dummy
scoreboard objectives add bacaphd_srx dummy
scoreboard objectives add bacaphd_srz dummy
scoreboard objectives add bacaphd_srhi dummy
scoreboard objectives add bacaphd_srlo dummy
scoreboard objectives add bacaphd_srdq dummy
scoreboard objectives add bacaphd_rt_x dummy
scoreboard objectives add bacaphd_rt_z dummy
scoreboard objectives add bacaphd_rt_px dummy
scoreboard objectives add bacaphd_rt_pz dummy
scoreboard objectives add bacaphd_rt_gx dummy
scoreboard objectives add bacaphd_rt_gz dummy
scoreboard objectives add bacaphd_rt_j dummy
scoreboard objectives add bacaphd_rt_k dummy
scoreboard objectives add bacaphd_rt_r dummy
scoreboard objectives add bacaphd_rt_s dummy
scoreboard objectives add bacaphd_rt_d dummy
scoreboard objectives add bacaphd_rt_e dummy
scoreboard objectives add bacaphd_rt_st dummy
scoreboard objectives add bacaphd_rt_in dummy
scoreboard objectives add bacaphd_rt_now dummy
scoreboard objectives add bacaphd_ud_n dummy
scoreboard objectives add bacaphd_ud_p dummy
scoreboard objectives add bacaphd_ud_x dummy
scoreboard objectives add bacaphd_ud_z dummy
scoreboard objectives add bacaphd_ud_1x dummy
scoreboard objectives add bacaphd_ud_1z dummy
scoreboard objectives add bacaphd_ud_2x dummy
scoreboard objectives add bacaphd_ud_2z dummy
scoreboard objectives add bacaphd_ud_a dummy
scoreboard objectives add bacaphd_ud_b dummy
scoreboard objectives add bacaphd_ud_c dummy
scoreboard objectives add bacaphd_ud_d dummy
scoreboard objectives add bacaphd_fall_tot dummy
scoreboard objectives add bacaphd_fall_prev dummy
scoreboard objectives add bacaphd_fall_now dummy
scoreboard objectives add bacaphd_barrels dummy
scoreboard objectives add bacaphd_ender dummy
scoreboard objectives add bacaphd_ender2 dummy
scoreboard objectives add bacaphd_ferry dummy
scoreboard objectives add bacaphd_ferry2 dummy
scoreboard objectives add bacaphd_pi_day dummy
scoreboard objectives add bacaphd_pi_age dummy
scoreboard objectives add bacaphd_cub dummy
scoreboard objectives add bacaphd_key_e dummy
scoreboard objectives add bacaphd_key_w dummy
scoreboard objectives add bacaphd_key_s dummy
scoreboard objectives add bacaphd_key_n dummy
scoreboard objectives add bacaphd_nmp_dmgb dummy
scoreboard objectives add bacaphd_nmp_cd dummy
scoreboard objectives add bacaphd_ts_h dummy
scoreboard objectives add bacaphd_ts_c dummy
scoreboard objectives add bacaphd_sg_y dummy
scoreboard objectives add bacaphd_yeet_x dummy
scoreboard objectives add bacaphd_yeet_z dummy
scoreboard objectives add bacaphd_yeet_t dummy
scoreboard objectives add bacaphd_bf dummy
scoreboard objectives add bacaphd_bf_ok dummy
scoreboard objectives add bacaphd_bf_prev dummy
scoreboard objectives add bacaphd_bf_x dummy
scoreboard objectives add bacaphd_bf_z dummy
scoreboard objectives add bacaphd_bf_px dummy
scoreboard objectives add bacaphd_bf_pz dummy
scoreboard objectives add bacaphd_bi dummy
scoreboard objectives add bacaphd_bs1 dummy
scoreboard objectives add bacaphd_bs2 dummy
scoreboard objectives add bacaphd_bs3 dummy
scoreboard objectives add bacaphd_bs4 dummy
scoreboard objectives add bacaphd_bs5 dummy
scoreboard objectives add bacaphd_bsn dummy
scoreboard objectives add bacaphd_spore dummy
scoreboard objectives add bacaphd_gg_ok dummy
scoreboard objectives add bacaphd_gg_glass dummy
scoreboard objectives add bacaphd_gg_seen dummy
scoreboard objectives add bacaphd_gn dummy
scoreboard objectives add bacaphd_gn_age dummy
scoreboard objectives add bacaphd_tw_wire dummy
scoreboard objectives add bacaphd_tw_hook dummy
scoreboard objectives add bacaphd_gor dummy
scoreboard objectives add bacaphd_hatch dummy
scoreboard objectives add bacaphd_ctorchb dummy
scoreboard objectives add bacaphd_ctorchd dummy
scoreboard objectives add bacaphd_yeet_m dummy
scoreboard objectives add bacaphd_pi_own dummy

function bacaphd:setup_stats_01
function bacaphd:setup_stats_02
function bacaphd:setup_stats_03
function bacaphd:setup_stats_04
function bacaphd:setup_stats_05
function bacaphd:setup_stats_06
function bacaphd:setup_stats_07
function bacaphd:setup_stats_08
function bacaphd:setup_stats_09
function bacaphd:setup_stats_10
function bacaphd:setup_stats_unverified

# Constant used to take absolute values in the Ominous Marathon distance checks
scoreboard players set #neg1 bacaphd_const -1
# Constants for the scoreboard maths: floor division of a block coordinate by 16, and
# -1 for taking an absolute value by negate-and-max.
scoreboard players set #16 bacaphd_calc 16
scoreboard players set #neg bacaphd_calc -1
# Constants for the Ice Road Trucker octagonal distance approximation
scoreboard players set $neg bacaphd_const -1
scoreboard players set $three bacaphd_const 3
scoreboard players set $eight bacaphd_const 8
# Constants used by the shared step helper
scoreboard players set $neg1 bacaphd_const -1
scoreboard players set $three bacaphd_const 3
scoreboard players set $eight bacaphd_const 8
# Constants for the octagonal distance approximation. Re-stating them is idempotent and
# keeps this batch's detectors from depending on another batch's load order.
scoreboard players set $neg bacaphd_const -1
scoreboard players set $three bacaphd_const 3
scoreboard players set $eight bacaphd_const 8
# solo6: constant used to take absolute values by negate-and-max in detect/pottery_barn
scoreboard players set #neg1 bacaphd_s6t -1
scoreboard players set #b5_daylen bacaphd_const 24000
scoreboard players set $b5neg bacaphd_const -1
scoreboard players set $b5three bacaphd_const 3
scoreboard players set $b5eight bacaphd_const 8
# Constant used by detect/camel_dash to take absolute values by negate-and-max.
scoreboard players set $neg1 bacaphd_ek -1
# Constants for the batch solo7 absolute-value and octagonal-distance maths
scoreboard players set $s7neg bacaphd_const -1
scoreboard players set $s7three bacaphd_const 3
scoreboard players set $s7eight bacaphd_const 8
